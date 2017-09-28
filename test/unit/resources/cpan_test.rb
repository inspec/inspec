# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Cpan' do
  it 'verify cpan package detail parsing' do
    resource = load_resource('cpan', 'DBD::Pg')
      pkg = {:type=>'cpan', :name=>'DBD::Pg', :version=>'3.7.0', :installed=>true }
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
end
