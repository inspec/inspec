
require 'helper'

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
        'user'    => nil,
        'command' => '/path/to/script1',
      },
      {
        'minute'  => '1',
        'hour'    => '3',
        'day'     => '12',
        'month'   => '10',
        'weekday' => '5',
        'user'    => nil,
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

    let(:crontab) { load_resource('crontab', { path: '/etc/cron.d/crondotd' }) }

    it 'prints a nice to_s string' do
      _(crontab.to_s).must_equal 'crontab for path /etc/cron.d/crondotd'
    end

    it 'returns all params of the file' do
      _(crontab.params).must_equal(
        [{
          'minute'  => '0',
          'hour'    => '2',
          'day'     => '11',
          'month'   => '9',
          'weekday' => '4',
          'user'    => 'root',
          'command' => '/path/to/crondotd1',
        },
         {
           'minute'  => '1',
           'hour'    => '3',
           'day'     => '12',
           'month'   => '10',
           'weekday' => '5',
           'user'    => 'daemon',
           'command' => '/path/to/crondotd2 arg1 arg2',
         },
         {
           'minute'  => '0',
           'hour'    => '0',
           'day'     => '1',
           'month'   => '1',
           'weekday' => '*',
           'user'    => 'root',
           'command' => '/usr/local/bin/foo.sh bar',
         }],
      )
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
          'user'    => 'special',
          'command' => '/bin/custom_script.sh',
        },
        {
          'minute'  => '0',
          'hour'    => '0',
          'day'     => '1',
          'month'   => '1',
          'weekday' => '*',
          'user'    => 'special',
          'command' => '/usr/local/bin/foo.sh bar'
        },
        {
          'minute'  => '-1',
          'hour'    => '-1',
          'day'     => '-1',
          'month'   => '-1',
          'weekday' => '-1',
          'user'    => 'special',
          'command' => '/bin/echo "Rebooting" > /var/log/rebooting.log'
        }
      ])
    end
  end

  describe 'it raises errors' do
    it 'fails and raises error on unsupported os' do
      resource = MockLoader.new(:windows).load_resource('crontab', { user: 'special' })
      _(resource.resource_failed?).must_equal true
      _(resource.resource_exception_message)
        .must_equal 'Resource `crontab` is not supported on platform windows/6.2.9200.'
    end

    it 'raises error when no user or path supplied' do
      resource = load_resource('crontab', {})
      _(resource.resource_failed?).must_equal true
      _(resource.resource_exception_message).must_equal 'A user or path must be supplied.'
    end

    it 'raises error when both user or path supplied' do
      resource = load_resource('crontab', {'user':'someuser', 'path': 'somefile'})
      _(resource.resource_failed?).must_equal true
      _(resource.resource_exception_message).must_equal 'Either user or path must be supplied, not both!'
    end

    it 'raises error when supplied path does not exist' do
      resource = load_resource('crontab', {'path': '/definitely/not/there/somefile'})
      _(resource.resource_failed?).must_equal true
      _(resource.resource_exception_message).must_equal 'Supplied crontab path \'/definitely/not/there/somefile\' must exist!'
    end
  end
end
