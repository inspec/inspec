+++
title = "file resource"
draft = false
gh_repo = "inspec"
platform = "os"

[menu]
  [menu.inspec]
    title = "file"
    identifier = "inspec/resources/os/file.md file resource"
    parent = "inspec/resources/os"
+++

Use the `file` Chef InSpec audit resource to test system file types, including directories, symbolic links, named pipes, sockets, character devices, block devices, and doors.

## Availability

### Install

The Chef InSpec resource distributes this resource.

### Version

This resource is available from InSpec 1.0.0.

## Syntax

A `file` resource block declares the location of the file type to be tested, the expected file type (if required), and one or more resource properties.

```ruby
    describe file('path') do
      it { should PROPERTY 'value' }
    end
```

> where
>
> - `('path')` is the name of the file and the path to the file.
> - `PROPERTY` is a valid resource property for this resource.
> - `'value'` is the value to be tested.

## Properties

### General Properties

- `content`
- `content_as_json`
- `content_as_yaml`
- `size`
- `basename`
- `path`
- `owner`
- `group`
- `type`

### Unix/Linux Properties

- `symlink`
- `mode`
- `link_path`
- `shallow_link_path`
- `mtime`
- `size`
- `selinux_label`
- `md5sum`
- `sha256sum`
- `path`
- `source`
- `source_path`
- `uid`
- `gid`

### Windows Properties

- `file_version`
- `product_version`
- `user_permissions`

## Resource Property Examples

### content

The `content` property tests if contents in the file match the value specified in a regular expression. The values of the `content` property are arbitrary and depend on the file type tested and also the expected type of information to be present in that file.

```ruby
    its('content') { should match REGEX }
```

The following complete example tests the `pg_hba.conf` file in PostgreSQL for MD5 requirements. The tests look at all `host` and `local` settings in that file, and then compare the MD5 checksums against the values in the test:

```ruby
    describe file('/etc/postgresql/9.1/main/pg_hba.conf') do
      its('content') { should match(%r{local\s+.*?all\s+.*?all\s+.*?md5}) }
      its('content') { should match(%r{host\s+.*?all\s+.*?all\s+.*?127.0.0.1\/32\s+.*?md5}) }
      its('content') { should match(%r{host\s+.*?all\s+.*?all\s+.*?::1\/128\s+.*?md5}) }
    end
```

### content_as_json

The `content_as_json` property tests if contents in the specified json file matches the value specified in hash format. The value can be either key or key-value pair of the hash.

```ruby
    its('content_as_json') { should include('key') }
    its('content_as_json') { should include('key' => 'value') }
```

Assuming the file helloworld.json has the following content

```ruby
    {
      "name" : "InSpec",
      "technology" : {
        "language" : "Ruby"
      }
    }
```

The syntax to test for the content is as follows:

```ruby
    describe file('/home/helloworld.json') do
      its('content_as_json') { should include('name') }
      its('content_as_json') { should include('name' => 'InSpec') }
      its('content_as_json') { should include('technology' => { 'language' => 'Ruby' }) }
    end
```

### content_as_yaml

The `content_as_yaml` property tests if contents in the specified **YAML** file matches the value specified in **hash** format. The value can be either key of the hash or key-value pair of hash.

```ruby
    its('content_as_yaml') { should include('key') }
    its('content_as_yaml') { should include('key' => 'value') }
```

Assuming the file helloworld.yml has the following content

```ruby
    name: "InSpec"
    technology:
      language: "Ruby"
```

The syntax to test for the content is as follows:

```ruby
    describe file('/home/helloworld.yml') do
      its('content_as_yaml') { should include('name') }
      its('content_as_yaml') { should include('name' => 'InSpec') }
      its('content_as_yaml') { should include('technology' => { 'language' => 'Ruby' }) }
    end
```

### file_version

The `file_version` property tests if a Windows file's version matches the specified value. The difference between a file's, 'file version' and 'product version' is that the file version is the version number of the file itself, whereas the product version is the version number associated with the application from which that file originates:

