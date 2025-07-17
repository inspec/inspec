name "train"

default_version "CHEF-19255-inspec-bugcrowd-chef-privilege-escalation-vulnerability"

version("CHEF-19255-inspec-bugcrowd-chef-privilege-escalation-vulnerability") do
  source git: "https://github.com/inspec/train.git"
end

dependency "ruby"
dependency "rubygems"

build do
  gem "build train.gemspec"
  gem "install train-#{version}.gem"
end
