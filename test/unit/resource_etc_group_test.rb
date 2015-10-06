# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::EtcGroup' do
  let(:resource) { load_resource('etc_group') }

  it 'verify /etc/group config parsing' do
    _(resource.gids).must_equal %w{ 0 33 }
    _(resource.groups).must_equal %w{ root www-data }
    _(resource.users).must_equal %w{ www-data root }
  end

  it 'verify group filter with no users' do
    root_filter = resource.where(name: 'root')
    _(root_filter.gids).must_equal ['0']
    _(root_filter.groups).must_equal ['root']
    _(root_filter.users).must_equal []
  end

  it 'verify group filter with users' do
    www_filter = resource.where(name: 'www-data')
    _(www_filter.gids).must_equal ['33']
    _(www_filter.groups).must_equal ['www-data']
    _(www_filter.users).must_equal ['www-data', 'root']
  end

  it 'verify group filter with wrong group' do
    wrong_filter = resource.where(name: 'wrong_group')
    _(wrong_filter.gids).must_equal []
    _(wrong_filter.groups).must_equal []
    _(wrong_filter.users).must_equal []
  end
end
