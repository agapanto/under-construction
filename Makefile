ENV_FILE:=.env.local

IMAGE_REGISTRY:=localhost:32000
IMAGE_NAME:=agapanto-under-construction
IMAGE_VERSION:=latest
IMAGE_SUFFIX:=-dev
IMAGE_TAG=$(IMAGE_NAME):$(IMAGE_VERSION)$(IMAGE_SUFFIX)

HELM_BINARY:=microk8s.helm3
HELM_TEMPLATE:=./helm/agapanto-under-construction

info:
	@echo "================================================================================"
	@echo "🙋 Thanks for let's agapanto/under-construction a try 🧙‍"
	@echo "================================================================================"
	@echo "👉 Just run 'make npm-install npm-serve'" to run this project on your computer.
	@echo "🐋 You can deploy this project using Docker, Dokku, Heroku or Kubernetes. "
	@echo "👀 Read this project docs at https://agapanto.github.io/under-construction/"
	@echo "--------------------------------------------------------------------------------"
	@echo "🤝 Contribute to this project at https://github.com/agapanto/under-construction"
	@echo "--------------------------------------------------------------------------------"
	@echo "https://agapanto.cl"
	@echo ""

# Local development recipes
npm-install:
	npm install

npm-build:
	npm run build

npm-serve:
	npm run serve

# Docker related recipes
docker-info:
	@echo "================================================================================"
	@echo "🐋 agapanto/under-construction Docker info‍"
	@echo "================================================================================"
	@echo "This VARIABLES are used by all Docker related recipes & scripts"
	@echo "--------------------------------------------------------------------------------"
	@echo "ENV_FILE       : ${ENV_FILE}"
	@echo "IMAGE_REGISTRY : ${IMAGE_REGISTRY}"
	@echo "IMAGE_NAME     : ${IMAGE_NAME}"
	@echo "IMAGE_VERSION  : ${IMAGE_VERSION}"
	@echo "IMAGE_SUFFIX   : ${IMAGE_SUFFIX}"
	@echo "IMAGE_TAG      : ${IMAGE_TAG}"
	@echo "--------------------------------------------------------------------------------"
	@echo "You can change it's values by running recipes like this:"
	@echo "make docker-info IMAGE_NAME=check IMAGE_VERSION=ifit IMAGE_SUFFIX=-reallychanges"
	@echo ""

docker-build:
	# Build docker image passing specified ENV_FILE values
	bash ./scripts/docker/build.sh ${ENV_FILE} ${IMAGE_TAG}

docker-tag:
	docker tag ${IMAGE_TAG} ${IMAGE_REGISTRY}/${IMAGE_TAG}

docker-push:
	docker push ${IMAGE_REGISTRY}/${IMAGE_TAG}

docker-release: docker-info docker-build docker-tag docker-push

docker-run:
	bash ./scripts/docker/run.sh ${ENV_FILE} ${IMAGE_TAG}

docker-shell:
	bash ./scripts/docker/shell.sh ${ENV_FILE} ${IMAGE_TAG}

# Helm(k8s package manager) related recipes
helm-info:
	@echo "================================================================================"
	@echo "⛵ agapanto/under-construction Helm info‍"
	@echo "================================================================================"
	@echo "This VARIABLES are used by all Helm related recipes & scripts"
	@echo "--------------------------------------------------------------------------------"
	@echo "ENV_FILE       : ${ENV_FILE}"
	@echo "HELM_BINARY    : ${HELM_BINARY}"
	@echo "HELM_TEMPLATE  : ${HELM_TEMPLATE}"
	@echo "--------------------------------------------------------------------------------"
	@echo "You can change it's values by running recipes like this:"
	@echo "make helm-info HELM_BINARY=helm3 HELM_TEMPLATE=./helm/agapanto-under-construction"
	@echo ""

helm-install:
	bash ./scripts/helm/install.sh ${ENV_FILE} ${HELM_BINARY} ${HELM_TEMPLATE} ${IMAGE_REGISTRY} ${IMAGE_NAME} ${IMAGE_VERSION}

helm-upgrade:
	bash ./scripts/helm/upgrade.sh ${ENV_FILE} ${HELM_BINARY} ${HELM_TEMPLATE} ${IMAGE_REGISTRY} ${IMAGE_NAME} ${IMAGE_VERSION}

helm-delete:
	bash ./scripts/helm/delete.sh ${ENV_FILE} ${HELM_BINARY} ${IMAGE_NAME}

helm-release: docker-release helm-delete helm-install
