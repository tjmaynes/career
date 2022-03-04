.PHONY: build
build: clean
	./scripts/build.sh

clean:
	rm -rf build/

deploy: build
