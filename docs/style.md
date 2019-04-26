# Chef InSpec profile style guide

This is a set of recommended Chef InSpec rules you should use when writing controls.

# Control Files

## Place control files in `controls/` and end them with `.rb`

Most syntax highlighters will render Chef InSpec files correctly across a wide list
of tools.

Avoid:
  - `controls/ssh_config`
  - `controls/ssh/config.rb`

Use:
  - `controls/ssh_config.rb`
  - `controls/ssh_config.rb`

## Avoid `controls`/`control` in your control filenames

Using `controls` in the filename creates unnecessary clutter when reading it.
Keep the names short and concise.

Avoid:
  - `controls/ssh_controls.rb`

Use:
  - `controls/ssh.rb`

# Code Style

## Avoid unnecessary parentheses in matchers

Adding additional parentheses is not required and provides more readability if
it is not used:

Avoid:
  - `it { should eq(value) }`

Use:
  - `it { should eq value }`

The exception are matchers that require additional arguments or named arguments.

# Controls

## Avoid wrapping controls in conditional statements

This will create dynamic profiles whose controls depend on the execution. The
problem here is that we cannot render the profile or provide its information
before scanning a system. We want to be able to inform users of the contents of
their profiles before they run them. It is valid to skip controls that are not
necessary for a system, as long as you do it via `only_if` conditions. Ruby's
internal conditionals will hide parts of the profile to static analysis and
should thus be avoided.

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

Instead use the `supports` attribute in the `inspec.yml` of the profile you
want to include:

```ruby
supports:
  - platform-name: centos
```

Now whenever you run the base profile you can just
`include_controls 'centos-profile'`. It will only run the included profiles is
the platform matches the supported platform.

## Avoid dynamic elements in the control IDs

Control IDs are used to map test results to the tests and profiles. Dynamic
control IDs make it impossible to map results back, since the identifier which
connects tests and results may change in the process.

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

Sometimes you may create controls from a static list of elements. If this list
stays the same no matter what system is scanned, it may be ok to do so and use
it as a generator for static controls.

## Avoid Ruby system calls

Ruby code is executed on the system that runs InSpec. This allows Chef InSpec to work
without Ruby and RubyGems being required on remote targets (servers or
containers). System calls are often used to interact with the local OS or remote
endpoints from a local installation.

Chef InSpec tests, however, are designed to be universally executable on all types
of runtimes, including local and remote execution. We want to give users the
ability to take an OS profile and execute it remotely or locally.

## Avoid shelling out

Avoid:
  - `` `ls``\`
  - `system("ls")`
  - `IO.popen("ls")`

Use:

  - `command("ls")` or `powershell("Get-ChildItem")`

Ruby's command executors will only run locally. Imagine a test like this:

```ruby
describe `whoami` do
  it { should cmp "bob\n" }
end
```

If you run this test on your local system and happen to be using Bob's account
it will succeed. But if you were to run it against
`--target alice@remote-host.com` it will still report that the user is bob
instead of alice.

Instead, do this:

```ruby
describe command('whoami') do
  its('stdout') { should cmp "bob\n" }
end
```

If the profile is pointed to a remote endpoint using the `command` resource
will run it on the remote OS.

## Avoid Ruby IO on files

Similar to the command interactions these files will only be read locally with
Ruby's internal calls. If you run this test against a remote target it won't
read the file from the remote endpoint, but from the local OS instead. Use the
`file` resource to read files on the target system.

Avoid:
  - `File.new("filename").read`
  - `File.read("filename")`
  - `IO.read("filename")`

Use:
  - `file("filename")`

In general, try to avoid Ruby's IO calls from within Chef InSpec controls and use
Chef InSpec resources instead.

## Avoid Ruby gem dependencies in controls

In addition to avoiding system-level gems and modules you should also limit the
use of external dependencies to resource packs or plugins. Gems need to be
resolved, installed, vendored, and protected from conflicts. We aim to avoid
exposing this complexity to users of InSpec, to make it a great tool even if you
are not a developer.

Plugins should declare gem dependencies in their gemspec, and then rely on the
plugin installation facility to install and manage dependencies.

## Avoid debugging calls (in production)

One of the best way to develop and explore tests is the interactive debugging
shell `pry` (see [Interactive Debugging with Pry] (https://www.inspec.io/docs/reference/dsl_inspec/#interactive-debugging-with-pry)
at the end of this page). However, after you finish your profile make sure you
have no interactive statements included anymore. Sometimes interactive calls are
hidden behind conditionals (`if` statements) that are harder to reach. These
calls can easily cause trouble when an automated profiles runs into an
interactive `pry` call that stops the execution and waits for user input.

Avoid:
  - `binding.pry` in production profiles

Use:
  - Use debugging calls during development only

Also you may find it helpful to use the Chef InSpec logging interface:

```ruby
Inspec::Log.info('Hi')
```

### 9. Favor `cmp` over `eq`

Reason: The `cmp` matcher handles type conversions, case insensitive comparisons, converting strings to versions (e.g. '7.35.0-1ubuntu2.10'), and many other troublesome things. Unless you are wanting an exact match (if so use the `eq` matcher) then the `cmp` matcher should be used.

For example, this:

```ruby
describe passwd.uids(0) do
  its('users') { should cmp 'root' }
end
```

is preferred over:

```ruby
describe passwd.uids(0) do
  its('users') { should eq ['root'] }
end
```

See the [`cmp` matcher documentation](https://www.inspec.io/docs/reference/matchers/#cmp) for more examples.
