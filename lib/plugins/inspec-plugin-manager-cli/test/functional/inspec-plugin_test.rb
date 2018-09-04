#=========================================================================================#
#                      `inspec plugin SUBCOMMAND` facility
#=========================================================================================#

# Should be able to install a gem-based plugin
# Should be able to list plugins when none installed
# Should be able to list plugins when some installed
# Train plugins should be included in the list
# Should be able to list core plugins as well
# Should be able to uninstall a gem plugin
# Uninstalling a nonexistant plugin is a code 2 error

# Should be able to install a path-based plugin
# Should be able to uninstall a path-based plugin

# Should be able to install a v1 (converted legacy) plugin
# Should be able to install a v2 CLI plugin
# Should be able to install a train plugin

# Should refuse to install gems that do not begin with train- or inspec-

# Should be able to install a plugin while pinning the version
# Should be able to upgrade a plugin

# Should be able to search for available plugins
# Should be able to search for plugins and assume the inspec- or train- prefixes.

# Should be able to suggest a train transport plugin when a gem search is successful
# Should raise an error if no train transport plugin exists