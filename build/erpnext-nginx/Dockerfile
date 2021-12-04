ARG NODE_IMAGE_TAG=14-buster-slim
ARG DOCKER_REGISTRY_PREFIX=supolabs
ARG IMAGE_TAG=latest

FROM node:${NODE_IMAGE_TAG}

RUN echo 19

ARG GIT_REPO=https://github.com/supolabs/erpnext
ARG GIT_BRANCH=version-13
ARG FRAPPE_BRANCH=version-13

COPY build/erpnext-nginx/install_app.sh /install_app
RUN chmod +x /install_app && \
  apt-get update -y && \
  apt-get install build-essential git python2 -y && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

RUN /install_app erpnext ${GIT_REPO} ${GIT_BRANCH} ${FRAPPE_BRANCH}

FROM ${DOCKER_REGISTRY_PREFIX}/frappe-nginx:${IMAGE_TAG}

COPY --from=0 /home/frappe/frappe-bench/sites/ /var/www/html/
COPY --from=0 /rsync /rsync
RUN echo "erpnext" >> /var/www/html/apps.txt

VOLUME [ "/assets" ]

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
