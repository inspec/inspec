require 'fileutils'
require 'functional/helper'
require 'securerandom'

describe 'inspec exec' do
  include FunctionalHelper

  it 'can generate keys' do
    prepare_examples do |dir|
      unique_key_name = SecureRandom.uuid()
      out = inspec("artifact generate --keyname #{unique_key_name}", "cd #{dir} && ")
      out.exit_status.must_equal 0

      stdout = out.stdout.force_encoding(Encoding::UTF_8)
      stdout.must_include 'Generating private key'
      stdout.must_include 'Generating public key'
    end
  end

  it 'can sign, verify and install a signed profile' do
    # The arcive install commands do not currently support windows and
    # use specific linux extract tar commands. Since artifact is still
    # experimental we are skipping it for now.
    return if is_windows?
    prepare_examples do |dir|
      unique_key_name = SecureRandom.uuid()
      install_dir = File.join(dir, SecureRandom.uuid())
      profile = File.join(dir, 'profile')
      FileUtils.mkdir(install_dir)

      out = inspec("artifact generate --keyname #{unique_key_name}", "cd #{dir} &&")
      out.exit_status.must_equal 0

      out = inspec("artifact sign-profile --profile #{profile} --keyname #{unique_key_name}", "cd #{dir} &&")
      out.exit_status.must_equal 0

      out = inspec("artifact install-profile --infile profile-1.0.0.iaf --destdir #{install_dir}", "cd #{dir} &&")
      out.exit_status.must_equal 0

      out.stdout.force_encoding(Encoding::UTF_8).must_include "Installing to #{install_dir}"
      Dir.entries(install_dir).join.must_include "inspec.yml"
    end
  end

end
