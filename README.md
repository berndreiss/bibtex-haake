## TODOs

- Einträge alphabetisch ordnen
- Nachname, Vorname statt Vorname Nachname
- "eds." statt editors und in Klammern 
- Bei @article editors mit (eds.) angeben falls vorhanden
- issue_date berücksichtigen bei @article und @inproceedings
- Jahreszahl bei @article und  @inpoceedings in Klammern mit Angabe von Monat/Jahreszeit 
- Seitenzahlen am Ende des Eintrags 
- kein "pages" oder ähnliches vor Seiten
- ", in" für Proceedings
- kein "in" für Artikel 
- ~~URL + Available at + (visited on mm/dd/yyyy). bei @online ergänzen (ACHTUNG hier weichen wir absichtlich von der Wordvorlage ab!!)~~
- ~~Großbuchstaben im Titel nicht klein machen~~
- Booktitle wird bei Monographien nicht erkannt
- ~~erledigtes Item~~

## Hinweise

Statt ```pdflatex``` kann auch ```make``` bzw. zum Aufräumen ```make clean``` verwendet werden (zumindest auf Linux-Systemen sollte das laufen). Ansonsten eben ```pdflatex paper && bibtex paper && pdflatex paper```.

Das Bash-Skript ```check.sh``` checkt das Ergebnis gegen die Wordvorlage. Dependencies: ```paste``` und ```pdftotext``` (ich nehme mal an, dass ```sed``` und ```grep``` zur Verfügung stehen :) ). Sollte ```make``` Probleme machen besser vorher paper.pdf erzeugen, sonst lässt das Skript das nämlich laufen. Das Skript ist jetzt vor allem interessant, um die beiden Einträge "side-by-side" zu sehen. Später sollte es dann aber keine Unterschiede mehr ausgeben.
