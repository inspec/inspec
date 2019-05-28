require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::AideConf' do
  describe 'AideConf Parameters' do
    resource = load_resource('aide_conf')
    it 'Verify aide_conf all_have_rule property - true case' do
      _(resource.all_have_rule('p')).must_equal true
    end
    it 'Verify aide_conf all_have_rule property - false case' do
      _(resource.all_have_rule('x')).must_equal false
    end
    it 'Verify aide_conf filtering by selection_line for single rule' do
      entries = resource.where { selection_line == '/bin' }
      _(entries.rules.flatten).must_include 'sha512'
    end
    it 'Verify handle_multi_rule properly expands rules based on macro' do
      entries = resource.where { selection_line == '/sbin' }
      _(entries.rules).must_include %w{p i l n u g s m c md5 sha512}
    end
    it 'Verify parse_rule_line properly expands rules based on macro' do
      entries = resource.where { selection_line == '/bin' }
      _(entries.rules).must_include %w{b t p i l n u g s m c md5 sha512}
    end
    it 'Verify parse_selection_line normalizes directories ending in /' do
      _(resource.selection_lines).must_include '/boot'
    end
    it 'Verify aide_conf finds all selection_line dirs' do
      _(resource.selection_lines).must_equal ['/boot', '/bin', '/sbin', '/etc/hosts']
    end
  end
end
