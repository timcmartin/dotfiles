let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
inoremap <silent> <Plug>ragtagXmlV ="&#".getchar().";"
inoremap <silent> <Plug>(matchup-c_g%) :call matchup#motion#insert_mode()
inoremap <silent> <S-Tab> =BackwardsSnippet()
inoremap <C-Tab> 	
inoremap <silent> <Plug>NERDCommenterInsert  <BS>:call NERDComment('i', "insert")
inoremap <silent> <Plug>(fzf-maps-i) :call fzf#vim#maps('i', 0)
inoremap <expr> <Plug>(fzf-complete-buffer-line) fzf#vim#complete#buffer_line()
inoremap <expr> <Plug>(fzf-complete-line) fzf#vim#complete#line()
inoremap <expr> <Plug>(fzf-complete-file-ag) fzf#vim#complete#path('ag -l -g ""')
inoremap <expr> <Plug>(fzf-complete-file) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -type f -print -o -type l -print | sed 's:^..::'")
inoremap <expr> <Plug>(fzf-complete-path) fzf#vim#complete#path("find . -path '*/\.*' -prune -o -print | sed '1d;s:^..::'")
inoremap <expr> <Plug>(fzf-complete-word) fzf#vim#complete#word()
inoremap <silent> <SNR>29_AutoPairsReturn =AutoPairsReturn()
inoremap <F5> =strftime("%b %d, %Y")
imap <F1> 
map! <D-v> *
xmap  <Plug>SpeedDatingUp
nmap  <Plug>SpeedDatingUp
nmap <silent>  :wincmd h
snoremap <silent> 	 i<Right>=TriggerSnippet()
xnoremap <silent> 	 >gv
nmap <silent> <NL> :wincmd j
vmap <NL> ddp
omap <NL> ddp
nmap <silent>  :wincmd k
vmap  ddkP
omap  ddkP
vnoremap <silent>  :NERDTreeTabsToggle
nnoremap <silent>  :NERDTreeTabsToggle
nnoremap  :FZF
nmap  :Tags
omap <silent> a% <Plug>(matchup-o_)<Plug>(matchup-a%)
omap <silent> i% <Plug>(matchup-o_)<Plug>(matchup-i%)
omap <silent> z% <Plug>(matchup-o_)<Plug>(matchup-z%)
omap <silent> [% <Plug>(matchup-o_)<Plug>(matchup-[%)
omap <silent> ]% <Plug>(matchup-o_)<Plug>(matchup-]%)
omap <silent> g% <Plug>(matchup-o_)<Plug>(matchup-g%)
omap <silent> % <Plug>(matchup-o_)<Plug>(matchup-%)
snoremap  b<BS>
xmap  <Plug>SpeedDatingDown
nmap  <Plug>SpeedDatingDown
snoremap % b<BS>%
omap <silent> % <Plug>(matchup-o_)<Plug>(matchup-%)
xmap <silent> % <Plug>(matchup-%)
nmap <silent> % <Plug>(matchup-%)
snoremap ' b<BS>'
xnoremap ,g y :Ggrep "
nmap <silent> ,w,m <Plug>VimwikiMakeTomorrowDiaryNote
nmap <silent> ,w,y <Plug>VimwikiMakeYesterdayDiaryNote
nmap <silent> ,w,t <Plug>VimwikiTabMakeDiaryNote
nmap <silent> ,w,w <Plug>VimwikiMakeDiaryNote
nmap <silent> ,w,i <Plug>VimwikiDiaryGenerateLinks
nmap <silent> ,wi <Plug>VimwikiDiaryIndex
nmap <silent> ,ws <Plug>VimwikiUISelect
nmap <silent> ,wt <Plug>VimwikiTabIndex
nmap <silent> ,ww <Plug>VimwikiIndex
map ,R :VroomRunNearestTest
map ,r :VroomRunTestFile
vnoremap ,rem :RExtractMethod
vnoremap ,rriv :RRenameInstanceVariable
vnoremap ,rrlv :RRenameLocalVariable
vnoremap ,relv :RExtractLocalVariable
vnoremap ,rec :RExtractConstant
nnoremap ,riv :RIntroduceVariable
nnoremap ,rcpc :RConvertPostConditional
nnoremap ,rel :RExtractLet
nnoremap ,rit :RInlineTemp
nnoremap ,rapn :RAddParameterNB
nnoremap ,rap :RAddParameter
nmap ,ca <Plug>NERDCommenterAltDelims
xmap ,cu <Plug>NERDCommenterUncomment
nmap ,cu <Plug>NERDCommenterUncomment
xmap ,cb <Plug>NERDCommenterAlignBoth
nmap ,cb <Plug>NERDCommenterAlignBoth
xmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cl <Plug>NERDCommenterAlignLeft
nmap ,cA <Plug>NERDCommenterAppend
xmap ,cy <Plug>NERDCommenterYank
nmap ,cy <Plug>NERDCommenterYank
xmap ,cs <Plug>NERDCommenterSexy
nmap ,cs <Plug>NERDCommenterSexy
xmap ,ci <Plug>NERDCommenterInvert
nmap ,ci <Plug>NERDCommenterInvert
nmap ,c$ <Plug>NERDCommenterToEOL
xmap ,cn <Plug>NERDCommenterNested
nmap ,cn <Plug>NERDCommenterNested
xmap ,cm <Plug>NERDCommenterMinimal
nmap ,cm <Plug>NERDCommenterMinimal
xmap ,cc <Plug>NERDCommenterComment
nmap ,cc <Plug>NERDCommenterComment
nmap ,caL <Plug>CalendarH
nmap ,cal <Plug>CalendarV
nnoremap <silent> ,wm :call WindowSwap#EasyWindowSwap()
nnoremap <silent> ,pw :call WindowSwap#DoWindowSwap()
nnoremap <silent> ,yw :call WindowSwap#MarkWindowSwap()
noremap ,tt :noautocmd vimgrep /TODO/j **/*.rb:cw
noremap <silent> ,P "*P
noremap <silent> ,Y "*Y
noremap <silent> ,y "*y
noremap <silent> ,p "*p
nnoremap ,ve :vsplit $MYVIMRC
map ,grs :call MakeRspecFileIfMissing()
map ,as :call RunAllSpecs()
map ,l :call RunLastSpec()
map ,s :call RunNearestSpec()
map ,t :call RunCurrentSpecFile()
map <silent> ,rh :%s/:\(\w*\)\s*=>\s*\(\w*\)/\1: \2/g
map ,tm :tabmove
map ,tc :tabclose
map ,to :tabonly
map ,tn :tabnew
nnoremap ,, 
map ,gg :topleft 100 :split Gemfile
map ,gr :topleft :split config/routes.rb
nnoremap ,  :noh  " remove highlight from search matches
nmap <silent> ,/ :nohlsearch
map ,do :NERDTree
map ,dc :NERDTreeTabsClose
map <silent> ,f :NERDTree:wincmd l:NERDTreeFind
vmap ,rs :!bash 
vmap <silent> ,x :!tidy -qi -raw -xml:se filetype=xml
nnoremap ,h *
nnoremap ,css :g#\({\n\)\@<=#.,/}/sort
nnoremap <silent> - :Switch
vnoremap // y/"
vnoremap / /\v
nnoremap / /\v
noremap ;; ;
map ; :
nnoremap =op <Nop>
noremap H ^
noremap L $
vnoremap <silent> P "_dp
xmap S <Plug>VSurround
snoremap U b<BS>U
omap <silent> Va% <Plug>(matchup-o_V)<Plug>(matchup-a%)
omap <silent> Vi% <Plug>(matchup-o_V)<Plug>(matchup-i%)
omap <silent> Vz% <Plug>(matchup-o_V)<Plug>(matchup-z%)
omap <silent> V[% <Plug>(matchup-o_V)<Plug>(matchup-[%)
omap <silent> V]% <Plug>(matchup-o_V)<Plug>(matchup-]%)
omap <silent> Vg% <Plug>(matchup-o_V)<Plug>(matchup-g%)
omap <silent> V% <Plug>(matchup-o_V)<Plug>(matchup-%)
nnoremap Y y$
nmap [xx <Plug>unimpaired_line_xml_encode
xmap [x <Plug>unimpaired_xml_encode
nmap [x <Plug>unimpaired_xml_encode
nmap [uu <Plug>unimpaired_line_url_encode
xmap [u <Plug>unimpaired_url_encode
nmap [u <Plug>unimpaired_url_encode
nmap [yy <Plug>unimpaired_line_string_encode
xmap [y <Plug>unimpaired_string_encode
nmap [y <Plug>unimpaired_string_encode
nmap [P <Plug>unimpairedPutAbove
nmap [p <Plug>unimpairedPutAbove
xmap [e <Plug>unimpairedMoveSelectionUp
nmap [e <Plug>unimpairedMoveUp
nmap [  <Plug>unimpairedBlankUp
omap [n <Plug>unimpairedContextPrevious
nmap [n <Plug>unimpairedContextPrevious
nmap [f <Plug>unimpairedDirectoryPrevious
nmap [ <Plug>unimpairedTPPrevious
nmap [T <Plug>unimpairedTFirst
nmap [t <Plug>unimpairedTPrevious
nmap [ <Plug>unimpairedQPFile
nmap [Q <Plug>unimpairedQFirst
nmap [q <Plug>unimpairedQPrevious
nmap [ <Plug>unimpairedLPFile
nmap [L <Plug>unimpairedLFirst
nmap [l <Plug>unimpairedLPrevious
nmap [B <Plug>unimpairedBFirst
nmap [b <Plug>unimpairedBPrevious
nmap [A <Plug>unimpairedAFirst
nmap [a <Plug>unimpairedAPrevious
nmap [C 9999[c
nmap [c <Plug>(signify-prev-hunk)
omap <silent> [% <Plug>(matchup-o_)<Plug>(matchup-[%)
xmap <silent> [% <Plug>(matchup-[%)
nmap <silent> [% <Plug>(matchup-[%)
snoremap \ b<BS>\
vmap \\ <Plug>NERDCommenterToggle
nmap \\ <Plug>NERDCommenterToggle
nmap ]xx <Plug>unimpaired_line_xml_decode
xmap ]x <Plug>unimpaired_xml_decode
nmap ]x <Plug>unimpaired_xml_decode
nmap ]uu <Plug>unimpaired_line_url_decode
xmap ]u <Plug>unimpaired_url_decode
nmap ]u <Plug>unimpaired_url_decode
nmap ]yy <Plug>unimpaired_line_string_decode
xmap ]y <Plug>unimpaired_string_decode
nmap ]y <Plug>unimpaired_string_decode
nmap ]P <Plug>unimpairedPutBelow
nmap ]p <Plug>unimpairedPutBelow
xmap ]e <Plug>unimpairedMoveSelectionDown
nmap ]e <Plug>unimpairedMoveDown
nmap ]  <Plug>unimpairedBlankDown
omap ]n <Plug>unimpairedContextNext
nmap ]n <Plug>unimpairedContextNext
nmap ]f <Plug>unimpairedDirectoryNext
nmap ] <Plug>unimpairedTPNext
nmap ]T <Plug>unimpairedTLast
nmap ]t <Plug>unimpairedTNext
nmap ] <Plug>unimpairedQNFile
nmap ]Q <Plug>unimpairedQLast
nmap ]q <Plug>unimpairedQNext
nmap ] <Plug>unimpairedLNFile
nmap ]L <Plug>unimpairedLLast
nmap ]l <Plug>unimpairedLNext
nmap ]B <Plug>unimpairedBLast
nmap ]b <Plug>unimpairedBNext
nmap ]A <Plug>unimpairedALast
nmap ]a <Plug>unimpairedANext
nmap ]C 9999]c
nmap ]c <Plug>(signify-next-hunk)
omap <silent> ]% <Plug>(matchup-o_)<Plug>(matchup-]%)
xmap <silent> ]% <Plug>(matchup-]%)
nmap <silent> ]% <Plug>(matchup-]%)
snoremap ^ b<BS>^
snoremap ` b<BS>`
omap <silent> a% <Plug>(matchup-o_)<Plug>(matchup-a%)
xmap <silent> a% <Plug>(matchup-a%)
nnoremap cop <Nop>
nmap cS <Plug>CSurround
nmap cs <Plug>Csurround
nmap cr <Plug>Coerce
nmap ds <Plug>Dsurround
nmap d <Plug>SpeedDatingNowLocal
nmap d <Plug>SpeedDatingNowUTC
vmap gx <Plug>NetrwBrowseXVis
nmap gx <Plug>NetrwBrowseX
nnoremap gY gg"+yG
vnoremap gy "+y
xmap gS <Plug>VgSurround
omap <silent> g% <Plug>(matchup-o_)<Plug>(matchup-g%)
xmap <silent> g% <Plug>(matchup-g%)
nmap <silent> g% <Plug>(matchup-g%)
nmap gy :%y+
omap <silent> i% <Plug>(matchup-o_)<Plug>(matchup-i%)
xmap <silent> i% <Plug>(matchup-i%)
vnoremap <silent> p "_dP
nnoremap td :tabclose
nnoremap tm :tabm 
nnoremap tn :tabnext
nnoremap tt :tabedit 
nnoremap tl :tablast
nnoremap tk :tabprev
nnoremap tj :tabnext
nnoremap th :tabfirst
omap <silent> va% <Plug>(matchup-o_v)<Plug>(matchup-a%)
omap <silent> vi% <Plug>(matchup-o_v)<Plug>(matchup-i%)
omap <silent> vz% <Plug>(matchup-o_v)<Plug>(matchup-z%)
omap <silent> v[% <Plug>(matchup-o_v)<Plug>(matchup-[%)
omap <silent> v]% <Plug>(matchup-o_v)<Plug>(matchup-]%)
omap <silent> vg% <Plug>(matchup-o_v)<Plug>(matchup-g%)
omap <silent> v% <Plug>(matchup-o_v)<Plug>(matchup-%)
nmap ySS <Plug>YSsurround
nmap ySs <Plug>YSsurround
nmap yss <Plug>Yssurround
nmap yS <Plug>YSurround
nmap ys <Plug>Ysurround
omap <silent> z% <Plug>(matchup-o_)<Plug>(matchup-z%)
xmap <silent> z% <Plug>(matchup-z%)
nmap <silent> z% <Plug>(matchup-z%)
nnoremap <SNR>194_: :=v:count ? v:count : ''
nnoremap <SNR>153_: :=v:count ? v:count : ''
snoremap <Left> bi
snoremap <Right> a
snoremap <BS> b<BS>
snoremap <silent> <S-Tab> i<Right>=BackwardsSnippet()
vnoremap <silent> <Plug>NetrwBrowseXVis :call netrw#BrowseXVis()
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#BrowseX(expand((exists("g:netrw_gx")? g:netrw_gx : '<cfile>')),netrw#CheckIfRemote())
xnoremap <silent> <S-Tab> <gv
nnoremap <silent> <Plug>unimpairedTPNext :exe "p".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>unimpairedTPPrevious :exe "p".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>unimpairedTLast :exe "".(v:count ? v:count : "")."tlast"
nnoremap <silent> <Plug>unimpairedTFirst :exe "".(v:count ? v:count : "")."tfirst"
nnoremap <silent> <Plug>unimpairedTNext :exe "".(v:count ? v:count : "")."tnext"
nnoremap <silent> <Plug>unimpairedTPrevious :exe "".(v:count ? v:count : "")."tprevious"
nnoremap <silent> <Plug>unimpairedQNFile :exe "".(v:count ? v:count : "")."cnfile"zv
nnoremap <silent> <Plug>unimpairedQPFile :exe "".(v:count ? v:count : "")."cpfile"zv
nnoremap <silent> <Plug>unimpairedQLast :exe "".(v:count ? v:count : "")."clast"zv
nnoremap <silent> <Plug>unimpairedQFirst :exe "".(v:count ? v:count : "")."cfirst"zv
nnoremap <silent> <Plug>unimpairedQNext :exe "".(v:count ? v:count : "")."cnext"zv
nnoremap <silent> <Plug>unimpairedQPrevious :exe "".(v:count ? v:count : "")."cprevious"zv
nnoremap <silent> <Plug>unimpairedLNFile :exe "".(v:count ? v:count : "")."lnfile"zv
nnoremap <silent> <Plug>unimpairedLPFile :exe "".(v:count ? v:count : "")."lpfile"zv
nnoremap <silent> <Plug>unimpairedLLast :exe "".(v:count ? v:count : "")."llast"zv
nnoremap <silent> <Plug>unimpairedLFirst :exe "".(v:count ? v:count : "")."lfirst"zv
nnoremap <silent> <Plug>unimpairedLNext :exe "".(v:count ? v:count : "")."lnext"zv
nnoremap <silent> <Plug>unimpairedLPrevious :exe "".(v:count ? v:count : "")."lprevious"zv
nnoremap <silent> <Plug>unimpairedBLast :exe "".(v:count ? v:count : "")."blast"
nnoremap <silent> <Plug>unimpairedBFirst :exe "".(v:count ? v:count : "")."bfirst"
nnoremap <silent> <Plug>unimpairedBNext :exe "".(v:count ? v:count : "")."bnext"
nnoremap <silent> <Plug>unimpairedBPrevious :exe "".(v:count ? v:count : "")."bprevious"
nnoremap <silent> <Plug>unimpairedALast :exe "".(v:count ? v:count : "")."last"
nnoremap <silent> <Plug>unimpairedAFirst :exe "".(v:count ? v:count : "")."first"
nnoremap <silent> <Plug>unimpairedANext :exe "".(v:count ? v:count : "")."next"
nnoremap <silent> <Plug>unimpairedAPrevious :exe "".(v:count ? v:count : "")."previous"
nnoremap <silent> <Plug>SurroundRepeat .
nnoremap <Plug>SpeedDatingFallbackDown 
nnoremap <Plug>SpeedDatingFallbackUp 
nnoremap <silent> <Plug>SpeedDatingNowUTC :call speeddating#timestamp(1,v:count)
nnoremap <silent> <Plug>SpeedDatingNowLocal :call speeddating#timestamp(0,v:count)
vnoremap <silent> <Plug>SpeedDatingDown :call speeddating#incrementvisual(-v:count1)
vnoremap <silent> <Plug>SpeedDatingUp :call speeddating#incrementvisual(v:count1)
nnoremap <silent> <Plug>SpeedDatingDown :call speeddating#increment(-v:count1)
nnoremap <silent> <Plug>SpeedDatingUp :call speeddating#increment(v:count1)
xnoremap <silent> <Plug>(signify-motion-outer-visual) :call sy#util#hunk_text_object(1)
onoremap <silent> <Plug>(signify-motion-outer-pending) :call sy#util#hunk_text_object(1)
xnoremap <silent> <Plug>(signify-motion-inner-visual) :call sy#util#hunk_text_object(0)
onoremap <silent> <Plug>(signify-motion-inner-pending) :call sy#util#hunk_text_object(0)
nnoremap <silent> <expr> <Plug>(signify-prev-hunk) &diff ? '[c' : ":\call sy#jump#prev_hunk(v:count1)\"
nnoremap <silent> <expr> <Plug>(signify-next-hunk) &diff ? ']c' : ":\call sy#jump#next_hunk(v:count1)\"
nmap <silent> <2-LeftMouse> <Plug>(matchup-double-click)
nnoremap <Plug>(matchup-reload) :MatchupReload
nnoremap <silent> <Plug>(matchup-double-click) :call matchup#text_obj#double_click()
onoremap <silent> <Plug>(matchup-a%) :call matchup#text_obj#delimited(0, 0, 'delim_all')
onoremap <silent> <Plug>(matchup-i%) :call matchup#text_obj#delimited(1, 0, 'delim_all')
xnoremap <silent> <Plug>(matchup-a%) :call matchup#text_obj#delimited(0, 1, 'delim_all')
xnoremap <silent> <Plug>(matchup-i%) :call matchup#text_obj#delimited(1, 1, 'delim_all')
onoremap <silent> <Plug>(matchup-z%) :call matchup#motion#op('z%')
xnoremap <silent> <SNR>101_(matchup-z%) :call matchup#motion#jump_inside(1)
nnoremap <silent> <Plug>(matchup-z%) :call matchup#motion#jump_inside(0)
onoremap <silent> <Plug>(matchup-[%) :call matchup#motion#op('[%')
onoremap <silent> <Plug>(matchup-]%) :call matchup#motion#op(']%')
xnoremap <silent> <SNR>101_(matchup-[%) :call matchup#motion#find_unmatched(1, 0)
xnoremap <silent> <SNR>101_(matchup-]%) :call matchup#motion#find_unmatched(1, 1)
nnoremap <silent> <Plug>(matchup-[%) :call matchup#motion#find_unmatched(0, 0)
nnoremap <silent> <Plug>(matchup-]%) :call matchup#motion#find_unmatched(0, 1)
onoremap <silent> <Plug>(matchup-g%) :call matchup#motion#op('g%')
xnoremap <silent> <SNR>101_(matchup-g%) :call matchup#motion#find_matching_pair(1, 0)
onoremap <silent> <Plug>(matchup-%) :call matchup#motion#op('%')
xnoremap <silent> <SNR>101_(matchup-%) :call matchup#motion#find_matching_pair(1, 1)
nnoremap <silent> <Plug>(matchup-g%) :call matchup#motion#find_matching_pair(0, 0)
nnoremap <silent> <Plug>(matchup-%) :call matchup#motion#find_matching_pair(0, 1)
nnoremap <silent> <expr> <SNR>101_(wise) empty(g:v_motion_force) ? 'v' : g:v_motion_force
nnoremap <silent> <Plug>(matchup-hi-surround) :call matchup#matchparen#highlight_surrounding()
nmap <silent> <Plug>NormalModeSendToTmux vip<Plug>SendSelectionToTmux
vnoremap <silent> <Plug>SendSelectionToTmux "ry :call Send_to_Tmux(@r)
xnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("x", "Uncomment")
nnoremap <silent> <Plug>NERDCommenterUncomment :call NERDComment("n", "Uncomment")
xnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("x", "AlignBoth")
nnoremap <silent> <Plug>NERDCommenterAlignBoth :call NERDComment("n", "AlignBoth")
xnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("x", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAlignLeft :call NERDComment("n", "AlignLeft")
nnoremap <silent> <Plug>NERDCommenterAppend :call NERDComment("n", "Append")
xnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("x", "Yank")
nnoremap <silent> <Plug>NERDCommenterYank :call NERDComment("n", "Yank")
xnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("x", "Sexy")
nnoremap <silent> <Plug>NERDCommenterSexy :call NERDComment("n", "Sexy")
xnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("x", "Invert")
nnoremap <silent> <Plug>NERDCommenterInvert :call NERDComment("n", "Invert")
nnoremap <silent> <Plug>NERDCommenterToEOL :call NERDComment("n", "ToEOL")
xnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("x", "Nested")
nnoremap <silent> <Plug>NERDCommenterNested :call NERDComment("n", "Nested")
xnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("x", "Minimal")
nnoremap <silent> <Plug>NERDCommenterMinimal :call NERDComment("n", "Minimal")
xnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("x", "Toggle")
nnoremap <silent> <Plug>NERDCommenterToggle :call NERDComment("n", "Toggle")
xnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("x", "Comment")
nnoremap <silent> <Plug>NERDCommenterComment :call NERDComment("n", "Comment")
onoremap <silent> <Plug>(fzf-maps-o) :call fzf#vim#maps('o', 0)
xnoremap <silent> <Plug>(fzf-maps-x) :call fzf#vim#maps('x', 0)
nnoremap <silent> <Plug>(fzf-maps-n) :call fzf#vim#maps('n', 0)
noremap <SNR>32_DashGlobalSearch :Dash!
noremap <SNR>32_DashSearch :Dash
nnoremap <silent> <Plug>CalendarT :cal calendar#show(2)
nnoremap <silent> <Plug>CalendarH :cal calendar#show(1)
nnoremap <silent> <Plug>CalendarV :cal calendar#show(0)
nnoremap <F5> "=strftime("%b %d, %Y")P
nmap <F8> :TagbarToggle
map <F1> 
map <F3> :set paste!|set paste?
map <F2> :PBCopy
xmap <BS> "-d
vmap <D-x> "*d
vmap <D-c> "*y
vmap <D-v> "-d"*P
nmap <D-v> "*P
inoremap  `^
imap S <Plug>ISurround
imap s <Plug>Isurround
imap <silent> % <Plug>(matchup-c_g%)
inoremap <silent> 	 =TriggerSnippet()
imap  <Plug>DiscretionaryEnd
inoremap <silent> 	 =ShowAvailableSnips()
imap  <Plug>Isurround
inoremap jj 
cnoremap w' w
cmap w!! w !sudo tee % >/dev/null
iabbr ipry require IEx; IEx.pry;
iabbr bpry require 'pry'; binding.pry;
iabbr rdebug require 'ruby-debug'; Debugger.start; Debugger.settings[:autoeval] = 1; Debugger.settings[:autolist] = 1; debugger
iabbr Lidsa Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum
cabbr gitv =(getcmdtype()==':' && getcmdpos()==1 ? 'Gitv' : 'gitv')
let &cpo=s:cpo_save
unlet s:cpo_save
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set backupdir=~/.vimbackupdir,~/tmp,~/,.
set clipboard=unnamed
set cmdheight=2
set directory=~/.vimbackupdir,~/tmp,~/,.
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set gdefault
set grepprg=grep\ -rnH\ --exclude='.*.swp'\ --exclude='*~'\ --exclude='*.log'\ --exclude=tags\ $*\ /dev/null
set helplang=en
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set listchars=tab:���\ ,trail:␠
set matchpairs=(:),{:},[:],<:>
set mousemodel=extend
set ruler
set runtimepath=~/.vimbundles/ag.vim,~/.vimbundles/angular-vim-snippets,~/.vimbundles/auto-pairs,~/.vimbundles/calendar-vim,~/.vimbundles/CoffeeTags,~/.vimbundles/dash.vim,~/.vimbundles/funcoo.vim,~/.vimbundles/fzf.vim,~/.vimbundles/gitv,~/.vimbundles/indentLine,~/.vimbundles/javascript-libraries-syntax.vim,~/.vimbundles/nerdcommenter,~/.vimbundles/nerdtree,~/.vimbundles/nerdtree-git-plugin,~/.vimbundles/pbcopy.vim,~/.vimbundles/puppet-syntax-vim,~/.vimbundles/README.md,~/.vimbundles/rubocop,~/.vimbundles/snipmate.vim,~/.vimbundles/supertab,~/.vimbundles/switch.vim,~/.vimbundles/syntastic,~/.vimbundles/tabular,~/.vimbundles/tagbar,~/.vimbundles/tags,~/.vimbundles/tmuxline.vim,~/.vimbundles/todo.txt-vim,~/.vimbundles/trailertrash.vim,~/.vimbundles/tslime.vim,~/.vimbundles/typescript-vim,~/.vimbundles/vim-abolish,~/.vimbundles/vim-afterglow,~/.vimbundles/vim-airline,~/.vimbundles/vim-airline-themes,~/.vimbundles/vim-airlineish,~/.vimbundles/vim-angular,~/.vimbundles/vim-autotag,~/.vimbundles/vim-blockle,~/.vimbundles/vim-bufo
set scrolloff=3
set shell=bash
set shiftwidth=2
set showmatch
set noshowmode
set showtabline=2
set smartcase
set softtabstop=2
set splitbelow
set splitright
set statusline=[%n]\ %<%.99f\ %h%w%m%r%{HTry('CapsLockStatusline')}%y%{HTry('rails#statusline')}%{HTry('fugitive#statusline')}%#ErrorMsg#%{HTry('SyntasticStatuslineFlag')}%*%=%-14.(%l,%c%V%)\ %P
set noswapfile
set switchbuf=useopen,usetab
set tabline=%!airline#extensions#tabline#get()
set tabstop=2
set tags=./tags;
set tildeop
set title
set titlestring='Powerslave'
set undodir=~/.vim/tmp//,~/Library/Vim/undo,~/.vimbackupdir/.undo
set undofile
set viminfo='10,\"100,:20,%,n~/.viminfo
set visualbell
set whichwrap=b,s,h,l,<,>,[,]
set wildignore=*.o,*.obj,.git,tmp/**,public/uploads/**
set wildmenu
set wildmode=longest,list,full
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/src/getty/unisporkal/landing
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +0 app/models/asset_set.rb
badd +0 spec/fake_services_setup.rb
badd +0 spec/rack_spec_helper.rb
argglobal
silent! argdel *
$argadd app/models/asset_set.rb
edit app/models/asset_set.rb
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
3wincmd h
wincmd w
wincmd w
wincmd w
wincmd t
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
exe 'vert 1resize ' . ((&columns * 40 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 65 + 136) / 272)
exe 'vert 3resize ' . ((&columns * 65 + 136) / 272)
exe 'vert 4resize ' . ((&columns * 99 + 136) / 272)
argglobal
enew
file NERD_tree_1
let s:cpo_save=&cpo
set cpo&vim
inoremap <buffer> <silent> <BS> =AutoPairsDelete()
nnoremap <buffer> <silent> <NL> :call nerdtree#ui_glue#invokeKeyMap("<C-j>")
nnoremap <buffer> <silent>  :call nerdtree#ui_glue#invokeKeyMap("<C-k>")
nnoremap <buffer> <silent>  :call nerdtree#ui_glue#invokeKeyMap(g:NERDTreeMapActivateNode)
nnoremap <buffer> <silent> ? :call nerdtree#ui_glue#invokeKeyMap("?")
nnoremap <buffer> <silent> A :call nerdtree#ui_glue#invokeKeyMap("A")
nnoremap <buffer> <silent> B :call nerdtree#ui_glue#invokeKeyMap("B")
inoremap <buffer> <silent> § =AutoPairsMoveCharacter('''')
inoremap <buffer> <silent> ¢ =AutoPairsMoveCharacter('"')
inoremap <buffer> <silent> © =AutoPairsMoveCharacter(')')
inoremap <buffer> <silent> ¨ =AutoPairsMoveCharacter('(')
nnoremap <buffer> <silent> C :call nerdtree#ui_glue#invokeKeyMap("C")
nnoremap <buffer> <silent> CD :call nerdtree#ui_glue#invokeKeyMap("CD")
inoremap <buffer> <silent> î :call AutoPairsJump()a
inoremap <buffer> <silent> <expr> ð AutoPairsToggle()
inoremap <buffer> <silent> â =AutoPairsBackInsert()
inoremap <buffer> <silent> å =AutoPairsFastWrap()
inoremap <buffer> <silent> ý =AutoPairsMoveCharacter('}')
inoremap <buffer> <silent> û =AutoPairsMoveCharacter('{')
inoremap <buffer> <silent> Ý =AutoPairsMoveCharacter(']')
inoremap <buffer> <silent> Û =AutoPairsMoveCharacter('[')
nnoremap <buffer> <silent> D :call nerdtree#ui_glue#invokeKeyMap("D")
nnoremap <buffer> <silent> F :call nerdtree#ui_glue#invokeKeyMap("F")
nnoremap <buffer> <silent> I :call nerdtree#ui_glue#invokeKeyMap("I")
nnoremap <buffer> <silent> J :call nerdtree#ui_glue#invokeKeyMap("J")
nnoremap <buffer> <silent> K :call nerdtree#ui_glue#invokeKeyMap("K")
nnoremap <buffer> <silent> O :call nerdtree#ui_glue#invokeKeyMap("O")
nnoremap <buffer> <silent> P :call nerdtree#ui_glue#invokeKeyMap("P")
nnoremap <buffer> <silent> R :call nerdtree#ui_glue#invokeKeyMap("R")
nnoremap <buffer> <silent> T :call nerdtree#ui_glue#invokeKeyMap("T")
nnoremap <buffer> <silent> U :call nerdtree#ui_glue#invokeKeyMap("U")
nnoremap <buffer> <silent> X :call nerdtree#ui_glue#invokeKeyMap("X")
nnoremap <buffer> <silent> [c :call nerdtree#ui_glue#invokeKeyMap("[c")
nnoremap <buffer> <silent> ]c :call nerdtree#ui_glue#invokeKeyMap("]c")
nnoremap <buffer> <silent> cd :call nerdtree#ui_glue#invokeKeyMap("cd")
nnoremap <buffer> <silent> e :call nerdtree#ui_glue#invokeKeyMap("e")
nnoremap <buffer> <silent> f :call nerdtree#ui_glue#invokeKeyMap("f")
nnoremap <buffer> <silent> go :call nerdtree#ui_glue#invokeKeyMap("go")
nnoremap <buffer> <silent> gs :call nerdtree#ui_glue#invokeKeyMap("gs")
nnoremap <buffer> <silent> gi :call nerdtree#ui_glue#invokeKeyMap("gi")
nnoremap <buffer> <silent> i :call nerdtree#ui_glue#invokeKeyMap("i")
nnoremap <buffer> <silent> m :call nerdtree#ui_glue#invokeKeyMap("m")
nnoremap <buffer> <silent> o :call nerdtree#ui_glue#invokeKeyMap("o")
nnoremap <buffer> <silent> p :call nerdtree#ui_glue#invokeKeyMap("p")
nnoremap <buffer> <silent> q :call nerdtree#ui_glue#invokeKeyMap("q")
nnoremap <buffer> <silent> r :call nerdtree#ui_glue#invokeKeyMap("r")
nnoremap <buffer> <silent> s :call nerdtree#ui_glue#invokeKeyMap("s")
nnoremap <buffer> <silent> t :call nerdtree#ui_glue#invokeKeyMap("t")
nnoremap <buffer> <silent> u :call nerdtree#ui_glue#invokeKeyMap("u")
nnoremap <buffer> <silent> x :call nerdtree#ui_glue#invokeKeyMap("x")
nnoremap <buffer> <silent> <MiddleMouse> :call nerdtree#ui_glue#invokeKeyMap("<MiddleMouse>")
nnoremap <buffer> <silent> <2-LeftMouse> :call nerdtree#ui_glue#invokeKeyMap("<2-LeftMouse>")
nnoremap <buffer> <silent> <LeftRelease> <LeftRelease>:call nerdtree#ui_glue#invokeKeyMap("<LeftRelease>")
nnoremap <buffer> <D-R> :.Rake
nnoremap <buffer> <D-r> :Rake
inoremap <buffer> <silent>  =AutoPairsDelete()
inoremap <buffer> <silent>   =AutoPairsSpace()
inoremap <buffer> <silent> " =AutoPairsInsert('"')
inoremap <buffer> <silent> ' =AutoPairsInsert('''')
inoremap <buffer> <silent> ( =AutoPairsInsert('(')
inoremap <buffer> <silent> ) =AutoPairsInsert(')')
noremap <buffer> <silent> î :call AutoPairsJump()
noremap <buffer> <silent> ð :call AutoPairsToggle()
inoremap <buffer> <silent> [ =AutoPairsInsert('[')
inoremap <buffer> <silent> ] =AutoPairsInsert(']')
inoremap <buffer> <silent> ` =AutoPairsInsert('`')
inoremap <buffer> <silent> { =AutoPairsInsert('{')
inoremap <buffer> <silent> } =AutoPairsInsert('}')
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=hide
setlocal nobuflisted
setlocal buftype=nofile
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,\ %#Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-G\ %#Overwrite%.%#\"h\"%.%#,%+GStarted\ %\\u%\\u%.%#,%+GCompleted\ %\\d%\\d%\\d%.%#,%+G[ActiveJob]%.%#]\ Perform%.%#,%.%#rails\ test\ %f:%l,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ The\ fixture\ ID\ for\ %.%#,%f:\ %s\ (%m)%$%\\&%.%#/fixtures/%.%#(%\\d%\\+),%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Irails\ %\\S%\\+%\\s%\\+#\ %.%#,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%\\&completion=rails#complete_rails,%\\&console=console,%\\&start=server,%\\&terminal=%\\C%\\%%(console%\\|dbconsole%\\|server%\\|%[cs]%\\|db%\\)%\\>:%\\@!%\\ze%.%#,%\\&default=default,%D(in\ %f),%\\s%#%\\d%#:%#\ %#from\ %f:%l:%m,%\\s%#%\\d%#:%#\ %#from\ %f:%l:,%\\s%##\ %f:%l:%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%##\ %f:%l%\\&%.%#%\\D:%\\d%\\+,%\\s%#[%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:,%m\ [%f:%l]:,%+Erake\ aborted!,%+EDon't\ know\ how\ to\ build\ task\ %.%#,%+Einvalid\ option:%.%#,%+Irake\ %\\S%\\+%\\s%\\+#\ %.%#,%\\&chdir\ /Users/tmartin/src/getty/unisporkal/landing,%\\&buffer=`=rails#buffer(3).default_task(v:lnum)`
setlocal expandtab
if &filetype != 'nerdtree'
setlocal filetype=nerdtree
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=bin/rails
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal nomodifiable
setlocal nrformats=bin,octal,hex
set number
setlocal nonumber
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal readonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'nerdtree'
setlocal syntax=nerdtree
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=~/src/getty/unisporkal/landing/tags,./tags;
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=0
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal winfixwidth
setlocal nowrap
setlocal wrapmargin=0
wincmd w
argglobal
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> ,bt <Plug>BlockToggle
map <buffer> ,b <Plug>BlockToggle
nnoremap <buffer> <D-R> :.Rake
nnoremap <buffer> <D-r> :Rake
noremap <buffer> <silent> <End> g<End>
noremap <buffer> <silent> <Home> g<Home>
noremap <buffer> <silent> <Down> gj
noremap <buffer> <silent> <Up> gk
cmap <buffer>  <Plug><cfile>
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=:#\ 
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,\ %#Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-G\ %#Overwrite%.%#\"h\"%.%#,%+GStarted\ %\\u%\\u%.%#,%+GCompleted\ %\\d%\\d%\\d%.%#,%+G[ActiveJob]%.%#]\ Perform%.%#,%.%#rails\ test\ %f:%l,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ The\ fixture\ ID\ for\ %.%#,%f:\ %s\ (%m)%$%\\&%.%#/fixtures/%.%#(%\\d%\\+),%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Irails\ %\\S%\\+%\\s%\\+#\ %.%#,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%\\&completion=rails#complete_rails,%\\&console=console,%\\&start=server,%\\&terminal=%\\C%\\%%(console%\\|dbconsole%\\|server%\\|%[cs]%\\|db%\\)%\\>:%\\@!%\\ze%.%#,%\\&default=default,%D(in\ %f),%\\s%#%\\d%#:%#\ %#from\ %f:%l:%m,%\\s%#%\\d%#:%#\ %#from\ %f:%l:,%\\s%##\ %f:%l:%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%##\ %f:%l%\\&%.%#%\\D:%\\d%\\+,%\\s%#[%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:,%m\ [%f:%l]:,%+Erake\ aborted!,%+EDon't\ know\ how\ to\ build\ task\ %.%#,%+Einvalid\ option:%.%#,%+Irake\ %\\S%\\+%\\s%\\+#\ %.%#,%\\&chdir\ /Users/tmartin/src/getty/unisporkal/landing,%\\&buffer=`=rails#buffer(1).default_task(v:lnum)`
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,:,.,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end,=private,=protected,=public
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=bin/rails
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=~/src/getty/unisporkal/landing/lib,~/src/getty/unisporkal/landing/vendor,~/src/getty/unisporkal/landing/app/models/concerns,~/src/getty/unisporkal/landing/app/controllers/concerns,~/src/getty/unisporkal/landing/app/controllers,~/src/getty/unisporkal/landing/app/helpers,~/src/getty/unisporkal/landing/app/mailers,~/src/getty/unisporkal/landing/app/models,~/src/getty/unisporkal/landing/app/jobs,~/src/getty/unisporkal/landing/app/*,~/src/getty/unisporkal/landing/spec,~/src/getty/unisporkal/landing/spec/controllers,~/src/getty/unisporkal/landing/spec/helpers,~/src/getty/unisporkal/landing/spec/mailers,~/src/getty/unisporkal/landing/spec/models,~/src/getty/unisporkal/landing/spec/views,~/src/getty/unisporkal/landing/spec/lib,~/src/getty/unisporkal/landing/spec/features,~/src/getty/unisporkal/landing/spec/requests,~/src/getty/unisporkal/landing/spec/integration,~/src/getty/unisporkal/landing/spec/jobs,~/src/getty/unisporkal/landing/app/views,~/src/getty/unisporkal/landing,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(2)
setlocal suffixesadd=.rb,.raw,.erb,.html,.builder,.ruby,.coffee,.haml,.jbuilder
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=./tags;,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/tags,~/.rbenv/versions/2.3.1/lib/ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actioncable-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionmailer-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionpack-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionview-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/activejob-5.1.0/tags,~/.rbenv/versions/2.3.1/lib
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=79
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 4 - ((3 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
4
normal! 0
wincmd w
argglobal
if bufexists('spec/rack_spec_helper.rb') | buffer spec/rack_spec_helper.rb | else | edit spec/rack_spec_helper.rb | endif
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> ,bt <Plug>BlockToggle
map <buffer> ,b <Plug>BlockToggle
nnoremap <buffer> <D-R> :.Rake
nnoremap <buffer> <D-r> :Rake
cmap <buffer>  <Plug><cfile>
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=:#\ 
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,\ %#Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-G\ %#Overwrite%.%#\"h\"%.%#,%+GStarted\ %\\u%\\u%.%#,%+GCompleted\ %\\d%\\d%\\d%.%#,%+G[ActiveJob]%.%#]\ Perform%.%#,%.%#rails\ test\ %f:%l,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ The\ fixture\ ID\ for\ %.%#,%f:\ %s\ (%m)%$%\\&%.%#/fixtures/%.%#(%\\d%\\+),%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Irails\ %\\S%\\+%\\s%\\+#\ %.%#,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%\\&completion=rails#complete_rails,%\\&console=console,%\\&start=server,%\\&terminal=%\\C%\\%%(console%\\|dbconsole%\\|server%\\|%[cs]%\\|db%\\)%\\>:%\\@!%\\ze%.%#,%\\&default=default,%D(in\ %f),%\\s%#%\\d%#:%#\ %#from\ %f:%l:%m,%\\s%#%\\d%#:%#\ %#from\ %f:%l:,%\\s%##\ %f:%l:%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%##\ %f:%l%\\&%.%#%\\D:%\\d%\\+,%\\s%#[%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:,%m\ [%f:%l]:,%+Erake\ aborted!,%+EDon't\ know\ how\ to\ build\ task\ %.%#,%+Einvalid\ option:%.%#,%+Irake\ %\\S%\\+%\\s%\\+#\ %.%#,%\\&chdir\ /Users/tmartin/src/getty/unisporkal/landing,%\\&buffer=`=rails#buffer(5).default_task(v:lnum)`
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,:,.,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end,=private,=protected,=public
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=bin/rails
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=~/src/getty/unisporkal/landing/lib,~/src/getty/unisporkal/landing/vendor,~/src/getty/unisporkal/landing/app/models/concerns,~/src/getty/unisporkal/landing/app/controllers/concerns,~/src/getty/unisporkal/landing/app/controllers,~/src/getty/unisporkal/landing/app/helpers,~/src/getty/unisporkal/landing/app/mailers,~/src/getty/unisporkal/landing/app/models,~/src/getty/unisporkal/landing/app/jobs,~/src/getty/unisporkal/landing/app/*,~/src/getty/unisporkal/landing/spec,~/src/getty/unisporkal/landing/spec/controllers,~/src/getty/unisporkal/landing/spec/helpers,~/src/getty/unisporkal/landing/spec/mailers,~/src/getty/unisporkal/landing/spec/models,~/src/getty/unisporkal/landing/spec/views,~/src/getty/unisporkal/landing/spec/lib,~/src/getty/unisporkal/landing/spec/features,~/src/getty/unisporkal/landing/spec/requests,~/src/getty/unisporkal/landing/spec/integration,~/src/getty/unisporkal/landing/spec/jobs,~/src/getty/unisporkal/landing/app/views,~/src/getty/unisporkal/landing,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(3)
setlocal suffixesadd=.rb,.raw,.erb,.html,.builder,.ruby,.coffee,.haml,.jbuilder
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=./tags;,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/tags,~/.rbenv/versions/2.3.1/lib/ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actioncable-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionmailer-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionpack-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionview-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/activejob-5.1.0/tags,~/.rbenv/versions/2.3.1/lib
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=79
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 19 - ((18 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
19
normal! 0
wincmd w
argglobal
if bufexists('spec/fake_services_setup.rb') | buffer spec/fake_services_setup.rb | else | edit spec/fake_services_setup.rb | endif
let s:cpo_save=&cpo
set cpo&vim
nmap <buffer> ,bt <Plug>BlockToggle
map <buffer> ,b <Plug>BlockToggle
nnoremap <buffer> <D-R> :.Rake
nnoremap <buffer> <D-r> :Rake
cmap <buffer>  <Plug><cfile>
let &cpo=s:cpo_save
unlet s:cpo_save
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal backupcopy=
setlocal balloonexpr=
setlocal nobinary
setlocal nobreakindent
setlocal breakindentopt=
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal nocindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=:#\ 
setlocal commentstring=#\ %s
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=inc
setlocal conceallevel=2
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
set cursorline
setlocal cursorline
setlocal define=^\\s*def\\s\\+\\(self\\.\\)\\=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=%\\S%\\+\ \ %#%[cefi]%[rxod]%[eir]%[a-z]%#%\\x1b[0m\ %\\+%\\S%\\+%$%\\&%\\x1b%\\S%\\+\ \ %#%m%\\>%\\x1b[0m\ \ %#%f,%\\s\ %#%[cefi]%[rxod]%[eir]%[a-z]%#\ %\\+%\\S%\\+%$%\\&%\\s\ %#%m%\\>\ \ %#%f,\ %#Overwrite%.%#%\\S%\\+\ \ %#%m%\\x1b[0m\ \ %#%f,%-G\ %#Overwrite%.%#\"h\"%.%#,%+GStarted\ %\\u%\\u%.%#,%+GCompleted\ %\\d%\\d%\\d%.%#,%+G[ActiveJob]%.%#]\ Perform%.%#,%.%#rails\ test\ %f:%l,%+GCurrent\ version:%.%#,%+G\ %#Status\ %#Migration\ ID%.%#,%+G\ The\ fixture\ ID\ for\ %.%#,%f:\ %s\ (%m)%$%\\&%.%#/fixtures/%.%#(%\\d%\\+),%+G\ %#Prefix\ %#Verb%.%#,%+G\ %#Code\ LOC:\ %.%#,%+GAbout\ your\ application's\ environment,%+Grun\ %\\S%#::Application.routes,%+Irails\ %\\S%\\+%\\s%\\+#\ %.%#,%+Eruby:%.%#(LoadError),%+EUsage:%.%#,%+ECould\ not\ find\ generator%.%#,%+EType\ 'rails'\ for\ help.,%\\&completion=rails#complete_rails,%\\&console=console,%\\&start=server,%\\&terminal=%\\C%\\%%(console%\\|dbconsole%\\|server%\\|%[cs]%\\|db%\\)%\\>:%\\@!%\\ze%.%#,%\\&default=default,%D(in\ %f),%\\s%#%\\d%#:%#\ %#from\ %f:%l:%m,%\\s%#%\\d%#:%#\ %#from\ %f:%l:,%\\s%##\ %f:%l:%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%##\ %f:%l%\\&%.%#%\\D:%\\d%\\+,%\\s%#[%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:\ %#%m%\\&%.%#%\\D:%\\d%\\+:%.%#,%\\s%#%f:%l:,%m\ [%f:%l]:,%+Erake\ aborted!,%+EDon't\ know\ how\ to\ build\ task\ %.%#,%+Einvalid\ option:%.%#,%+Irake\ %\\S%\\+%\\s%\\+#\ %.%#,%\\&chdir\ /Users/tmartin/src/getty/unisporkal/landing,%\\&buffer=`=rails#buffer(4).default_task(v:lnum)`
setlocal expandtab
if &filetype != 'ruby'
setlocal filetype=ruby
endif
setlocal fixendofline
setlocal foldcolumn=0
set nofoldenable
setlocal nofoldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=0
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=croql
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal formatprg=
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=-1
setlocal include=^\\s*\\<\\(load\\>\\|require\\>\\|autoload\\s*:\\=[\"']\\=\\h\\w*[\"']\\=,\\)
setlocal includeexpr=
setlocal indentexpr=GetRubyIndent(v:lnum)
setlocal indentkeys=0{,0},0),0],!^F,o,O,e,:,.,=end,=else,=elsif,=when,=ensure,=rescue,==begin,==end,=private,=protected,=public
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=ri
set linebreak
setlocal linebreak
setlocal nolisp
setlocal lispwords=
set list
setlocal list
setlocal makeencoding=
setlocal makeprg=bin/rails
setlocal matchpairs=(:),{:},[:],<:>
setlocal modeline
setlocal modifiable
setlocal nrformats=bin,octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=rubycomplete#Complete
setlocal path=~/src/getty/unisporkal/landing/lib,~/src/getty/unisporkal/landing/vendor,~/src/getty/unisporkal/landing/app/models/concerns,~/src/getty/unisporkal/landing/app/controllers/concerns,~/src/getty/unisporkal/landing/app/controllers,~/src/getty/unisporkal/landing/app/helpers,~/src/getty/unisporkal/landing/app/mailers,~/src/getty/unisporkal/landing/app/models,~/src/getty/unisporkal/landing/app/jobs,~/src/getty/unisporkal/landing/app/*,~/src/getty/unisporkal/landing/spec,~/src/getty/unisporkal/landing/spec/controllers,~/src/getty/unisporkal/landing/spec/helpers,~/src/getty/unisporkal/landing/spec/mailers,~/src/getty/unisporkal/landing/spec/models,~/src/getty/unisporkal/landing/spec/views,~/src/getty/unisporkal/landing/spec/lib,~/src/getty/unisporkal/landing/spec/features,~/src/getty/unisporkal/landing/spec/requests,~/src/getty/unisporkal/landing/spec/integration,~/src/getty/unisporkal/landing/spec/jobs,~/src/getty/unisporkal/landing/app/views,~/src/getty/unisporkal/landing,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal signcolumn=auto
setlocal nosmartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(4)
setlocal suffixesadd=.rb,.raw,.erb,.html,.builder,.ruby,.coffee,.haml,.jbuilder
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'ruby'
setlocal syntax=ruby
endif
setlocal tabstop=2
setlocal tagcase=
setlocal tags=./tags;,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,/usr/local/Cellar/rbenv/1.1.1/rbenv.d/exec/gem-rehash/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/site_ruby/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/vendor_ruby/tags,~/.rbenv/versions/2.3.1/lib/ruby/2.3.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/2.3.0/x86_64-darwin17/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actioncable-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionmailer-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionpack-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/actionview-5.1.0/tags,~/.rbenv/versions/2.3.1/lib/ruby/gems/2.3.0/gems/activejob-5.1.0/tags,~/.rbenv/versions/2.3.1/lib
setlocal termwinkey=
setlocal termwinscroll=10000
setlocal termwinsize=
setlocal textwidth=79
setlocal thesaurus=
setlocal undofile
setlocal undolevels=-123456
setlocal varsofttabstop=
setlocal vartabstop=
setlocal nowinfixheight
setlocal nowinfixwidth
setlocal wrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 26 - ((20 * winheight(0) + 38) / 77)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
26
normal! 0
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 40 + 136) / 272)
exe 'vert 2resize ' . ((&columns * 65 + 136) / 272)
exe 'vert 3resize ' . ((&columns * 65 + 136) / 272)
exe 'vert 4resize ' . ((&columns * 99 + 136) / 272)
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filnxtToO
set winminheight=1 winminwidth=1
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
