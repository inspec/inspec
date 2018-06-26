# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'functional/helper'
require 'tmpdir'

describe 'inspec archive' do
  include FunctionalHelper

  it 'archive is successful' do
    out = inspec('archive ' + example_profile + ' --overwrite')
    out.exit_status.must_equal 0
    out.stdout.must_match(/Generate archive [^ ]*profile-1.0.0.tar.gz/)
    out.stdout.must_include 'Finished archive generation.'
  end

  it 'archives to output file' do
    out = inspec('archive ' + example_profile + ' --output ' + dst.path)
    out.stderr.must_equal ''
    out.stdout.must_include 'Generate archive '+dst.path
    out.stdout.must_include 'Finished archive generation.'
    out.exit_status.must_equal 0
    File.exist?(dst.path).must_equal true
  end

  it 'auto-archives when no --output is given' do
    auto_dst = File.join(repo_path, 'profile-1.0.0.tar.gz')
    out = inspec('archive ' + example_profile + ' --overwrite')
    out.stderr.must_equal ''
    out.stdout.must_include 'Generate archive '+auto_dst
    out.stdout.must_include 'Finished archive generation.'
    out.exit_status.must_equal 0
    File.exist?(auto_dst).must_equal true
  end

  it 'archive on invalid archive' do
    Dir.tmpdir do |target_dir|
      out = inspec('archive #{target_dir} --output ' + dst.path)
      # out.stdout.must_equal '' => we have partial stdout output right now
      out.stderr.must_include "Don't understand inspec profile in \"#{target_dir}\""
      out.exit_status.must_equal 1
      File.exist?(dst.path).must_equal false
    end
  end

  it 'archive wont overwrite existing files' do
    x = rand.to_s
    File.write(dst.path, x)
    out = inspec('archive ' + example_profile + ' --output ' + dst.path)
    out.stderr.must_equal '' # uh...
    out.stdout.must_include "Archive #{dst.path} exists already. Use --overwrite."
    out.exit_status.must_equal 1
    File.read(dst.path).must_equal x
  end

  it 'archive will overwrite files if necessary' do
    x = rand.to_s
    File.write(dst.path, x)
    out = inspec('archive ' + example_profile + ' --output ' + dst.path + ' --overwrite')
    out.stderr.must_equal ''
    out.stdout.must_include 'Generate archive '+dst.path
    out.exit_status.must_equal 0
    File.read(dst.path).wont_equal x
  end

  it 'creates valid tar.gz archives' do
    out = inspec('archive ' + example_profile + ' --output ' + dst.path + ' --tar')
    out.stderr.must_equal ''
    out.stdout.must_include 'Generate archive '+dst.path
    out.exit_status.must_equal 0
    t = Zlib::GzipReader.open(dst.path)
    Gem::Package::TarReader.new(t).entries.map(&:header).map(&:name).must_include 'inspec.yml'
  end

  it 'creates valid zip archives' do
    out = inspec('archive ' + example_profile + ' --output ' + dst.path + ' --zip')
    out.stderr.must_equal ''
    out.stdout.must_include 'Generate archive '+dst.path
    out.exit_status.must_equal 0
    Zip::File.new(dst.path).entries.map(&:name).must_include 'inspec.yml'
  end

  it 'archives profiles that contain exceptions in controls' do
    out = inspec('archive ' + File.join(profile_path, 'exception-in-control') + ' --overwrite')
    out.exit_status.must_equal 0
    out.stdout.must_match(/Generate archive [^ ]*.tar.gz/)
    out.stdout.must_include 'Finished archive generation.'
  end
end
