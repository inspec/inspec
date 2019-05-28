require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::TOML' do
  describe 'when loading valid TOML' do
    let (:resource) { load_resource('toml', 'default.toml') }

    it 'gets params as a hash' do
      _(resource.params).must_be_kind_of Hash
    end

    it 'retrieves nil if a param is missing' do
      _(resource.params['missing']).must_be_nil
    end

    it 'retrieves params by name' do
      _(resource.params['key']).must_equal 'value'
    end

    it 'retrieves array by name' do
      _(resource.params['arr']).must_be_kind_of Array
      _(resource.params['arr']).must_equal [1, 2, 3]
    end

    it 'retrieves table by name as hash' do
      h = {"key1" => "value1", "key2" => "value2"}
      _(resource.params['mytable']).must_be_kind_of Hash
      _(resource.params['mytable']).must_equal h
    end
  end
end