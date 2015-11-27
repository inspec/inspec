# Custom InSpec resources

You can easily create your own resources. Here is a custom resource for an
application called Gordon. It is saved as `gordon_config.rb`.

```ruby
require 'yaml'

class GordonConfig < Inspec.resource(1)
  name 'gordon_config'

  def initialize
    @path = '/etc/gordon/config.yaml'
    @config = inspec.file(@path).content
    @params = YAML.load(@config)
  end

  def method_missing(name)
    @params[name.to_s]
  end
end
```

Include this file in your `test.rb`:

```ruby
require_relative 'gordon_config'
```

Now you can start using your new resource:

```ruby
describe gordon_config do
  its('version') { should eq('1.0') }
end
```


## Run inspec

inspec exec custom_resource/test.rb
..

Finished in 0.05616 seconds (files took 0.18182 seconds to load)
2 examples, 0 failures
