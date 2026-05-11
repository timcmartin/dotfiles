#!/usr/bin/env bash
set -euo pipefail

usage() {
  echo "Usage: $0 <getty|istock> <path-to-extracted-PDF-folder>"
  echo ""
  echo "Examples:"
  echo "  $0 getty /tmp/cla-update/PDF"
  echo "  $0 istock /tmp/cla-update/PDF"
  exit 1
}

if [ $# -lt 2 ]; then
  usage
fi

SITE="$1"
SRC="$2"
UNISPORKAL_ROOT="$HOME/src/getty/unisporkal"

# Locale mapping: zip suffix → app locale
# Add entries here if the Localization team introduces new locale codes
declare -A LOCALE_MAP=(
  [af]=af [de]=de [en-gb]=en-gb [en-us]=en-us [es]=es [fr]=fr
  [it]=it [jp]=ja [ja]=ja [ko]=ko [nl]=nl [pl]=pl [pt-br]=pt-br
  [pt]=pt-pt [pt-pt]=pt-pt [ru]=ru [se]=sv [sv]=sv [tr]=tr [zh-hk]=zh-hk
)

# Detect source filename prefix by checking what's in the zip
SRC_PREFIX=""
for f in "${SRC}"/*.pdf; do
  basename="$(basename "$f" .pdf)"
  # Strip locale suffix to get the prefix (e.g., Content_License_Agreement)
  SRC_PREFIX="${basename%_*}"
  # Handle locales with hyphens (e.g., _en-us → strip _en)
  if [[ "$SRC_PREFIX" == *"_"* ]] && [[ "$basename" == *"-"* ]]; then
    SRC_PREFIX="${basename%%_[a-z]*}"
  fi
  break
done

if [ -z "$SRC_PREFIX" ]; then
  echo "ERROR: No PDF files found in ${SRC}"
  exit 1
fi

echo "Detected source filename prefix: ${SRC_PREFIX}"
echo "Site: ${SITE}"
echo ""

# Define targets based on site
if [ "$SITE" = "getty" ]; then
  TARGETS=(
    "misc_admin/app/assets/pdf/getty|Content_License_Agreement"
    "purchase/app/assets/pdf/getty|Content_License_Agreement"
    "federated-components/checkout/src/assets/pdf/getty|content-license-agreement"
  )
elif [ "$SITE" = "istock" ]; then
  TARGETS=(
    "purchase/app/assets/pdf/istock|content_license_agreement"
    "federated-components/checkout/src/assets/pdf/istock|content-license-agreement"
  )
else
  echo "ERROR: Site must be 'getty' or 'istock'"
  usage
fi

# Process each source file
for src_file in "${SRC}"/*.pdf; do
  basename="$(basename "$src_file" .pdf)"
  # Extract the locale suffix (everything after the last underscore, but handle hyphenated locales)
  zip_locale="${basename##*_}"

  # Check for hyphenated locales like en-gb, pt-br, zh-hk
  # If the part before the last underscore also ends with a common prefix, it's a simple locale
  # But if the filename has e.g., _en-gb, we need to grab that
  possible_hyphen="${basename%_*}"
  possible_hyphen="${possible_hyphen##*_}"
  if [[ "$zip_locale" =~ ^(gb|us|br|pt|hk)$ ]] && [[ "$possible_hyphen" =~ ^(en|pt|zh)$ ]]; then
    zip_locale="${possible_hyphen}-${zip_locale}"
  fi

  # Map to app locale
  app_locale="${LOCALE_MAP[$zip_locale]:-}"
  if [ -z "$app_locale" ]; then
    echo "⚠️  Unknown locale '${zip_locale}' in file $(basename "$src_file") — skipping"
    continue
  fi

  for target in "${TARGETS[@]}"; do
    IFS='|' read -r rel_path filename_prefix <<<"$target"
    dest_base="${UNISPORKAL_ROOT}/${rel_path}"
    dest_file="${dest_base}/${app_locale}/${filename_prefix}.${app_locale}.pdf"

    if [ ! -d "$(dirname "$dest_file")" ]; then
      echo "  ⚠️  SKIP: Destination dir missing: $(dirname "$dest_file")"
      continue
    fi

    cp "$src_file" "$dest_file"
    echo "  ✓ $(basename "$src_file") → ${rel_path}/${app_locale}/"
  done
done

echo ""
echo "Done! Don't forget to commit changes in each app separately."
echo ""
echo "Apps to commit:"
for target in "${TARGETS[@]}"; do
  IFS='|' read -r rel_path _ <<<"$target"
  case "$rel_path" in
    federated-components/*) app_name="checkout federated component" ;;
    *) app_name="${rel_path%%/*}" ;;
  esac
  echo "  - ${app_name}"
done
