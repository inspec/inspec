# What is backend in inspec?

Inspec::Backend class creates the train connection object. Train lets you talk to your local or remote operating systems and APIs with a unified interface.

It allows you to:

* execute commands via run_command
* interact with files via file
* identify the target operating system via os
* authenticate to API-based services and treat them like a platform

When inspec exec command is run with --target option it establishes the connection to that target using speficifed transport like ssh, winrm etc. By default it uses local transport if the --target is not provided. Backend class is responsible for creating this transprot and establish connection using train.

## Mock backend

Mock is used primarily for testing and debugging. This is used to create a dummy connection.
InSpec use Mock backend in unit testing environment and some places in code base where backend object is required but it does not require for any real time connection or execution of commands. For example inspec export, check, archive are some of the cli commands uses mock bockend as it required by profile object( https://github.com/inspec/inspec/blob/main/lib/inspec/config.rb#L187) else if not provided it creates the backend with local(https://github.com/inspec/inspec/blob/main/lib/inspec/config.rb#L187) transport which is not required for export, check and archive.

## Where from all Inspec::Backend.create(Inspec::Config.mock) gets called?

  > export
  > check
  > archive
  > in dsl.rb filter_included_controls
  > profile_vendor.rb in profile_opts

## What Inspec::Backend.create does?

It call unpack_train_credentials of config.rb which returns the hash containing backend, logger and few more details
example

```

{}:logger=>#<Logger:0x00000001124d6210 @level=1, @progname=nil, @default_formatter=#<Logger::Formatter:0x00000001124d6170 @datetime_format=nil>, @formatter=nil, @logdev=#<Logger::LogDevice:0x00000001124d6058 @shift_period_suffix=nil, @shift_size=nil, @shift_age=nil, @filename=nil, @dev=#<IO:<STDERR>>, @binmode=false, @mon_data=#<Monitor:0x00000001124d5fb8>, @mon_data_owner_object_id=19580>>, :backend=>"local"}
```

then it vaidates the backend
creats the train transport and train connection
it enables or disables caching for file and command for train connection. For mock backend the caching is always enabled.
It returns the Inspec:Backend object which wraps the trains connection object inside it.

## Which all classes requires backend information?

backend information is used in InSpec::Formatters::Base to get the backend target information like name, release, target_id(uuid of the target) and inserts that in the run_data (Ref: https://github.com/inspec/inspec/blob/main/lib/inspec/formatters/base.rb#L75)
REF: https://github.com/inspec/inspec/blob/main/lib/inspec/formatters/base.rb#L279
if  backend is nil?(https://github.com/inspec/inspec/blob/main/lib/inspec/formatters/base.rb#L282) in base formatter it return nil and show warning messages if there is train error (https://github.com/inspec/inspec/blob/main/lib/inspec/formatters/base.rb#L287)


# Why mock backend is used in export, check, vendor and archive?


# How the Mock backend plays with the Mock Loader / Test Unit system?


