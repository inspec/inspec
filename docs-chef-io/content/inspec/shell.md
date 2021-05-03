+++
title = "Chef InSpec Shell"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "InSpec Shell"
    identifier = "inspec/reference/shell.md Chef InSpec Shell"
    parent = "inspec/reference"
    weight = 110
+++

The Chef InSpec interactive shell is a pry based REPL that can be used to
quickly run Chef InSpec controls and tests without having to write it to a
file. Its functionality is similar to [chef-shell](/chef_shell/) as it provides a way
to exercise the Chef InSpec DSL, its resources, tests, and plugins without
having to create a profile or write a test file. See
[http://pryrepl.org/](http://pryrepl.org/) for an introduction to what pry is and what it can
do.

See [Explore Chef InSpec resources](https://learn.chef.io/modules/explore-inspec-resources#/)
on Learn Chef Rally for a hands-on example that uses Chef InSpec shell.

## Launching the shell

If you are using Chef InSpec from a platform-specific package (rpm, msi,
etc.) or from a Chef prepared shell in Chef Workstation, you can directly launch
Chef InSpec shell against your local machine using the following. See
<https://docs.chef.io/install_dk.html#set-system-ruby> for details.

```bash
inspec shell
inspec help shell # This will describe inspec shell usage
```

If you wish to connect to a remote machine (called a target within
InSpec), you can use the `-t` flag. We support connecting using SSH,
WinRM and docker. If no target is provided, we implicitly support the
"local" target - i.e. tests running on the current machine running
InSpec. For an SSH connection, use `-i` for specifying SSH key files,
and the `--sudo*` commands for requesting a privilege escalation after
logging in. For a WinRM connection, use `--path` to change the login
path, `--ssl` to use SSL for transport layer encryption.

```bash
inspec shell -t ssh://root@192.168.64.2:11022  # Login to remote machine using ssh as root.
inspec shell -t ssh://user@hostname:1234 -i /path/to/user_key  # Login to hostname on port 1234 as user using given ssh key.
inspec shell -t winrm://UserName:Password@windowsmachine:1234  # Login to windowsmachine over WinRM as UserName.
inspec shell -t winrm://windowsmachine --user 'UserName@domain' --password 'Secret123!' # Login to windowsmachine as UserName@domain.org.
inspec shell -t docker://container_id # Login to a Docker container.
```

## Resource Packs

Use resource packs to share custom resources with other Chef InSpec users.
A resource pack is a Chef InSpec profile that contains only custom resources and
no other controls or tests.

For example, the profile in [`examples/profile`](https://github.com/chef/inspec/tree/master/examples/profile)
in the Chef InSpec GitHub repository defines an
[`example_config` resource](https://github.com/chef/inspec/blob/master/examples/profile/controls/example.rb).
To use these resources within the Chef InSpec shell, you will need to download
and specify them as a dependency.

Once you have local access to the profile, you can use the `example_config` custom
resource provided in the `examples/profile` GitHub repo in your local environment :

```bash
inspec shell --depends examples/profile
```

Once inside the shell your resource will be available:

```ruby
inspec> example_config
```

## Using Ruby in Chef InSpec shell

Since Chef InSpec shell is pry based, you may treat the shell as an
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

## Using Chef InSpec DSL in Chef InSpec shell

Chef InSpec shell will automatically evaluate the result of every command as
if it were a test file. If you type in a Ruby command that is not an
Chef InSpec control or test, the shell will evaluate it as if it were a
regular ruby command.

Bare Chef InSpec resources are instantiated and their help text is presented.
You may also access the resource contents or other matchers that they
define. Run `help <resource>` to get more help on using a particular
resource or see the Chef InSpec resources documentation online.

```bash
$ inspec shell
Welcome to the interactive InSpec Shell
To find out how to use it, type: help

inspec> file('/Users/myuser').directory?
=> true
inspec> os_env('HOME')
=> Environment variable HOME
inspec> os_env('HOME').content
=> /Users/myuser
inspec> exit
```

Chef InSpec tests are immediately executed.

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
inspec>     its('content') { should eq '/Users/myuser' }
inspec>   end
inspec> end
  ✔  my_control: Environment variable HOME content should eq "/Users/myuser"

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

## Running a single Chef InSpec command

If you wish to run a single Chef InSpec command and fetch its results, you
may use the `-c` flag. This is similar to using `bash -c`.

```bash
$ inspec shell -c 'describe file("/Users/myuser") do it { should exist } end'
Target:  local://

  ✔  File /Users/myuser should exist

Summary: 1 successful, 0 failures, 0 skipped
```

```bash
$ inspec shell --format json -c 'describe file("/Users/test") do it { should exist } end'
{
  "version": "1.49.2",
  "controls": [{
    "status": "passed",
    "code_desc": "File /Users/test should exist",
    "run_time": 0.002374,
    "start_time": "2018-01-06 18:32:38 -0500"
  }],
  "other_checks": [],
  "profiles": [{
    "name": "inspec-shell",
    "supports": [],
    "controls": [{
      "title": null,
      "desc": null,
      "impact": 0.5,
      "refs": [],
      "tags": {},
      "code": "",
      "source_location": {
        "ref": "/usr/local/lib/ruby/gems/2.4.0/gems/inspec-1.49.2/lib/inspec/control_eval_context.rb",
        "line": 89
      },
      "id": "(generated from (eval):1 7b6f82c2cc5e4205b3e2c97c8e855f2d)",
      "results": [{
        "status": "passed",
        "code_desc": "File /Users/test should exist",
        "run_time": 0.002374,
        "start_time": "2018-01-06 18:32:38 -0500"
      }]
    }],
    "groups": [{
      "title": null,
      "controls": ["(generated from (eval):1 7b6f82c2cc5e4205b3e2c97c8e855f2d)"],
      "id": "unknown"
    }],
    "attributes": [],
    "sha256": "29c070a90b7e3521babf618215573284a790d92907783d5b2c138f411bfd2e74"
  }],
  "platform": {
    "name": "mac_os_x",
    "release": "17.3.0"
  },
  "statistics": {
    "duration": 0.003171
  }
}
```

## Running Chef InSpec Shell With Inputs

With InSpec [profiles that support inputs]({{< relref "inputs/#which-profiles-support-inputs" >}}),
you can set inputs using the InSpec `shell` command. This allows you to work more consistently with
InSpec profiles when switching between the `shell` and `exec` commands.

For more details on inputs, see the [inputs reference](/inspec/inputs/).

### Set Inputs with Command-line Options

The `shell` command accepts one or more inputs in the command line as single-quoted YAML or JSON structures.

```bash
$ inspec shell --input=input_name=input_value
Welcome to the interactive InSpec Shell
To find out how to use it, type: help

inspec> control 'my_control' do
inspec>   describe input('input_name') do
inspec>     it { should cmp 'input_value' }
inspec>   end
inspec> end
Profile: inspec-shell

  ✔  my_control: input_value
     ✔  input_value is expected to cmp == "input_value"

Profile Summary: 1 successful control, 0 control failures, 0 controls skipped
Test Summary: 1 successful, 0 failures, 0 skipped
inspec> exit
```

### Set Inputs with YAML File

You can also save inputs and values to one or more YAML files and pass them to `shell` in the command line.
For example:

```yaml
input_name: input_value
another_input: another_value
```

```bash
inspec shell --input-file=<path>
```