```ruby
    its('file_version') { should eq '1.2.3' }
```

### group

The `group` property tests if the group to which a file belongs matches the specified value.

```ruby
    its('group') { should eq 'admins' }
```

The following examples show how to use this Chef InSpec audit resource.

### link_path

The `link_path` property tests if the file exists at the specified path. If the file is a symlink, the Chef InSpec resolves the symlink recursively and return the ultimate linked file.

```ruby
    its('link_path') { should eq '/some/path/to/file' }
```

### shallow_link_path

The `shallow_link_path` property returns the path that the file refers to, only resolving it once (that is, it performs a readlink operation). If the file is not a symlink, **nil** is returned.

```ruby
    its('shallow_link_path') { should eq '/some/path/to/file' }
```

### md5sum

The `md5sum` property tests if the MD5 checksum for a file matches the specified value.

```ruby
    its('md5sum') { should eq '3329x3hf9130gjs9jlasf2305mx91s4j' }
```

### mode

The `mode` property tests if the mode assigned to the file matches the specified value.

```ruby
    its('mode') { should cmp '0644' }
```

The Chef InSpec [octal](https://en.wikipedia.org/wiki/Leading_zero#0_as_a_prefix) values begin the numeric mode specification with zero.

For example, write:

```ruby
    { should cmp '0644' }
```

not

```ruby
    { should cmp '644' }
```

or write:

```ruby
    { should cmp '01775' }
```

not

```ruby
    { should cmp '1775' }
```

Without the zero prefix for the octal value, the Chef InSpec interprets it as the _decimal_ value 644, which is octal 1024 or `-----w-r-T`, and any test for a file that is `-rw-r--r--` will fail.

{{< note >}}
See the [`be_more_permissive_than(mode)`](<#be_more_permissive_than?(mode)>) matcher for upper and lower bounds on file mode.
{{< /note >}}

### mtime

The `mtime` property tests if the file modification time for the file matches the specified value. The mtime, where supported, is returned as the number of seconds since the epoch.

```ruby
    describe file('/') do
      its('mtime') { should <= Time.now.to_i }
      its('mtime') { should >= Time.now.to_i - 1000 }
    end
```

### owner

The `owner` property tests if the owner of the file matches the specified value.

```ruby
    its('owner') { should eq 'root' }
```

### product_version

The `product_version` property tests if a Windows file's product version matches the specified value. The difference between a file's 'file version' and 'product version' is that the file version is the version number of the file itself, whereas the product version is the version number associated with the application from which that file originates.

```ruby
    its('product_version') { should eq '2.3.4' }
```

### user_permissions

The `user_permissions` property returns a hash containing a list of users or groups and their file permissions on Windows. For example:

```ruby
    its('user_permissions') { should cmp { "NT AUTHORITY\\SYSTEM" => "FullControl", "NT AUTHORITY\\Authenticated Users" => "ReadAndExecute", "BUILTIN\\Administrators" => "FullControl" } }

    its('user_permissions') { should include "NT AUTHORITY\\SYSTEM"=>"FullControl" }
```

### selinux_label

The `selinux_label` property tests if the SELinux label for a file matches the specified value.

```ruby
    its('selinux_label') { should eq 'system_u:system_r:httpd_t:s0' }
```

### sha256sum

The `sha256sum` property tests if the SHA-256 checksum for a file matches the specified value.

```ruby
    its('sha256sum') { should eq 'b837ch38lh19bb8eaopl8jvxwd2e4g58jn9lkho1w3ed9jbkeicalplaad9k0pjn' }
```

### size

The `size` property tests if a file's size matches, is greater than, or is less than the specified value. For example, equal:

```ruby
    its('size') { should eq 32375 }
```

Greater than:

```ruby
    its('size') { should be > 64 }
```

Less than:

```ruby
    its('size') { should be < 10240 }
```

### type

The `type` property tests for the file type. The available types are:

`file`
: the object is a file

`directory`
: the object is a directory

`link`
: the object is a symbolic link

`pipe`
: the object is a named pipe

`socket`
: the object is a socket

`character_device`
: the object is a character device

`block_device`
: the object is a block device

`door`
: the object is a door device

The `type` method usually returns the type as a Ruby "symbol". We recommend using the `cmp` matcher to match either by symbol or string.

For example:

```ruby
    its('type') { should eq :file }
    its('type') { should cmp 'file' }
```

or,

```ruby
    its('type') { should eq :socket }
    its('type') { should cmp 'socket' }
```

### Test the contents of a file for MD5 requirements

```ruby
    describe file('/etc/postgresql/9.1/main/pg_hba.conf') do
      its('content') { should match /local\s+.*?all\s+.*?all\s+.*?md5/ }
      its('content') { should match %r{host\s+.*?all\s+.*?all\s+.*?127.0.0.1\/32\s+.*?md5} }
      its('content') { should match %r{host\s+.*?all\s+.*?all\s+.*?::1\/128\s+.*?md5} }
    end
```

### Test if a file exists

```ruby
    describe file('/tmp') do
      it { should exist }
    end
```

### Test that a file does not exist

```ruby
    describe file('/tmpest') do
      it { should_not exist }
    end
```

### Test if a path is a directory

```ruby
    describe file('/tmp') do
      its('type') { should eq :directory }
      it { should be_directory }
    end
```

### Test if a path is a file and not a directory

```ruby
    describe file('/proc/version') do
      its('type') { should cmp 'file' }
      it { should be_file }
      it { should_not be_directory }
    end
```

### Test if a file is a symbolic link

```ruby
    describe file('/dev/stdout') do
      its('type') { should cmp 'symlink' }
      it { should be_symlink }
      it { should_not be_file }
      it { should_not be_directory }
    end
```

### Test if a file is a character device

```ruby
    describe file('/dev/zero') do
      its('type') { should cmp 'character' }
      it { should be_character_device }
      it { should_not be_file }
      it { should_not be_directory }
    end
```

### Test if a file is a block device

```ruby
    describe file('/dev/zero') do
      its('type') { should cmp 'block' }
      it { should be_character_device }
      it { should_not be_file }
      it { should_not be_directory }
    end
```

### Test the mode for a file

```ruby
    describe file('/dev') do
     its('mode') { should cmp '00755' }
    end
```

### Test the owner of a file

```ruby
    describe file('/root') do
      its('owner') { should eq 'root' }
    end
```

### Test if a file is owned by the root user

```ruby
    describe file('/dev') do
      it { should be_owned_by 'root' }
    end
```

### Test the mtime for a file

```ruby
    describe file('/') do
      its('mtime') { should <= Time.now.to_i }
      its('mtime') { should >= Time.now.to_i - 1000 }
    end
```

### Test that a file's size is between 64 and 10240

```ruby
    describe file('/') do
      its('size') { should be > 64 }
      its('size') { should be < 10240 }
    end
```

### Test that a file's size is zero

```ruby
    describe file('/proc/cpuinfo') do
      its('size') { should be 0 }
    end
```

### Test an MD5 checksum

```ruby
    require 'digest'
    cpuinfo = file('/proc/cpuinfo').content

    md5sum = Digest::MD5.hexdigest(cpuinfo)

    describe file('/proc/cpuinfo') do
      its('md5sum') { should eq md5sum }
    end
```

### Test an SHA-256 checksum

```ruby
    require 'digest'
    cpuinfo = file('/proc/cpuinfo').content

    sha256sum = Digest::SHA256.hexdigest(cpuinfo)

    describe file('/proc/cpuinfo') do
      its('sha256sum') { should eq sha256sum }
    end
```

### Verify NTP

The following example shows how to use the `file` audit resource to verify if the `ntp.conf` and `leap-seconds` files are present, and then the `command` resource to verify if NTP is installed and running.

```ruby
    describe file('/etc/ntp.conf') do
      it { should be_file }
    end

    describe file('/etc/ntp.leapseconds') do
      it { should be_file }
    end

    describe command('pgrep ntp') do
      its('exit_status') { should eq 0 }
    end
```

### Test parameters of symlinked file

If you need to test the parameters of the target file for a symlink, you can use the `link_path` (recursive resolution) or `shallow_link_path` (direct link) method for the `file` resource.

For example, for the following symlink:

```ruby
    lrwxrwxrwx. 1 root root 11 03-10 17:56 /dev/virtio-ports/com.redhat.rhevm.vdsm -> ../vport2p1
```

You can write controls for both the link and the target.

```ruby
    describe file('/dev/virtio-ports/com.redhat.rhevm.vdsm') do
      it { should be_symlink }
    end

    virito_port_vdsm = file('/dev/virtio-ports/com.redhat.rhevm.vdsm').link_path
    describe file(virito_port_vdsm) do
      it { should exist }
      it { should be_character_device }
      it { should be_owned_by 'ovirtagent' }
      it { should be_grouped_into 'ovirtagent' }
    end
```

## Matchers

{{< readfile file="content/inspec/reusable/md/inspec_matchers_link.md" >}}

This resource has the following special matchers.

### be_allowed

The `be_allowed` matcher tests if the file contains a certain permission set, such as `execute` or `write` in Unix and [`full-control` or `modify` in Windows](https://www.codeproject.com/Reference/871338/AccessControl-FileSystemRights-Permissions-Table).

```ruby
    it { should be_allowed('read') }
```

Just like with `be_executable` and other permissions, you can check for the permission to the specific user or group.

```ruby
    it { should be_allowed('full-control', by_user: 'MyComputerName\Administrator') }
```

Or,

```ruby
    it { should be_allowed('write', by: 'root') }
```

### be_block_device

The `be_block_device` matcher tests if the file exists as a block device, such as `/dev/disk0` or `/dev/disk0s9`.

```ruby
    it { should be_block_device }
```

### be_character_device

The `be_character_device` matcher tests if the file exists as a character device (that corresponds to a block device), such as `/dev/rdisk0` or `/dev/rdisk0s9`.

```ruby
    it { should be_character_device }
```

### be_directory

The `be_directory` matcher tests if the file exists as a directory, such as `/etc/passwd`, `/etc/shadow`, or `/var/log/httpd`.

```ruby
    it { should be_directory }
```

### be_executable

The `be_executable` matcher tests if the file exists as an executable.

```ruby
    it { should be_executable }
```

The `be_executable` matcher may also test if the file is executable by a specific owner, group, or user. For example, a group.

```ruby
    it { should be_executable.by('group') }
```

an owner:

```ruby
    it { should be_executable.by('owner') }
```

any user other than the owner or members of the file's group:

```ruby
    it { should be_executable.by('others') }
```

a user:

```ruby
    it { should be_executable.by_user('user') }
```

### be_file

The `be_file` matcher tests if the file exists as a file. This can be useful with configuration files like `/etc/passwd` where there typically is not an associated file extension---`passwd.txt`.

```ruby
    it { should be_file }
```

### be_grouped_into

The `be_grouped_into` matcher tests if the file exists as part of the named group.

```ruby
    it { should be_grouped_into 'group' }
```

### be_linked_to

The `be_linked_to` matcher tests if the file is linked to the named target.

```ruby
    it { should be_linked_to '/etc/target-file' }
```

### be_owned_by

The `be_owned_by` matcher tests if the file is owned by the named user, such as `root`.

```ruby
    it { should be_owned_by 'root' }
```

### be_pipe

The `be_pipe` matcher tests if the file exists as first-in, first-out special file (`.fifo`) that is typically used to define a named pipe, such as `/var/log/nginx/access.log.fifo`.

```ruby
    it { should be_pipe }
```

### be_readable

The `be_readable` matcher tests if the file is readable.

```ruby
    it { should be_readable }
```

The `be_readable` matcher may also test if the file is readable by a specific owner, group, or user. For example, a group.

```ruby
    it { should be_readable.by('group') }
```

an owner:

```ruby
    it { should be_readable.by('owner') }
```

any user other than the owner or members of the file's group:

```ruby
    it { should be_readable.by('others') }
```

a user:

```ruby
    it { should be_readable.by_user('user') }
```

### be_setgid

The `be_setgid` matcher tests if the 'setgid' permission is set on the file or directory. On executable files, this causes the process to be started owned by the group that owns the file, rather than the primary group of the invocating user. This can result in escalation of privilege. On Linux, when setgid is set on directories, setgid causes newly created files and directories to be owned by the group that owns the setgid parent directory; additionally, newly created subdirectories will have the setgid bit set.

```ruby
    it { should be_setgid }
```

### be_socket

The `be_socket` matcher tests if the file exists as socket (`.sock`), such as `/var/run/php-fpm.sock`.

```ruby
    it { should be_socket }
```

### be_sticky

The `be_sticky` matcher tests if the 'sticky bit' permission is set on the directory. On directories, this restricts file deletion to the owner of the file, even if the permission of the parent directory would normally permit deletion by others. This is commonly used on /tmp filesystems.

```ruby
    it { should be_sticky }
```

### be_setuid

The `be_setuid` matcher tests if the 'setuid' permission is set on the file. On executable files, this causes the process to be started owned by the user that owns the file, rather than invocating user. This can result in escalation of privilege.

```ruby
    it { should be_setuid }
```

### be_symlink

The `be_symlink` matcher tests if the file exists as a symbolic, or soft link that contains an absolute or relative path reference to another file.

```ruby
    it { should be_symlink }
```

### be_version

The `be_version` matcher tests the version of the file.

```ruby
    it { should be_version '1.2.3' }
```

### be_writable

The `be_writable` matcher tests if the file is writable.

```ruby
    it { should be_writable }
```

The `be_writable` matcher may also test if the file is writable by a specific owner, group, or user. For example, a group.

```ruby
    it { should be_writable.by('group') }
```

an owner:

```ruby
    it { should be_writable.by('owner') }
```

any user other than the owner or members of the file's group.

```ruby
    it { should be_writable.by('others') }
```

a user:

```ruby
    it { should be_writable.by_user('user') }
```

### exist

The `exist` matcher tests if the named file exists.

```ruby
    it { should exist }
```

### have_mode

The `have_mode` matcher tests if a file has a mode assigned to it.

```ruby
    it { should have_mode }
```

### be_more_permissive_than(mode)

`be_more_permissive_than(mode)` takes the maximum desired mode - in `octal format` ('0644' or '0777') - of your file as a `String` and returns a `Boolean`. It returns `true` if your file has a mode with greater permissions than specified.

```ruby
    describe file('/etc/passwd') do
      it { should_not be_more_permissive_than('0644') }
      it { should be_more_permissive_than('0000') }
    end
```

### be_inherited

`be_inherited` is a boolean matcher which returns `true` if a file or folder has inheritance enabled, otherwise `false`. This matcher works on Windows systems only.

```ruby
    describe file('C://Example') do
      it { should be_inherited }
    end
```

### be_immutable

`be_immutable` is a boolean matcher which returns `true` if the specified file has the immutable flag set, otherwise `false`. This matcher is supported on UNIX systems only.

```ruby
    describe file("/home/example") do
      it { should be_readable }
      it { should be_immutable }
    end
```

### be_mounted

`be_mounted` is a boolean matcher which returns `true` if the specified directory is mounted on the system. Else `false`. In addition, to test the attributes of the mounted directory, use the `mount` resource.

```ruby
    describe file("/") do
      it { should be_mounted }
    end
```
