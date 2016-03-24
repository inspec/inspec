# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'minitest/hell'
class Minitest::Test
  parallelize_me!
end

describe 'Inspec::InspecCLI' do
  let(:repo_path) { File.expand_path(File.join( __FILE__, '..', '..', '..')) }
  let(:exec_inspec) { File.join(repo_path, 'bin', 'inspec') }
  let(:profile_path) { File.join(repo_path, 'test', 'unit', 'mock', 'profiles') }
  let(:examples_path) { File.join(repo_path, 'examples') }
  let(:dst) {
    # create a temporary path, but we only want an auto-clean helper
    # so remove the file and give back the path
    res = Tempfile.new('inspec-shred')
    FileUtils.rm(res.path)
    TMP_CACHE[res.path] = res
  }

  def inspec(commandline)
    CMD.run_command("#{exec_inspec} #{commandline}")
  end

  describe 'detect' do
    it 'runs well on all nodes' do
      out = inspec('detect')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      j = JSON.load(out.stdout)
      j.keys.must_include 'name'
      j.keys.must_include 'family'
      j.keys.must_include 'arch'
      j.keys.must_include 'release'
    end
  end

  describe 'version' do
    it 'provides the version number on stdout' do
      out = inspec('version')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.must_equal Inspec::VERSION+"\n"
    end
  end

  describe 'shell' do
    it 'provides a help command' do
      out = CMD.run_command("echo \"help\nexit\" | #{exec_inspec} shell")
      out.exit_status.must_equal 0
      out.stdout.must_include 'Available commands:'
      out.stdout.must_include 'You are currently running on:'
    end

    it 'exposes all resources' do
      out = CMD.run_command("echo \"os\nexit\" | #{exec_inspec} shell")
      out.exit_status.must_equal 0
      out.stdout.must_match /^=> .*Operating.* .*System.* .*Detection.*$/
    end
  end

  describe 'example profile' do
    let(:path) { File.join(examples_path, 'profile') }

    it 'check is successful' do
      out = inspec('check ' + path)
      out.stdout.must_match /Valid.*true/
      out.exit_status.must_equal 0
    end

    it 'archive is successful' do
      out = inspec('archive ' + path + ' --overwrite')
      out.exit_status.must_equal 0
      out.stdout.must_match /Generate archive [^ ]*profile.tar.gz/
      out.stdout.must_include 'Finished archive generation.'
    end

    it 'archives to output file' do
      out = inspec('archive ' + path + ' --output ' + dst.path)
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive '+dst.path
      out.stdout.must_include 'Finished archive generation.'
      out.exit_status.must_equal 0
      File.exist?(dst.path).must_equal true
    end

    it 'auto-archives when no --output is given' do
      auto_dst = File.join(repo_path, 'profile.tar.gz')
      out = inspec('archive ' + path + ' --overwrite')
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive '+auto_dst
      out.stdout.must_include 'Finished archive generation.'
      out.exit_status.must_equal 0
      File.exist?(auto_dst).must_equal true
    end

    it 'archive on invalid archive' do
      out = inspec('archive /proc --output ' + dst.path)
      # out.stdout.must_equal '' => we have partial stdout output right now
      out.stderr.must_include "Don't understand inspec profile in \"/proc\""
      out.exit_status.must_equal 1
      File.exist?(dst.path).must_equal false
    end

    it 'archive wont overwrite existing files' do
      x = rand.to_s
      File.write(dst.path, x)
      out = inspec('archive ' + path + ' --output ' + dst.path)
      out.stderr.must_equal '' # uh...
      out.stdout.must_include "Archive #{dst.path} exists already. Use --overwrite."
      out.exit_status.must_equal 1
      File.read(dst.path).must_equal x
    end

    it 'archive will overwrite files if necessary' do
      x = rand.to_s
      File.write(dst.path, x)
      out = inspec('archive ' + path + ' --output ' + dst.path + ' --overwrite')
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive '+dst.path
      out.exit_status.must_equal 0
      File.read(dst.path).wont_equal x
    end

    it 'creates valid tar.gz archives' do
      out = inspec('archive ' + path + ' --output ' + dst.path + ' --tar')
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive '+dst.path
      out.exit_status.must_equal 0
      t = Zlib::GzipReader.open(dst.path)
      Gem::Package::TarReader.new(t).entries.map(&:header).map(&:name).must_include 'inspec.yml'
    end

    it 'creates valid zip archives' do
      out = inspec('archive ' + path + ' --output ' + dst.path + ' --zip')
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive '+dst.path
      out.exit_status.must_equal 0
      Zip::File.new(dst.path).entries.map(&:name).must_include 'inspec.yml'
    end

    it 'read the profile json' do
      out = inspec('json ' + path)
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      s = out.stdout
      JSON.load(s).must_be_kind_of Hash
    end

    describe 'json profile data' do
      let(:json) { JSON.load(inspec('json '+path).stdout) }

      it 'has a name' do
        json['name'].must_equal 'profile'
      end

      it 'has a title' do
        json['title'].must_equal 'InSpec Example Profile'
      end

      it 'has a summary' do
        json['summary'].must_equal 'Demonstrates the use of InSpec Compliance Profile'
      end

      it 'has a version' do
        json['version'].must_equal '1.0.0'
      end

      it 'has a maintainer' do
        json['maintainer'].must_equal 'Chef Software, Inc.'
      end

      it 'has a copyright' do
        json['copyright'].must_equal 'Chef Software, Inc.'
      end

      it 'has rules' do
        json['rules'].length.must_equal 2 # TODO: flatten out or search deeper!
      end

      describe 'a rule' do
        let(:rule) { json['rules']['controls/example.rb']['rules']['tmp-1.0'] }

        it 'has a title' do
          rule['title'].must_equal 'Create /tmp directory'
        end

        it 'has a description' do
          rule['desc'].must_equal 'An optional description...'
        end

        it 'has an impact' do
          rule['impact'].must_equal 0.7
        end

        it 'has a ref' do
          rule['refs'].must_equal([{'ref' => 'Document A-12', 'url' => 'http://...'}])
        end

        it 'has a source location' do
          loc = File.join(path, '/controls/example.rb')
          rule['source_location'].must_equal [loc, 8]
        end

        it 'has a the source code' do
          rule['code'].must_match /\Acontrol \"tmp-1.0\" do.*end\n\Z/m
        end
      end
    end

    it 'writes json to file' do
      out = inspec('json ' + path + ' --output ' + dst.path)
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      hm = JSON.load(File.read(dst.path))
      hm['name'].must_equal 'profile'
      hm['rules'].length.must_equal 2 # TODO: flatten out or search deeper!
    end

    it 'can execute the profile' do
      out = inspec('exec ' + path)
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      out.stdout.must_match /^Pending: /
      out.stdout.must_include '3 examples, 0 failures, 1 pending'
    end

    it 'can execute the profile with the json formatter' do
      out = inspec('exec ' + path + ' --format json')
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      JSON.load(out.stdout).must_be_kind_of Hash
    end

    describe 'execute a profile with json formatting' do
      let(:json) { JSON.load(inspec('exec ' + path + ' --format json').stdout) }
      let(:examples) { json['examples'] }
      let(:ex1) { examples.find{|x| x['id'] == 'tmp-1.0'} }
      let(:ex2) { examples.find{|x| x['id'] =~ /generated/} }
      let(:ex3) { examples.find{|x| x['id'] == 'gordon-1.0'} }

      it 'must have 3 examples' do
        json['examples'].length.must_equal 3
      end

      it 'id in json' do
        examples.find { |ex| !ex.key? 'id' }.must_be :nil?
      end

      it 'impact in json' do
        ex1['impact'].must_equal 0.7
        ex2['impact'].must_be :nil?
      end

      it 'status in json' do
        ex1['status'].must_equal 'passed'
        ex3['status'].must_equal 'pending'
      end

      it 'pending message in json' do
        ex1['pending_message'].must_be :nil?
        ex3['pending_message'].must_equal 'Not yet implemented'
      end
    end

    describe 'execute a profile with fulljson formatting' do
      let(:json) { JSON.load(inspec('exec ' + path + ' --format fulljson').stdout) }
      let(:examples) { json['examples'] }
      let(:metadata) { json['profiles'][0] }
      let(:ex1) { examples.find{|x| x['id'] == 'tmp-1.0'} }
      let(:ex2) { examples.find{|x| x['id'] =~ /generated/} }
      let(:ex3) { examples.find{|x| x['id'] == 'gordon-1.0'} }

      it 'has all the metadata' do
        metadata.must_equal({
          "name" => "profile",
          "title" => "InSpec Example Profile",
          "maintainer" => "Chef Software, Inc.",
          "copyright" => "Chef Software, Inc.",
          "copyright_email" => "support@chef.io",
          "license" => "Apache 2 license",
          "summary" => "Demonstrates the use of InSpec Compliance Profile",
          "version" => "1.0.0",
          "supports" => [{"os-family" => "unix"}]
        })
      end

      it 'must have 3 examples' do
        json['examples'].length.must_equal 3
      end

      it 'id in json' do
        examples.find { |ex| !ex.key? 'id' }.must_be :nil?
      end

      it 'title in json' do
        ex3['title'].must_equal 'Verify the version number of Gordon'
      end

      it 'desc in json' do
        ex3['desc'].must_equal 'An optional description...'
      end

      it 'code in json' do
        ex3['code'].wont_be :nil?
      end

      it 'code_desc in json' do
        ex3['code_desc'].wont_be :nil?
      end

      it 'impact in json' do
        ex1['impact'].must_equal 0.7
        ex2['impact'].must_be :nil?
      end

      it 'status in json' do
        ex1['status'].must_equal 'passed'
        ex3['status'].must_equal 'pending'
      end

      it 'ref in json' do
        ex1['ref'].must_match %r{examples/profile/controls/example.rb$}
      end

      it 'ref_line in json' do
        ex1['ref_line'].must_equal 14
      end

      it 'run_time in json' do
        ex1['run_time'].wont_be :nil?
      end

      it 'start_time in json' do
        ex1['start_time'].wont_be :nil?
      end

      it 'pending message in json' do
        ex1['pending'].must_be :nil?
        ex3['pending'].must_equal "Can't find file \"/tmp/gordon/config.yaml\""
      end
    end
  end

  describe 'example inheritance profile' do
    let(:path) { File.join(examples_path, 'inheritance') }

    [
      'archive %s --overwrite',
      'check %s',
      'json %s',
    ].each do |cmd|
      it cmd[/^\w/] + ' fails without --profiles-path' do
        out = inspec(format(cmd, path))
        out.stderr.must_include 'You must supply a --profiles-path to inherit'
        # out.stdout.must_equal '' => we still get partial output
        out.exit_status.must_equal 1
      end
    end

    it 'check succeeds with --profiles-path' do
      out = inspec('check ' + path + ' --profiles-path ' + examples_path)
      out.stderr.must_equal ''
      out.stdout.must_match /Valid.*true/
      out.exit_status.must_equal 0
    end

    it 'archive is successful with --profiles-path' do
      out = inspec('archive ' + path + ' --output ' + dst.path + ' --profiles-path ' + examples_path)
      out.stderr.must_equal ''
      out.stdout.must_include 'Generate archive '+dst.path
      out.stdout.must_include 'Finished archive generation.'
      out.exit_status.must_equal 0
      File.exist?(dst.path).must_equal true
    end

    it 'read the profile json with --profiles-path' do
      out = inspec('json ' + path + ' --profiles-path '+examples_path)
      out.stderr.must_equal ''
      out.exit_status.must_equal 0
      s = out.stdout
      hm = JSON.load(s)
      hm['name'].must_equal 'inheritance'
      hm['rules'].length.must_equal 1 # TODO: flatten out or search deeper!
    end
  end
end
