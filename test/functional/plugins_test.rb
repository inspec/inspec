# Functional tests related to plugin facility

# Trying to load a corrupt plugins.json is a code 2 error
# Trying to load a plugins.json with a version other than 1 is a code 2 error

# should be able to use a CLI subcommand provided by a plugin
# should be able to use a CLI subcommand provided by a plugin when the userdir is in a custom location
# Should be able to install a gem-based plugin
# Should be able to list plugins when none installed
# Should be able to list plugins when some installed
# Should be able to uninstall a gem plugin
# Uninstalling a nonexistance plugin is a code 1 error
# Trying to run with a busted plugin is a code 2 error with no reporter but clean error on stderr
# Trying to run with a busted plugin and a --debug is a code 2 error with no reporter and trace on stderr
# Should be able to install a path-based plugin
# Should be able to uninstall a path-based plugin

# Should be able to install a legacy "versionless" plugin
# Should be able to install a v1 (converted legacy) plugin
# Should be able to install a v2 CLI plugin
# Should be able to install a v2 platform plugin

# Should refuse to install gems that do not begin with train- or inspec-

