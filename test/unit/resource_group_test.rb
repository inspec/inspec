# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::EtcGroup' do
  describe 'etc_group' do
    let(:resource) { loadResource('etc_group') }

    it 'verify /etc/group config parsing' do
      _(resource.gids).must_equal %w{ 0 1 2 3 4 5 6 7 8 9 10 12 13 15 20 21 22 24 25 26 27 29 30 33 34 37 38 39 40 41 42 43 44 45 46 50 60 100 65534 101 102 103}
      _(resource.groups).must_equal %w{ root daemon bin sys adm tty disk lp mail news uucp man proxy kmem dialout fax voice cdrom floppy tape sudo audio dip www-data backup operator list irc src gnats shadow utmp video sasl plugdev staff games users nogroup libuuid ssh ntp}
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
end
