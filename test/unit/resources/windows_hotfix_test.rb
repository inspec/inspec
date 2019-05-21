
require 'helper'

describe 'Inspec::Resources::WindowsHotfix' do

  # ubuntu 14.04
  it 'fail windows_hotfix fails on ubuntu' do
    resource = MockLoader.new(:ubuntu1404).load_resource('windows_hotfix', 'KB4019215')
    _(resource.installed?).must_equal false
  end

  # windows
  it 'verify windows_hotfix installed on windows' do
    resource = MockLoader.new(:windows).load_resource('windows_hotfix', 'KB4019215')
    _(resource.installed?).must_equal true
  end

  # windows missing hotfix
  it 'verify windows_hotfix not installed on windows' do
    resource = MockLoader.new(:windows).load_resource('windows_hotfix', 'KB9999999')
    _(resource.installed?).must_equal false
  end
end
