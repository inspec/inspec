# InSpec style guide

This is the set of recommended InSpec styles you should use on your daily journey when writing controls.

## Control files

### 1. All controls should be located in the "controls" directory and end in ".rb"

Reason: Most syntax highlighters will render InSpec files correctly across a wide list of tools.

Avoid: `controls/ssh_config`
Use: `controls/ssh_config.rb`

Avoid: `controls/ssh/config.rb`
Use: `controls/ssh_config.rb`

### 2. Avoid using "controls" or "control" in the name of your control files

Reason: Using `controls` in the filename again duplicates it and creates unnecessary clutter when reading it. Keep the names short and concise.

Avoid: `controls/ssh_controls.rb`
Use: `controls/ssh.rb`


## Code style

### 3. Use Ruby style conventions

Reason: There are many opinions on how to style code across languages and frameworks. To reduce the differences and make all code more easily readable and understandable we choose to follow some common Ruby style guidelines. The following list is a subset of the current best practices. Since InSpec is focused on writing tests instead of arbitrary programming code we can focus on a subset that is important to test authors.

This is a subset of style conventions taken from [the Ruby style guide](https://github.com/rubocop-hq/ruby-style-guide):

- Use: UTF-8 as source file encoding.
- Use: 2 spaces per indentation level. No hard tabs
- Use: Unix-style file endings.
- Avoid: multiple expressions per line.
- Use: Spaces around operators, after commas, colons and semicolons.
```ruby
sum = 1 + 2
```
- Avoid: Spaces after `(`, `[` or before `]`, `)`. Use spaces around `{` and before `}`.
```ruby
# bad
some( arg ).other
[ 1, 2, 3 ].each{|e| puts e}

# good
some(arg).other
[1, 2, 3].each { |e| puts e }
```
- Avoid: several empty lines in a row

Please refer to the full guide for the recommended style conventions.

## Controls

### 4. Do not wrap controls in conditional statements

Reason: This will create dynamic profiles whose controls depend on the execution. The problem here is that we cannot render the profile or provide its information before scanning a system. We want to be able to inform users of the contents of their profiles before they run them. It is valid to skip controls that are not necessary for a system, as long as you do it via `only_if` conditions. Ruby's internal conditionals will hide parts of the profile to static analysis and should thus be avoided.

Avoid:
```ruby
if package('..').installed?
  control "package-test1" do
    ..
  end
end
```

Use:
```ruby
control "package-test1" do
  only_if { package('..').installed? }
end
```

Avoid:
```ruby
case inspec.platform.name
when /centos/
  include_controls 'centos-profile'
...
```
Use:
- Set the `supports` attribute in `inspec.yml` files of the profile you want to include:
```ruby
supports:
- platform-name: centos
```
Now whenever you run the base profile you can just `include_controls 'centos-profile'`.
It will only run the included profiles is the platform matches the supported platform.


### 5. Do not include dynamic elements in the control IDs

Reason: Control IDs are used to map test results to the tests and profiles. Dynamic control IDs make it impossible to map results back, since the identifier which connects tests and results may change in the process.

Avoid:
```ruby
control "test-file-#{name}" do
  ..
end
```

Use:
```ruby
control "test-all-files" do
  ..
end
```

Sometimes you may create controls from a static list of elements. If this list stays the same no matter what system is scanned, it may be ok to do so and use it as a generator for static controls.


### 6. Avoid Ruby system calls

Reason: System calls are often used to interact with the local OS or remote endpoints from a local installation. InSpec tests, however, are designed to be universally executable on all types of runtimes, including local and remote execution. We want to give users the ability to take an OS profile and execute it remotely or locally. We also try to avoid more complexity and programming elements in control files.

Avoid: `` `ls ``\`
Avoid: `system("ls")`
Avoid: `IO.popen("ls")`
Use: `command("ls")` or `powershell("..")`

Ruby's command executors will only run locally. If the profile is pointed to a remote endpoint these commands will not run on the remote OS and may skew results.

Avoid: `File.new("filename").read`
Avoid: `File.read("filename")`
Avoid: `IO.read("filename")`
Use: `file("filename")`

Similar to the command interactions these files will only be read locally with Ruby's internal calls. Use the `file` resource to read them on any system.

In general, try to avoid IO calls from within InSpec controls.


### 7. Avoid debugging calls (in production)

Reason: One of the best way to develop and explore tests is the interactive debugging shell `pry` (see the section on "Interactive Debugging with Pry" at the end of this page). However, after you finish your profile make sure you have no interactive statements included anymore. Sometimes interactive calls are hidden behind conditionals (`if` statements) that are harder to reach. These calls can easily cause trouble when an automated profiles runs into an interactive `pry` call that stops the execution and waits for user input.

Avoid: `binding.pry` in production profiles
Use: Use debugging calls during development only



vvvv FIND A HOME? vvvv

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
  # use the json InSpec resource to get the file
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

For example, using `` `ls ``\ or `system('ls')` will result in the `ls`
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
an InSpec resource once and use the content in multiple tests.

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

### Example 1

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

### Example 2

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
