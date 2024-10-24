# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override "train", version: "v#{train_stable}"
override "ruby", version: "3.1.6"

openssl_version = windows? ? "1.1.1w" : "3.0.11"
override :openssl, version: openssl_version

override "ruby-msys2-devkit", version: "3.1.6-1"
