# junit reporter

This is the implementation of the junit XML reporter.

## To Install This Plugin

This plugin is included with inspec. There is no need to install it separately.

## What This Plugin Does

This reporter generates an XML report in Apache Ant JUnit format.

## Implementation Note

This reporter uses the REXML XML generator, but may use more advanced XML systems for testing. This is to keep packaging requirements for CHef InSpec lightweight and free of compiled dependencies.
