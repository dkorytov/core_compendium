
core_fit_notes.pdf: core_fit_notes.tex
	pdflatex core_fit_notes.tex
	pdflatex core_fit_notes.tex
clean:
	rm core_fit_notes.pdf
