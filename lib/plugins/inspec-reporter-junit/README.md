# junit and junit2 reporters

This is the implementation of the junit and junit2 XML reporter.

## To Install This Plugin

This plugin is included with inspec. There is no need to install it separately.

## What This Plugin Does

This reporter generates an XML report in Apache Ant JUnit format.

'junit' is the legacy Chef InSpec JUnit reporter. It generates nonstandard JUNit XML in several ways. New users are advised to use junit2.

'junit2' is an updated reporter that attempts to match the JUnit "standard", such as it isn't, more closely. It validates against the schema published by [Windy Road](https://github.com/windyroad/JUnit-Schema).

## Implementation Note

This reporter uses the REXML XML generator, but may use more advanced XML systems for testing. This is to keep packaging requirements for Chef InSpec lightweight and free of compiled dependencies.
