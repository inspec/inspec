# Change Log

<!-- latest_release -->
<!-- latest_release -->

<!-- release_rollup -->
<!-- release_rollup -->

## [v1.31.1](https://github.com/chef/inspec/tree/v1.31.1) (2017-07-06)
[Full Changelog](https://github.com/chef/inspec/compare/v1.31.0...v1.31.1)

**Fixed bugs:**

- host resource: fix netcat detection [\#1995](https://github.com/chef/inspec/pull/1995) ([adamleff](https://github.com/adamleff))

## [v1.31.0](https://github.com/chef/inspec/tree/v1.31.0) (2017-07-06)
[Full Changelog](https://github.com/chef/inspec/compare/v1.30.0...v1.31.0)

**Implemented enhancements:**

- Add support for ncat in host resource for CoreOS [\#1993](https://github.com/chef/inspec/pull/1993) ([adamleff](https://github.com/adamleff))
- New postgres\_hba\_conf resource [\#1964](https://github.com/chef/inspec/pull/1964) ([aaronlippold](https://github.com/aaronlippold))
- New postgres\_ident\_conf resource [\#1963](https://github.com/chef/inspec/pull/1963) ([aaronlippold](https://github.com/aaronlippold))

**Fixed bugs:**

- Fix formatter when two profiles have the same name [\#1991](https://github.com/chef/inspec/pull/1991) ([adamleff](https://github.com/adamleff))
- Fix host resolution on Darwin, use dig wherever possible [\#1986](https://github.com/chef/inspec/pull/1986) ([adamleff](https://github.com/adamleff))
- updated postgres\_session resource properly escape queries [\#1939](https://github.com/chef/inspec/pull/1939) ([aaronlippold](https://github.com/aaronlippold))

## [v1.30.0](https://github.com/chef/inspec/tree/v1.30.0) (2017-06-29)
[Full Changelog](https://github.com/chef/inspec/compare/v1.29.0...v1.30.0)

**Implemented enhancements:**

- Ensure docker resource works with docker 1.13+ [\#1966](https://github.com/chef/inspec/pull/1966) ([chris-rock](https://github.com/chris-rock))
- Add `rpm\_dbpath` support to the package resource [\#1960](https://github.com/chef/inspec/pull/1960) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Allow mysql resource to accept socket path [\#1933](https://github.com/chef/inspec/pull/1933) ([rshade](https://github.com/rshade))
- add nginx\_conf resource [\#1889](https://github.com/chef/inspec/pull/1889) ([arlimus](https://github.com/arlimus))
- oracle\_session and mssql\_session improvement [\#1857](https://github.com/chef/inspec/pull/1857) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- Fix socket handling in mysql resource [\#1971](https://github.com/chef/inspec/pull/1971) ([chris-rock](https://github.com/chris-rock))
- Fix typo in the version\_from\_dir method in postgres\_session resource [\#1962](https://github.com/chef/inspec/pull/1962) ([aaronlippold](https://github.com/aaronlippold))
- make postgres resource working in mock runner \(for inspec check\) [\#1961](https://github.com/chef/inspec/pull/1961) ([chris-rock](https://github.com/chris-rock))
- Fix directory resource output and exists check [\#1950](https://github.com/chef/inspec/pull/1950) ([adamleff](https://github.com/adamleff))
- Fix postgres\_conf ability to test parameters that have a dot in them [\#1938](https://github.com/chef/inspec/pull/1938) ([aaronlippold](https://github.com/aaronlippold))

## [v1.29.0](https://github.com/chef/inspec/tree/v1.29.0) (2017-06-22)
[Full Changelog](https://github.com/chef/inspec/compare/v1.28.1...v1.29.0)

**Fixed bugs:**

- Don't send HTTP headers that have nil values [\#1948](https://github.com/chef/inspec/pull/1948) ([adamleff](https://github.com/adamleff))
- small typo in the postgres resource with exist? function and assignment of data\_dir\_loc. [\#1937](https://github.com/chef/inspec/pull/1937) ([aaronlippold](https://github.com/aaronlippold))
- reject `nil` as a command input [\#1863](https://github.com/chef/inspec/pull/1863) ([arlimus](https://github.com/arlimus))

## [v1.28.1](https://github.com/chef/inspec/tree/v1.28.1) (2017-06-16)
[Full Changelog](https://github.com/chef/inspec/compare/v1.28.0...v1.28.1)

**Implemented enhancements:**

- Adding toml resource [\#1924](https://github.com/chef/inspec/pull/1924) ([nsdavidson](https://github.com/nsdavidson))

**Fixed bugs:**

- Update zlib to 1.2.11 to address known CVEs [\#1934](https://github.com/chef/inspec/issues/1934)

## [v1.28.0](https://github.com/chef/inspec/tree/v1.28.0) (2017-06-15)
[Full Changelog](https://github.com/chef/inspec/compare/v1.27.0...v1.28.0)

**Implemented enhancements:**

- Add support for CoreOS to the service resource [\#1928](https://github.com/chef/inspec/pull/1928) ([rarenerd](https://github.com/rarenerd))
- Host resource ping method should return stdout [\#1927](https://github.com/chef/inspec/pull/1927) ([justincmoy](https://github.com/justincmoy))
- Add TCP reachability support on Linux for host resource [\#1915](https://github.com/chef/inspec/pull/1915) ([adamleff](https://github.com/adamleff))
- Adds support for iis\_app InSpec testing [\#1905](https://github.com/chef/inspec/pull/1905) ([EasyAsABC123](https://github.com/EasyAsABC123))
- Add support for virtualization resource [\#1803](https://github.com/chef/inspec/pull/1803) ([tkak](https://github.com/tkak))

**Fixed bugs:**

- Error when listing compliance profiles against Automate pre 0.8 [\#1921](https://github.com/chef/inspec/issues/1921)
- Unexpected `nil` authentication with `inspec exec -t` and WinRM [\#1901](https://github.com/chef/inspec/issues/1901)
- inspec exec with --json-config option having multiple node information [\#1897](https://github.com/chef/inspec/issues/1897)
- describe package failing in newer version [\#1797](https://github.com/chef/inspec/issues/1797)
- Fix detection of Automate pre-0.8.x in Compliance::API [\#1922](https://github.com/chef/inspec/pull/1922) ([adamleff](https://github.com/adamleff))
- bugfix: reading tgz files with binread [\#1920](https://github.com/chef/inspec/pull/1920) ([arlimus](https://github.com/arlimus))
- fix intermitten functional vendor test failures [\#1919](https://github.com/chef/inspec/pull/1919) ([arlimus](https://github.com/arlimus))
- enforce option values where needed [\#1918](https://github.com/chef/inspec/pull/1918) ([arlimus](https://github.com/arlimus))
- inspec archive for tgz files on windows [\#1907](https://github.com/chef/inspec/pull/1907) ([arlimus](https://github.com/arlimus))
- reading binary profile data on windows [\#1906](https://github.com/chef/inspec/pull/1906) ([arlimus](https://github.com/arlimus))
- remove duplicate message in describe.one blocks [\#1896](https://github.com/chef/inspec/pull/1896) ([arlimus](https://github.com/arlimus))

## [v1.27.0](https://github.com/chef/inspec/tree/v1.27.0) (2017-06-06)
[Full Changelog](https://github.com/chef/inspec/compare/v1.26.0...v1.27.0)

**Implemented enhancements:**

- Support special cases for crontab resource [\#1893](https://github.com/chef/inspec/pull/1893) ([arlimus](https://github.com/arlimus))
- add the Nginx parser [\#1888](https://github.com/chef/inspec/pull/1888) ([arlimus](https://github.com/arlimus))
- support FIPS 140-2 compliant digest calls [\#1887](https://github.com/chef/inspec/pull/1887) ([arlimus](https://github.com/arlimus))
- Add windows support to the `processes` resource [\#1878](https://github.com/chef/inspec/pull/1878) ([username-is-already-taken2](https://github.com/username-is-already-taken2))
- add bitbucket repo url handling [\#1866](https://github.com/chef/inspec/pull/1866) ([stubblyhead](https://github.com/stubblyhead))
- Commenting the `contain\_duplicates` deprecation until we have a good alternative [\#1860](https://github.com/chef/inspec/pull/1860) ([alexpop](https://github.com/alexpop))
- verifies that inspec.yml uses licenses in SPDX format [\#1858](https://github.com/chef/inspec/pull/1858) ([chris-rock](https://github.com/chris-rock))
- funtion to get pgsql version, exposed version, cluster and fixed session [\#1758](https://github.com/chef/inspec/pull/1758) ([aaronlippold](https://github.com/aaronlippold))

**Fixed bugs:**

- Use RubyGems version for habitat plan [\#1883](https://github.com/chef/inspec/pull/1883) ([smith](https://github.com/smith))
- Fix version method call for refresh token [\#1875](https://github.com/chef/inspec/pull/1875) ([ndobson](https://github.com/ndobson))
- Add warningaction to test-netconnection [\#1869](https://github.com/chef/inspec/pull/1869) ([seththoenen](https://github.com/seththoenen))
- Fix parameters to `find` commands [\#1856](https://github.com/chef/inspec/pull/1856) ([chris-rock](https://github.com/chris-rock))
- Fix command exists check on Windows with full paths [\#1850](https://github.com/chef/inspec/pull/1850) ([username-is-already-taken2](https://github.com/username-is-already-taken2))
- Fix compliance uploads when version is not present [\#1849](https://github.com/chef/inspec/pull/1849) ([adamleff](https://github.com/adamleff))

## [v1.26.0](https://github.com/chef/inspec/tree/v1.26.0) (2017-05-31)
[Full Changelog](https://github.com/chef/inspec/compare/v1.25.1...v1.26.0)

**Implemented enhancements:**

- Bump default timeouts for `http` resource [\#1835](https://github.com/chef/inspec/pull/1835) ([schisamo](https://github.com/schisamo))
- Improvements to Habitat plan [\#1820](https://github.com/chef/inspec/pull/1820) ([smith](https://github.com/smith))

**Fixed bugs:**

- adjust localhost+sudo test output to train update [\#1873](https://github.com/chef/inspec/pull/1873) ([arlimus](https://github.com/arlimus))
- sudo-detection for target execution [\#1870](https://github.com/chef/inspec/pull/1870) ([arlimus](https://github.com/arlimus))
- bugfix: do not send nil to command on unsupported OS [\#1865](https://github.com/chef/inspec/pull/1865) ([arlimus](https://github.com/arlimus))
- bugfix: non-url servers with compliance login [\#1861](https://github.com/chef/inspec/pull/1861) ([arlimus](https://github.com/arlimus))
- Raise exception if profile target URL cannot be parsed [\#1853](https://github.com/chef/inspec/pull/1853) ([adamleff](https://github.com/adamleff))
- postgres relative path includes [\#1852](https://github.com/chef/inspec/pull/1852) ([aaronlippold](https://github.com/aaronlippold))
- Amended the processes resource to skip on windows [\#1851](https://github.com/chef/inspec/pull/1851) ([username-is-already-taken2](https://github.com/username-is-already-taken2))
- Fix assert that a gem is not installed [\#1844](https://github.com/chef/inspec/pull/1844) ([cattywampus](https://github.com/cattywampus))
- Habitat Profiles: redirect stderr to stdout [\#1826](https://github.com/chef/inspec/pull/1826) ([adamleff](https://github.com/adamleff))

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

## [v1.23.0](https://github.com/chef/inspec/tree/v1.23.0) (2017-05-04)
[Full Changelog](https://github.com/chef/inspec/compare/v1.22.0...v1.23.0)

**Implemented enhancements:**

- Add command-line completions for fish shell [\#1760](https://github.com/chef/inspec/pull/1760) ([smith](https://github.com/smith))

**Merged pull requests:**

- rake: lint before test [\#1755](https://github.com/chef/inspec/pull/1755) ([arlimus](https://github.com/arlimus))

## [v1.22.0](https://github.com/chef/inspec/tree/v1.22.0) (2017-04-27)
[Full Changelog](https://github.com/chef/inspec/compare/v1.21.0...v1.22.0)

## [v1.21.0](https://github.com/chef/inspec/tree/v1.21.0) (2017-04-24)
[Full Changelog](https://github.com/chef/inspec/compare/v1.20.0...v1.21.0)
