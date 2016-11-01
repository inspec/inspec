---
title: InSpec Shell
---

# InSpec Shell

The InSpec interactive shell is a pry based REPL that can be used to
quickly run InSpec controls and tests without having to write it to a
file. Its functionality is similar to `chef shell` - it provides a way
to exercise the InSpec DSL, its resources, tests and plugins without
having to create a profile or write a test file. See
[http://pryrepl.org/](http://pryrepl.org/) for an introduction to what pry is and what it can
do.

## Launching the shell

If you are using InSpec from a platform-specific package (rpm, msi,
etc.) or from a chef prepared shell in ChefDK, you can directly launch
InSpec shell against your local machine using the following. See
<https://docs.chef.io/install_dk.html#set-system-ruby> for details.

```bash
$ inspec shell
$ inspec help shell # This will describe inspec shell usage
```

If you wish to connect to a remote machine (called a target within
InSpec), you can use the `-t` flag. We support connecting using ssh,
WinRm and docker. If no target is provided, we implicitly support the
"local" target - i.e. tests running on the current machine running
InSpec. For an ssh connection, use `-i` for specifying ssh key files,
and the `--sudo*` commands for requesting a privelege escalation after
logging in. For a WinRM connection, use `--path` to change the login
path, `--ssl` to use SSL for transport layer encryption.

```bash
$ inspec shell -t ssh://root@192.168.64.2:11022  # Login to remote machine using ssh as root.
$ inspec shell -t ssh://user@hostname:1234 -i /path/to/user_key  # Login to hostname on port 1234 as user using given ssh key.
$ inspec shell -t winrm://UserName:Password@windowsmachine:1234  # Login to windowsmachine over WinRM as UserName.
$ inspec shell -t docker://container_id # Login to a docker container.
```

## Using Ruby in InSpec shell

Since InSpec shell is pry based, you may treat the shell as an
interactive Ruby session. You may write Ruby expressions and evaluate
them. Source high-lighting, automatic indentation and command history
(using the up and down arrow keys) are available to make your experience
more delightful. You can exit the shell using `exit`.

```bash
$ inspec shell
Welcome to the interactive InSpec Shell
To find out how to use it, type: help

inspec> 1 + 2
=> 3
inspec> exit
```

## Using InSpec DSL in InSpec shell

InSpec shell will automatically evaluate the result of every command as
if it were a test file. If you type in a Ruby command that is not an
InSpec control or test, the shell will evaluate it as if it were a
regular ruby command.

Bare InSpec resources are instantiated and their help text is presented.
You may also access the resource contents or other matchers that they
define. Run `help <resource>` to get more help on using a particular
resource or see the InSpec resources documentation online.

```bash
$ inspec shell
Welcome to the interactive InSpec Shell
To find out how to use it, type: help

inspec> file('/Users/ksubramanian').directory?
=> true
inspec> os_env('HOME')
=> Environment variable HOME
inspec> os_env('HOME').content
=> /Users/ksubramanian
inspec> exit
```

InSpec tests are immediately executed.

```bash
inspec> describe file('/Users')     # Empty test.
Summary: 0 successful, 0 failures, 0 skipped
inspec> describe file('/Users') do  # Test with one check.
inspec>   it { should exist }
inspec> end
  ✔  File /Users should exist

Summary: 1 successful, 0 failures, 0 skipped
```

All tests in a control are immediately executed as well. If a control is
redefined in the shell, the old control's tests are destroyed and
replaced with the redefinition and the control is re-run.

```bash
inspec> control 'my_control' do
inspec>   describe os_env('HOME') do
inspec>     its('content') { should eq '/Users/ksubramanian' }
inspec>   end
inspec> end
  ✔  my_control: Environment variable HOME content should eq "/Users/ksubramanian"

  Summary: 1 successful, 0 failures, 0 skipped
```

Syntax errors are illegal tests are also detected and reported.

```bash
inspec> control 'foo' do
inspec>   thisisnonsense
inspec> end
NameError: undefined local variable or method `thisisnonsense' for #<#<Class:0x007fd63b571f98>:0x007fd639825cc8>
from /usr/local/lib/ruby/gems/2.3.0/gems/rspec-expectations-3.5.0/lib/rspec/matchers.rb:967:in `method_missing'
inspec> control 'foo' do
inspec>   describe file('wut') do
inspec>     its('thismakesnosense') { should cmp 'fail' }
inspec>   end
inspec> end
  ✖  foo: File wut thismakesnosense  (undefined method `thismakesnosense' for File wut:Inspec::Resource::Registry::File)

  Summary: 0 successful, 1 failures, 0 skipped
```

## Running a single InSpec command

If you wish to run a single InSpec command and fetch its results, you
may use the `-c` flag. This is similar to using `bash -c`.

```bash
$ inspec shell -c 'describe file("/Users/ksubramanian") do it { should exist } end'}
Target:  local://

  ✔  File /Users/ksubramanian should exist

Summary: 1 successful, 0 failures, 0 skipped
```

```bash
$ inspec shell --format json -c 'describe file("/Users/ksubramanian") do it { should exist } end'
{"version":"0.30.0","profiles":{"":{"supports":[],"controls":{"(generated from in_memory.rb:1 5aab65c33fb1f133d9244017958eef64)":{"title":null,"desc":null,"impact":0.5,"refs":[],"tags":{},"code":"          rule = rule_class.new(id, profile_id, {}) do\n            res = describe(*args, &block)\n          end\n","source_location":{"ref":"/Users/ksubramanian/repo/chef/inspec/lib/inspec/profile_context.rb","line":184},"results":[{"status":"passed","code_desc":"File /Users/ksubramanian should exist","run_time":0.000747,"start_time":"2016-08-16 11:41:40 -0400"}]}},"groups":{"in_memory.rb":{"title":null,"controls":["(generated from in_memory.rb:1 5aab65c33fb1f133d9244017958eef64)"]}},"attributes":[]}},"other_checks":[],"summary":{"duration":0.001078,"example_count":1,"failure_count":0,"skip_count":0}}}
```
