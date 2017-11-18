# encoding: utf-8
# author: Adam Leff

require 'helper'
require 'inspec/resource'

describe 'Inspec::Resources::Crontab' do
  let(:crontab) { load_resource('crontab') }

  it 'retrieve minutes via field' do
    _(crontab.minutes).must_equal [ '0', '1' ]
  end

  it 'retrieve hours via field' do
    _(crontab.hours).must_equal [ '2', '3' ]
  end

  it 'retrieve days via field' do
    _(crontab.days).must_equal [ '11', '12' ]
  end

  it 'retrieve months via field' do
    _(crontab.months).must_equal [ '9', '10' ]
  end

  it 'retrieve weekdays via field' do
    _(crontab.weekdays).must_equal [ '4', '5' ]
  end

  it 'retrieve commands via field' do
    _(crontab.commands).must_equal [ '/path/to/script1', '/path/to/script2 arg1 arg2' ]
  end

  it 'returns all params of the file' do
    _(crontab.params).must_equal([
      {
        'minute'  => '0',
        'hour'    => '2',
        'day'     => '11',
        'month'   => '9',
        'weekday' => '4',
        'command' => '/path/to/script1',
      },
      {
        'minute'  => '1',
        'hour'    => '3',
        'day'     => '12',
        'month'   => '10',
        'weekday' => '5',
        'command' => '/path/to/script2 arg1 arg2'
      },
    ])
  end

  it 'prints a nice to_s string' do
    _(crontab.to_s).must_equal "crontab for current user"
  end

  describe 'filter by command' do
    let(:entry) { crontab.commands(/script2/) }

    it 'returns the correct content' do
      _(entry.content).must_equal '1 3 12 10 5 /path/to/script2 arg1 arg2'
    end

    it 'prints a nice to_s string' do
      _(entry.to_s).must_equal 'crontab for current user with command == /script2/'
    end
  end

  describe 'query by user' do
    let(:crontab) { load_resource('crontab', 'foouser') }

    it 'prints a user-specific to_s string' do
      _(crontab.to_s).must_equal 'crontab for user foouser'
    end
  end

  describe 'query by path' do
    let(:crontab) { load_resource('crontab', '/etc/cron.d/crondotd') }

    it 'prints a nice to_s string' do
      _(crontab.to_s).must_equal 'crontab for path /etc/cron.d/crondotd'
    end
  end

  describe 'special strings' do
    let(:crontab) { load_resource('crontab', 'special') }

    it 'returns all params of the file' do
      _(crontab.params).must_equal([
        {
          'minute'  => '*',
          'hour'    => '*',
          'day'     => '*',
          'month'   => '*',
          'weekday' => '*',
          'command' => '/bin/custom_script.sh',
        },
        {
          'minute'  => '0',
          'hour'    => '0',
          'day'     => '1',
          'month'   => '1',
          'weekday' => '*',
          'command' => '/usr/local/bin/foo.sh bar'
        },
        {
          'minute'  => '-1',
          'hour'    => '-1',
          'day'     => '-1',
          'month'   => '-1',
          'weekday' => '-1',
          'command' => '/bin/echo "Rebooting" > /var/log/rebooting.log'
        }
      ])
    end
  end
end
