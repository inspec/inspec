# Change Log

## [v1.26.0](https://github.com/chef/inspec/tree/v1.26.0) (2017-05-30)
[Full Changelog](https://github.com/chef/inspec/compare/v1.25.1...v1.26.0)

**Implemented enhancements:**

- Improvements to Habitat plan [\#1820](https://github.com/chef/inspec/pull/1820) ([smith](https://github.com/smith))

**Fixed bugs:**

- bugfix: adjust localhost+sudo test output to train update [\#1873](https://github.com/chef/inspec/pull/1873) ([arlimus](https://github.com/arlimus))
- bugfix: do not send nil to command on unsupported OS [\#1865](https://github.com/chef/inspec/pull/1865) ([arlimus](https://github.com/arlimus))
- bugfix: non-url servers with compliance login [\#1861](https://github.com/chef/inspec/pull/1861) ([arlimus](https://github.com/arlimus))
- Habitat Profiles: redirect stderr to stdout [\#1826](https://github.com/chef/inspec/pull/1826) ([adamleff](https://github.com/adamleff))

**Closed issues:**

- Using Automate - `compliance\_profile\_name': undefined method `\[\]' for nil:NilClass \(NoMethodError\) seeing 1.25.1 Inspec  [\#1848](https://github.com/chef/inspec/issues/1848)
- Missing filesystem size check for InSpec [\#1843](https://github.com/chef/inspec/issues/1843)

## [v1.25.1](https://github.com/chef/inspec/tree/v1.25.1) (2017-05-20)
[Full Changelog](https://github.com/chef/inspec/compare/v1.25.0...v1.25.1)

**Implemented enhancements:**

- throw an error during inspec check if the version is not correct [\#1832](https://github.com/chef/inspec/pull/1832) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- Fixing typo on method name [\#1841](https://github.com/chef/inspec/pull/1841) ([cheeseplus](https://github.com/cheeseplus))

## [v1.25.0](https://github.com/chef/inspec/tree/v1.25.0) (2017-05-17)
[Full Changelog](https://github.com/chef/inspec/compare/v1.24.0...v1.25.0)

**Implemented enhancements:**

- return version as json [\#1822](https://github.com/chef/inspec/pull/1822) ([chris-rock](https://github.com/chris-rock))
- support new automate compliance backend [\#1819](https://github.com/chef/inspec/pull/1819) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- read source code if profile is in tgz/zip [\#1816](https://github.com/chef/inspec/pull/1816) ([arlimus](https://github.com/arlimus))
- Update postgresql conf resource to accept include\_dir as a string as well as an array [\#1727](https://github.com/chef/inspec/pull/1727) ([elliott-davis](https://github.com/elliott-davis))

## [v1.24.0](https://github.com/chef/inspec/tree/v1.24.0) (2017-05-11)
[Full Changelog](https://github.com/chef/inspec/compare/v1.23.0...v1.24.0)

**Implemented enhancements:**

- minor ui fix [\#1807](https://github.com/chef/inspec/pull/1807) ([echohack](https://github.com/echohack))
- Add busybox-static to habitat plan so netstat works for port resource on linux [\#1805](https://github.com/chef/inspec/pull/1805) ([elliott-davis](https://github.com/elliott-davis))
- add sha256 checksum to json [\#1796](https://github.com/chef/inspec/pull/1796) ([arlimus](https://github.com/arlimus))
- add platform info to json formatter [\#1792](https://github.com/chef/inspec/pull/1792) ([arlimus](https://github.com/arlimus))
- Update hab exporter to use inspec in path over calling to hab sup [\#1791](https://github.com/chef/inspec/pull/1791) ([elliott-davis](https://github.com/elliott-davis))
- Add support for Windows auth in mssql\_resourcet [\#1786](https://github.com/chef/inspec/pull/1786) ([arlimus](https://github.com/arlimus))
- Allow mysql\_session to test databases on different hosts [\#1779](https://github.com/chef/inspec/pull/1779) ([aaronlippold](https://github.com/aaronlippold))
- Handle parse errors for attrs/secrets [\#1775](https://github.com/chef/inspec/pull/1775) ([adamleff](https://github.com/adamleff))
- Add an oracledb\_session resource [\#1751](https://github.com/chef/inspec/pull/1751) ([nsdavidson](https://github.com/nsdavidson))

## [v1.23.0](https://github.com/chef/inspec/tree/v1.23.0) (2017-05-04)
[Full Changelog](https://github.com/chef/inspec/compare/v1.22.0...v1.23.0)

**Implemented enhancements:**

- Add command-line completions for fish shell [\#1760](https://github.com/chef/inspec/pull/1760) ([smith](https://github.com/smith))
- Error and exit when using --sudo locally [\#1741](https://github.com/chef/inspec/pull/1741) ([adamleff](https://github.com/adamleff))

**Fixed bugs:**

- Make the --no-color flag work for inspec exec [\#1749](https://github.com/chef/inspec/pull/1749) ([adamleff](https://github.com/adamleff))
- Fix xinetd resource failing when file cannot be read [\#1746](https://github.com/chef/inspec/pull/1746) ([adamleff](https://github.com/adamleff))
- Habitat profile bug fixes and improvements [\#1735](https://github.com/chef/inspec/pull/1735) ([rhass](https://github.com/rhass))

**Merged pull requests:**

- rake: lint before test [\#1755](https://github.com/chef/inspec/pull/1755) ([arlimus](https://github.com/arlimus))
- rename old deprecations that were meant for 1.0 [\#1737](https://github.com/chef/inspec/pull/1737) ([arlimus](https://github.com/arlimus))
- add `inspec.profile.file\(...\)` for profile files [\#1720](https://github.com/chef/inspec/pull/1720) ([arlimus](https://github.com/arlimus))

## [v1.22.0](https://github.com/chef/inspec/tree/v1.22.0) (2017-04-27)
[Full Changelog](https://github.com/chef/inspec/compare/v1.21.0...v1.22.0)

**Implemented enhancements:**

- rename `parse\_config` options for clarity [\#1709](https://github.com/chef/inspec/issues/1709)
- rename SimpleConfig / parse\_config / parse\_config\_file options [\#1723](https://github.com/chef/inspec/pull/1723) ([arlimus](https://github.com/arlimus))
- Add matchers help to shell, clean up help output [\#1722](https://github.com/chef/inspec/pull/1722) ([adamleff](https://github.com/adamleff))
- provide `inspec.version` information [\#1719](https://github.com/chef/inspec/pull/1719) ([arlimus](https://github.com/arlimus))
- provide the `inspec` keyword [\#1718](https://github.com/chef/inspec/pull/1718) ([arlimus](https://github.com/arlimus))
- print and prettyprint the inspec backend class [\#1717](https://github.com/chef/inspec/pull/1717) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- pretty-print multiline control descriptions [\#1711](https://github.com/chef/inspec/pull/1711) ([arlimus](https://github.com/arlimus))
- bugfix: unindent description misbehaviors [\#1707](https://github.com/chef/inspec/pull/1707) ([arlimus](https://github.com/arlimus))

## [v1.21.0](https://github.com/chef/inspec/tree/v1.21.0) (2017-04-24)
[Full Changelog](https://github.com/chef/inspec/compare/v1.20.0...v1.21.0)



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*