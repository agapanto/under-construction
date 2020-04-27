# under-construction

Create a simple, responsive "under construction" website easily with vue.js.

---
### 🗒️ Prerequisites
You must have the following software installed:
- docker
- git
- npm
- vim

---
## Installation
There are several ways to install `under-construction`, but for all of them you wil need to:

0. Clone the project & get into it's folder
```bash
git clone https://github.com/agapanto/under-construction && cd under-construction
```

and optionally you could:

0. Copy `.env.dist` file to `.env.local` and change it's content with atom(or vim if you prefer)
```bash
cp .env.dist .env.local && vim .env.local
```
```bash
#NOTE: This '.env.local' file would work both for npm recipe as for docker ones.
# If you want to know more, look at 'scripts' folder and 'Makefile'
```

### 💻 On local machine

1. Install project dependencies
```bash
make npm-install
```

2. Run the project
```bash
make npm-serve
```

3. Go to [`localhost:8080`](http://localhost:8080/) 🥳


### 🐋 Using Docker

#### Create docker image

1. Create a docker image with name `my-site-under-construction` for version `0.0.1-test`
```bash
make docker-build \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test
```

#### Tag image & upload it to a image registry (optional)

2. Tag the image to be uploaded to `localhost:32000` image registry([`microk8s.enable registry`](https://microk8s.io/docs/registry-built-in) needed)
```bash
make docker-tag \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test \
IMAGE_REGISTRY=localhost:32000
```

3. Upload the image to `localhost:32000` image registry(you must be logged in on external registry)
```bash
make docker-push \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test \
IMAGE_REGISTRY=localhost:32000
```

#### Create, tag & upload image to a registry (oneliner) (optional)
2. Create, tag & upload the image to `localhost:32000` image registry
```bash
make docker-release \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test \
IMAGE_REGISTRY=localhost:32000
```

#### Run image
2. Run the image on port `8080`
```bash
make docker-run \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test \
HOST_PORT=8080 \
#IMAGE_REGISTRY=localhost:32000 this variable is not used for docker-run recipe so you can omit it
```

3. Go to [`localhost:8080`](http://localhost:8080/) 🤩
```python
#NOTE:Do you want to use another 'port'? just set HOST_PORT variable as desired
```

#### Explore image(`docker shell`)
2. You can see the image contents by running docker-shell recipe, your built website lives on `/usr/share/nginx/html/`
```bash
make docker-shell \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test \
HOST_PORT=8080 \
#IMAGE_REGISTRY=localhost:32000 this variable is not used for docker-run recipe so you can omit it
```

### ⛵ Using Helm(k8s)

#### Release Docker image

1. Create, tag & upload the image to `localhost:32000` image registry(if you use a different registry that one on microk8s, remember this registry must be accesible within the kubernetes context in order to pull the images correctly).
```bash
make docker-release \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test \
IMAGE_REGISTRY=localhost:32000
```

#### Install with Helm

2. Install as `my-site-under-construction` the just released `localhost:32000/my-site-under-construction:0.0.1-test` image using Helm.
```bash
make helm-install \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test \
IMAGE_REGISTRY=localhost:32000
```

#### Upgrade with Helm (optional)

3. Upgrade the `my-site-under-construction` deployment using Helm.
```bash
make helm-install \
IMAGE_NAME=my-site-under-construction \
IMAGE_VERSION=0.0.1 \
IMAGE_SUFFIX=-test \
IMAGE_REGISTRY=localhost:32000
```

### 📦 Deploy to heroku
1. Click the damn button! \
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy/?template=https://github.com/agapanto/under-construction)
