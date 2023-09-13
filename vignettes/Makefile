
GSCMD = R --slave -e 'cat(tools::find_gs_cmd())'

bob:
	echo $$($(GSCMD))

all: north.html mapmisc.pdf perspective.html

clean:
	rm -rf *.md *.tex *.toc *.bbl *.blg *.aux *.out *.log *.spl *tikzDictionary *.md figure/ cache/ *.dvi *.4* *.css *.idv *.lg *.tmp *.xref *.gz my*.bib *.nav *.xml *.vrb *.snm 

empty:
	rm *.pdf *.html

%.pdf: %.tex
	mkdir -p mapmiscUncompressed;
	xelatex -interaction=nonstopmode --output-directory=mapmiscUncompressed $<;
	xelatex -interaction=nonstopmode --output-directory=mapmiscUncompressed $<;
	$$($(GSCMD)) -q -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dPDFSETTINGS=/ebook -dCompatibilityLevel=1.5 -dAutoRotatePages=/None -dPrinted=false -sOutputFile='$@' 'mapmiscUncompressed/$@';
	rm -r mapmiscUncompressed

#	R --slave -e "tools::compactPDF('$@', gs_quality='ebook')" 


%.md: %.Rmd
	R --slave -e "knitr::knit('$<')"

%.tex: %.Rnw
	R --slave -e "knitr::knit('$<')"

	
%.html: %.md
	pandoc  --embed-resources --standalone --to=html5 --css=http://diseasemapping.r-forge.r-project.org/webpage.css --output=$@ $<	
