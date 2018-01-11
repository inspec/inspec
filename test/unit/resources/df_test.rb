require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::DfResource' do
  let (:resource) { load_resource('df', '/') }

  it 'resolves the / partition' do
    _(resource.partition).must_equal '/'
  end

  it 'has more than 1 MB' do
    _(resource.size).must_be :>=, 1
  end

  it 'must equal 28252316 MB' do
    _(resource.size).must_equal 28252316
  end
end
