# Profile Evaluations and everything else around profile

In this document following topics will be covered:

- How profiles are initialised?
- How profiles are evaluated in different InSpec CLI commands?
- Why do we load profile context?
- How runner is using rspec and running profile tests?

## How profiles are initialised?

Profiles are initialised using `Profile.for_path` method which is called via `Profile.for_target` method which resolves the target and calls `Profile.for_fetcher` to fetch profile from a remote location using the fetcher object.
Finally `Profile.for_path` is called via `Profile.for_fetcher` method which creates a new instance of `Inspec::Profile` class for a given path by resolving the path.

This is how profile is initialised while using InSpec profiles in InSpec commands like exec, archive, check, export and json.

### Backtrace of the flow:

    #0  Inspec::Profile.initialize(source_reader#SourceReaders::InspecReader, options#Hash) at chef/inspec/lib/inspec/profile.rb:148
    ͱ-- #1  Class.new(*args) at chef/inspec/lib/inspec/profile.rb:64
    #2  #<Class:Inspec::Profile>.for_path(path#String, opts#Hash) at chef/inspec/lib/inspec/profile.rb:64
    #3  #<Class:Inspec::Profile>.for_fetcher(fetcher#Inspec::CachedFetcher, config#Hash) at chef/inspec/lib/inspec/profile.rb:71
    #4  #<Class:Inspec::Profile>.for_target(target#String, opts#Hash) at chef/inspec/lib/inspec/profile.rb:82

## How profiles are evaluated in different InSpec CLI commands?

1. `inspec exec`

Inspec exec calls runner run, which collect control control tests using Inspec::Profile.collect_tests by loading the control file and context via Inspec::ProfileContext.

### Flow of evaluation of control via Runner:

- Inspec::Runner.run starts with initiates the running process of inspec profile execution.
- Inspec::Runner.load loads necessary dependencies for the process and control tests by calling Inspec::Profile.collect_tests.
- Inspec::Profile.collect_tests gathers the control tests from the profile.
- Inspec::ProfileContext.load_control_file calls load_with_context to load control source in a context.
- Inspec::ProfileContext.load_with_context loads control source within profile context

### Backtrace of the flow:

    #0  Inspec::ProfileContext.load_with_context(context#Inspec::ControlEvalContext, content#String, source#String, line#NilClass) at chef/inspec/lib/inspec/profile_context.rb:164
    #1  Inspec::ProfileContext.load_control_file(*args#Array) at chef/inspec/lib/inspec/profile_context.rb:155
    #2  block in Inspec::Profile.block in collect_tests at chef/inspec/lib/inspec/profile.rb:253
    ͱ-- #3  Hash.each at chef/inspec/lib/inspec/profile.rb:247
    #4  Inspec::Profile.collect_tests at chef/inspec/lib/inspec/profile.rb:247
    #5  block in Inspec::DependencySet.block in each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:68
    ͱ-- #6  Hash.each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:67
    #7  Inspec::DependencySet.each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:67
    #8  Inspec::Profile.collect_tests at chef/inspec/lib/inspec/profile.rb:242
    #9  block in Inspec::Runner.block in load at chef/inspec/lib/inspec/runner.rb:126
    ͱ-- #10 Array.each at chef/inspec/lib/inspec/runner.rb:107
    #11 Inspec::Runner.load at chef/inspec/lib/inspec/runner.rb:107
    #12 Inspec::Runner.run(with#NilClass) at chef/inspec/lib/inspec/runner.rb:174
    #13 block in Inspec::InspecCLI.block in exec(*targets#Array) at chef/inspec/lib/inspec/cli.rb:391

2. `inspec check`

Inspec check command verifies the profile based on the metadata and params evaluated from the profile source code.
It uses the loaded parameters which are evaluated and loaded within profile context.

### Flow of evaluation of control in inspec check command

