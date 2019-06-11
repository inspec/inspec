# This file has been moved to the v2.0 plugins. This redirect allows for legacy use.
# TODO: Remove in inspec 4.0

require "plugins/inspec-compliance/lib/inspec-compliance/configuration"

# Backport old namespace
Compliance = InspecPlugins::Compliance unless defined?(Compliance)
