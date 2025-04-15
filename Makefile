MASTER  = paper
VERSION = v1.0

all: clean
	@pdflatex ${MASTER}.tex
	@test -f literatur.bib && ( bibtex ${MASTER}; pdflatex ${MASTER}.tex ) || echo "No Bibtex"
	@pdflatex ${MASTER}.tex 

clean:
	@rm -rf *run.xml *-blx.bib *.aux *.bbl *.bcf *.blg *.brf *.log *.lof *.lot *.lol *.out *.tcp *.toc *.tps *.bak *.backup *.pdfsync *.synctex.gz *.*~
	@for i in run.xml -blx.bib aux bbl blg brf log lof lot lol out tcp toc tps bak backup pdfsync synctex.gz; do find . -name *.$$i -exec rm -f {} + ; done
	@find . -name *.*~ -exec rm -f {} +

