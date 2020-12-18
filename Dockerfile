FROM ruby:alpine
LABEL maintainer="Chef Software, Inc. <docker@chef.io>"

ARG EXPEDITOR_VERSION
ARG VERSION=4.24.8

# GEM_SOURCE is kept away from expeditor controlled ARGs to accomodate 3rd party distros
ARG GEM_SOURCE=https://rubygems.org

# Allow VERSION below to be controlled by either VERSION or EXPEDITOR_VERSION build arguments
ENV VERSION ${EXPEDITOR_VERSION:-${VERSION}}

RUN mkdir -p /share
RUN apk add --update build-base libxml2-dev libffi-dev git openssh-client
RUN gem install --no-document --source ${GEM_SOURCE} inspec:${VERSION} inspec-bin:${VERSION}

# cleanup leftovers in the image
RUN apk del build-base
RUN rm -rf /usr/local/bundle/cache/*
RUN find /usr/local/lib/ruby/gems/*/cache/ -name *.gem -delete
RUN find /usr/local/bundle/extensions -name gem_make.out -delete -name mkmf.log -delete

ENTRYPOINT ["inspec"]
CMD ["help"]
VOLUME ["/share"]
WORKDIR /share
