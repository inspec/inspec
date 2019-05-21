
require 'helper'

describe 'Inspec::Resources::Pip' do
  it 'verify pip package detail parsing' do
    resource = load_resource('pip', 'jinja2')
    pkg = {:name=>'Jinja2', :installed=>true, :version=>'2.8', :type=>'pip'}
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
  it 'verify pip package default parsing' do
    resource = load_resource('pip', 'django')
    pkg = {:name=>'Django', :installed=>true, :version=>'1.10.5', :type=>'pip'}
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
  it 'verify pip package non default parsing' do
    resource = load_resource('pip', 'django', '/test/path/pip')
    pkg = {:name=>'Django', :installed=>true, :version=>'1.11.4', :type=>'pip'}
    _(resource.installed?).must_equal true
    _(resource.info).must_equal pkg
  end
end
