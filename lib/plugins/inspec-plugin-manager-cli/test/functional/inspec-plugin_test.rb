#=========================================================================================#
#                      `inspec plugin SUBCOMMAND` facility
#=========================================================================================#

#-----------------------------------------------------------------------------------------#
#                                   inspec help
#-----------------------------------------------------------------------------------------#

# inspec help subcommand listing

#-----------------------------------------------------------------------------------------#
#                                 inspec plugin list
#-----------------------------------------------------------------------------------------#

# plugin help list
# plugin list when empty
# plugin list when a gem and a path are installed
# plugin list -a with gem and path

#-----------------------------------------------------------------------------------------#
#                               inspec plugin search
#-----------------------------------------------------------------------------------------#
# plugin search help
# plugin search inspec-test-fixture
# plugin search inspec-test-
# plugin search -e inspec-test-
# plugin search -a inspec-test-fixture
# plugin search test-fixture
# plugin search train-test-fixture
# plugin search inspec-test-fixture-nonesuch

#-----------------------------------------------------------------------------------------#
#                               inspec plugin install
#-----------------------------------------------------------------------------------------#
# plugin install help
# plugin install from path
# plugin install from gemfile
# plugin install from gem when gem exists, get latest version
# plugin install train plugin
# Should refuse to install gems that do not begin with train- or inspec-
# plugin install with pinned version
# plugin install nonesuch
# plugin install already installed same version
# plugin install already installed need update

#-----------------------------------------------------------------------------------------#
#                               inspec plugin update
#-----------------------------------------------------------------------------------------#
# plugin update help
# plugin update
# plugin update already current
# plugin update when not installed
# plugin update nonesuch

#-----------------------------------------------------------------------------------------#
#                               inspec plugin uninstall
#-----------------------------------------------------------------------------------------#
# plugin uninstall help
# plugin uninstall gem-based
# plugin uninstall path-based
# plugin uninstall when not installed

