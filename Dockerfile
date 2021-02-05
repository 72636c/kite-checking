# syntax = docker/dockerfile:experimental

FROM node:12-alpine AS dev-deps

WORKDIR /workdir

COPY package.json yarn.lock ./

RUN --mount=type=secret,id=npm,target=/workdir/.npmrc \
  yarn install --frozen-lockfile --ignore-optional
