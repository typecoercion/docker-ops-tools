version := 0.2.20

build-push:
	docker buildx build --platform linux/amd64,linux/arm64 --push -t ghcr.io/typecoercion/ops-tools:$(version) .

create-use:
	docker buildx create --name with-arm64
	docker buildx use with-arm64

docker-login:
	docker login --username carbidemouse
