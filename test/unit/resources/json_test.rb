# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::JSON' do
  describe 'when loading a valid json' do
    let (:resource) { load_resource('json', 'policyfile.lock.json') }

    it 'gets params as a hashmap' do
      _(resource.params).must_be_kind_of Hash
    end

    it 'retrieves nil if a param is missing' do
      _(resource.params['missing']).must_be_nil
    end

    it 'retrieves params by name' do
      _(resource.send('name')).must_equal 'demo'
    end

    it 'retrieves an array by name' do
      _(resource.send('run_list')).must_equal %w{a b}
    end

    it 'doesnt resolve dot-notation names' do
      _(resource.send('x.y.z')).must_be_nil
    end

    it 'doesnt resolve symbol-notation names' do
      _(resource.send(:'x.y.z')).must_be_nil
    end
  end
  describe 'when loading a nonexistent file' do
    let (:resource) { load_resource('json', 'nonexistent.json') }

    it 'produces an error' do
      _(resource.resource_exception_message).must_equal 'Can\'t find file "nonexistent.json"'
    end
  end
end
