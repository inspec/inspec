This test fixture is a user config dir setup as though the inspec-test-fixture v0.2.0 was already installed, and it has no version constraint.

This is interesting because (unlike 0.1.0) v0.2.0 has a gem dependency.

This was accomplished by executing (*without* bundler) the following commands:

```bash
mkdir -p test/unit/mock/config_dirs/test-fixture-2-float/gems/{2.3.0,2.4.0,2.5.0}
# Here I'm running a ruby 2.4.x binary with rbenv
gem install -N -i test/unit/mock/config_dirs/test-fixture-2-float/gems/2.4.0 test/unit/mock/plugins/inspec-test-fixture/pkg/inspec-test-fixture-0.2.0.gem
```

Note that we will need to add an installation tree each time we support a new minor or major version of the Ruby VM.