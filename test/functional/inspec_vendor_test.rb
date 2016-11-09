# encoding: utf-8
# author: Christoph Hartmann
require 'functional/helper'

describe 'example inheritance profile' do
  include FunctionalHelper
  let(:path) { File.join(examples_path, 'inheritance') }

  it 'can vendor profile dependencies' do
    out = inspec('vendor ' + path + ' --overwrite')
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Vendor dependencies of #{path} into #{path}/vendor"
    out.stderr.must_equal ''
    out.exit_status.must_equal 0

    vendor_dir = File.join(path, 'vendor')
    File.exist?(vendor_dir).must_equal true

    lockfile = File.join(path, 'inspec.lock')
    File.exist?(lockfile).must_equal true
  end

  it 'can vendor profile dependencies from the profile path' do
    out = inspec('vendor --overwrite', "cd #{path} &&")
    out.stdout.force_encoding(Encoding::UTF_8).must_include "Vendor dependencies of #{path} into #{path}/vendor"
    out.stderr.must_equal ''
    out.exit_status.must_equal 0

    vendor_dir = File.join(path, 'vendor')
    File.exist?(vendor_dir).must_equal true

    lockfile = File.join(path, 'inspec.lock')
    File.exist?(lockfile).must_equal true
  end
end
