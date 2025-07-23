# omnibus/config/software/train.rb

name "train"

default_version "CHEF-19255-inspec-bugcrowd-chef-privilege-escalation-vulnerability"

license "Apache-2.0"
license_file "LICENSE"

source git: "https://github.com/inspec/train.git"

relative_path "train"

build do
  env = with_standard_compiler_flags(with_embedded_path)

  bundle_install = [
    "bundle config set --local deployment true",
    "bundle install --jobs #{workers} --retry 5 --path=#{install_dir}/vendor/bundle"
  ]

  command bundle_install.join(" && "), env: env
end