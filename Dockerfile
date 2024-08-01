FROM ruby:3.2.3-slim-bookworm

ARG BUILD_PACKAGES="build-essential"
ARG DEV_PACKAGES="curl git"
ARG RUBY_PACKAGES="libpq-dev"
ARG OTHERS_PACKAGES=""

RUN apt-get update -qq && apt-get install -y \
    $BUILD_PACKAGES $DEV_PACKAGES $RUBY_PACKAGES $OTHERS_PACKAGES

WORKDIR /app

ENV BUNDLER_VERSION 2.5.14

RUN gem install bundler -v $BUNDLER_VERSION
