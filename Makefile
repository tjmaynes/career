.PHONY: build
build: clean
	xelatex cv.tex
	xelatex resume.tex

resign: clean
	./scripts/build-resignation-pdf.sh

clean:
	rm -rf build
	rm -f *.log *.pdf

