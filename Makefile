IMAGE_NAME:=agapanto-under-construction
IMAGE_VERSION:=latest
IMAGE_TAG=$(IMAGE_NAME):$(IMAGE_VERSION)
SLIM_IMAGE_TAG=$(IMAGE_NAME).slim:$(IMAGE_VERSION)

# Local development recipes
npm-build:
	npm run build

npm-serve:
	npm run serve

# Docker related recipes
docker-info:
	@echo "IMAGE NAME     : ${IMAGE_NAME}"
	@echo "IMAGE VERSION  : ${IMAGE_VERSION}"
	@echo "IMAGE TAG      : ${IMAGE_TAG}"
	@echo "SLIM_IMAGE TAG : ${SLIM_IMAGE_TAG}"

docker-build:
	docker build . -t ${IMAGE_TAG}

docker-slim:
	docker-slim build ${IMAGE_TAG} --tag ${SLIM_IMAGE_TAG}

docker-run:
	docker run ${IMAGE_TAG}

docker-run-slim:
	docker run ${SLIM_IMAGE_TAG}
