#!/bin/sh
# Assembles the single-file desk page from desk/ parts into public/index.html.
# Edit the parts, never public/index.html (it is gitignored and rebuilt in CI).
set -e
cd "$(dirname "$0")"
mkdir -p public
cat desk/01-head.html desk/02-style.css desk/03-header.html desk/04-scene.svg.html \
    desk/05-overlay.html desk/06-script.js.html desk/07-tail.html > public/index.html
echo "built public/index.html ($(wc -c < public/index.html) bytes)"
