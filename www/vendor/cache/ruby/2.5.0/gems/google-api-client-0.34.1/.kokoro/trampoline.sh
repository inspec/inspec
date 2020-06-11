#!/bin/bash

script_url="https://raw.githubusercontent.com/googleapis/google-cloud-ruby/master/.kokoro/trampoline.sh"
curl -o master-trampoline.sh $script_url && source master-trampoline.sh
