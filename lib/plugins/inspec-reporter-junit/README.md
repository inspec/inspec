# junit and junit2 reporters

This is the implementation of the junit and junit2 XML reporters.

## Installation

This plugin ships with Chef InSpec and requires no additional installation.

## What These Plugins Do

`junit` is the legacy Chef InSpec JUnit reporter, which is retained for backwards compatibility. It generates an XML report in Apache Ant JUnit format. The output format is considered nonstandard in several ways. New users are advised to use `junit2`.

`junit2` is an updated reporter that provides JUnit output according to the schema published by [Windy Road](https://github.com/windyroad/JUnit-Schema).

## Implementation Note

This reporter uses the REXML XML generator at runtime, but uses Nokogiri, a more heavyweight XML library, for testing. This design keeps packaging requirements lightweight and free of compiled dependencies.
