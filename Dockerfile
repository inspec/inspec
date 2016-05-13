FROM ruby:alpine
RUN mkdir /share
COPY inspec.gem /
RUN apk add --update build-base libxml2-dev libffi-dev && \
    gem install /inspec.gem --no-document && \
    apk del build-base
ENTRYPOINT ["inspec"]
CMD ["help"]
VOLUME ["/share"]
WORKDIR /share
