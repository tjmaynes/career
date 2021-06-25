BUILD_DIRECTORY_NAME = build
REGISTRY_USERNAME    = tjmaynes
REGISTRY_PASSWORD    ?= ""
IMAGE_NAME           = career-builder
TAG                  = latest

build:
	./scripts/build.sh

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