- Inspec::Profile.check starts with performing a check of an InSpec profile.
- Inspec::Profile.controls_count determines the count of controls in the profile, needed for check summary.
- Inspec::Profile.params returns metadata and other needed parameters of an InSpec profile.
- Inspec::Profile.load_params loads the parameters associated with the profile.
- Inspec::Profile.load_checks_params
- Inspec::Profile.collect_tests gathers the control tests from the profile.
- Inspec::ProfileContext.load_control_file calls load_with_context to load control source in a context.
- Inspec::ProfileContext.load_with_context loads control source within profile context.

### Backtrace of the flow:

    #0  Inspec::ProfileContext.load_with_context(context#Inspec::ControlEvalContext, content#String, source#String, line#NilClass) at chef/inspec/lib/inspec/profile_context.rb:164
    #1  Inspec::ProfileContext.load_control_file(*args#Array) at chef/inspec/lib/inspec/profile_context.rb:155
    #2  block in Inspec::Profile.block in collect_tests at chef/inspec/lib/inspec/profile.rb:253
    ͱ-- #3  Hash.each at chef/inspec/lib/inspec/profile.rb:247
    #4  Inspec::Profile.collect_tests at chef/inspec/lib/inspec/profile.rb:247
    #5  block in Inspec::DependencySet.block in each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:68
    ͱ-- #6  Hash.each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:67
    #7  Inspec::DependencySet.each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:67
    #8  Inspec::Profile.collect_tests at chef/inspec/lib/inspec/profile.rb:242
    #9  Inspec::Profile.load_checks_params(params#Hash) at chef/inspec/lib/inspec/profile.rb:880
    #10 Inspec::Profile.load_params at chef/inspec/lib/inspec/profile.rb:872
    #11 Inspec::Profile.params at chef/inspec/lib/inspec/profile.rb:235
    #12 Inspec::Profile.controls_count at chef/inspec/lib/inspec/profile.rb:699
    #13 Inspec::Profile.check at chef/inspec/lib/inspec/profile.rb:661
    #14 block in Inspec::InspecCLI.block in check(path#String) at chef/inspec/lib/inspec/cli.rb:184

3. `inspec export`

Inspec export command extracts our the information of a profile containing details of metadata of a profile and other parameters by evaluating the source code of the profile.
It uses the loaded parameters which are evaluated and loaded within profile context.

### Flow of evaluation of control in inspec export command

- Inspec::Profile.info starts with gathering information or metadata about the InSpec profile.
- Inspec::Profile.params returns metadata and other needed parameters of an InSpec profile.
- Inspec::Profile.load_params loads the parameters associated with the profile.
- Inspec::Profile.load_checks_params
- Inspec::Profile.collect_tests gathers the control tests from the profile.
- Inspec::ProfileContext.load_control_file calls load_with_context to load control source in a context.
- Inspec::ProfileContext.load_with_context loads control source within profile context.

### Backtrace of the flow:

    #0  Inspec::ProfileContext.load_with_context(context#Inspec::ControlEvalContext, content#String, source#String, line#NilClass) at chef/inspec/lib/inspec/profile_context.rb:164
    #1  Inspec::ProfileContext.load_control_file(*args#Array) at chef/inspec/lib/inspec/profile_context.rb:155
    #2  block in Inspec::Profile.block in collect_tests at chef/inspec/lib/inspec/profile.rb:253
    ͱ-- #3  Hash.each at chef/inspec/lib/inspec/profile.rb:247
    #4  Inspec::Profile.collect_tests at chef/inspec/lib/inspec/profile.rb:247
    #5  block in Inspec::DependencySet.block in each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:68
    ͱ-- #6  Hash.each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:67
    #7  Inspec::DependencySet.each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:67
    #8  Inspec::Profile.collect_tests at chef/inspec/lib/inspec/profile.rb:242
    #9  Inspec::Profile.load_checks_params(params#Hash) at chef/inspec/lib/inspec/profile.rb:880
    #10 Inspec::Profile.load_params at chef/inspec/lib/inspec/profile.rb:872
    #11 Inspec::Profile.params at chef/inspec/lib/inspec/profile.rb:235
    #12 Inspec::Profile.info(res#NilClass) at chef/inspec/lib/inspec/profile.rb:478
    #13 block in Inspec::InspecCLI.block in export(target#String, as_json#String) at chef/inspec/lib/inspec/cli.rb:139

