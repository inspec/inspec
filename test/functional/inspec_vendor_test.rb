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
    out = inspec('vendor ' + meta_path + ' --overwrite')
    out.exit_status.must_equal 0

    vendor_dir = File.join(meta_path, 'vendor')
    File.exist?(vendor_dir).must_equal true

    lockfile = File.join(meta_path, 'inspec.lock')
    File.exist?(lockfile).must_equal true

    out = inspec('exec ' + meta_path + ' -l debug --no-create-lockfile')
    out.stdout.force_encoding(Encoding::UTF_8).must_include   'Using cached dependency for {:url=>"https://github.com/dev-sec/tests-ssh-hardening/archive/master.tar.gz", :sha256=>"01414bd307ea2f7d4dc8cd141085ba7ad61d4c3b2606d57b2dae987c1c3954cb"'
    out.stdout.force_encoding(Encoding::UTF_8).must_include 'Using cached dependency for {:git=>"https://github.com/dev-sec/ssl-benchmark.git", :ref=>"e17486c864434c818f96ca13edd2c5a420100a45"'
    out.stdout.force_encoding(Encoding::UTF_8).must_include 'Using cached dependency for {:git=>"https://github.com/chris-rock/windows-patch-benchmark.git", :ref=>"c183d08eb25638e7f5eac97e521640ea314c8e3d"'
    out.stdout.force_encoding(Encoding::UTF_8).index('Fetching URL:').must_be_nil
    out.stdout.force_encoding(Encoding::UTF_8).index('Fetched archive moved to:').must_be_nil

    out.stderr.must_equal ''
  end

  it 'ensure json command works for vendored profile' do
    out = inspec('json ' + meta_path + ' --output ' + dst.path)
    hm = JSON.load(File.read(dst.path))
    hm['name'].must_equal 'meta-profile'
    hm['controls'].length.must_equal 79
  end
end
