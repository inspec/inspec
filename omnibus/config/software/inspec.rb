#
# Copyright:: Copyright 2016-2019, Chef Software Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
require_relative "../../../lib/inspec/version"

name "inspec"

dependency "ruby"

license :project_license

default_version "v#{Inspec::VERSION}"

source path: "#{Omnibus::Config.project_root}/../",
       options: { exclude: ["omnibus"] }

build do
  env = with_standard_compiler_flags(with_embedded_path)

  # Remove existing built gems in case they exist in the current dir
  delete "#{name}-*.gem"

  # We bundle install to ensure the versions of gems we are going to
  # appbundle-lock to are definitely installed
  bundle "config set --local without test kitchen", env: env
  bundle "install", env: env

  gem "build #{name}-core.gemspec", env: env
  gem "install #{name}-core*.gem --no-document", env: env

  gem "build #{name}.gemspec", env: env
  gem "install #{name}-*.gem --no-document", env: env

  gem "build inspec-bin.gemspec", env: env, cwd: "#{project_dir}/inspec-bin"
  gem "install inspec-bin-*.gem --no-document", env: env, cwd: "#{project_dir}/inspec-bin"

  block do
    appbundle "inspec", lockdir: project_dir, gem: "inspec-bin", env: env
  end

  block "Delete test folder from problem gems" do
    env["VISUAL"] = "echo"
    gem_install_dir = shellout!("#{install_dir}/embedded/bin/gem open rubyzip", env: env).stdout.chomp
    remove_directory "#{gem_install_dir}/test"
  end
end
