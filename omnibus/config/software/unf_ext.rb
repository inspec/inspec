# override for unf_ext until
# https://github.com/knu/ruby-unf_ext/pull/39
# is merged (done!) and released (not as of March 2019)

name 'unf_ext'

dependency 'ruby'
dependency 'rubygems'

license :project_license
default_version '55d872fb15f3a26e4ee8f8dbe7ba859c80d40383'
source git: 'https://github.com/chef/ruby-unf_ext.git'

build do
  env = with_standard_compiler_flags(with_embedded_path)
  delete "#{name}-*.gem"
  gem "build #{name}.gemspec", env: env
  gem "install #{name}-*.gem --no-document", env: env
end
