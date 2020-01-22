BUILD_DIRECTORY_NAME = build
BUILD_DIRECTORY      = $(PWD)/$(BUILD_DIRECTORY_NAME)
REGISTRY_USERNAME    = tjmaynes
REGISTRY_PASSWORD    ?= ""
IMAGE_NAME           = career-builder
TAG                  = latest
TARGET_BRANCH        = release
REPO                 = git@github.com:tjmaynes/career.git

check_version:
	xelatex --version

build: clean check_version
	chmod +x ./scripts/build.sh
	./scripts/build.sh \
	$(BUILD_DIRECTORY)

build_image:
	chmod +x ./scripts/build_image.sh
	./scripts/build_image.sh $(REGISTRY_USERNAME) $(IMAGE_NAME) $(TAG)

deploy_artifact:
	chmod +x ./scripts/deploy_artifact.sh
	./scripts/deploy_artifact.sh \
	$(GIT_USERNAME) \
	$(GIT_EMAIL) \
	$(GIT_COMMIT_SHA) \
	$(TARGET_BRANCH) \
	$(BUILD_DIRECTORY_NAME) \
	$(REPO)

push_image:
	chmod +x ./scripts/push_image.sh
	./scripts/push_image.sh \
	$(REGISTRY_USERNAME) \
	$(REGISTRY_PASSWORD) \
	$(IMAGE_NAME) \
	$(TAG)

debug_image:
	chmod +x ./scripts/debug_image.sh
	./scripts/debug_image.sh \
	$(REGISTRY_USERNAME) \
	$(IMAGE_NAME) \
	$(TAG) \
	$(PWD)

clean:
	rm -rf $(BUILD_DIRECTORY)

.PHONY: build