require 'inspec/resource'

module InspecPlugins::<%= module_name %>
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
    # register the top-level subcommand.  That is to say, subcommand_desc
    # makes `inspec <%= command_name_dashes %> ...` work.  Args to sub_command_desc are
    # a usage message, and a short decription.
    # These will appear when someone has installed the plugin, and then they
    # run `inspec help`.
    # Note: if you want your command (or subcommand) to have dashes in it,
    # use underscores where you want a dash, and Thor will convert them.
    # Thor will fail to find a command that is directly named with dashes.
    subcommand_desc '<%= command_name_snake %> [COMMAND]', 'Your Usage Message Here'

    # The usual rhythm for a Thor CLI file is description, options, command method.
    # Thor just has you call DSL methods in sequence prior to each command.

    # Let's make a command, 'do_something'. This will then be available
    # as `inspec <%= command_name_dashes %> do-something
    # (Change this method name to be something sensible for your plugin.)

    # First, provide a usage / description. This will appear
    # in `inspec help <%= command_name_dashes %>`.
    # As this is a usage message, you should write the command as it should appear
    # to the user (if you want it to have dashes, use dashes)
    desc 'do-something WHAT [OPTIONS]', 'Does something'

    # Let's include an option, -s, to summarize
    # Refer to the Thors docs; there is a lot you can do here.
    option :summary, desc: 'Include a total at the bottom', \
                     type: :boolean, default: true, aliases: [:s]

    # OK, now the actual method itself.  If you provide params, you're telling Thor that
    # you accept CLI arguments after all options have been consumed.
    # Note again that the method name has an underscore, but when invoked
    # on the CLI, use a dash.
    def do_something(what = 'nothing')
      # The code here will *only* be executed if someone actually
      # runs `inspec <%= command_name_dashes %> do-something`.

      # `what` will be the command line arg
      # `options` will be a hash of CLI option values

      # Talk to the user using the `ui` object (see Inspec::UI)
      # ui.error('Whoops!')

      ui.warning('This is a generated plugin with a default implementation.  Edit lib/<%= plugin_name %>/cli_command.rb to make it do what you want.')
      ui.exit(:success) # or :usage_error
    end
  end
end
