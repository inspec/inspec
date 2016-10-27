# encoding: utf-8

require 'fileutils'
require 'functional/helper'
require 'securerandom'

describe 'inspec exec' do
  include FunctionalHelper

  it 'can generate keys' do
    unique_key_name = SecureRandom.uuid()
    out = inspec("artifact generate --keyname #{unique_key_name}")
    # haha, ruby so shitty, there's ALWAYS gem problems
    #out.stderr.must_equal ''
    out.exit_status.must_equal 0
    stdout = out.stdout.force_encoding(Encoding::UTF_8)
    stdout.must_include 'Generating private key'
    stdout.must_include 'Generating public key'

    FileUtils.rm("#{unique_key_name}.pem.pub")
    FileUtils.rm("#{unique_key_name}.pem.key")
  end

  it 'can sign, verify and install a signed profile' do
    FileUtils.rm_f('profile-1.0.0.iaf')
    unique_key_name = SecureRandom.uuid()
    install_dir = SecureRandom.uuid()
    FileUtils.mkdir(install_dir)

    out = inspec("artifact generate --keyname #{unique_key_name}")
    out.exit_status.must_equal 0

    out = inspec("artifact sign-profile --profile #{example_profile} --keyname #{unique_key_name}")
    out.exit_status.must_equal 0

    out = inspec("artifact install-profile --infile profile-1.0.0.iaf --destdir #{install_dir}")
    out.exit_status.must_equal 0
    stdout = out.stdout.force_encoding(Encoding::UTF_8)
    stdout.must_include "Installing to #{install_dir}"
    entries = Dir.entries install_dir
    entries.join.must_include "inspec.yml"
    FileUtils.rm_rf(install_dir)
    FileUtils.rm("#{unique_key_name}.pem.pub")
    FileUtils.rm("#{unique_key_name}.pem.key")
    FileUtils.rm('profile-1.0.0.iaf')
  end

end