4. `inspec archive`

Inspec archive command checks the profile first and then the archive operation is followed.

### Flow of evaluation of control in inspec archive command

- Inspec::Profile.check starts with performing a check of an InSpec profile.
- Inspec::Profile.controls_count determines the count of controls in the profile, needed for check summary.
- Inspec::Profile.params returns metadata and other needed parameters of an InSpec profile.
- Inspec::Profile.load_params loads the parameters associated with the profile.
- Inspec::Profile.load_checks_params
- Inspec::Profile.collect_tests gathers the control tests from the profile.
- Inspec::ProfileContext.load_control_file calls load_with_context to load control source in a context.
- Inspec::ProfileContext.load_with_context loads control source within profile context.

### Backtrace of the flow:

    #0  Inspec::ProfileContext.load_with_context(context#Inspec::ControlEvalContext, content#String, source#String, line#NilClass) at chef/inspec/lib/inspec/profile_context.rb:164
    #1  Inspec::ProfileContext.load_control_file(*args#Array) at chef/inspec/lib/inspec/profile_context.rb:155
    #2  block in Inspec::Profile.block in collect_tests at chef/inspec/lib/inspec/profile.rb:253
    ͱ-- #3  Hash.each at chef/inspec/lib/inspec/profile.rb:247
    #4  Inspec::Profile.collect_tests at chef/inspec/lib/inspec/profile.rb:247
    #5  block in Inspec::DependencySet.block in each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:68
    ͱ-- #6  Hash.each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:67
    #7  Inspec::DependencySet.each at chef/inspec/lib/inspec/dependencies/dependency_set.rb:67
    #8  Inspec::Profile.collect_tests at chef/inspec/lib/inspec/profile.rb:242
    #9  Inspec::Profile.load_checks_params(params#Hash) at chef/inspec/lib/inspec/profile.rb:880
    #10 Inspec::Profile.load_params at chef/inspec/lib/inspec/profile.rb:872
    #11 Inspec::Profile.params at chef/inspec/lib/inspec/profile.rb:235
    #12 Inspec::Profile.controls_count at chef/inspec/lib/inspec/profile.rb:699
    #13 Inspec::Profile.check at chef/inspec/lib/inspec/profile.rb:661
    #14 block in Inspec::InspecCLI.block in archive(path#String, log_level#NilClass) at chef/inspec/lib/inspec/cli.rb:291

## Why do we load profile context?

The reason why load_with_context is used is because it is called and used by the collect_tests method in the Inspec::Profile class to get control tests in a context. Because the collect_tests method is responsible for collecting all of the controls defined in the profile. After collecting all control tests, test_collector collects tests defined in each control to run with rspec.

The reason why we need to load controls is so that they can be executed as part of the InSpec profile.

## How runner is using rspec and running profile tests?

Inspec::Runner loads all the control tests via Inspec::Runner.load which is then run with Inspec::Runner.run_tests. And then the tests defined in each control is provided to test collector (RunnerRspec object) which runs the tests using Rspec.

### Backtrace of the flow:

    #0 Inspec::RunnerRspec.run(with#RSpec::Core::Runner) at /Users/nmathur/chef/inspec/lib/inspec/runner_rspec.rb:99
    #1  Inspec::Runner.run_tests(with#NilClass) at /Users/nmathur/chef/inspec/lib/inspec/runner.rb:219
    #2  Inspec::Runner.run(with#NilClass) at /Users/nmathur/chef/inspec/lib/inspec/runner.rb:175




