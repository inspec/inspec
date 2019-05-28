require 'helper'

describe Inspec::Reporters::JsonAutomate do
  let(:path) { File.expand_path(File.dirname(__FILE__)) }
  let(:report) do
    data = JSON.parse(File.read(path + '/../mock/reporters/run_data_wrapper.json'), symbolize_names: true)
    Inspec::Reporters::JsonAutomate.new({ run_data: data })
  end
  let(:profiles) { report.send(:profiles) }

  describe '#render' do
    it 'confirms render output' do
      output = File.read(path + '/../mock/reporters/json_merged_output')
      report.render
      report.rendered_output.must_equal output
    end
  end

  describe '#report_merged' do
    it 'outputs the correct report_merged' do
      output = File.read(path + '/../mock/reporters/json_merged_output')
      output = JSON.parse(output, symbolize_names: true)
      report.report.must_equal output
    end
  end

  describe '#find_master_parent' do
    it 'finds the parent' do
      report.instance_variable_set(:@profiles, profiles)
      parent = report.send(:find_master_parent, profiles[1])
      parent[:name].must_equal 'wrapper-override'
    end
  end

  describe '#merge_controls' do
    it 'merges profile controls' do
      parent = profiles[0]
      child = profiles[1]
      parent[:controls].select { |c| c[:id] == 'pro1-con4' }.first[:code].must_equal ''
      report.send(:merge_controls, parent, child)
      assert = "control 'pro1-con4' do\n  impact 1\n  title 'Profile 1 - Control 3 - useless'\n  desc 'Profile 1 - Control 3 description'\n  only_if do\n    1.eql?(0)\n  end\n  describe file('/tmp5') do\n    it { should exist }\n  end\nend\n"
      parent[:controls].select { |c| c[:id] == 'pro1-con4' }.first[:code].must_equal assert
    end
  end

  describe '#merge_depends' do
    it 'merges profile depends' do
      parent = profiles[0]
      child = profiles[1]
      child[:depends] = [{:name=>"myprofile2", :url=>"https://test/myprofile2-1.0.0.tar.gz"}]
      assert = [{:name=>"myprofile1z", :url=>"https://s3-eu-west-1.amazonaws.com/apop-bucket/profiles/myprofile1-1.0.0.tar.gz"}]
      parent[:depends].must_equal assert
      report.send(:merge_depends, parent, child)
      assert = [
        {:name=>"myprofile1z", :url=>"https://s3-eu-west-1.amazonaws.com/apop-bucket/profiles/myprofile1-1.0.0.tar.gz"},
        {:name=>"myprofile2", :url=>"https://test/myprofile2-1.0.0.tar.gz"},
      ]
      parent[:depends].must_equal assert
    end
  end
end
