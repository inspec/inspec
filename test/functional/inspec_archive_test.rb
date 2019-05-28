require 'functional/helper'
require 'tmpdir'

describe 'inspec archive' do
  include FunctionalHelper
  let(:auto_dst) { File.expand_path(File.join(repo_path, 'profile-1.0.0.tar.gz')) }

  it 'archive is successful' do
    prepare_examples('profile') do |dir|
      out = inspec('archive ' + dir + ' --overwrite')
      out.exit_status.must_equal 0
      out.stdout.must_match(/Generate archive [^ ]*profile-1.0.0.tar.gz/)
      out.stdout.must_include 'Finished archive generation.'
    end
  end

  it 'archives to output file' do
    prepare_examples('profile') do |dir|
      out = inspec('archive ' + dir + ' --output ' + dst.path)
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive ' + dst.path
      out.stdout.must_include 'Finished archive generation.'
      out.exit_status.must_equal 0
      File.exist?(dst.path).must_equal true
    end
  end

  it 'auto-archives when no --output is given' do
    prepare_examples('profile') do |dir|
      out = inspec('archive ' + dir + ' --overwrite')
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive ' + auto_dst
      out.stdout.must_include 'Finished archive generation.'
      out.exit_status.must_equal 0
      File.exist?(auto_dst).must_equal true
    end
  end

  it 'archive on invalid archive' do
    Dir.tmpdir do |target_dir|
      out = inspec("archive #{target_dir} --output " + dst.path)
      out.stderr.must_include "Don't understand inspec profile in \"#{target_dir}\""
      out.exit_status.must_equal 1
      File.exist?(dst.path).must_equal false
    end
  end

  it 'archive will overwrite existing files even without --overwrite' do
    prepare_examples('profile') do |dir|
      x = rand.to_s
      File.write(dst.path, x)
      out = inspec('archive ' + dir + ' --output ' + dst.path)
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive ' + dst.path
      out.exit_status.must_equal 0
      File.read(dst.path).wont_equal x
    end
  end

  it 'creates valid tar.gz archives' do
    prepare_examples('profile') do |dir|
      out = inspec('archive ' + dir + ' --output ' + dst.path + ' --tar')
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive ' + dst.path
      out.exit_status.must_equal 0
      t = Zlib::GzipReader.open(dst.path)
      Gem::Package::TarReader.new(t).entries.map(&:header).map(&:name).must_include 'inspec.yml'
    end
  end

  it 'creates valid zip archives' do
    prepare_examples('profile') do |dir|
      out = inspec('archive ' + dir + ' --output ' + dst.path + ' --zip')
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive ' + dst.path
      out.exit_status.must_equal 0
      Zip::File.new(dst.path).entries.map(&:name).must_include 'inspec.yml'
    end
  end

  it 'vendors dependencies by default' do
    prepare_examples('meta-profile') do |dir|
      out = inspec('archive ' + dir  + ' --output ' + dst.path)
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive ' + dst.path
      out.exit_status.must_equal 0
      t = Zlib::GzipReader.open(dst.path)
      files = Gem::Package::TarReader.new(t).entries.map(&:header).map(&:name)
      files.must_include 'inspec.lock'
      files.select { |f| f =~ /vendor/ }.count.must_be :>, 1
    end
  end

  it 'can archive a profile with required inputs' do
    archive_depends_path = File.join(profile_path, 'profile-with-required-inputs')

    Dir.mktmpdir do |tmpdir|
      FileUtils.cp_r(archive_depends_path + '/.', tmpdir)

      out = inspec('archive ' + tmpdir + ' --output ' + dst.path)
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
    end
  end
end
