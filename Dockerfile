FROM ruby:alpine
LABEL maintainer="Chef Software, Inc. <docker@chef.io>"

ARG EXPEDITOR_VERSION
ARG VERSION=4.24.28

ARG EXPEDITOR_CHANNEL
ARG CHANNEL=stable

# Allow VERSION below to be controlled by either VERSION or EXPEDITOR_VERSION build arguments
ENV VERSION ${EXPEDITOR_VERSION:-${VERSION}}
ENV CHANNEL ${EXPEDITOR_CHANNEL:-${CHANNEL}}

RUN wget "http://packages.chef.io/files/${CHANNEL}/inspec/${VERSION}/el/7/inspec-${VERSION}-1.el7.x86_64.rpm" -O /tmp/inspec.rpm && \
    rpm2cpio /tmp/inspec.rpm | cpio -idmv && \
    rm -rf /tmp/inspec.rpm

ENTRYPOINT ["inspec"]
CMD ["help"]
VOLUME ["/share"]
WORKDIR /share
