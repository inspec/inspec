# Test Fixtures Area

In this directory, you would place things that you need during testing.  For example, if you were making a plugin that counts the number of controls in a profile, you might have a directory tree like this:

```
  fixtures/
    profiles/
      zero-controls/
        inspec.yml
        controls/
      twelve-controls/
        inspec.yml
        controls/
          nine.rb
          three.rb
```

When writing your functional tests, you can point InSpec at the various test fixture profiles, and know that when it points at the zero-controls profile, it should find no controls; and when pointed at the twelve-controls profile, it should find 12.

## Using test fixtures provided with the `inspec` source code

InSpec itself ships with many test fixtures - not just profiles, but attribute files, configuration directories, and more.  Examine them at [the fixtures directory](https://github.com/inspec/inspec/tree/master/test/fixtures)

To use them, see the helper.rb file included in the example at test/helper.rb .
