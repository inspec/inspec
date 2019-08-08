#!/bin/sh
#
# This file updates the default VERSION build argument in the Dockerfile to the
# VERSION passed in to the file via environment variables.
#
# This ensures the Dockerfile in inspec master will list the version of the latest
# stable release for any community member who wishes to build their own container
# from scratch.
#

set -evx

sed -i -r "s/^ARG VERSION=.*/ARG VERSION=${EXPEDITOR_VERSION}/" Dockerfile
