IMAGE_REGISTRY:=localhost:32000
IMAGE_NAME:=agapanto-under-construction
IMAGE_VERSION:=latest
IMAGE_TAG=$(IMAGE_NAME):$(IMAGE_VERSION)

# Local development recipes
npm-build:
	npm run build

npm-serve:
	npm run serve

# Docker related recipes
docker-info:
	@echo "IMAGE REGISTRY : ${IMAGE_REGISTRY}"
	@echo "IMAGE NAME     : ${IMAGE_NAME}"
	@echo "IMAGE VERSION  : ${IMAGE_VERSION}"
	@echo "IMAGE TAG      : ${IMAGE_TAG}"

docker-build:
	docker build . -t ${IMAGE_REGISTRY}/${IMAGE_TAG}

docker-run:
	docker run ${IMAGE_REGISTRY}/${IMAGE_TAG}
