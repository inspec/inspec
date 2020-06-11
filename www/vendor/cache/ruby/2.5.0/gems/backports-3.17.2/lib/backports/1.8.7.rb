# require this file to load all the backports of Ruby 1.8.7
require "backports/tools/require_relative_dir"
require "backports/tools/deprecation"

Backports.frown_upon :require_version,
  'Requiring backports/<ruby version> is not recommended in production. Require just the needed backports instead.'

Backports.warned[:require_std_lib] = true
require "backports/std_lib"

Backports.require_relative_dir
