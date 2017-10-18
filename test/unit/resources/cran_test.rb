# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter
# author: Markus Grobelin

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Cran' do
  it 'verify cran package detail parsing' do
    resource = load_resource('cran', 'DBI')
    pkg = {type: 'cran', name: 'DBI', version: '0.5.1', installed: true}
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
end
