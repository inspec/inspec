# Resources

All basic resources known from serverspec are included. Please see its [documentation here](http://serverspec.org/resource_types.html).

## audit_policy

Check Microsoft Windows Audit Policies:

```ruby
describe audit_policy do
  its('Other Account Logon Events') { should_not eq 'No Auditing' }
end
```

## etc_group

Parse the `/etc/group` file:

```ruby
etc_group     # uses /etc/group
```

You can also specify the file's location:

```ruby
etc_group('/etc/group')
```

### :gids

Access all group IDs:

```ruby
describe etc_group do
  its('gids') { should_not contain_duplicates }
end
```

### :groups

Access all group names:

```ruby
describe etc_group do
  its('groups') { should include 'my_user' }
end
```

## group_policy

Test Microsoft Windows Group Policies:

```ruby
describe group_policy('Local Policies\Security Options') do
  its('Network access: Restrict anonymous access to Named Pipes and Shares') { should eq 1 }
end
```

## inetd_config

Test inetd config files:

```ruby
describe inetd_conf do
  its('shell') { should eq nil }
  its('login') { should eq nil }
  its('exec') { should eq nil }
end
```

## limits_conf

Test Linux-based `/etc/security/limits.conf`:

```ruby
describe limits_conf do
  its('*') { should include ['hard','core','0'] }
end
```

You can also specify a custom path:

```ruby
limits_conf('/path/to/limits.conf')
```

## login_def

Test Linux-based `/etc/login.defs`:

```ruby
describe login_def do
  its('UMASK') {
    should eq '077'
  }

  its('PASS_MAX_DAYS.to_i') {
    should be <= 90
  }
end
```

## mysql_conf

!!! warning "Difference to Serverspec"
    See [Serverspec resource reference](http://serverspec.org/resource_types.html#mysql_config) for comparison,

Test default MySQL and MariaDB configuration files:

```ruby
mysql_conf
```

You can also specify the configuration path:

```ruby
mysql_conf('/etc/mysql/my.cnf')
```

### :params

Retrieve parameters in a group and test them. In this example,
we take a look at the `safe-user-create` parameter, which is in the
`mysqld` group.

```ruby
describe mysql_conf.params('mysqld') do
  its('safe-user-create') { should eq('1') }
end
```

## mysql_session

Run commands on a MySQL server and test their output:

```ruby
sql = mysql_session('my_user','password')
```

### :describe

All tests are structured with the describe command:

```ruby
sql.describe('show databases like \'test\';') do
  its(:stdout) { should_not match(/test/) }
end
```

## ntp_conf

Test NTP configuration files:

```ruby
describe ntp_conf do
  its('server') { should_not eq nil }
  its('restrict') { should include '-4 default kod notrap nomodify nopeer noquery'}
end
```

## os_env

Test environment variables:

```ruby
describe os_env('PATH') do |dirs|
  its(:split) { should_not include('') }
  its(:split) { should_not include('.') }
end
```

## parse_config

Parse and test arbitrary configuration strings:

```ruby
output = command('useradd -D').stdout
describe parse_config(output) do
  its('INACTIVE.to_i') { should be >= 35 }
end
```

You can configure the way in which config data is parsed:

```ruby
describe parse_config(data, { multiple_values: true }) do
  its('users') { should include 'bob'}
end
```

The following options are supported:

```ruby
{
  # A regular expression which determines
  # an assignment from key to value
  # This example would match 'key = value'
  assignment_re: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,

  # How many values a key contains;
  # e.g. key = a b c
  #      would contain 3 values
  key_vals: 1,

  # What is identified as a comment.
  comment_char: '#',

  # Determine if comments must always be
  # in a separate line. Examples:
  # set to false:   'key = value # comment'
  #   results to:   params['key'] = 'value'
  # set to true:    'key = value # comment'
  #   results to:   params['key'] = 'value # comment'
  standalone_comments: false,

  # Configure if multiple values are possible
  # for each key. Examples:
  # set to true:   'key = a' and 'key = b'
  #  results to:   params['key'] = ['a', 'b']
  # set to false:  'key = a' and 'key = b'
  #  results to:   params['key'] = 'b'
  multiple_values: false
}
```

## parse_config_file

Parse and test arbitrary configuration files:

```ruby
describe parse_config_file('/path/to/file.conf') do
  its('PARAM_X') { should eq 'Y' }
end
```

Options can be configure similar to [parse_config](#parse_config):

```ruby
describe parse_config_file('/path/to/file.conf', { multiple_values: true }) do
  its('PARAM_X') { should include 'Y' }
end
```

## passwd

Test `/etc/passwd`:

```ruby
describe passwd(0) do
  its(:username) { should eq 'root' }
  its(:count) { should eq 1 }
end
```

## postgres_conf

Test default PostgreSQL configuration files:

```ruby
postgres_conf
```

You can also specify the configuration path:

```ruby
postgres_conf('/var/lib/pgsql/data/postgresql.conf')
```

### :params

Retrieve parameters and test them:

```ruby
describe postgres_conf.params do
  it { should include('log_disconnections' => 'on') }
end
```

## postgres_session

Run commands on a MySQL server and test their output:

```ruby
sql = postgres_session('my_user','password')
```

### :describe

All tests are structured with the describe command:

```ruby
sql.describe('SELECT * FROM pg_shadow WHERE passwd IS NULL;') do
  its('output') { should eq('') }
end
```

## processes

Check the list of running programs and test it:

```ruby
describe processes('mysqld') do
  its('list.length') { should be(1) }
end
```

## registry_key

This resource allows you to test Windows Registry keys by checking the resulting values:

```ruby
describe registry_key('Task Scheduler','HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\Schedule') do
  its('Start') { should eq 2 }
end
```

## ssh_config

Test default OpenSSH configuration files:

```ruby
ssh_config     # /etc/ssh/ssh_config
sshd_config    # /etc/ssh/sshd_config
```

Parse custom SSH client and server configuration files:

```ruby
client = ssh_config('/path/to/ssh_config')
server = sshd_config('/path/to/sshd_config')
```

Usage:

```ruby
describe sshd_config do
  its('Protocol') { should eq('2') }
end
```

## security_policy

Test Microsoft Windows Security Policies:

```ruby
describe security_policy do
  # verifies that only the 'Administrators' group has remote access
  its('SeRemoteInteractiveLogonRight') { should eq '*S-1-5-32-544' }
end
```
