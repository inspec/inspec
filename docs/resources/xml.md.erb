---
title: About the xml Resource
platform: os
---

# xml

Use the `xml` Chef InSpec audit resource to test data in an XML file.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.37.6 of InSpec.

## Syntax

An `xml` resource block declares the data to be tested. Assume the following XML file:

    <root>
      <name>hello</name>
      <meta>
        <creator>John Doe</creator>
      </meta>
      <array>
        <element>one</element>
        <element>two</element>
      </array>
      <array>
        <element value="one"></element>
        <element value="two"></element>
      </array>
    </root>

This file can be queried for elements using:

    describe xml('/path/to/name.xml') do
      its('root/name') { should eq ['hello'] }
      its('root/meta/creator') { should eq ['John Doe'] }
      its('root/array[2]/element') { should eq ['two'] }
    end

This file can be queried for attributes using:

    describe xml('/path/to/name.xml') do
      its('root/array[2]/element/@value') { should eq ['one', 'two'] }
      its('root/array[2]/element/attribute::value') { should eq ['one', 'two'] }
      its('root/array[2]/element[2]/attribute::value') { should eq ['two'] }
      its('count(//*)') { should eq [42] }
      its('boolean(root/array[2]/element[2]/@valid)') { should eq [false] }
    end

where

* `root/name` and `root/array[2]/element/@value` is an XPath expression
* `should eq ['foo']` tests a value of `root/name` as read from an XML file versus the value declared in the test

In the above example, you see the use of `@` and `attribute::` which are both methods of fetching attributes.

In the event the path contains an element which contains periods, the alternate syntax can be used:

    its(['root/name.with.a.period']) { should cmp 'so_many_dots' }

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test an AppPool's presence in an applicationHost.config file or the default site under applicationHost.sites

    describe xml('applicationHost.config') do
      # using the alternate syntax as described above because of the . in the key name
      its(['configuration/system.applicationHost/applicationPools/add@name']) { should contain('my_pool') }
    end

    describe xml('applicationHost.sites') do
      its('site[@name="Default Web Site"]/application/virtualDirectory/@path') { should eq ['/'] }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### name

The `name` matcher tests the value of `name` as read from a JSON file versus the value declared in the test:

    its('name') { should eq 'foo' }