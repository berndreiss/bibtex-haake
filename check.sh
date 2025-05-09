#!/bin/bash

TEX_NAME=paper
WORD_NAME=VorlageWord

clear

echo "Kompiliere .tex Datei..."
make > /dev/null 2>&1

echo ""
echo "Vergleiche Einträge -> kein weiterer Output heißt alles gut ;) "

compare_entry() {
    local file="$1"
    local lines_after="$2"
    local pattern="$3"
    WORD=$(grep -A $2 "$1" $WORD_NAME.txt | paste -sd' ')
    WORD=$(echo "$WORD" | sed 's/Conger./Conger/g')
    WORD=$(echo "$WORD" | sed 's/R.E./R. E./g')
    WORD=$(echo "$WORD" | sed 's/W.E./W. E./g')
    WORD=$(echo "$WORD" | sed 's/K.D./K. D./g')
    TEX=$(grep -A $3 "$1" $TEX_NAME.txt | paste -sd' ')
    TEX=$(echo "$TEX" | sed "s/’/'/g")
    TEX=$(echo "$TEX" | sed "s/–/-/g")
    if [[ "$TEX" == *": //"* ]]; then
       TEX=$(echo $TEX | sed 's/: \/\//:\/\//g')
    fi

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
sed -i '/chipubform/a\(visited on 04/15/2025).' $WORD_NAME.txt
sed -i 's#\(http://www\.acm\.org/sigchi/chipubform/\)\.#\1#' $WORD_NAME.txt

pdftotext $TEX_NAME.pdf

compare_entry Schwartz 2 2
compare_entry videotape 2 2
compare_entry impacts 2 2
compare_entry Conference 2 3
compare_entry "Ethics and" 1 1

echo ""

rm -f $WORD_NAME.txt $TEX_NAME.txt
make clean
