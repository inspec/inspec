# encoding: utf-8

name 'train'

dependency 'ruby'
dependency 'rubygems'
dependency 'bundler'
dependency 'appbundler'

license :project_license
default_version 'add-gcp-transport'
source git: 'https://github.com/chef-partners/train.git'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  delete "#{name}-*.gem"
  gem "build #{name}.gemspec", env: env
  gem "install #{name}-*.gem --no-document", env: env
end
