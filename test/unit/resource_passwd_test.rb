# encoding: utf-8

require 'helper'
require 'vulcano/resource'

describe 'Vulcano::Resources::Passwd' do
  describe 'passwd' do
    let(:resource) { loadResource('passwd') }

    it 'verify passwd parsing' do
      _(resource.usernames).must_equal %w{root daemon bin sys sync games man lp mail news uucp proxy www-data backup list irc gnats nobody libuuid sshd}
      _(resource.uids).must_equal %w{0 1 2 3 4 5 6 7 8 9 10 13 33 34 38 39 41 65534 100 101}
    end

    it 'verify root passwd resource' do
      root = resource.uid(0)
      _(root.username).must_equal 'root'
      _(root.count).must_equal 1
    end

    it 'verify www-data resource' do
      www = resource.uid(33)
      _(www.username).must_equal 'www-data'
      _(www.count).must_equal 1
    end

  end
end
