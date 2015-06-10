# vulcanosec cli

CLI tool for vulcanosec.

## Development

You can get a console within your evaluation context. Example:

```ruby
rule "sth-new" do
  binding.pry
  ...
end
```

Once you run `vulcano check myprofile/` you will get a CLI context.

Copyright 2015 Dominik Richter. All rights reserved.
