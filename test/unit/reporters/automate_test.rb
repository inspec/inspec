# encoding: utf-8

require 'helper'

describe Inspec::Reporters::Automate do
  let(:path) { File.expand_path(File.dirname(__FILE__)) }
  let(:options) do
    {
      'url' => "https://my-automate-server.mycompany.com/data-collector/v0/",
      'token' => "kwe09wef9uqwqmpoqwdqd=",
      'node_uuid' => "22ad2f99-f84f-5456-95a0-7e91b4b66690",
      'node_name' => "test_node",
      'environment' => "prod",
    }
  end
  let(:report) do 
    data = JSON.parse(File.read(path + '/../mock/reporters/run_data.json'), symbolize_names: true)
    options.merge!({ run_data: data })
    Inspec::Reporters::Automate.new(options)
  end

  describe '#enriched_report' do
    it 'returns a enriched report' do
      report.enriched_report[:node_uuid].must_equal "22ad2f99-f84f-5456-95a0-7e91b4b66690"
      report.enriched_report[:node_name].must_equal "test_node"
      report.enriched_report[:environment].must_equal "prod"
    end
  end

  describe '#send_report' do
    it 'returns true for sent report' do
      headers = {
        'Content-Type' => 'application/json',
        'x-data-collector-token' => 'kwe09wef9uqwqmpoqwdqd=',
        'x-data-collector-auth' => 'version=1.0',
      }
      stub = Net::HTTP::Post.new("/data-collector/v0/", headers)
      Net::HTTP::Post.expects(:new).with("/data-collector/v0/", headers).returns(stub)
      Net::HTTP.any_instance.stubs(:request).returns(true)
      report.send_report.must_equal true
    end
  end

  describe '#uuid_from_string' do
    it 'converts a string to a uuid' do
      end_time = "2018-03-28T14:10:50Z"
      node_uuid = "22ad2f99-f84f-5456-95a0-7e91b4b66690"
      assert = "4cd5aaa3-eea0-5aa2-9837-631e10b873b1"
      report.send(:uuid_from_string, end_time + node_uuid).must_equal assert
    end
  end
end
