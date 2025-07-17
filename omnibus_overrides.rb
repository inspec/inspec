# THIS IS NOW HAND MANAGED, JUST EDIT THE THING

# grab the current train release from rubygems.org
override "train", version: "CHEF-19255-inspec-bugcrowd-chef-privilege-escalation-vulnerability"
override "train_core", version: "CHEF-19255-inspec-bugcrowd-chef-privilege-escalation-vulnerability"
override "ruby", version: "3.1.6"

override :openssl, version: "3.0.9"

override "ruby-msys2-devkit", version: "3.1.6-1"
