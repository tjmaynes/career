.PHONY: build
build: clean
	./scripts/build.sh "cv"
	./scripts/build.sh "resume"

resign: clean
	./scripts/build-resignation-pdf.sh

clean:
	rm -rf build/

deploy: build
