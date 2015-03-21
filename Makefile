name=presentation
TEX := $(shell find . -name '*.tex')
PDF := $(shell find . -name '*.pdf')
PNG := $(shell find . -name '*.png')
all: $(name).pdf
examples/gravity.pdf: examples/gravity.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/gravity.tex
	cd examples; bibtex gravity
	pdflatex -aux-directory=examples -output-directory=examples examples/gravity.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/gravity.tex
examples/table.pdf: examples/table.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/table.tex
examples/math.pdf: examples/math.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/math.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/math.tex
examples/lists2.pdf: examples/lists2.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/lists2.tex
examples/lists.pdf: examples/lists.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/lists.tex
examples/hello_world.pdf: examples/hello_world.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/hello_world.tex
examples/hello_world2.pdf: examples/hello_world2.tex
	pdflatex -aux-directory=examples -output-directory=examples examples/hello_world2.tex
$(name).pdf: refs.bib $(TEX) $(PDF) $(PNG) examples/hello_world.pdf examples/hello_world2.pdf examples/lists.pdf examples/lists2.pdf examples/math.pdf examples/table.pdf examples/gravity.pdf
	pdflatex ${name}.tex
	bibtex ${name}
	pdflatex ${name}.tex
	pdflatex ${name}.tex
clean:
	find . -type f -name '*.aux' -delete
	find . -type f -name '*.out' -delete
	find . -type f -name '*.log' -delete
	find . -type f -name '*.bbl' -delete
	find . -type f -name '*.blg' -delete
	find . -type f -name '*.log' -delete
	find . -type f -name '*.bak' -delete
	find . -type f -name '*.lot' -delete
	find . -type f -name '*.lof' -delete
	find . -type f -name '*.idx' -delete
	find . -type f -name '*.toc' -delete
	find . -type f -name '*.vrb' -delete
	find . -type f -name '*.nav' -delete
	find . -type f -name '*.toc' -delete
	find . -type f -name '*.snm' -delete
	find . -type f -name '*.tmp' -delete
	find . -type f -name '*~' -delete
	find examples/ -type f -name '*.pdf' -delete
	rm ${name}.pdf
