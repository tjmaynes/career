.PHONY: build
build: clean
	pdflatex cv.tex
	pdflatex resume.tex

resign: clean
	./scripts/build-resignation-pdf.sh

clean:
	rm -rf build
	rm -f *.log *.pdf

