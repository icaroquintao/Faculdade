all: 
	pdflatex aeds.tex
	bibtex aeds
	pdflatex aeds.tex
	pdflatex aeds.tex
run: clean all 
	evince aeds.pdf &
clean:
	rm *.aux *.bbl *.blg *.log *.toc
