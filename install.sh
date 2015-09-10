#!/bin/bash

# set package name
PCK="dn"

echo "Checking requirements..."
if [ "$(command -v latex)" = "" -o "$(command -v pdflatex)" = "" ]; then
    echo "ERROR: one of these commands is missing: latex or pdflatex"
    exit 0
fi

echo "Checking system..."
SYSTEM=$(uname -s)
echo "$SYSTEM found."

# define local tex installation path
case "$SYSTEM" in
    "Darwin" )
    DIR="$HOME/Library/texmf"
    ;;
    "Linux" )
    DIR="$HOME/texmf/tex"
    ;;
esac

# directories
DIR_LIST=("" "tex" "doc" "tex/latex" "tex/latex/$PCK" "doc" "doc/$PCK")

echo "Creating directories if needed..."
for i in "${!DIR_LIST[@]}"; do
    if [ ! -d "$DIR/${DIR_LIST[$i]}" ]; then
        mkdir "$DIR/${DIR_LIST[$i]}"
    fi
done

echo "Installing..."

echo "Creating .sty file..."
latex "$PCK.ins"

echo "Creating documentation..."
pdflatex "$PCK.dtx"

echo "Moving to correct location..."
cp "$PWD/$PCK.pdf" "$DIR/doc/$PCK/$PCK.pdf"
cp "$PWD/$PCK.dtx" "$DIR/doc/$PCK/$PCK.dtx"
cp "$PWD/$PCK.sty" "$DIR/tex/latex/$PCK/$PCK.sty"

echo "Done."
