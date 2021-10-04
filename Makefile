BUILD_DIRECTORY_NAME = build
REGISTRY_USERNAME    = tjmaynes
REGISTRY_PASSWORD    ?= ""
IMAGE_NAME           = career-builder
TAG                  = latest

.PHONY: build
build: clean
	./scripts/build.sh

clean:
	rm -rf build/

deploy: build
