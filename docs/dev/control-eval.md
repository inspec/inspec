# What happens when a profile file is loaded

## Consult with Harry Tuttle

[He's not from Central Services or anything.](https://youtu.be/VRfoIyx8KfU?t=2m41s)

## Tips

* In the early days of Chef InSpec / ServerSpec, controls were called "rules".  Throughout various places in the code, the word "rule" is used to mean "control".  Make the mental subsitution.
* Chef InSpec supports reading profiles from tarballs, local files, git repos, etc.  So, don't count on local file reading; instead it uses a special source reader to obtain the contents of the files.

## The basics of the stack

    #5  Inspec::Profile.collect_tests(include_list#Array) at lib/inspec/profile.rb:167
    #4  Hash.each at lib/inspec/profile.rb:167
    #3  block in Inspec::Profile.block in collect_tests(include_list#Array) at lib/inspec/profile.rb:170
    #2  Inspec::ProfileContext.load_control_file(*args#Array) at lib/inspec/profile_context.rb:141
    #1  Inspec::ProfileContext.control_eval_context at lib/inspec/profile_context.rb:58
    #0  #<Class:Inspec::ControlEvalContext>.create(profile_context#Inspec::ProfileContext, resources_dsl#Module) at lib/inspec/control_eval_context.rb:41

## A profile context is created

Like many things in Chef InSpec core, a profile context is an anonymous class. (verify)

Additionally, a control_eval_context is created.  It is an instance of an anonymous class; it has a class<->relationship with its profile context.  See `lib/inspec/control_eval_context.rb`.

## Each file's contents are instance eval'd against the control_eval_context

### DSL methods are executed at this time

So, if you have a control file with `title` in it, that will call the title method that was defined at `lib/inspec/control_eval_context.rb:60`.  Importantly, this also includes the `control` DSL keyword, and also the `describe` keyword (used for bare describes).

### Each control and their block are wrapped in an anonymous class

The anonymous class generator is located at `lib/inspec/control_eval_context.rb:24`.  At this point, the terminology switches from `control` to `rule`.  Each context class inherits from Inspec::Rule, which provides the constructor.

The control context class also gets extended with the resource DSL, so anything in the source code for the control can use the resource DSL.  This includes all resource names, but importantly, the `describe` DSL keyword.

Finally, Inspec::Rule provides the control DSL - impact, title, desc, ref, and tags.

### The block is instance_eval'd against the control context class

See `lib/inspec/rule.rb:50`.  We're now in two levels of instance eval'ing - the file is gradually being eval'd against the profile context anonymous class, and the current control's block is being instance eval'd against a control context anonymous class.

At this stage, control-level metadata (impact, title, refs, tags, desc) are evaluated and set as instance vars on the control.

Any "loose" ruby in the control is also executed at this point.

And, the describe and describe.one blocks are executed.

### TODO: describe blocks are *not* instance-evaled

### The control is registered with the profile

Using the method register_control (dynamically defined on the control eval context), we check for various skip conditions.  If none of them apply, the control is then registered with the profile context using register_rule.

ProfileContext.register_rule's main job is to determine the full ID of the control (within the context of the profile) and either add it to the controls list, or (if another control with the same ID exists), merge it.  (This is where overriding happens).

Note: can skip a control with:
Inspec::Rule.set_skip_rule(control, msg)

## What else?