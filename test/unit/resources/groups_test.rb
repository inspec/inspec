require 'helper'
require 'inspec/resource'

describe 'groups resource on unix platform' do
  let(:resource) { MockLoader.new(:ubuntu1404).load_resource('groups') }

  describe 'no arguments' do
    it 'finds all group names' do
      _(resource.names.count).must_equal 3
      _(resource.names).must_equal %w(root www-data GroupWithCaps)
    end

    it 'finds all group gids' do
      _(resource.gids.count).must_equal 3
      _(resource.gids).must_equal [0, 33, 999]
    end


    it 'finds no group domains' do
      _(resource.domains.count).must_equal 3
      _(resource.domains).must_equal [nil, nil, nil]
    end
  end

  describe 'where method' do
    it 'retrieves entries via gid' do
      _(resource.where{ gid == 33 }.entries.length).must_equal 1
    end

    it 'retrieves entries via name' do
      _(resource.where{ name == 'www-data' }.entries.length).must_equal 1
    end

    it 'retrieves members via name' do
      _(resource.where{ name == 'www-data' }.members).must_equal ['www-data,root']
    end

    it 'retrieves entries via members regexp' do
      _(resource.where{ members =~ /root/ }.members).must_equal ['www-data,root']
      _(resource.where{ members =~ /root/ }.exist?).must_equal true
    end
  end
end

describe 'groups resource on windows platform' do
  let(:resource) { MockLoader.new(:windows).load_resource('groups') }

  describe 'no arguments' do
    it 'finds all group names' do
      _(resource.names.count).must_equal 4
      _(resource.names).must_equal ['Administrators', 'Guests', 'Power Users', 'Users']
    end

    it 'finds all group gids' do
      _(resource.gids.count).must_equal 4
      _(resource.gids).must_equal ["S-1-5-32-544", "S-1-5-32-546", "S-1-5-32-547", "S-1-5-32-545"]
    end


    it 'finds no group domains' do
      _(resource.domains.count).must_equal 4
      _(resource.domains).must_equal ['WIN-CIV7VMLVHLD', 'WIN-CIV7VMLVHLD',
                                      'WIN-CIV7VMLVHLD', 'WIN-CIV7VMLVHLD']
    end
  end

  describe 'where method' do
    it 'retrieves entries via gid' do
      _(resource.where{ gid == 'S-1-5-32-544' }.entries.length).must_equal 1
    end

    it 'retrieves entries via name' do
      _(resource.where{ name == 'Administrators' }.entries.length).must_equal 1
    end

    it 'retrieves members via name' do
      _(resource.where{ name == 'Administrators' }.members).must_equal ['Administrators', 'Domain Admins']
      _(resource.where{ name == 'Administrators' }.exist?).must_equal true
    end

    it 'retrieves groups via included members' do
      res = _(resource.where{ members.include? 'Guest' }.raw_data)
      res.target.count.must_equal 1
      res.target.first['name'].must_equal 'Guests'
    end
  end
end
