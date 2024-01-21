ARG PYTHON_VER=3.10
ARG ALPINE_VER=3.15
FROM python:${PYTHON_VER}-alpine${ALPINE_VER}

WORKDIR /
COPY . .

ARG UID=1000
ARG GID=1000
ARG APP_USER_GROUP=python

RUN addgroup -g ${GID} -S ${APP_USER_GROUP} \
 && adduser -u ${UID} -S ${APP_USER_GROUP} -G ${APP_USER_GROUP} 

ARG SEMGREP_VER=1.53.0
ARG ALPINE_VER=3.15
ARG APK_REPO=https://mirror.yandex.ru/mirrors/alpine/v${ALPINE_VER}

RUN echo ${APK_REPO}/       > /etc/apk/repositories \
 && echo ${APK_REPO}/community/ >> /etc/apk/repositories \
 && echo ${APK_REPO}/main >> /etc/apk/repositories \
 && apk update && apk upgrade && apk add --no-cache git jq curl build-base \
 && pip install semgrep==$SEMGREP_VER

RUN pip install --no-cache-dir -r requirements.txt

USER ${APP_USER_GROUP}
ENTRYPOINT []