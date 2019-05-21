
require 'helper'

describe 'Inspec::Resources::Cran' do
  it 'verify cran package detail parsing' do
    resource = load_resource('cran', 'DBI')
    pkg = {type: 'cran', name: 'DBI', version: '0.5.1', installed: true}
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
  it 'verify info for non-installed packages' do
    resource = load_resource('cran', 'DoesNotExist')
    _(resource.installed?).must_equal false
    _(resource.version).must_be_nil
    _(resource.info[:name]).must_equal 'DoesNotExist'
    _(resource.info[:type]).must_equal 'cran'
  end
end
