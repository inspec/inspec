require 'inspec/resource'

module InspecPlugins::ResourceLister
  # This class will provide the actual CLI implementation.
  # Its superclass is provided by another call to Inspec.plugin,
  # this time with two args.  The first arg specifies we are requesting
  # version 2 of the Plugins API.  The second says we are making a CLI
  # Command plugin component, so please make available any DSL needed
  # for that.
  #  In fact, aside from a some housekeeping DSL methods, most of the
  # DSL provided is that of Thor. Inspec.plugin(2, :cli_command)
  # promises to return a class that is a subclass of Thor.  So, to add
  # commands, usage information, and options, use the Thor documentation.
  class CliCommand < Inspec.plugin(2, :cli_command)
    # This isn't provided by Thor, but is needed by InSpec so that it can
    # register the subcommand.  Args are a usage message, and a short decription.
    # These will appear when someone has installed the plugin, and then they
    # run `inspec help`.
    subcommand_desc 'list-resources [COMMAND]', 'List resources that InSpec finds.'

    # The usual rhythm for a Thor CLI file is description, options, command method.
    # Thor just has you call DSL methods in sequence prior to each command.
    # Let's make a command, 'core', that lists all of the resources included with InSpec.

    # First, provide a usage / description. This will appear in `inspec help list-resources`.
    desc 'core [OPTIONS]', 'List resources that are included with InSpec.'

    # Let's include an option, -s, to summarize the list.
    # Refer to the Thors docs; there is a lot you can do here.
    option :summary, desc: 'Include a total at the bottom', \
                     type: :boolean, default: true, aliases: [:s]

    # OK, now the actual method itself.  If you provide params, you're telling Thor that
    # you accept CLI arguments after all options have been consumed. Let's accept a
    # pattern, assumed to be a wildcard substring. If we provide a default, the CLI arg becomes optional.
    def core(pattern = /.+/)
      # The code here will *only* be executed if someone actually runs
      # `inspec list-resources core`.  So, we can lazily wait to load
      # expensive things here. However, InSpec has in fact already
      # loaded the Resources, so we don't have anything to load.

      # If we were passed a CLI arg, wrap the arg in Regexp matchers so
      # we will match anywhere in the name.
      unless pattern == /.+/
        pattern = Regexp.new('.*' + pattern + '.*')
      end

      # This gets a bit into InSpec innards; but this is simply a Hash.
      registry = Inspec::Resource.default_registry
      resource_names = registry.keys.grep(pattern).sort

      # One day we'll have nice UI support.
      resource_names.each { |name| puts name }

      if options[:summary]
        puts '-' * 30
        puts "#{resource_names.count} resources total"
      end
    end

    # A neat idea for future work would be to add another command, perhaps
    # 'resource-pack', which examines a possibly remote resource pack and
    # enumerates the resources it defines.

    # Another idea might be to fetch a profile, and list the resources actually
    # used in the controls of the profile, along with counts.
  end
end
