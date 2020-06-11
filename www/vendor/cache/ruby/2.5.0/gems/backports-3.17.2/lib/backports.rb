require "backports/version"

require "backports/tools/deprecation"
Backports.deprecate :require_version,
                    "Doing `require 'backports'` is deprecated and will not load any backport in the next major release.\n" \
                    "Require just the needed backports instead, or 'backports/latest'."
require "backports/2.4"
Backports.warned[:rails] = true
require "backports/rails"
