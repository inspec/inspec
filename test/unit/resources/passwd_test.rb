
require 'helper'

describe 'Inspec::Resources::Passwd' do
  let(:passwd) { load_resource('passwd') }
  it 'retrieve users via field' do
    _(passwd.users).must_equal %w{root www-data}
  end

  it 'retrieve uids via field' do
    _(passwd.uids).must_equal %w{0 33}
  end

  it 'retrieve gids via field' do
    _(passwd.gids).must_equal %w{0 133}
  end

  it 'retrieve passwords via field' do
    _(passwd.passwords).must_equal %w{x x}
  end

  it 'retrieve login-shells via field' do
    _(passwd.shells).must_equal %w{/bin/bash /bin/sh}
  end

  it 'access all lines of the file' do
    _(passwd.lines).must_equal %w{root:x:0:0:root:/root:/bin/bash www-data:x:33:133:www-data:/var/www:/bin/sh}
  end

  it 'access all params of the file' do
    _(passwd.params[1]).must_equal({"user"=>"www-data", "password"=>"x", "uid"=>"33", "gid"=>"133", "desc"=>"www-data", "home"=>"/var/www", "shell"=>"/bin/sh"})
  end

  describe 'filter by uid == 0' do
    let(:child) { passwd.uids(0) }
    it 'creates a new passwd instance' do
      _(child.content).must_equal 'root:x:0:0:root:/root:/bin/bash'
    end

    it 'prints a nice to_s string' do
      _(child.to_s).must_equal '/etc/passwd with uid == 0'
    end

    it 'retrieves singular elements instead of arrays when filter has only one entry' do
      _(child.users).must_equal ['root']
      _(child.entries.length).must_equal 1
    end
  end

  describe 'filter via name =~ /^www/' do
    let(:child) { passwd.users(/^www/) }
    it 'filters by user via name (regex)' do
      _(child.users).must_equal ['www-data']
      _(child.entries.length).must_equal 1
    end

    it 'prints a nice to_s string' do
      _(child.to_s).must_equal '/etc/passwd with user == /^www/'
    end
  end

  describe 'where clause' do
    it 'retrieves username via uids < x' do
      _(passwd.where { uid.to_i < 33 }.entries.length).must_equal 1
      _(passwd.where { uid.to_i < 34 }.entries.length).must_equal 2
    end

    it 'retrieves username via uids <= x' do
      _(passwd.where { uid.to_i <= 32 }.entries.length).must_equal 1
      _(passwd.where { uid.to_i <= 33 }.entries.length).must_equal 2
    end

    it 'retrieves username via uids > x' do
      _(passwd.where { uid.to_i > 0 }.entries.length).must_equal 1
      _(passwd.where { uid.to_i > -1 }.entries.length).must_equal 2
    end

    it 'retrieves username via uids >= x' do
      _(passwd.where { uid.to_i >= 1 }.entries.length).must_equal 1
      _(passwd.where { uid.to_i >= 0 }.entries.length).must_equal 2
    end

    it 'retrieves username via uids == x' do
      _(passwd.where { uid.to_i == 0 }.entries.length).must_equal 1
      _(passwd.where { uid.to_i == 1 }.entries.length).must_equal 0
    end

    it 'retrieves username via uids != x' do
      _(passwd.where { uid.to_i != 0 }.entries.length).must_equal 1
      _(passwd.where { uid.to_i != 1 }.entries.length).must_equal 2
    end
  end
end
