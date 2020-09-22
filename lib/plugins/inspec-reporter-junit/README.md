# junit and junit2 reporters

This is the implementation of the junit and junit2 XML reporters.

## To Install These Plugins

This plugin is included with InSpec. There is no need to install it separately.

## What These Plugins Do

`junit` is the legacy Chef InSpec JUnit reporter. It generates an XML report in Apache Ant JUnit format. The output format may be considered nonstandard in several ways. New users are advised to use `junit2`.

`junit2` is an updated reporter that provides JUnit output according to the schema published by [Windy Road](https://github.com/windyroad/JUnit-Schema).

## Implementation Note

This reporter uses the REXML XML generator, but uses the more heavyweight XML library Nokogiri for testing. This is to keep packaging requirements lightweight and free of compiled dependencies.
