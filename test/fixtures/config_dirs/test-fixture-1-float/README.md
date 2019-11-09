This test fixture is a user config dir setup as though the inspec-test-fixture v1 was already installed, and it has no version constraint.

This was accomplished by executing (*without* bundler) the following commands:

```bash
mkdir -p test/fixtures/config_dirs/test-fixture-1-float/gems/{2.3.0,2.4.0,2.5.0}
# Here I'm running a ruby 2.4.x binary with rbenv
gem install -l -N -i test/fixtures/config_dirs/test-fixture-1-float/gems/2.4.0 test/fixtures/plugins/inspec-test-fixture/pkg/inspec-test-fixture-0.1.0.gem
```

Note that we will need to add an installation tree each time we support a new minor or major version of the Ruby VM.
