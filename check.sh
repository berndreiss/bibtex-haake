#!/bin/bash

TEX_NAME=paper
WORD_NAME=VorlageWord

if [ ! -f "$TEX_NAME.tex" ]; then
    echo "Kompiliere .tex Datei..."
    make > /dev/null 2>&1
fi

echo ""
echo "Vergleiche Einträge -> kein weiterer Output heißt alles gut ;) "

compare_entry() {
    local file="$1"
    local lines_after="$2"
    local pattern="$3"
    WORD=$(grep -A $2 "$1" $WORD_NAME.txt | paste -sd' ')
    TEX=$(grep -A $3 "$1" $TEX_NAME.txt | paste -sd' ')

    if [ "$WORD" != "$TEX" ]; then
        echo "<---UNTERSCHIEDE GEFUNDEN--->"
        echo ""
        echo "Vorlage:"
        echo "$WORD"
        echo ""
        echo "Bibtex:"
        echo "$TEX"
        echo ""
    fi
}

pdftotext $WORD_NAME.pdf
pdftotext $TEX_NAME.pdf

compare_entry Schwartz 2 1
compare_entry videotape 2 1
compare_entry impacts 2 1
compare_entry Conference 1 0
compare_entry "Ethics and" 1 0

rm -f $WORD_NAME.txt $TEX_NAME.txt
make clean
