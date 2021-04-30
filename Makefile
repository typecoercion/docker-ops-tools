platforms := linux/amd64,linux/arm64
version   := $(shell cat VERSION)

build-push:
	docker buildx build --platform $(platforms) --push -t ghcr.io/typecoercion/ops-tools:$(version) .

create-use:
	docker buildx create --name with-arm64
	docker buildx use with-arm64

docker-login:
	docker login --username carbidemouse

increment-version:
	./scripts/make/increment-version
