#!/bin/bash

if [ -z $VIMWIKI_MD_DIR ]
then
    echo "Doing nothing. VIMWIKI_MD_DIR not set."
    exit 1
fi

I_DIR="$HOME/$VIMWIKI_MD_DIR"
O_DIR="$I_DIR/html"

if [ ! -d "$O_DIR" ]
then
    echo "Creating $O_DIR"
    mkdir "$O_DIR"
fi

echo "Converting to html..."
for f in $I_DIR/*.md
do
    if [ -f "$f" ]
    then
        pandoc -s --metadata title="wiki" -f markdown -t html -o "${O_DIR}/$(basename ${f%.md}).html" "$f"
    fi
done

echo "Fixing links..."
for f in $O_DIR/*.html
do
    if [ -f "$f" ]
    then
        sed -i -E 's/(href=".*)(")/\1.html\2/g' "$f"
    fi
done

echo "Done."
echo "Run firefox $O_DIR/index.html"
