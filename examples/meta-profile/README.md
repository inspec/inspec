# meta-profile

The inspec.yml file in this profile shows how one can use dependencies
from non-local sources such as Git or an HTTP url. This feature can
be used to build up a environment-wide profile that is based on more
specific profiles managed by others.

InSpec supports multiple profile locations:

```
depends:
  # defaults to supermarket
  - name: hardening/ssh-hardening  
  # remote tar or zip file
  - name: os-hardening
    url: https://github.com/dev-sec/tests-os-hardening/archive/master.zip
  # git
  - git: https://github.com/dev-sec/ssl-baseline.git
  - name: windows-patch-benchmark
    git: https://github.com/chris-rock/windows-patch-benchmark.git
  # Chef Compliance
  - name: linux
    compliance: base/linux
```

You could use those dependencies in your `exmaple.rb`:

```

include_controls 'hardening/ssh-hardening'
include_controls 'os-hardening'
include_controls 'ssl-baseline'
include_controls 'linux'
include_controls 'windows-patch-benchmark'
```

Further details are described in our [InSpec Docs](https://www.inspec.io/docs/reference/profiles/)
