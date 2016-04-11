=====================================================
Using |ruby| in InSpec
=====================================================

The |inspec| DSL is a |ruby| DSL for writing audit controls, which includes audit resources that you can invoke.
Core and custom resources are written as regular |ruby| classes which inherit from `Inspec.resource`.

Execution
=====================================================

It's important to understand that |ruby| code used in custom resources and controls DSL is executed on the system that runs |inspec|. This allows |inspec| to work without |ruby| and rubygems being required on the target(node or container).

For example, parsing a |csv| file like this to check the content:

.. code-block:: ruby

    require 'CSV'
    control 'check-interns-group' do
      impact 0.8
      title 'Ensure interns are assigned to the correct group'
      CSV.foreach("/mnt/share/interns.csv") do |row|
        describe user(raw[3]) do
          its('group') { should eq 'interns' }
        end
      end
    end

requires file `/mnt/share/interns.csv` to exist on the system running |inspec|.

The |ruby| code can be slightly changed in order to parse the |csv| content from the remote target. This is accomplished using the |inspec| file resource that retrieves the content of the file from the target.

.. code-block:: ruby

    require 'CSV'
    control 'check-interns-group' do
      impact 0.8
      title 'Ensure interns are assigned to the correct group'
      csv_content = file('/root/scan-reports/cis-cat.csv').content
      CSV.parse(csv_content) do |row|
        describe user(row[3]) do
          its('group') { should eq 'interns' }
        end
      end
    end

Similarly, using ```ls``` or ``system('ls')`` will result in the `ls` command being run locally and not on the target system.
In order to process the output of `ls` executed on the target system, use `inspec.command('ls')` or `inspec.powershell('ls')`

You can also use |ruby| variables and logic to instantiate an |inspec| resource once. For example, run a command and use the content in multiple tests:

.. code-block:: ruby

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
        puts "*** testing '#{path.strip}'"
        describe directory(path.strip) do
          it { should_not be_writable.by('group') }
          it { should_not be_writable.by('other') }
        end
      end
    end


Interactive Debugging with Pry
-----------------------------------------------------

An **advanced** but very useful |ruby| tip. In the previous example, I commented out the `require 'pry'; binding.pry;` line. If you remove the `#` and run the control, the execution will stop at that line and give you a `pry` shell. From this `pry` shell, you can print variables, see methods available, etc. For the above example:

.. code-block:: ruby

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

You can use `pry` inside both the controls DSL and resources.
Similarly, for dev and test, you can use `inspec shell` which is based on `pry`, for example:

.. code-block:: ruby

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
      its(:stdout) { should match /bin/ }
      its('stderr') { should eq '' }
      its(:exit_status) { should eq 0 }
    end

.. |inspec| replace:: InSpec
.. |inspec resource| replace:: InSpec Resource
.. |chef compliance| replace:: Chef Compliance
.. |ruby| replace:: Ruby
.. |csv| replace:: CSV
.. |windows| replace:: Microsoft Windows
.. |postgresql| replace:: PostgreSQL
.. |apache| replace:: Apache
