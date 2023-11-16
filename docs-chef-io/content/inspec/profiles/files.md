+++
title = "Profile Files"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Files"
    identifier = "inspec/profiles/files"
    parent = "inspec/profiles"
    weight = 50
+++

A Chef InSpec profile may contain additional files that can be accessed during tests.
A profile file enables you to separate the logic of your tests from the data your tests check for.
For example, the list of ports you require to be open.

## Files location

Add files to the `files` directory at the root of a profile.

```text
examples/profile
├── controls
│   ├── example.rb
│── files
│   └── services.yml
└── inspec.yml
```

## Access file

Use `inspec.profile.file('FILENAME.yml')` to access data from the file.

## Example

With `files/services.yml` containing the following data:

```yaml
- service_name: httpd-alpha
  port: 80
- service_name: httpd-beta
  port: 8080
```

The tests in `example.rb` can now access this file:

```ruby
my_services = yaml(content: inspec.profile.file('services.yml')).params

my_services.each do |s|
  describe service(s['service_name']) do
    it { should be_running }
  end

  describe port(s['port']) do
    it { should be_listening }
  end
end
```
