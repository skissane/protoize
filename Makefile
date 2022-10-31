IMAGE_REPO = skissane
IMAGE_NAME = protoize
IMAGE_TAG  = latest
IMAGE_PATH = $(IMAGE_REPO)/$(IMAGE_NAME)
IMAGE_FULL = $(IMAGE_PATH):$(IMAGE_TAG)
BASEDIR=$(shell pwd)
UID=$(shell id -u)
GID=$(shell id -g)

CONTAINER_NAME = $(IMAGE_NAME)

define docker_run
	docker run --rm --name $(CONTAINER_NAME) -u $(UID):$(GID) -v $(BASEDIR)/work:/work $(2) $(IMAGE_FULL) $(1)
endef

.PHONY: build
build:
	docker build -t $(IMAGE_FULL) .

.PHONY: shell
shell: build work
	$(call docker_run,/bin/bash $(ARGS),-it $(DOCKER_ARGS))

.PHONY: protoize
protoize: build work
	$(call docker_run,protoize $(ARGS),$(DOCKER_ARGS))

work:
	@mkdir -p work
