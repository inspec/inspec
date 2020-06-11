#!/bin/bash

script_url="https://raw.githubusercontent.com/googleapis/google-cloud-ruby/master/.kokoro/osx.sh"
curl -o master-osx.sh $script_url && source master-osx.sh
