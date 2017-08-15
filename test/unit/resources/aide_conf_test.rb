# encoding: utf-8
# author: Jen Burns, burnsjennifere@gmail.com

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::AideConf' do
  describe 'AideConf Parameters' do
    resource = load_resource('aide_conf')
    it 'Verify aide_conf all_have_rule property' do
      _(resource.all_have_rule('p')).must_equal true
    end
    it 'Verify aide_conf filtering by selection_line' do
      entries = resource.where { selection_line == '/bin' }
      _(entries.rules.flatten).must_include 'sha512'
    end
    it 'Verify aide_conf finds selection_line dirs' do
      _(resource.selection_lines).must_include '/bin'
    end
  end
end
