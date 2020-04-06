ENV_FILE:=.env.local
IMAGE_REGISTRY:=localhost:32000
IMAGE_NAME:=agapanto-under-construction
IMAGE_VERSION:=latest
IMAGE_SUFFIX:=-dev
IMAGE_TAG=$(IMAGE_NAME):$(IMAGE_VERSION)$(IMAGE_SUFFIX)

# Local development recipes
npm-install:
	npm install

npm-build:
	npm run build

npm-serve:
	npm run serve

# Docker related recipes
docker-info:
	@echo "ENV_FILE       : ${ENV_FILE}"
	@echo "IMAGE_REGISTRY : ${IMAGE_REGISTRY}"
	@echo "IMAGE_NAME     : ${IMAGE_NAME}"
	@echo "IMAGE_VERSION  : ${IMAGE_VERSION}"
	@echo "IMAGE_SUFFIX   : ${IMAGE_SUFFIX}"
	@echo "IMAGE_TAG      : ${IMAGE_TAG}"

docker-build:
	# Build docker image passing specified ENV_FILE values
	bash ./scripts/docker-build.sh ${ENV_FILE} ${IMAGE_TAG}

docker-tag:
	docker tag ${IMAGE_TAG} ${IMAGE_REGISTRY}/${IMAGE_TAG}

docker-push:
	docker push ${IMAGE_REGISTRY}/${IMAGE_TAG}

docker-release: docker-info docker-build docker-tag docker-push

docker-run:
	docker run -t \
		--env-file $(ENV_FILE) \
		$(IMAGE_TAG)

docker-shell:
	docker run -it --rm \
		--entrypoint=/bin/sh \
		--env-file $(ENV_FILE) \
		$(IMAGE_TAG)

# Helm(k8s package manager) related recipes
helm-install:
	# Install released image through helm3
	helm install ${IMAGE_NAME} ./helm/${IMAGE_NAME} \
		--set image.repository=${IMAGE_REGISTRY}/${IMAGE_NAME} \
		--set image.tag=${IMAGE_VERSION} \
		--set service.type=NodePort

helm-delete:
	helm del ${IMAGE_NAME}

helm-release: docker-release helm-delete helm-install
