ARG IMAGE_TAG=latest
ARG DOCKER_REGISTRY_PREFIX=ghcr.io/supolabs
FROM ${DOCKER_REGISTRY_PREFIX}/frappe-worker:${IMAGE_TAG}

ARG GIT_REPO=https://github.com/supolabs/erpnext
ARG GIT_BRANCH=version-13

RUN echo 19

RUN install_app erpnext ${GIT_REPO} ${GIT_BRANCH}
