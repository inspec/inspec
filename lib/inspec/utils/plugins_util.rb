
PLUGINS_CLI_COMMANDS = %w{plugin parallel license init habitat compliance automate sign}

PLUGIN_REPORTERS = %w{progress-bar junit junit2 json-min html2 child-status}

def list_core_plugin_cli_commands
  ### Logic to fetch list of plugin names - but not very useful at this point
  ### Requires logic to fetch cli command names defined within each plugin
  # core_plugins_dir = File.expand_path(File.join(File.dirname(__FILE__), "..", "..", "plugins"))
  # plugin_names = []
  # # Iterate through the plugins directory and collect plugin names
  # Dir.glob(File.join(core_plugins_dir, "inspec-*")).each do |plugin_dir|
  # 	plugin_names << File.basename(plugin_dir)
  # end
  # plugin_names
  #####

  PLUGINS_CLI_COMMANDS # TODO Implement more dynamic way of populating the cli commands list
end

def list_core_plugin_reporters
  PLUGIN_REPORTERS # TODO Implement more dynamic way of populating the reporters list
end