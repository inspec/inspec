#---------------------------------------------------------------------#
# Plugin Loading
#---------------------------------------------------------------------#
require "inspec/plugin/v2"

begin
  # Load v2 plugins.  Manually check for plugin disablement.
  omit_core = ARGV.delete("--disable-core-plugins")
  omit_user = ARGV.delete("--disable-user-plugins")
  v2_loader = Inspec::Plugin::V2::Loader.new(omit_core_plugins: omit_core, omit_user_plugins: omit_user)
  v2_loader.load_all
  v2_loader.exit_on_load_error
  v2_loader.activate_mentioned_cli_plugins

  # Load v1 plugins on startup
  ctl = Inspec::PluginCtl.new
  ctl.list.each { |x| ctl.load(x) }

  # load v1 CLI plugins before the InSpec CLI has been started
  Inspec::Plugins::CLI.subcommands.each do |_subcommand, params|
    Inspec::InspecCLI.register(
      params[:klass],
      params[:subcommand_name],
      params[:usage],
      params[:description],
      params[:options]
    )
  end
rescue Inspec::Plugin::V2::Exception => v2ex
  Inspec::Log.error v2ex.message

  if ARGV.include?("--debug")
    Inspec::Log.error v2ex.class.name
    Inspec::Log.error v2ex.backtrace.join("\n")
  else
    Inspec::Log.error "Run again with --debug for a stacktrace."
  end
  exit Inspec::UI::EXIT_PLUGIN_ERROR
end
