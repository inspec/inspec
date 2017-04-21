# Using Ruby in InSpec

The InSpec DSL is a Ruby based DSL for writing audit controls, which
includes audit resources that you can invoke. Core and custom resources
are written as regular Ruby classes which inherit from
`Inspec.resource`.

Assuming we have a JSON file like this on the node to be tested:

```json
{
  "keys":[
    {"username":"john", "key":"/opt/keys/johnd.key"},
    {"username":"jane", "key":"/opt/keys/janed.key"},
    {"username":"sunny ", "key":"/opt/keys/sunnym.key"}
  ]
}
```

The following example shows how you can use pure Ruby code(variables,
loops, conditionals, regular expressions, etc) to run a few tests
against the above JSON file:

```ruby
control 'check-interns' do
  # use the json inspec resource to get the file
  json_obj = json('/opt/keys/interns.json')
  describe json_obj do
    its('keys') { should_not eq nil }
  end
  if json_obj['keys']
    # loop over the keys array
    json_obj['keys'].each do |intern|
      username = intern['username'].strip
      # check for white spaces chars in usernames
      describe username do
        it { should_not match(/\s/) }
      end
      # check key file owners and permissions
      describe file(intern['key']) do
        it { should be_owned_by username }
        its('mode') { should cmp '0600' }
      end
    end
  end
end
```

## Execution

It's important to understand that Ruby code used in custom resources and
controls DSL is executed on the system that runs InSpec. This allows
InSpec to work without Ruby and rubygems being required on remote
targets(servers or containers).

For example, using `` `ls ``\` or `system('ls')` will result in the `ls`
command being run locally and not on the target(remote) system. In order
to process the output of `ls` executed on the target system, use
`inspec.command('ls')` or `inspec.powershell('ls')`

Similarly, use `inspec.file(PATH)` to access files or directories from
remote systems in your tests or custom resources.


## Using rubygems

Ruby gems are self-contained programs and libraries. If you create a custom
resource please vendor gems into the library. This ensures that all resources
are self-contained and complete and don't need any resolution at runtime. We
vendor resources and requirements through dependency resolution, which is
independent of programming languages and their resolver mechanisms.

## Interactive Debugging with Pry

Here's a sample InSpec control that users Ruby variables to instantiate
an InSpec resource once and use the content in multipLe tests.

```ruby
control 'check-perl' do
  impact 0.3
  title 'Check perl compiled options and permissions'
  perl_out = command('perl -V')
  #require 'pry'; binding.pry;
  describe perl_out do
    its('exit_status') { should eq 0 }
    its('stdout') { should match (/USE_64_BIT_ALL/) }
    its('stdout') { should match (/useposix=true/) }
    its('stdout') { should match (/-fstack-protector/) }
  end

  # extract an array of include directories
  perl_inc = perl_out.stdout.partition('@INC:').last.strip.split("\n")
  # ensure include directories are only writable by 'owner'
  perl_inc.each do |path|
    describe directory(path.strip) do
      it { should_not be_writable.by('group') }
      it { should_not be_writable.by('other') }
    end
  end
end
```

An **advanced** but very useful Ruby tip. In the previous example, I
commented out the `require 'pry'; binding.pry;` line. If you remove the
`#` prefix and run the control, the execution will stop at that line and
give you a `pry` shell. Use that to troubleshoot, print variables, see
methods available, etc. For the above example:

```ruby
[1] pry> perl_out.exit_status
=> 0
[2] pry> perl_out.stderr
=> ""
[3] pry> ls perl_out
Inspec::Plugins::Resource#methods: inspect
Inspec::Resources::Cmd#methods: command  exist?  exit_status  result  stderr  stdout  to_s
Inspec::Plugins::ResourceCommon#methods: resource_skipped  skip_resource
Inspec::Resource::Registry::Command#methods: inspec
instance variables: @__backend_runner__  @__resource_name__  @command  @result
[4] pry> perl_out.stdout.partition('@INC:').last.strip.split("\n")
=> ["/Library/Perl/5.18/darwin-thread-multi-2level",
 "    /Library/Perl/5.18",
...REDACTED...
[5] pry> exit    # or abort
```

You can use `pry` inside both the controls DSL and resources. Similarly,
for dev and test, you can use `inspec shell` which is based on `pry`,
for example:

```ruby
$ inspec shell
Welcome to the interactive InSpec Shell
To find out how to use it, type: help

inspec> command('ls /home/gordon/git/inspec/docs').stdout
=> "ctl_inspec.rst\ndsl_inspec.rst\ndsl_resource.rst\n"
inspec> command('ls').stdout.split("\n")
=> ["ctl_inspec.rst", "dsl_inspec.rst", "dsl_resource.rst"]

inspec> help command
Name: command

Description:
Use the command InSpec audit resource to test an arbitrary command that is run on the system.

Example:
describe command('ls -al /') do
  it { should exist }
  its('stdout') { should match /bin/ }
  its('stderr') { should eq '' }
  its('exit_status') { should eq 0 }
end
```

## Shelling out in tests

When writing tests you can not use standard ruby methods to shellout as it tries to execute those commands locally.
However, the `command` resource has a `.stdout` method that will allow you to manipulate the results.
Using the above example, you could check the writes on several subdirectories.

### Example 1:
```ruby
$ inspec shell
Welcome to the interactive InSpec Shell
To find out how to use it, type: help

inspec> output=command('echo test').stdout
=> "test\n"
inspec> describe command('echo test') do
inspec>   its('stdout') { should eq output }
inspec> end

Profile: inspec-shell
Version: (not specified)

  Command echo
     ✔  test stdout should eq "test\n"

Test Summary: 1 successful, 0 failures, 0 skipped
```

### Example 2:
```ruby
$ inspec shell
Welcome to the interactive InSpec Shell
To find out how to use it, type: help

inspec> dirs = command('ls -d /home/gordon/git/inspec/docs').stdout.split("\n")
=> ["/home/gordon/git/inspec/docs"]
inspec> dirs.each do |dir|
inspec>   describe directory(dir) do
inspec>     its('mode') { should cmp '0775' }
inspec>   end
inspec> end

Profile: inspec-shell
Version: (not specified)

  File /home/gordon/git/inspec/docs/
     ✔  mode should cmp == "0775"

Test Summary: 1 successful, 0 failures, 0 skipped
```
