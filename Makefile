BUILD_DIRECTORY_NAME = build
BUILD_DIRECTORY      = $(PWD)/$(BUILD_DIRECTORY_NAME)
REGISTRY_USERNAME    = tjmaynes
REGISTRY_PASSWORD    ?= ""
IMAGE_NAME           = career-builder
TAG                  = latest

check_version:
	xelatex --version

build: clean check_version
	./scripts/build.sh \
	$(BUILD_DIRECTORY)

build_image:
	./scripts/build_image.sh $(REGISTRY_USERNAME) $(IMAGE_NAME) $(TAG)

push_image:
	./scripts/push_image.sh \
	$(REGISTRY_USERNAME) \
	$(REGISTRY_PASSWORD) \
	$(IMAGE_NAME) \
	$(TAG)

debug_image:
	./scripts/debug_image.sh \
	$(REGISTRY_USERNAME) \
	$(IMAGE_NAME) \
	$(TAG) \
	$(PWD)

clean:
	rm -rf $(BUILD_DIRECTORY)

.PHONY: build