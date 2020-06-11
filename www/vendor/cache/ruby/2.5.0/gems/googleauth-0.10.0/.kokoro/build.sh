#!/bin/bash

script_url="https://raw.githubusercontent.com/googleapis/google-cloud-ruby/master/.kokoro/build.sh"
curl -o master-build.sh $script_url && source master-build.sh
