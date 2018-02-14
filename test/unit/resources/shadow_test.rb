# encoding: utf-8

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Shadow' do
  let(:shadow) { load_resource('shadow') }

  it 'content should be mapped correctly' do
    _(shadow.content).must_equal "root:x:1:2:3\nwww-data:!!:10:20:30:40:50:60"
  end

  it 'retrieve users via field' do
    _(shadow.users).must_equal %w{root www-data}
    _(shadow.user).must_equal %w{root www-data}
    _(shadow.count).must_equal 2
  end

  it 'retrieve passwords via field' do
    _(shadow.passwords).must_equal %w{x !!}
    _(shadow.password).must_equal %w{x !!}
  end

  it 'retrieve last password change via field' do
    _(shadow.last_changes).must_equal %w{1 10}
    _(shadow.last_change).must_equal %w{1 10}
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
    _(shadow.expiry_date).must_equal [nil, "60"]
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
      _(child.to_s).must_equal '/etc/shadow with user == /^www/'
    end
  end

  describe 'filter via name = root' do
    let(:child) { shadow.users('root') }

    it 'filters by user name' do
      _(child.users).must_equal %w{root}
      _(child.count).must_equal 1
    end
  end

  describe 'filter via min_days' do
    let(:child) { shadow.min_days('20') }

    it 'filters by property' do
      _(child.users).must_equal %w{www-data}
      _(child.count).must_equal 1
    end
  end

  describe 'it raises errors' do
    it 'raises error on unsupported os' do
      resource = MockLoader.new(:windows).load_resource('shadow')
      _(resource.resource_skipped?).must_equal true
      _(resource.resource_exception_message).must_equal 'The `shadow` resource is not supported on your OS.'
    end
  end
end
