# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Pip' do
  it 'verify pip package detail parsing' do
    resource = load_resource('pip', 'jinja2')
    pkg = {:name=>'Jinja2', :installed=>true, :version=>'2.8', :type=>'pip'}
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
end
