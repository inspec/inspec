# What happens when a profile file is loaded

## Consult with Harry Tuttle

[He's not from Central Services or anything.](https://youtu.be/VRfoIyx8KfU?t=2m41s)

## Tips

* In the early days of Chef InSpec / ServerSpec, controls were called "rules".  Throughout various places in the code, the word "rule" is used to mean "control".  Make the mental substitution.
* Chef InSpec supports reading profiles from tarballs, local files, git repos, etc.  So, don't count on local file reading; instead it uses a special source reader to obtain the contents of the files.

## A profile context is created

Profile context gets instantiated as soon as the Profile gets created.

    0  Inspec::ProfileContext.initialize(profile_id#String, backend#Inspec::Backend, conf#Hash) at inspec/lib/inspec/profile_context.rb:20
    ͱ-- #1  Class.new(*args) at inspec/lib/inspec/profile_context.rb:13
    #2  #<Class:Inspec::ProfileContext>.for_profile(profile#Inspec::Profile, backend#Inspec::Backend) at inspec/lib/inspec/profile_context.rb:13
    #3  Inspec::Profile.initialize(source_reader#SourceReaders::InspecReader, options#Hash) at inspec/lib/inspec/profile.rb:149
    ͱ-- #4  Class.new(*args) at inspec/lib/inspec/profile.rb:61
    #5  #<Class:Inspec::Profile>.for_path(path#String, opts#Hash) at inspec/lib/inspec/profile.rb:61
    #6  #<Class:Inspec::Profile>.for_fetcher(fetcher#Inspec::CachedFetcher, config#Hash) at inspec/lib/inspec/profile.rb:68
    #7  #<Class:Inspec::Profile>.for_target(target#String, opts#Hash) at inspec/lib/inspec/profile.rb:74
    #8  Inspec::Runner.add_target(target#String, _opts#Array) at inspec/lib/inspec/runner.rb:198
    #9  block in Inspec::InspecCLI.block in exec(*targets#Array) at inspec/lib/inspec/cli.rb:283
    ͱ-- #10 Array.each at inspec/lib/inspec/cli.rb:283
    #11 Inspec::InspecCLI.exec(*targets#Array) at inspec/lib/inspec/cli.rb:283


When run method of the runner gets called, it loads control [file](https://github.com/inspec/inspec/blob/master/lib/inspec/profile_context.rb#L151) which instantiates the control_eval_context object [here](https://github.com/inspec/inspec/blob/master/lib/inspec/profile_context.rb#L61) and creates dsl, and the adds profile_context as dsl class methods [here](https://github.com/inspec/inspec/blob/master/lib/inspec/profile_context.rb#L243)

    #0  Inspec::ProfileContext::DomainSpecificLunacy::ClassMethods.add_methods(profile_context#Inspec::ProfileContext) at /inspec/lib/inspec/profile_context.rb:242
    #1  block in #<Class:Inspec::ProfileContext::DomainSpecificLunacy>.block in create_dsl(profile_context#Inspec::ProfileContext) at /inspec/lib/inspec/profile_context.rb:220
    ͱ-- #2  Module.initialize at inspec/lib/inspec/profile_context.rb:218
    ͱ-- #3  Class.new(*args) at inspec/lib/inspec/profile_context.rb:218
    #4  #<Class:Inspec::ProfileContext::DomainSpecificLunacy>.create_dsl(profile_context#Inspec::ProfileContext) at inspec/lib/inspec/profile_context.rb:218
    #5  Inspec::ProfileContext.to_resources_dsl at inspec/lib/inspec/profile_context.rb:56
    #6  Inspec::ProfileContext.control_eval_context at inspec/lib/inspec/profile_context.rb:63
    #7  Inspec::ProfileContext.load_control_file(*args#Array) at inspec/lib/inspec/profile_context.rb:154
    #8  block in Inspec::Profile.block in collect_tests(include_list#Array) at inspec/lib/inspec/profile.rb:222
    ͱ-- #9  Hash.each at inspec/lib/inspec/profile.rb:216
    #10 Inspec::Profile.collect_tests(include_list#Array) at inspec/lib/inspec/profile.rb:216
    #11 block in Inspec::Runner.block in load at inspec/lib/inspec/runner.rb:119
    ͱ-- #12 Array.each at inspec/lib/inspec/runner.rb:101
    #13 Inspec::Runner.load at inspec/lib/inspec/runner.rb:101
    #14 Inspec::Runner.run(with#NilClass) at inspec/lib/inspec/runner.rb:135
    #15 Inspec::InspecCLI.exec(*targets#Array) at inspec/lib/inspec/cli.rb:286

## Each file's contents are instance eval'd against the control_eval_context

### DSL methods are executed at this time

So, if you have a control file with `title` in it, that will call the title method that was defined [here](https://github.com/inspec/inspec/blob/master/lib/inspec/control_eval_context.rb#L46).  Importantly, this also includes the `control` DSL keyword, and also the `describe` keyword (used for bare describes).

### Each control get registered as rule.

Each control gets registerd and the terminology switches from `control` to `rule` [here](https://github.com/inspec/inspec/blob/master/lib/inspec/control_eval_context.rb#L57)

The control context class also gets extended with the resource DSL, so anything in the source code for the control can use the resource DSL.  This includes all resource names, but importantly, the `describe` DSL keyword.

Finally, Inspec::Rule provides the control DSL - impact, title, desc, ref, and tags.

### The block is instance_eval'd against the control context class

See `https://github.com/inspec/inspec/blob/master/lib/inspec/rule.rb#L46`.  We're now in two levels of instance eval'ing - the file is gradually being eval'd against the profile context and the current control's block is being instance eval'd against a control context.

At this stage, control-level metadata (impact, title, refs, tags, desc) are evaluated and set as instance vars on the control.

Any "loose" ruby in the control is also executed at this point.

And, the describe and describe.one blocks are executed.

### TODO: describe blocks are *not* instance-evaled

### The control is registered with the profile

Using the method register_control (dynamically defined on the control eval context), we check for various skip conditions.  If none of them apply, the control is then registered with the profile context using register_rule.

[ProfileContext.register_rule's](https://github.com/inspec/inspec/blob/master/lib/inspec/profile_context.rb#L183) main job is to determine the full ID of the control (within the context of the profile) and either add it to the controls list, or (if another control with the same ID exists), merge it.  (This is where overriding happens).

Note: can skip a control with:
Inspec::Rule.set_skip_rule(control, msg)

## What else?
