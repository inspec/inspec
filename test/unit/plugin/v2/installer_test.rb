#-----------------------------------------------------------------------#
# basics
#-----------------------------------------------------------------------#

# it should know its gem path
# it should be able to list gems present in the gem path
# it should be able to list plugins in the gem path

#-----------------------------------------------------------------------#
# Installing
#-----------------------------------------------------------------------#

# it should raise an exception when trying to install a gem-plugin that does not exist
# installing a gem with dependencies should result in the deps being installed under the config dir
# Should be able to install a gem-based plugin
# Installing a gem places it under the config dir gem area
# Should be able to install a v2 CLI plugin
# Should be able to install a v2 platform plugin
# Should be able to install a path-based plugin
# Should refuse to install gems that do not begin with train- or inspec-
# Should be able to install a plugin while pinning the version

#-----------------------------------------------------------------------#
# Upgrading
#-----------------------------------------------------------------------#

# it should be able to update a plugin

#-----------------------------------------------------------------------#
# Removing
#-----------------------------------------------------------------------#

# Should be able to uninstall a gem plugin
# Should be able to uninstall a path-based plugin
# Uninstalling a nonexistant plugin is a code 2 error

#-----------------------------------------------------------------------#
# Searching
#-----------------------------------------------------------------------#

# Should be able to search for available plugins
# Should be able to search for plugins and assume the inspec- or train- prefixes.
# Should be able to suggest a train transport plugin when a gem search is successful
# Should raise an error if no train transport plugin exists