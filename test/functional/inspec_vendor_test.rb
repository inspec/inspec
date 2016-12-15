# encoding: utf-8
# author: Christoph Hartmann
require 'functional/helper'

describe 'example inheritance profile' do
  include FunctionalHelper
  let(:inheritance_path) { File.join(examples_path, 'inheritance') }
  let(:meta_path) { File.join(examples_path, 'meta-profile') }

  it 'can vendor profile dependencies' do
    out = inspec('vendor ' + inheritance_path + ' --overwrite')
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Vendor dependencies of #{inheritance_path} into #{inheritance_path}/vendor"
    out.stderr.must_equal ''
    out.exit_status.must_equal 0

    vendor_dir = File.join(inheritance_path, 'vendor')
    File.exist?(vendor_dir).must_equal true

    lockfile = File.join(inheritance_path, 'inspec.lock')
    File.exist?(lockfile).must_equal true
  end

  it 'can vendor profile dependencies from the profile path' do
    # clean existing vendor directory
    begin
      FileUtils.rm_r ("#{inheritance_path}/vendor")
    rescue Errno::ENOENT => e
    end

    # vendor all dependencies
    out = inspec('vendor --overwrite', "cd #{inheritance_path} &&")
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Vendor dependencies of #{inheritance_path} into #{inheritance_path}/vendor"
    out.stderr.must_equal ''
    out.exit_status.must_equal 0

    vendor_dir = File.join(inheritance_path, 'vendor')
    File.exist?(vendor_dir).must_equal true

    lockfile = File.join(inheritance_path, 'inspec.lock')
    File.exist?(lockfile).must_equal true
  end

  it 'ensure nothing is loaded from external source if vendored profile is used' do
    # clean existing vendor directory
    begin
      FileUtils.rm_r ("#{meta_path}/vendor")
    rescue Errno::ENOENT => e
    end

    # vendor all dependencies
    out = inspec('vendor ' + meta_path + ' --overwrite')
    out.exit_status.must_equal 0

    vendor_dir = File.join(meta_path, 'vendor')
    File.exist?(vendor_dir).must_equal true

    lockfile = File.join(meta_path, 'inspec.lock')
    File.exist?(lockfile).must_equal true

    out = inspec('exec ' + meta_path + ' -l debug --no-create-lockfile')
    out.stdout.force_encoding(Encoding::UTF_8).must_include 'Using cached dependency for {:url=>"https://github.com/dev-sec/tests-ssh-hardening/archive/master.tar.gz"'
    out.stdout.force_encoding(Encoding::UTF_8).must_include 'Using cached dependency for {:url=>"https://github.com/dev-sec/ssl-benchmark/archive/master.tar.gz"'
    out.stdout.force_encoding(Encoding::UTF_8).must_include 'Using cached dependency for {:url=>"https://github.com/chris-rock/windows-patch-benchmark/archive/master.tar.gz"'
    out.stdout.force_encoding(Encoding::UTF_8).index('Fetching URL:').must_be_nil
    out.stdout.force_encoding(Encoding::UTF_8).index('Fetched archive moved to:').must_be_nil

    out.stderr.must_equal ''
  end

  it 'ensure json/check command do not fetch remote profiles if vendored' do
    # clean cache directory
    begin
      FileUtils.rm_rf "#{Dir.home}/.inspec/cache"
    rescue Errno::ENOENT => e
    end

    # ensure the profile is vendored
    out = inspec('vendor ' + meta_path + ' --overwrite')

    # execute json command
    # we need to activate the logger with `-l debug`, but that needs to redirect its output to STDERR
    out = inspec('json ' + meta_path + ' --output ' + dst.path)
    out.exit_status.must_equal 0
    hm = JSON.load(File.read(dst.path))
    hm['name'].must_equal 'meta-profile'
    hm['controls'].length.must_equal 79

    # copies = out.stdout.scan(/Copy .* to cache directory/).length
    # copies.must_equal 3
    #
    # length = out.stdout.scan(/Dependency does not exist in the cache/).length
    # length.must_equal 1
    #
    # length = out.stdout.scan(/Fetching URL:/).length
    # length.must_equal 0

    # execute check command
    out = inspec('check ' + meta_path + ' -l debug')
    out.exit_status.must_equal 0

    # copies = out.stdout.scan(/Copy .* to cache directory/).length
    # copies.must_equal 3
    #
    # length = out.stdout.scan(/Dependency does not exist in the cache/).length
    # length.must_equal 1
    #
    # length = out.stdout.scan(/Fetching URL:/).length
    # length.must_equal 0
  end

  it 'can vendor profile dependencies from the profile path' do
    out = inspec('vendor --overwrite', "cd #{inheritance_path} &&")
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Vendor dependencies of #{inheritance_path} into #{inheritance_path}/vendor"
    out.stderr.must_equal ''
    out.exit_status.must_equal 0

    vendor_dir = File.join(inheritance_path, 'vendor')
    File.exist?(vendor_dir).must_equal true

    lockfile = File.join(inheritance_path, 'inspec.lock')
    File.exist?(lockfile).must_equal true
  end

  it 'use lockfile in tarball' do
    # ensure the profile is vendored and packaged as tar
    out = inspec('vendor ' + meta_path + ' --overwrite')
    out.exit_status.must_equal 0
    out = inspec('archive ' + meta_path + ' --overwrite')
    out.exit_status.must_equal 0

    # execute json command
    out = inspec(' meta-profile.tar.gz -l debug')
    out.exit_status.must_equal 0

    length = out.stdout.scan(/Fetching URL:/).length
    length.must_equal 0
  end
end
