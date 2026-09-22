#!/usr/bin/env zsh
#
# reap-orphans.sh — find (and optionally kill) dev processes left behind when a
# herdr workspace, tab, or pane is closed.
#
# Closing a workspace kills the pane shells, but tooling that has detached from
# them (spring servers, ruby-lsp's `rails runner`, language servers, watchers)
# is reparented to launchd and keeps running. It holds memory and counts against
# kern.maxprocperuid (6000) — the ceiling that makes panes die with
# "fork failed: resource temporarily unavailable" at session start.
#
# Also reports spaceship prompt jobs wedged under an async worker.
#
# Usage: reap-orphans.sh [--kill]
#        Default is a dry run; --kill sends SIGTERM, then SIGKILL to stragglers.

setopt pipefail

kill_mode=0
[[ "$1" == "--kill" ]] && kill_mode=1

# Long-running dev tooling that can legitimately outlive its parent.
dev_re='spring |ruby_lsp|ruby-lsp|solargraph|rails runner|bin/rails|puma|sidekiq|language-server|tsserver|jest|vitest|webpack|vite |rspack|storybook|nodemon|eslint_d|prettierd'
# Never touch these, even if they match above.
keep_re='herdr|copilot-watch|ssh-agent|/nvim|/Applications/|/System/|/usr/libexec/|/usr/sbin/|claude'

root_of() {
  git -C "$1" rev-parse --show-toplevel 2>/dev/null || print -r -- "$1"
}

cwd_of() {
  lsof -p "$1" 2>/dev/null | awk '$4=="cwd"{print $NF}'
}

# --- project roots that still have a live herdr pane -------------------------
typeset -a live_roots
if command -v herdr >/dev/null 2>&1; then
  for c in ${(f)"$(herdr pane list 2>/dev/null | tr ',' '\n' | grep '"cwd"' | sed 's/.*"cwd":"//; s/"$//' | sort -u)"}; do
    [[ -d "$c" ]] && live_roots+=("$(root_of "$c")")
  done
  live_roots=(${(u)live_roots})
fi

typeset -a victims

# --- orphaned dev tooling ----------------------------------------------------
print "=== orphaned dev processes (parent gone, project has no live pane) ==="
found=0
for line in ${(f)"$(ps -U $(id -u) -o pid=,ppid=,args= | awk '$2==1 {pid=$1; $1=""; $2=""; sub(/^ +/, ""); print pid "\t" $0}')"}; do
  pid=${line%%$'\t'*}
  args=${line#*$'\t'}
  print -r -- "$args" | grep -qE "$keep_re" && continue
  print -r -- "$args" | grep -qE "$dev_re" || continue

  cwd=$(cwd_of $pid)
  if [[ -n "$cwd" && -d "$cwd" ]]; then
    proot=$(root_of "$cwd")
  else
    proot="?"
  fi

  skip=0
  for r in $live_roots; do
    [[ "$proot" == "$r" ]] && skip=1 && break
  done
  (( skip )) && continue

  found=1
  victims+=($pid)
  printf "  %-7s %-10s %5s MB  %s\n" \
    "$pid" \
    "$(ps -p $pid -o etime= | tr -d ' ')" \
    "$(( $(ps -p $pid -o rss= | tr -d ' ') / 1024 ))" \
    "${proot:t}: ${args[1,80]}"
done
(( found )) || print "  none"

# --- wedged spaceship prompt jobs -------------------------------------------
print ""
print "=== wedged spaceship prompt jobs ==="
total=0
for w in ${(f)"$(ps -U $(id -u) -o pid=,stat=,nice=,comm= | awk '$3>=15 && $2 ~ /s/ && $4 ~ /zsh$/ {print $1}')"}; do
  [[ -z "$w" ]] && continue
  typeset -a kids
  kids=(${(f)"$(pgrep -P $w 2>/dev/null)"})
  kids=(${kids:#})
  (( ${#kids} == 0 )) && continue
  print "  worker $w: ${#kids} stuck job(s)"
  victims+=($kids)
  (( total += ${#kids} ))
done
(( total )) || print "  none"

# --- act ---------------------------------------------------------------------
print ""
if (( ${#victims} == 0 )); then
  print "Nothing to reap."
  exit 0
fi

if (( ! kill_mode )); then
  print "${#victims} process(es) would be reaped. Re-run with --kill to do it."
  exit 0
fi

for p in $victims; do kill -TERM $p 2>/dev/null; done
sleep 2

typeset -a survivors
for p in $victims; do
  ps -p $p -o pid= >/dev/null 2>&1 && survivors+=($p)
done

if (( ${#survivors} )); then
  for p in $survivors; do kill -KILL $p 2>/dev/null; done
  print "Reaped ${#victims} process(es) (${#survivors} needed SIGKILL)."
else
  print "Reaped ${#victims} process(es) cleanly."
fi
