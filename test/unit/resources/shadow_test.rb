# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Shadow' do
  let(:shadow) { load_resource('shadow') }

  it 'retrieve users via field' do
    _(shadow.users).must_equal %w{root www-data}
  end

  it 'retrieve passwords via field' do
    _(shadow.passwords).must_equal %w{x !!}
  end

  it 'retrieve last password change via field' do
    _(shadow.last_changes).must_equal %w{1 10}
  end

  it 'retrieve min password days via field' do
    _(shadow.min_days).must_equal %w{2 20}
  end

  it 'retrieve max password days via field' do
    _(shadow.max_days).must_equal %w{3 30}
  end

  it 'retrieve warning days for password expiry via field' do
    _(shadow.warn_days).must_equal [nil, "40"]
  end

  it 'retrieve days before account is inactive via field' do
    _(shadow.inactive_days).must_equal [nil, "50"]
  end

  it 'retrieve dates when account will expire via field' do
    _(shadow.expiry_dates).must_equal [nil, "60"]
  end

  it 'access all lines of the file' do
    _(shadow.lines[0]).must_equal 'root:x:1:2:3::::'
  end

  it 'access all params of the file' do
    _(shadow.params[0]).must_equal({
      'user' => 'root', 'password' => 'x', 'last_change' => '1',
      'min_days' => '2', 'max_days' => '3', 'warn_days' => nil,
      'inactive_days' => nil, 'expiry_date' => nil, 'reserved' => nil,
    })
  end

  describe 'filter via name =~ /^www/' do
    let(:child) { shadow.users(/^www/) }

    it 'filters by user via name (regex)' do
      _(child.users).must_equal ['www-data']
      _(child.count).must_equal 1
    end

    it 'prints a nice to_s string' do
      _(child.to_s).must_equal '/etc/shadow with user = /^www/'
    end
  end
end
