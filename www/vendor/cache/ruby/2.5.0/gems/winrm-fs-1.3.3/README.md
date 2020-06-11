# File system operations over Windows Remote Management (WinRM) for Ruby
[![Build Status](https://travis-ci.org/WinRb/winrm-fs.svg?branch=master)](https://travis-ci.org/WinRb/winrm-fs)
[![Gem Version](https://badge.fury.io/rb/winrm-fs.svg)](http://badge.fury.io/rb/winrm-fs)
[![Build status](https://ci.appveyor.com/api/projects/status/wm6apa8ojfhfmwsf?svg=true)](https://ci.appveyor.com/project/winrb/winrm-fs)

## Uploading files
Files may be copied from the local machine to the winrm endpoint. Individual files or directories, as well as arrays of files and directories may be specified. Data from a `StringIO` object may also be uploaded to a remote file.
```ruby
require 'winrm-fs'

connection = WinRM::Connection.new(...
file_manager = WinRM::FS::FileManager.new(connection)

# upload file.txt from the current working directory
file_manager.upload('file.txt', 'c:/file.txt')

# upload the my_dir directory to c:/foo/my_dir
file_manager.upload('/Users/sneal/my_dir', 'c:/foo/my_dir')

# upload from an in-memory buffer
file_manager.upload(StringIO.new('some data to upload'), 'c:/file.txt')

# upload multiple directories and a file to c:\programData
file_manager.upload([
  '/Users/sneal/foo1',
  '/Users/sneal/foo2'
  '/Users/sneal/fluffy.txt'
], '$env:ProgramData')
```

### Optimizing WinRM settings
Since winrm-fs 1.0/winrm 2.0, files are uploaded using the PSRP protocol and transfer speeds are dramatically improved from previous versions. This is largely due to the fact that the size of chunks that can be transferred at one time are now governed by the `MaxEnvelopeSizekb` winrm configuration setting on the endpoint. This default to 500 on Windows 2012 R2 and 150 on Windows 2008 R2. You may experience much faster transfer rates on 2008 R2 by increasing this setting.

### Handling progress events
If you want to implement your own custom progress handling, you can pass a code
block and use the proggress data that `upload` yields to this block:
```ruby
file_manager.upload('c:/dev/my_dir', '$env:AppData') do |bytes_copied, total_bytes, local_path, remote_path|
  puts "#{bytes_copied}bytes of #{total_bytes}bytes copied"
end
```

## Troubleshooting

If you're having trouble, first of all its most likely a network or WinRM configuration
issue. Take a look at the [WinRM gem troubleshooting](https://github.com/WinRb/WinRM#troubleshooting)
first.

## Contributing

1. Fork it.
2. Create a branch (git checkout -b my_feature_branch)
3. Run the unit and integration tests (bundle exec rake integration)
4. Commit your changes (git commit -am "Added a sweet feature")
5. Push to the branch (git push origin my_feature_branch)
6. Create a pull requst from your branch into master (Please be sure to provide enough detail for us to cipher what this change is doing)

### Running the tests

We use Bundler to manage dependencies during development.

```
$ bundle install
```

Once you have the dependencies, you can run the unit tests with `rake`:

```
$ bundle exec rake spec
```

To run the integration tests you will need a Windows box with the WinRM service properly configured. Its easiest to use the Vagrant Windows box in the Vagrantilfe of this repo.

1. Create a Windows VM with WinRM configured (see above).
2. Copy the config-example.yml to config.yml - edit this file with your WinRM connection details.
3. Run `bundle exec rake integration`

## WinRM-fs Authors
* Shawn Neal (https://github.com/sneal)
* Matt Wrock (https://github.com/mwrock)

[Contributors](https://github.com/WinRb/winrm-fs/graphs/contributors)
