# Change Log

## [0.34.1](https://github.com/chef/inspec/tree/0.34.1) (2016-09-13)
[Full Changelog](https://github.com/chef/inspec/compare/v0.34.0...0.34.1)

**Fixed bugs:**

- Force encoding in bin only [\#1062](https://github.com/chef/inspec/pull/1062) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- Fixup rubocop violation in www/ [\#1067](https://github.com/chef/inspec/pull/1067) ([stevendanna](https://github.com/stevendanna))
- add homepage skeleton [\#1063](https://github.com/chef/inspec/pull/1063) ([arlimus](https://github.com/arlimus))

## [v0.34.0](https://github.com/chef/inspec/tree/v0.34.0) (2016-09-12)
[Full Changelog](https://github.com/chef/inspec/compare/v0.33.2...v0.34.0)

**Implemented enhancements:**

- Vendor Github and Supermarket dependencies [\#959](https://github.com/chef/inspec/issues/959)
- use simple config for security policy resource [\#1044](https://github.com/chef/inspec/pull/1044) ([chris-rock](https://github.com/chris-rock))
- identify enabled/disabled accounts for windows [\#1039](https://github.com/chef/inspec/pull/1039) ([chris-rock](https://github.com/chris-rock))

**Closed issues:**

- Compliance should allow the ability to upload the unconverted SCAP profiles from the agencies. [\#1055](https://github.com/chef/inspec/issues/1055)
- Multiple matchers in a describe block display only a single line [\#1025](https://github.com/chef/inspec/issues/1025)
- Create all content for inspec homepage demo [\#1021](https://github.com/chef/inspec/issues/1021)
- User resource should use Filtertable [\#948](https://github.com/chef/inspec/issues/948)

**Merged pull requests:**

- rename example to meta-profile [\#1051](https://github.com/chef/inspec/pull/1051) ([chris-rock](https://github.com/chris-rock))
- fix webpack start script for tutorial [\#1050](https://github.com/chef/inspec/pull/1050) ([vjeffrey](https://github.com/vjeffrey))
- Add Inspec::Fetcher\#relative\_target for compatibility [\#1046](https://github.com/chef/inspec/pull/1046) ([stevendanna](https://github.com/stevendanna))
- Typo supermarket -\> compliance [\#1041](https://github.com/chef/inspec/pull/1041) ([stevendanna](https://github.com/stevendanna))
- Improve duplicate and cycle detection in resolver [\#1038](https://github.com/chef/inspec/pull/1038) ([stevendanna](https://github.com/stevendanna))
- Add example of corporate profile [\#1037](https://github.com/chef/inspec/pull/1037) ([stevendanna](https://github.com/stevendanna))
- Ensure simplecov starts before everything else [\#1036](https://github.com/chef/inspec/pull/1036) ([stevendanna](https://github.com/stevendanna))
- add sys\_info resource to get information about the hostname [\#1035](https://github.com/chef/inspec/pull/1035) ([chris-rock](https://github.com/chris-rock))
- Add GitFetcher and rework Fetchers+SourceReaders [\#1034](https://github.com/chef/inspec/pull/1034) ([stevendanna](https://github.com/stevendanna))
- add demo content [\#1033](https://github.com/chef/inspec/pull/1033) ([vjeffrey](https://github.com/vjeffrey))
- add health graphs [\#1032](https://github.com/chef/inspec/pull/1032) ([arlimus](https://github.com/arlimus))
- fix table formatting in readme [\#1031](https://github.com/chef/inspec/pull/1031) ([arlimus](https://github.com/arlimus))
- remove old delivery tests [\#1029](https://github.com/chef/inspec/pull/1029) ([arlimus](https://github.com/arlimus))
- make demo better [\#1015](https://github.com/chef/inspec/pull/1015) ([vjeffrey](https://github.com/vjeffrey))
- user resource should support filtertable [\#990](https://github.com/chef/inspec/pull/990) ([ksubrama](https://github.com/ksubrama))

## [v0.33.2](https://github.com/chef/inspec/tree/v0.33.2) (2016-09-07)
[Full Changelog](https://github.com/chef/inspec/compare/v0.33.1...v0.33.2)

**Implemented enhancements:**

- ssl resource fix and speed improvement [\#1027](https://github.com/chef/inspec/pull/1027) ([alexpop](https://github.com/alexpop))
- allow direct access to iis configuration parameters [\#1020](https://github.com/chef/inspec/pull/1020) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- ssl resource fix and speed improvement [\#1027](https://github.com/chef/inspec/pull/1027) ([alexpop](https://github.com/alexpop))

## [v0.33.1](https://github.com/chef/inspec/tree/v0.33.1) (2016-09-07)
[Full Changelog](https://github.com/chef/inspec/compare/v0.33.0...v0.33.1)

**Closed issues:**

- Research: determine mechanism for recording + playing back inspec [\#955](https://github.com/chef/inspec/issues/955)
- Create content for interactive inspec online demo [\#954](https://github.com/chef/inspec/issues/954)

**Merged pull requests:**

- Pass attributes from command line into profile context [\#1026](https://github.com/chef/inspec/pull/1026) ([stevendanna](https://github.com/stevendanna))
- Remove SourceReader::Inspec\#prepare\_load\_path [\#1023](https://github.com/chef/inspec/pull/1023) ([stevendanna](https://github.com/stevendanna))
- add demo yml contents [\#1022](https://github.com/chef/inspec/pull/1022) ([arlimus](https://github.com/arlimus))

## [v0.33.0](https://github.com/chef/inspec/tree/v0.33.0) (2016-09-05)
[Full Changelog](https://github.com/chef/inspec/compare/v0.32.0...v0.33.0)

**Implemented enhancements:**

- Introduce scoping to the ProfileContext which has a view of all of its dependencies  [\#958](https://github.com/chef/inspec/issues/958)
- Create Help for Subcommands [\#305](https://github.com/chef/inspec/issues/305)
- Allow service resource to accept Windows service name with spaces [\#1003](https://github.com/chef/inspec/pull/1003) ([martinheg](https://github.com/martinheg))

**Fixed bugs:**

- Error output not informative [\#1016](https://github.com/chef/inspec/issues/1016)
- Suse Linux Enterprise Server 11 SPX is failing for describe service resource. [\#997](https://github.com/chef/inspec/issues/997)
- Inspec Docker directory test fails [\#996](https://github.com/chef/inspec/issues/996)
- package\(\) 'version' {should match\(pattern\)} does not return failed control, but shows as failed test [\#898](https://github.com/chef/inspec/issues/898)
- Raise error when an invalid URI is received [\#1019](https://github.com/chef/inspec/pull/1019) ([alexpop](https://github.com/alexpop))
- Fix os exception in mysql resource [\#1012](https://github.com/chef/inspec/pull/1012) ([alexpop](https://github.com/alexpop))
- cmp not treating 0 as integer only as string [\#991](https://github.com/chef/inspec/pull/991) ([jeremymv2](https://github.com/jeremymv2))

**Closed issues:**

- apache\_conf resource seems to be using incorrect paths to amalgamate apache config \(only Centos/RHEL?\) [\#1013](https://github.com/chef/inspec/issues/1013)
- More options link in Readme.md doesn't work \(404\) - need updating? [\#1001](https://github.com/chef/inspec/issues/1001)
- Chef compliance breaks after updating inspec gem 0.32 [\#992](https://github.com/chef/inspec/issues/992)
- Improve CLI report [\#984](https://github.com/chef/inspec/issues/984)
- record inspec + in-browser playback for online demo [\#956](https://github.com/chef/inspec/issues/956)
- UX & UI design for the interactive HTML demo [\#953](https://github.com/chef/inspec/issues/953)

**Merged pull requests:**

- use winrm v2 [\#1018](https://github.com/chef/inspec/pull/1018) ([chris-rock](https://github.com/chris-rock))
- always display error message [\#1017](https://github.com/chef/inspec/pull/1017) ([chris-rock](https://github.com/chris-rock))
- Fix apache conf [\#1014](https://github.com/chef/inspec/pull/1014) ([jeremymv2](https://github.com/jeremymv2))
- fix cli inherited profiles [\#1008](https://github.com/chef/inspec/pull/1008) ([vjeffrey](https://github.com/vjeffrey))
- improve suse 11 support for service resource [\#1007](https://github.com/chef/inspec/pull/1007) ([chris-rock](https://github.com/chris-rock))
- Extend Inspec DSL docs [\#1006](https://github.com/chef/inspec/pull/1006) ([nvtkaszpir](https://github.com/nvtkaszpir))
- vj/fix cli report [\#1004](https://github.com/chef/inspec/pull/1004) ([vjeffrey](https://github.com/vjeffrey))
- fix cli link to docs [\#1002](https://github.com/chef/inspec/pull/1002) ([chris-rock](https://github.com/chris-rock))
- Promote cmp usage as it provides results with octal mode [\#999](https://github.com/chef/inspec/pull/999) ([alexpop](https://github.com/alexpop))
- Initial attempt at isolating resources between dependencies [\#994](https://github.com/chef/inspec/pull/994) ([stevendanna](https://github.com/stevendanna))
- inspec demo [\#989](https://github.com/chef/inspec/pull/989) ([vjeffrey](https://github.com/vjeffrey))
- Allow functional tests to pass on OSX [\#988](https://github.com/chef/inspec/pull/988) ([stevendanna](https://github.com/stevendanna))
- Minor refactor and explanatory comments [\#987](https://github.com/chef/inspec/pull/987) ([stevendanna](https://github.com/stevendanna))

## [v0.32.0](https://github.com/chef/inspec/tree/v0.32.0) (2016-08-26)
[Full Changelog](https://github.com/chef/inspec/compare/v0.31.0...v0.32.0)

**Implemented enhancements:**

- Provide SSL InSpec with full demo [\#903](https://github.com/chef/inspec/issues/903)
- improve package resource on windows [\#86](https://github.com/chef/inspec/issues/86)
- can check windows service startup mode now [\#968](https://github.com/chef/inspec/pull/968) ([Anirudh-Gupta](https://github.com/Anirudh-Gupta))
- Resolved an issue checking ports on windows [\#962](https://github.com/chef/inspec/pull/962) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- Grouping multiple `it` blocks in one `describe` blocks ruins console output during test runs [\#918](https://github.com/chef/inspec/issues/918)
- Windows default path format causes errors with inspec check [\#672](https://github.com/chef/inspec/issues/672)
- bugfix windows forward slashes handling [\#963](https://github.com/chef/inspec/pull/963) ([chris-rock](https://github.com/chris-rock))
- Fix command evaluation for inspec shell -c [\#943](https://github.com/chef/inspec/pull/943) ([ksubrama](https://github.com/ksubrama))

**Closed issues:**

- Support sid for user resource [\#960](https://github.com/chef/inspec/issues/960)
- Create and load Lockfiles for dependencies [\#950](https://github.com/chef/inspec/issues/950)
- Implement test cases for inspec shell [\#942](https://github.com/chef/inspec/issues/942)
- Transitive dependency loading [\#915](https://github.com/chef/inspec/issues/915)
- Document InSpec OR features [\#853](https://github.com/chef/inspec/issues/853)
- Document ini resource [\#848](https://github.com/chef/inspec/issues/848)
- Document special service resources [\#495](https://github.com/chef/inspec/issues/495)

**Merged pull requests:**

- Reformat service resource docs for discoverability [\#986](https://github.com/chef/inspec/pull/986) ([stevendanna](https://github.com/stevendanna))
- Generate documentation for the `vendor` command [\#985](https://github.com/chef/inspec/pull/985) ([stevendanna](https://github.com/stevendanna))
- suport for ruby 2.2.2 [\#983](https://github.com/chef/inspec/pull/983) ([chris-rock](https://github.com/chris-rock))
- Add windows user SID as 'UID' in user resource. Fix \#960 [\#982](https://github.com/chef/inspec/pull/982) ([ksubrama](https://github.com/ksubrama))
- document ini resource [\#981](https://github.com/chef/inspec/pull/981) ([vjeffrey](https://github.com/vjeffrey))
- Upgrade FFI to Ruby 2.3 issues on windows [\#980](https://github.com/chef/inspec/pull/980) ([ksubrama](https://github.com/ksubrama))
- move train connection out of loop for command\_simulator [\#979](https://github.com/chef/inspec/pull/979) ([vjeffrey](https://github.com/vjeffrey))
- Update port.rb Documentation [\#978](https://github.com/chef/inspec/pull/978) ([nvtkaszpir](https://github.com/nvtkaszpir))
- first pass at collecting command output for demo [\#977](https://github.com/chef/inspec/pull/977) ([vjeffrey](https://github.com/vjeffrey))
- Fix `rake` to work again [\#976](https://github.com/chef/inspec/pull/976) ([jkeiser](https://github.com/jkeiser))
- Fix `bundle install` on Ruby 2.1.9 [\#975](https://github.com/chef/inspec/pull/975) ([jkeiser](https://github.com/jkeiser))
- Initial control isolation support [\#973](https://github.com/chef/inspec/pull/973) ([stevendanna](https://github.com/stevendanna))
- Allow JSON 2.x [\#972](https://github.com/chef/inspec/pull/972) ([chris-rock](https://github.com/chris-rock))
- Add Ruby 2.3 to the test matrix, make it the primary test for most suites [\#971](https://github.com/chef/inspec/pull/971) ([jkeiser](https://github.com/jkeiser))
- Speed up windows package lookup [\#970](https://github.com/chef/inspec/pull/970) ([ksubrama](https://github.com/ksubrama))
- Expand relative paths based on profile location [\#965](https://github.com/chef/inspec/pull/965) ([stevendanna](https://github.com/stevendanna))
- restructure test suites in travis [\#964](https://github.com/chef/inspec/pull/964) ([chris-rock](https://github.com/chris-rock))
- Replace Molinillo-based resolver [\#961](https://github.com/chef/inspec/pull/961) ([stevendanna](https://github.com/stevendanna))
- Add prototype of inspec.lock [\#949](https://github.com/chef/inspec/pull/949) ([stevendanna](https://github.com/stevendanna))
- document OR feature [\#947](https://github.com/chef/inspec/pull/947) ([vjeffrey](https://github.com/vjeffrey))
- print controls, then tests; print header of describe, then individual test results [\#946](https://github.com/chef/inspec/pull/946) ([vjeffrey](https://github.com/vjeffrey))
- Add darwin helper [\#945](https://github.com/chef/inspec/pull/945) ([tas50](https://github.com/tas50))
- Update platforms in the docs to match the code [\#944](https://github.com/chef/inspec/pull/944) ([tas50](https://github.com/tas50))
- Add integration tests for file owner on windows [\#923](https://github.com/chef/inspec/pull/923) ([chris-rock](https://github.com/chris-rock))

## [v0.31.0](https://github.com/chef/inspec/tree/v0.31.0) (2016-08-19)
[Full Changelog](https://github.com/chef/inspec/compare/v0.30.0...v0.31.0)

**Implemented enhancements:**

- Support writing full tests in inspec shell [\#240](https://github.com/chef/inspec/issues/240)
- inspec shell documentation - Fix \#805 [\#925](https://github.com/chef/inspec/pull/925) ([ksubrama](https://github.com/ksubrama))
- Windows ports with pid and process name [\#912](https://github.com/chef/inspec/pull/912) ([alexpop](https://github.com/alexpop))
- Improve inspec shell by having it evaluate describe/control blocks. [\#909](https://github.com/chef/inspec/pull/909) ([ksubrama](https://github.com/ksubrama))

**Fixed bugs:**

- `inspec login help` help text inconsistent with `inspec` CLI usage [\#905](https://github.com/chef/inspec/issues/905)
- Subcommand help outputs incorrect usage line [\#895](https://github.com/chef/inspec/issues/895)
- `inspec compliance version` fails with stacktrace if no compliance URL is configured [\#894](https://github.com/chef/inspec/issues/894)
- `inspec` binary occasionally exits zero on SSH failures [\#840](https://github.com/chef/inspec/issues/840)
- inspec login fails [\#793](https://github.com/chef/inspec/issues/793)
- ssh\_config and sshd\_config matchers should be case-insensitive [\#759](https://github.com/chef/inspec/issues/759)
- Login succeeds but later commands fail [\#731](https://github.com/chef/inspec/issues/731)
- passwd resource does not ignore comments [\#725](https://github.com/chef/inspec/issues/725)
- remove tests and dev dependencies from released gem [\#924](https://github.com/chef/inspec/pull/924) ([arlimus](https://github.com/arlimus))
- update dependencies and loosen molinillo [\#917](https://github.com/chef/inspec/pull/917) ([arlimus](https://github.com/arlimus))
- Handle xinetd config with only one entry [\#846](https://github.com/chef/inspec/pull/846) ([chris-rock](https://github.com/chris-rock))

**Closed issues:**

- Document InSpec Shell [\#805](https://github.com/chef/inspec/issues/805)

**Merged pull requests:**

- fix functional test for compliance plugin [\#941](https://github.com/chef/inspec/pull/941) ([chris-rock](https://github.com/chris-rock))
- give accurate information for inspec compliance login --help [\#938](https://github.com/chef/inspec/pull/938) ([vjeffrey](https://github.com/vjeffrey))
- Document awesome where syntax for port [\#937](https://github.com/chef/inspec/pull/937) ([pburkholder](https://github.com/pburkholder))
- Fetch deps based on urls [\#935](https://github.com/chef/inspec/pull/935) ([stevendanna](https://github.com/stevendanna))
- Ease testing of compliance integration tests [\#934](https://github.com/chef/inspec/pull/934) ([chris-rock](https://github.com/chris-rock))
- restructure unit tests [\#933](https://github.com/chef/inspec/pull/933) ([chris-rock](https://github.com/chris-rock))
- return token stored message on login [\#932](https://github.com/chef/inspec/pull/932) ([vjeffrey](https://github.com/vjeffrey))
- fail gracefully on inspec compliance profiles when bad token is provided [\#930](https://github.com/chef/inspec/pull/930) ([vjeffrey](https://github.com/vjeffrey))
- Fix recursive deps for path-based deps [\#929](https://github.com/chef/inspec/pull/929) ([stevendanna](https://github.com/stevendanna))
- fix integration tests for Chef Compliance [\#928](https://github.com/chef/inspec/pull/928) ([chris-rock](https://github.com/chris-rock))
- Remove false username/passwd msg from inspec compliance login [\#927](https://github.com/chef/inspec/pull/927) ([vjeffrey](https://github.com/vjeffrey))
- inspec compliance version fails gracefully when no server config [\#926](https://github.com/chef/inspec/pull/926) ([vjeffrey](https://github.com/vjeffrey))
- add kitchen.yml for non-public kitchen boxes [\#922](https://github.com/chef/inspec/pull/922) ([chris-rock](https://github.com/chris-rock))
- Ignore comment lines in /etc/passwd [\#920](https://github.com/chef/inspec/pull/920) ([stevendanna](https://github.com/stevendanna))
- ssh\_config parse should be case insensitive [\#919](https://github.com/chef/inspec/pull/919) ([vjeffrey](https://github.com/vjeffrey))
- add ssl resource \(early access\) [\#914](https://github.com/chef/inspec/pull/914) ([arlimus](https://github.com/arlimus))
- Add iis\_site resource [\#907](https://github.com/chef/inspec/pull/907) ([chrisevett](https://github.com/chrisevett))

## [v0.30.0](https://github.com/chef/inspec/tree/v0.30.0) (2016-08-12)
[Full Changelog](https://github.com/chef/inspec/compare/v0.29.0...v0.30.0)

**Implemented enhancements:**

- introduce dependency resolution \(experimental\) [\#891](https://github.com/chef/inspec/pull/891) ([arlimus](https://github.com/arlimus))
- Improve windows support of omnibus installer [\#890](https://github.com/chef/inspec/pull/890) ([ksubrama](https://github.com/ksubrama))
- Add omnibus for inspec [\#658](https://github.com/chef/inspec/pull/658) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- RHEL postgres data dir is not /var/lib/postgres as coded [\#494](https://github.com/chef/inspec/issues/494)
- Add readline ignore markers to color escape codes in the shell [\#900](https://github.com/chef/inspec/pull/900) ([stevendanna](https://github.com/stevendanna))

**Closed issues:**

- `inspec exec` help option does not provide any context sensitive help [\#906](https://github.com/chef/inspec/issues/906)
- Add windows MSI packaging support to omnibus [\#889](https://github.com/chef/inspec/issues/889)
- tab-completion support in the inspec command line and in the inspec shell :\) [\#607](https://github.com/chef/inspec/issues/607)

**Merged pull requests:**

- auto-generate inspec cli docs [\#911](https://github.com/chef/inspec/pull/911) ([arlimus](https://github.com/arlimus))
- move test suites to allowed failures until travis is fixed [\#904](https://github.com/chef/inspec/pull/904) ([chris-rock](https://github.com/chris-rock))
- travis experiment: lower docker concurrency [\#902](https://github.com/chef/inspec/pull/902) ([stevendanna](https://github.com/stevendanna))
- Improve detection of postgresql conf dir and data dir [\#901](https://github.com/chef/inspec/pull/901) ([stevendanna](https://github.com/stevendanna))
- Add `inspec env` command to configure shell tab-completion [\#896](https://github.com/chef/inspec/pull/896) ([stevendanna](https://github.com/stevendanna))
- Support regular expressions for Windows registry key [\#892](https://github.com/chef/inspec/pull/892) ([chris-rock](https://github.com/chris-rock))
- add integration test for windows file and directory [\#880](https://github.com/chef/inspec/pull/880) ([chris-rock](https://github.com/chris-rock))

## [v0.29.0](https://github.com/chef/inspec/tree/v0.29.0) (2016-08-08)
[Full Changelog](https://github.com/chef/inspec/compare/v0.28.1...v0.29.0)

**Implemented enhancements:**

- port\(\) could convert string parameter to integer [\#867](https://github.com/chef/inspec/issues/867)
- InSpec output for summary needs to count controls [\#852](https://github.com/chef/inspec/issues/852)
- add params and content method to parse\_config [\#876](https://github.com/chef/inspec/pull/876) ([chris-rock](https://github.com/chris-rock))
- Activate centos, debian and oracle linux in our travis tests [\#869](https://github.com/chef/inspec/pull/869) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- 1.10.2 missing a space in failed test output [\#872](https://github.com/chef/inspec/issues/872)
- inspec fails to determine file\_version for a file on a windows 2012R2 [\#858](https://github.com/chef/inspec/issues/858)
- os\[:family\] returns "centos" rather than "redhat" on my Centos 7.2 box [\#847](https://github.com/chef/inspec/issues/847)
- Inspec exec output when multiple matchers are used [\#812](https://github.com/chef/inspec/issues/812)
- Inspec Detect Issues [\#772](https://github.com/chef/inspec/issues/772)
- systemd is-enabled check does not handle backcompat with sysv-init scripts \(e.g. ntp on Ubuntu 16.04\) [\#749](https://github.com/chef/inspec/issues/749)
- Update inspec for os\[:family\] change in Train [\#865](https://github.com/chef/inspec/pull/865) ([stevendanna](https://github.com/stevendanna))
- Use systemctl's helper command to determine enabled & active status [\#863](https://github.com/chef/inspec/pull/863) ([stevendanna](https://github.com/stevendanna))

**Closed issues:**

- bump train dependency [\#870](https://github.com/chef/inspec/issues/870)
- parse\_config error when searching for fs.suid\_dumpable [\#866](https://github.com/chef/inspec/issues/866)
- Improve integration tests [\#861](https://github.com/chef/inspec/issues/861)
- Adapt InSpec to work with latest train OS updates [\#855](https://github.com/chef/inspec/issues/855)

**Merged pull requests:**

- revert control\_summary field in output [\#887](https://github.com/chef/inspec/pull/887) ([arlimus](https://github.com/arlimus))
- Remove some platforms from travis config [\#883](https://github.com/chef/inspec/pull/883) ([stevendanna](https://github.com/stevendanna))
- Explicitly require docker transport to avoid autoload bug [\#882](https://github.com/chef/inspec/pull/882) ([stevendanna](https://github.com/stevendanna))
- Require train 0.16 [\#881](https://github.com/chef/inspec/pull/881) ([chris-rock](https://github.com/chris-rock))
- Generate test labels for multi-test controls [\#879](https://github.com/chef/inspec/pull/879) ([ksubrama](https://github.com/ksubrama))
- Allow port to be specified as a string [\#878](https://github.com/chef/inspec/pull/878) ([stevendanna](https://github.com/stevendanna))
- improve code style for parse\_config thanks @stevendanna [\#877](https://github.com/chef/inspec/pull/877) ([chris-rock](https://github.com/chris-rock))
- remote target supported OS also includes hp-ux [\#873](https://github.com/chef/inspec/pull/873) ([Anirudh-Gupta](https://github.com/Anirudh-Gupta))
- Be a bit louder when skipping an entire integration suite [\#864](https://github.com/chef/inspec/pull/864) ([stevendanna](https://github.com/stevendanna))
- Count controls in the summary output. Fix \#852 [\#860](https://github.com/chef/inspec/pull/860) ([vjeffrey](https://github.com/vjeffrey))

## [v0.28.1](https://github.com/chef/inspec/tree/v0.28.1) (2016-08-03)
[Full Changelog](https://github.com/chef/inspec/compare/v0.28.0...v0.28.1)

**Fixed bugs:**

- Read Chef attributes within the tests ? [\#813](https://github.com/chef/inspec/issues/813)
- Docs for command use eq instead of match [\#502](https://github.com/chef/inspec/issues/502)
- fix color code barriers [\#838](https://github.com/chef/inspec/pull/838) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- Document all supported Operating Systems [\#842](https://github.com/chef/inspec/issues/842)

**Merged pull requests:**

- Add supported OS list to readme [\#859](https://github.com/chef/inspec/pull/859) ([vjeffrey](https://github.com/vjeffrey))
- Update README with correct directions for integration tests [\#857](https://github.com/chef/inspec/pull/857) ([stevendanna](https://github.com/stevendanna))
- Only test PRs and pushes to master [\#856](https://github.com/chef/inspec/pull/856) ([stevendanna](https://github.com/stevendanna))
- Support either /dev/kcore or /dev/core in the tests [\#850](https://github.com/chef/inspec/pull/850) ([stevendanna](https://github.com/stevendanna))
- add air gap environment post from @jeremymv2 [\#841](https://github.com/chef/inspec/pull/841) ([chris-rock](https://github.com/chris-rock))
- move base\_cli to lib/inspec [\#832](https://github.com/chef/inspec/pull/832) ([arlimus](https://github.com/arlimus))

## [v0.28.0](https://github.com/chef/inspec/tree/v0.28.0) (2016-07-21)
[Full Changelog](https://github.com/chef/inspec/compare/v0.27.1...v0.28.0)

**Implemented enhancements:**

- add port resource for windows 2008 [\#837](https://github.com/chef/inspec/pull/837) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- prevent circular loading of resource library [\#831](https://github.com/chef/inspec/pull/831) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- Added two InSpec Tutorial blog posts [\#836](https://github.com/chef/inspec/pull/836) ([anniehedgpeth](https://github.com/anniehedgpeth))
- add mssql resource [\#835](https://github.com/chef/inspec/pull/835) ([chrisevett](https://github.com/chrisevett))

## [v0.27.1](https://github.com/chef/inspec/tree/v0.27.1) (2016-07-15)
[Full Changelog](https://github.com/chef/inspec/compare/v0.27.0...v0.27.1)

**Fixed bugs:**

- Inconsistent json format caused by inconsistent hash keys [\#827](https://github.com/chef/inspec/issues/827)

**Closed issues:**

- wrong path detection for postgres conf\_dir and conf\_path [\#823](https://github.com/chef/inspec/issues/823)

**Merged pull requests:**

- FIX: file\(hba\_config\_file\) test in documentation [\#830](https://github.com/chef/inspec/pull/830) ([atomic111](https://github.com/atomic111))
- Fix runner.rb key inconsistency [\#828](https://github.com/chef/inspec/pull/828) ([alexpop](https://github.com/alexpop))
- FIX \#823 wrong postgres path detection for conf\_dir and conf\_path [\#824](https://github.com/chef/inspec/pull/824) ([atomic111](https://github.com/atomic111))

## [v0.27.0](https://github.com/chef/inspec/tree/v0.27.0) (2016-07-11)
[Full Changelog](https://github.com/chef/inspec/compare/v0.26.0...v0.27.0)

**Implemented enhancements:**

- inspec report source\_location data type [\#807](https://github.com/chef/inspec/issues/807)
- Additional fields in inspec reports [\#806](https://github.com/chef/inspec/issues/806)
- api: report source location with field identifiers [\#808](https://github.com/chef/inspec/pull/808) ([arlimus](https://github.com/arlimus))
- add boolean support for cmp matcher [\#801](https://github.com/chef/inspec/pull/801) ([chris-rock](https://github.com/chris-rock))
- improve wmi resource [\#800](https://github.com/chef/inspec/pull/800) ([chris-rock](https://github.com/chris-rock))
- Update documentation for bundles [\#716](https://github.com/chef/inspec/pull/716) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- `os` resource not accessible within a `describe` [\#451](https://github.com/chef/inspec/issues/451)
- add suid sgid and sticky support for file resource [\#819](https://github.com/chef/inspec/pull/819) ([arlimus](https://github.com/arlimus))
- pin gem version for ffi due to appveyor failures [\#816](https://github.com/chef/inspec/pull/816) ([arlimus](https://github.com/arlimus))
- check service running by ActiveState [\#814](https://github.com/chef/inspec/pull/814) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- small fix for postgres\_session documentation \(Test for risky database entries example\) [\#815](https://github.com/chef/inspec/pull/815) ([atomic111](https://github.com/atomic111))
- Add array documentation to yaml / json resource [\#803](https://github.com/chef/inspec/pull/803) ([brentm5](https://github.com/brentm5))
- Updating ctl docs to include the init command [\#802](https://github.com/chef/inspec/pull/802) ([ChefRycar](https://github.com/ChefRycar))
- add documentation for bash resource [\#799](https://github.com/chef/inspec/pull/799) ([chris-rock](https://github.com/chris-rock))
- align inspec's check, detect, and exec cli formatters [\#797](https://github.com/chef/inspec/pull/797) ([arlimus](https://github.com/arlimus))

## [v0.26.0](https://github.com/chef/inspec/tree/v0.26.0) (2016-06-16)
[Full Changelog](https://github.com/chef/inspec/compare/v0.25.0...v0.26.0)

**Implemented enhancements:**

- use train instead of r-train [\#795](https://github.com/chef/inspec/pull/795) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- Transport error while trying to ssh to mac osx  [\#788](https://github.com/chef/inspec/issues/788)

**Closed issues:**

- Can't upload inherited profile [\#789](https://github.com/chef/inspec/issues/789)

**Merged pull requests:**

- provide target info in cli output [\#796](https://github.com/chef/inspec/pull/796) ([arlimus](https://github.com/arlimus))
- multi-profile reporting in cli formatter [\#794](https://github.com/chef/inspec/pull/794) ([arlimus](https://github.com/arlimus))
- use utf-8 characters for default cli formatter [\#792](https://github.com/chef/inspec/pull/792) ([arlimus](https://github.com/arlimus))
- integer?\("0300"\) should not be true [\#791](https://github.com/chef/inspec/pull/791) ([srenatus](https://github.com/srenatus))
- introduce cli report formatter [\#790](https://github.com/chef/inspec/pull/790) ([arlimus](https://github.com/arlimus))

## [v0.25.0](https://github.com/chef/inspec/tree/v0.25.0) (2016-06-14)
[Full Changelog](https://github.com/chef/inspec/compare/v0.24.0...v0.25.0)

**Closed issues:**

- Why mode matcher doesn't work on a file resource [\#781](https://github.com/chef/inspec/issues/781)

**Merged pull requests:**

- Update readme with Annie's Tutorial Day 5 [\#785](https://github.com/chef/inspec/pull/785) ([anniehedgpeth](https://github.com/anniehedgpeth))
- Feature: Implementation of RFC Attributes [\#723](https://github.com/chef/inspec/pull/723) ([chris-rock](https://github.com/chris-rock))

## [v0.24.0](https://github.com/chef/inspec/tree/v0.24.0) (2016-06-03)
[Full Changelog](https://github.com/chef/inspec/compare/v0.23...v0.24.0)

**Implemented enhancements:**

- support intra-libraries file referencing + loading [\#780](https://github.com/chef/inspec/pull/780) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- Update documentation for matching output of commands [\#777](https://github.com/chef/inspec/pull/777) ([tas50](https://github.com/tas50))

## [v0.23](https://github.com/chef/inspec/tree/v0.23) (2016-05-31)
[Full Changelog](https://github.com/chef/inspec/compare/v0.22.1...v0.23)

**Implemented enhancements:**

- connect `port` and filter table [\#776](https://github.com/chef/inspec/pull/776) ([arlimus](https://github.com/arlimus))
- add resource to filter table blocks [\#775](https://github.com/chef/inspec/pull/775) ([arlimus](https://github.com/arlimus))
- add helper methods for os resource [\#774](https://github.com/chef/inspec/pull/774) ([chris-rock](https://github.com/chris-rock))

**Closed issues:**

- inspec hangs on command\('ausearch -k docker'\).stdout [\#768](https://github.com/chef/inspec/issues/768)
- registry\_key test failing on Windows 2008 R2 [\#767](https://github.com/chef/inspec/issues/767)
- InSpec login successful with wrong username [\#766](https://github.com/chef/inspec/issues/766)

**Merged pull requests:**

- update readme with blogs [\#769](https://github.com/chef/inspec/pull/769) ([chris-rock](https://github.com/chris-rock))

## [v0.22.1](https://github.com/chef/inspec/tree/v0.22.1) (2016-05-18)
[Full Changelog](https://github.com/chef/inspec/compare/v0.22.0...v0.22.1)

**Fixed bugs:**

- fix reporter/formatter disagreements [\#764](https://github.com/chef/inspec/pull/764) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- port resource fails in docker containers because netstat is missing, but gives poor error output as to why. [\#762](https://github.com/chef/inspec/issues/762)
- Add support for alternate sudo command [\#755](https://github.com/chef/inspec/issues/755)
- Chef Compliance Server UI - Need capability to remove an uploaded profile [\#712](https://github.com/chef/inspec/issues/712)

## [v0.22.0](https://github.com/chef/inspec/tree/v0.22.0) (2016-05-16)
[Full Changelog](https://github.com/chef/inspec/compare/v0.21.6...v0.22.0)

**Implemented enhancements:**

- update train dependency to 0.12.0 [\#757](https://github.com/chef/inspec/pull/757) ([chris-rock](https://github.com/chris-rock))
- run integration tests in docker [\#732](https://github.com/chef/inspec/pull/732) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- fixed 'it' statements under file\_test [\#758](https://github.com/chef/inspec/pull/758) ([Anirudh-Gupta](https://github.com/Anirudh-Gupta))
- modification in command resource example [\#756](https://github.com/chef/inspec/pull/756) ([Anirudh-Gupta](https://github.com/Anirudh-Gupta))
- add sudo\_command option [\#754](https://github.com/chef/inspec/pull/754) ([jeremymv2](https://github.com/jeremymv2))
- remove string quotes around regexp \(docfix\) [\#750](https://github.com/chef/inspec/pull/750) ([lamont-granquist](https://github.com/lamont-granquist))
- rake release\_docker + smaller image builds [\#745](https://github.com/chef/inspec/pull/745) ([arlimus](https://github.com/arlimus))

## [v0.21.6](https://github.com/chef/inspec/tree/v0.21.6) (2016-05-13)
[Full Changelog](https://github.com/chef/inspec/compare/v0.21.5...v0.21.6)

**Fixed bugs:**

- catch corner-case with symbols on test-objects [\#748](https://github.com/chef/inspec/pull/748) ([arlimus](https://github.com/arlimus))
- Prevent nil.include? [\#747](https://github.com/chef/inspec/pull/747) ([alexpop](https://github.com/alexpop))

## [v0.21.5](https://github.com/chef/inspec/tree/v0.21.5) (2016-05-13)
[Full Changelog](https://github.com/chef/inspec/compare/v0.21.4...v0.21.5)

**Fixed bugs:**

- fix construction of ruby objects on string and array handlers [\#746](https://github.com/chef/inspec/pull/746) ([arlimus](https://github.com/arlimus))

## [v0.21.4](https://github.com/chef/inspec/tree/v0.21.4) (2016-05-13)
[Full Changelog](https://github.com/chef/inspec/compare/v0.21.3...v0.21.4)

**Implemented enhancements:**

- use struct for processes list [\#744](https://github.com/chef/inspec/pull/744) ([arlimus](https://github.com/arlimus))

## [v0.21.3](https://github.com/chef/inspec/tree/v0.21.3) (2016-05-11)
[Full Changelog](https://github.com/chef/inspec/compare/v0.21.2...v0.21.3)

**Fixed bugs:**

- Return empty array instead of nil for port methods [\#739](https://github.com/chef/inspec/pull/739) ([alexpop](https://github.com/alexpop))

**Merged pull requests:**

- deprecate array matcher [\#737](https://github.com/chef/inspec/pull/737) ([chris-rock](https://github.com/chris-rock))
- Escape os\_env command on Windows to handle env variables containing parentheses. [\#735](https://github.com/chef/inspec/pull/735) ([tpcwang](https://github.com/tpcwang))

## [v0.21.2](https://github.com/chef/inspec/tree/v0.21.2) (2016-05-11)
[Full Changelog](https://github.com/chef/inspec/compare/v0.21.1...v0.21.2)

**Implemented enhancements:**

- Read SELinux labels for processes [\#726](https://github.com/chef/inspec/issues/726)
- Fix contain\_match, add none\_match [\#736](https://github.com/chef/inspec/pull/736) ([alexpop](https://github.com/alexpop))

**Fixed bugs:**

- Fix contain\\_match, add none\\_match [\#736](https://github.com/chef/inspec/pull/736) ([alexpop](https://github.com/alexpop))

## [v0.21.1](https://github.com/chef/inspec/tree/v0.21.1) (2016-05-10)
[Full Changelog](https://github.com/chef/inspec/compare/v0.21.0...v0.21.1)

**Fixed bugs:**

- fix: remove non-existent class [\#729](https://github.com/chef/inspec/pull/729) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- Expose label for processes only on linux [\#733](https://github.com/chef/inspec/pull/733) ([vjeffrey](https://github.com/vjeffrey))
- Add all\_match to matchers [\#730](https://github.com/chef/inspec/pull/730) ([vjeffrey](https://github.com/vjeffrey))

## [v0.21.0](https://github.com/chef/inspec/tree/v0.21.0) (2016-05-10)
[Full Changelog](https://github.com/chef/inspec/compare/v0.20.1...v0.21.0)

**Implemented enhancements:**

- Support nested describe.one blocks [\#711](https://github.com/chef/inspec/issues/711)
- inspec exec format json backtrace [\#614](https://github.com/chef/inspec/issues/614)
- Improve error output for compliance plugin [\#544](https://github.com/chef/inspec/issues/544)
- Cryptic error output if authentication with Chef Compliance fails [\#489](https://github.com/chef/inspec/issues/489)
- How to access the impact of a test failure? [\#377](https://github.com/chef/inspec/issues/377)
- Optimize InSpec detect [\#300](https://github.com/chef/inspec/issues/300)
- document output and/or expected results [\#210](https://github.com/chef/inspec/issues/210)
- Remove redundant space when missing expectation [\#724](https://github.com/chef/inspec/pull/724) ([alexpop](https://github.com/alexpop))
- Provide service params [\#721](https://github.com/chef/inspec/pull/721) ([alexpop](https://github.com/alexpop))
- api: make processes return integers for pid/vsz/rss [\#717](https://github.com/chef/inspec/pull/717) ([arlimus](https://github.com/arlimus))
- Expose systemd service properties via .info [\#715](https://github.com/chef/inspec/pull/715) ([alexpop](https://github.com/alexpop))
- Use only strings in resource examples, docs and tests [\#708](https://github.com/chef/inspec/pull/708) ([alexpop](https://github.com/alexpop))
- use filtertable with passwd resource [\#699](https://github.com/chef/inspec/pull/699) ([arlimus](https://github.com/arlimus))
- show error if user is not logged in to compliance server [\#696](https://github.com/chef/inspec/pull/696) ([chris-rock](https://github.com/chris-rock))
- JSON formatter redesign [\#671](https://github.com/chef/inspec/pull/671) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- bugfix: handle train errors in inspec execution [\#705](https://github.com/chef/inspec/pull/705) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- How do I inherit a profile from another profile? [\#691](https://github.com/chef/inspec/issues/691)
- How do I download a profile from a compliance server? [\#690](https://github.com/chef/inspec/issues/690)
- inspec compliance login fails [\#689](https://github.com/chef/inspec/issues/689)

**Merged pull requests:**

- inspec detect learns human-readable output [\#720](https://github.com/chef/inspec/pull/720) ([chris-rock](https://github.com/chris-rock))
- Add documentation on how to use ruby  [\#718](https://github.com/chef/inspec/pull/718) ([alexpop](https://github.com/alexpop))
- export \#tests\(\) from OrTest object [\#714](https://github.com/chef/inspec/pull/714) ([arlimus](https://github.com/arlimus))
- use strings instead of symbols [\#707](https://github.com/chef/inspec/pull/707) ([vjeffrey](https://github.com/vjeffrey))
- hpux support for basic port properties [\#706](https://github.com/chef/inspec/pull/706) ([Anirudh-Gupta](https://github.com/Anirudh-Gupta))

## [v0.20.1](https://github.com/chef/inspec/tree/v0.20.1) (2016-04-30)
[Full Changelog](https://github.com/chef/inspec/compare/v0.20.0...v0.20.1)

**Implemented enhancements:**

- Add basename parameter and add tests [\#701](https://github.com/chef/inspec/pull/701) ([alexpop](https://github.com/alexpop))

**Fixed bugs:**

- fix appveyor caching [\#700](https://github.com/chef/inspec/pull/700) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- 0.20.1 [\#702](https://github.com/chef/inspec/pull/702) ([alexpop](https://github.com/alexpop))

## [v0.20.0](https://github.com/chef/inspec/tree/v0.20.0) (2016-04-29)
[Full Changelog](https://github.com/chef/inspec/compare/v0.19.3...v0.20.0)

**Implemented enhancements:**

- update to train's new file interface: symlink + uid + gid [\#694](https://github.com/chef/inspec/pull/694) ([arlimus](https://github.com/arlimus))
- validate target backend [\#688](https://github.com/chef/inspec/pull/688) ([arlimus](https://github.com/arlimus))
- `where { field op value }` for filter table [\#684](https://github.com/chef/inspec/pull/684) ([arlimus](https://github.com/arlimus))
- add `shell -c` for executing calls against the inspec api [\#683](https://github.com/chef/inspec/pull/683) ([arlimus](https://github.com/arlimus))
- Hpux [\#682](https://github.com/chef/inspec/pull/682) ([Anirudh-Gupta](https://github.com/Anirudh-Gupta))
- Add table-style filter utility [\#681](https://github.com/chef/inspec/pull/681) ([arlimus](https://github.com/arlimus))
- added hpux user and package resource support [\#678](https://github.com/chef/inspec/pull/678) ([Anirudh-Gupta](https://github.com/Anirudh-Gupta))

**Fixed bugs:**

- Specifying an invalid target protocol should give a failure message [\#686](https://github.com/chef/inspec/issues/686)
- update compliance plugin [\#695](https://github.com/chef/inspec/pull/695) ([chris-rock](https://github.com/chris-rock))
- bugfix: restore pax\_global\_header fetcher filter [\#669](https://github.com/chef/inspec/pull/669) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- How do I run an inspec profile in chef audit mode? [\#692](https://github.com/chef/inspec/issues/692)

**Merged pull requests:**

- 0.20.0 [\#698](https://github.com/chef/inspec/pull/698) ([arlimus](https://github.com/arlimus))
- update appveyor ruby to 2.2 + fix caching [\#697](https://github.com/chef/inspec/pull/697) ([arlimus](https://github.com/arlimus))

## [v0.19.3](https://github.com/chef/inspec/tree/v0.19.3) (2016-04-22)
[Full Changelog](https://github.com/chef/inspec/compare/v0.19.2...v0.19.3)

**Fixed bugs:**

- fix legacy supports call [\#679](https://github.com/chef/inspec/pull/679) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- Releasing inspec 0.19.3 [\#680](https://github.com/chef/inspec/pull/680) ([alexpop](https://github.com/alexpop))
- v0.19.2 [\#675](https://github.com/chef/inspec/pull/675) ([arlimus](https://github.com/arlimus))

## [v0.19.2](https://github.com/chef/inspec/tree/v0.19.2) (2016-04-21)
[Full Changelog](https://github.com/chef/inspec/compare/v0.19.1...v0.19.2)

**Implemented enhancements:**

- Fix indenting for translated loops and ors [\#673](https://github.com/chef/inspec/pull/673) ([alexpop](https://github.com/alexpop))
- add regexp to cmp matcher [\#667](https://github.com/chef/inspec/pull/667) ([arlimus](https://github.com/arlimus))
- remodel bash and shell wrappers [\#662](https://github.com/chef/inspec/pull/662) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- bugfix: fix formatting of cmp expectations [\#668](https://github.com/chef/inspec/pull/668) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- Octal Permissions Match [\#666](https://github.com/chef/inspec/issues/666)
- file permissions for symlinked files are not checked correctly [\#665](https://github.com/chef/inspec/issues/665)

**Merged pull requests:**

- release via travis + test via rubygems [\#663](https://github.com/chef/inspec/pull/663) ([arlimus](https://github.com/arlimus))

## [v0.19.1](https://github.com/chef/inspec/tree/v0.19.1) (2016-04-18)
[Full Changelog](https://github.com/chef/inspec/compare/v0.19.0...v0.19.1)

**Implemented enhancements:**

- configure command execution shells to sh/bash/zsh [\#659](https://github.com/chef/inspec/pull/659) ([arlimus](https://github.com/arlimus))
- be descriptive on shadow.entries [\#657](https://github.com/chef/inspec/pull/657) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- bugfix: print cmp expectations [\#656](https://github.com/chef/inspec/pull/656) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- gem install failure on RHEL 7.2 Ruby 2.0 [\#653](https://github.com/chef/inspec/issues/653)

**Merged pull requests:**

- version bump: 0.19.1 [\#661](https://github.com/chef/inspec/pull/661) ([srenatus](https://github.com/srenatus))
- add requirements for gem installation to readme [\#655](https://github.com/chef/inspec/pull/655) ([arlimus](https://github.com/arlimus))

## [v0.19.0](https://github.com/chef/inspec/tree/v0.19.0) (2016-04-17)
[Full Changelog](https://github.com/chef/inspec/compare/v0.18.0...v0.19.0)

**Implemented enhancements:**

- Add required inspec version to inspec.yml [\#644](https://github.com/chef/inspec/issues/644)
- Resource grub conf [\#652](https://github.com/chef/inspec/pull/652) ([arlimus](https://github.com/arlimus))
- fail on unsupported os/platform [\#651](https://github.com/chef/inspec/pull/651) ([arlimus](https://github.com/arlimus))
- specify required inspec version in inspec.yml [\#648](https://github.com/chef/inspec/pull/648) ([arlimus](https://github.com/arlimus))
- feature: `cmp \< / \> / \<= / \>= / == / != sth` matcher [\#643](https://github.com/chef/inspec/pull/643) ([arlimus](https://github.com/arlimus))
- Add 'static' value as enabled to systemd service enabled check [\#637](https://github.com/chef/inspec/pull/637) ([jmccann](https://github.com/jmccann))
- add dockerized inspec [\#635](https://github.com/chef/inspec/pull/635) ([arlimus](https://github.com/arlimus))
- inspec-compliance + Compliance 1.0 [\#576](https://github.com/chef/inspec/pull/576) ([srenatus](https://github.com/srenatus))

**Fixed bugs:**

- `add\_test': undefined method error on Ubuntu 15.10 with Ruby 2.1 [\#642](https://github.com/chef/inspec/issues/642)
- Install failed on Ubuntu with Ruby 2.1 [\#641](https://github.com/chef/inspec/issues/641)
- Inspec json resource . example not working [\#631](https://github.com/chef/inspec/issues/631)
- Checking on services on SLES 11 fails [\#627](https://github.com/chef/inspec/issues/627)
- Inspec check fails on `examples/profile` [\#485](https://github.com/chef/inspec/issues/485)
- bugfix: rspec world handling on rspec 3.5 [\#650](https://github.com/chef/inspec/pull/650) ([arlimus](https://github.com/arlimus))
- Prevent its\(:to\_i\) from generated tests [\#639](https://github.com/chef/inspec/pull/639) ([alexpop](https://github.com/alexpop))
- bugfix: non-profile execution with json formatter [\#632](https://github.com/chef/inspec/pull/632) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- add usage instructions for inspec container [\#649](https://github.com/chef/inspec/pull/649) ([chris-rock](https://github.com/chris-rock))
- update documentation for json resource [\#647](https://github.com/chef/inspec/pull/647) ([chris-rock](https://github.com/chris-rock))
- Add support for suse 11 to service resource [\#638](https://github.com/chef/inspec/pull/638) ([spuranam](https://github.com/spuranam))
- Add -i to ssh example, link to cli options [\#636](https://github.com/chef/inspec/pull/636) ([vjeffrey](https://github.com/vjeffrey))

## [v0.18.0](https://github.com/chef/inspec/tree/v0.18.0) (2016-04-09)
[Full Changelog](https://github.com/chef/inspec/compare/v0.17.1...v0.18.0)

**Implemented enhancements:**

- supports keyword marks tests as skipped instead of removing them [\#620](https://github.com/chef/inspec/pull/620) ([arlimus](https://github.com/arlimus))
- Support only\_if in controls [\#619](https://github.com/chef/inspec/pull/619) ([arlimus](https://github.com/arlimus))
- don't remove controls with only\_if [\#618](https://github.com/chef/inspec/pull/618) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- 0.18.0 [\#629](https://github.com/chef/inspec/pull/629) ([arlimus](https://github.com/arlimus))
- Encourage sharing of profiles [\#625](https://github.com/chef/inspec/pull/625) ([nathenharvey](https://github.com/nathenharvey))
- add travis and appveyor badges [\#622](https://github.com/chef/inspec/pull/622) ([chris-rock](https://github.com/chris-rock))
- remove unused profile.tar.gz [\#621](https://github.com/chef/inspec/pull/621) ([chris-rock](https://github.com/chris-rock))
- Extended gordon\_config with more examples [\#610](https://github.com/chef/inspec/pull/610) ([alexpop](https://github.com/alexpop))
- Create ISSUE\_TEMPLATE [\#581](https://github.com/chef/inspec/pull/581) ([srenatus](https://github.com/srenatus))

## [v0.17.1](https://github.com/chef/inspec/tree/v0.17.1) (2016-03-31)
[Full Changelog](https://github.com/chef/inspec/compare/v0.17.0...v0.17.1)

**Merged pull requests:**

- add inspec objects \(not exposed by default\) [\#608](https://github.com/chef/inspec/pull/608) ([arlimus](https://github.com/arlimus))

## [v0.17.0](https://github.com/chef/inspec/tree/v0.17.0) (2016-03-31)
[Full Changelog](https://github.com/chef/inspec/compare/v0.16.4...v0.17.0)

**Implemented enhancements:**

- add advanced passwd filters \(experimental\) [\#602](https://github.com/chef/inspec/pull/602) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- readable.by not working on RHEL7 [\#597](https://github.com/chef/inspec/issues/597)
- sshd\_config resource no method error [\#595](https://github.com/chef/inspec/issues/595)
- Update the readme.md file to include new cli output [\#590](https://github.com/chef/inspec/issues/590)

**Merged pull requests:**

- 0.17.0 [\#604](https://github.com/chef/inspec/pull/604) ([arlimus](https://github.com/arlimus))
- add file uid and gid accessors [\#603](https://github.com/chef/inspec/pull/603) ([arlimus](https://github.com/arlimus))
- fix errors introduced in \#593 [\#594](https://github.com/chef/inspec/pull/594) ([chris-rock](https://github.com/chris-rock))
- Updated documentation and examples to include tags and references [\#593](https://github.com/chef/inspec/pull/593) ([aaronlippold](https://github.com/aaronlippold))
- Ease removal of whitespace for Powershell Write-Output and VBScript Echo [\#592](https://github.com/chef/inspec/pull/592) ([chris-rock](https://github.com/chris-rock))
- Amazon linux support for service resource [\#580](https://github.com/chef/inspec/pull/580) ([jbussdieker](https://github.com/jbussdieker))
- Fixed API calls for inspec compliance [\#537](https://github.com/chef/inspec/pull/537) ([JTabel](https://github.com/JTabel))

## [v0.16.4](https://github.com/chef/inspec/tree/v0.16.4) (2016-03-25)
[Full Changelog](https://github.com/chef/inspec/compare/v0.16.3...v0.16.4)

**Implemented enhancements:**

- support --controls for inspec json [\#589](https://github.com/chef/inspec/pull/589) ([arlimus](https://github.com/arlimus))
- dont fail with stacktrace on connection errors [\#588](https://github.com/chef/inspec/pull/588) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- Escape whitespace for compliance upload [\#486](https://github.com/chef/inspec/issues/486)
- inspec-compliance: url\_encode profile names [\#574](https://github.com/chef/inspec/pull/574) ([srenatus](https://github.com/srenatus))

**Closed issues:**

- --controls flag should be supported in all inspec commands [\#568](https://github.com/chef/inspec/issues/568)

**Merged pull requests:**

- 0.16.4 [\#591](https://github.com/chef/inspec/pull/591) ([arlimus](https://github.com/arlimus))
- Improvements to gordon example and docs [\#583](https://github.com/chef/inspec/pull/583) ([alexpop](https://github.com/alexpop))
- bugfix: fix rare inspec shell missing all resources [\#582](https://github.com/chef/inspec/pull/582) ([alexpop](https://github.com/alexpop))
- document tags and refs [\#561](https://github.com/chef/inspec/pull/561) ([chris-rock](https://github.com/chris-rock))

## [v0.16.3](https://github.com/chef/inspec/tree/v0.16.3) (2016-03-23)
[Full Changelog](https://github.com/chef/inspec/compare/v0.16.2...v0.16.3)

**Fixed bugs:**

- 0.16.3 [\#575](https://github.com/chef/inspec/pull/575) ([srenatus](https://github.com/srenatus))
- inspec-compliance: fix upload of profiles [\#573](https://github.com/chef/inspec/pull/573) ([srenatus](https://github.com/srenatus))

**Closed issues:**

- Issues with 'inspec compliance upload' [\#572](https://github.com/chef/inspec/issues/572)

## [v0.16.2](https://github.com/chef/inspec/tree/v0.16.2) (2016-03-22)
[Full Changelog](https://github.com/chef/inspec/compare/v0.16.1...v0.16.2)

**Fixed bugs:**

- bugfix: dont crash on read\_file contents in parse\_config [\#570](https://github.com/chef/inspec/pull/570) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- inspec exec error on new install [\#569](https://github.com/chef/inspec/issues/569)

**Merged pull requests:**

- 0.16.2 [\#571](https://github.com/chef/inspec/pull/571) ([arlimus](https://github.com/arlimus))

## [v0.16.1](https://github.com/chef/inspec/tree/v0.16.1) (2016-03-22)
[Full Changelog](https://github.com/chef/inspec/compare/v0.16.0...v0.16.1)

**Implemented enhancements:**

- undefined method `addresses' for Port [\#555](https://github.com/chef/inspec/issues/555)
- add `wmi` resource [\#560](https://github.com/chef/inspec/pull/560) ([chris-rock](https://github.com/chris-rock))
- Add `vbscript` resource [\#559](https://github.com/chef/inspec/pull/559) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- 0.16.1 [\#567](https://github.com/chef/inspec/pull/567) ([arlimus](https://github.com/arlimus))
- add support for addresses in port resource [\#558](https://github.com/chef/inspec/pull/558) ([chris-rock](https://github.com/chris-rock))

## [v0.16.0](https://github.com/chef/inspec/tree/v0.16.0) (2016-03-19)
[Full Changelog](https://github.com/chef/inspec/compare/v0.15.0...v0.16.0)

**Implemented enhancements:**

- Read Chef attributes within the tests ? [\#541](https://github.com/chef/inspec/issues/541)
- A resource to test http GET calls [\#538](https://github.com/chef/inspec/issues/538)
- rename `script` resource to `powershell` resource [\#553](https://github.com/chef/inspec/pull/553) ([chris-rock](https://github.com/chris-rock))
- add fulljson formatter [\#552](https://github.com/chef/inspec/pull/552) ([arlimus](https://github.com/arlimus))
- feature: add tags and refs [\#551](https://github.com/chef/inspec/pull/551) ([arlimus](https://github.com/arlimus))
- fix detect + add output option to archive command [\#546](https://github.com/chef/inspec/pull/546) ([arlimus](https://github.com/arlimus))
- adding named resource registry classes [\#540](https://github.com/chef/inspec/pull/540) ([adamleff](https://github.com/adamleff))
- add output stream to rspec configuration [\#529](https://github.com/chef/inspec/pull/529) ([vjeffrey](https://github.com/vjeffrey))
- Move integration tests to test/integration [\#468](https://github.com/chef/inspec/pull/468) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- Unable to Handle Spaced Windows File Paths [\#469](https://github.com/chef/inspec/issues/469)
- fix inspec shell and continuously test it [\#556](https://github.com/chef/inspec/pull/556) ([arlimus](https://github.com/arlimus))
- bugfix: prevent duplicate loading of library files [\#547](https://github.com/chef/inspec/pull/547) ([arlimus](https://github.com/arlimus))
- fix detect + add output option to archive command [\#546](https://github.com/chef/inspec/pull/546) ([arlimus](https://github.com/arlimus))
- bugfix: archive command with inheritance-based profiles [\#545](https://github.com/chef/inspec/pull/545) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- Add additional metadata to the control definition to allow for more complete mapping to security guidance documents [\#536](https://github.com/chef/inspec/issues/536)
- CLI: Specifying --profiles-path on check succeeds but displays usage error on archive [\#535](https://github.com/chef/inspec/issues/535)
- inspec failing to connect to Compliance \(SSL certificate error\) [\#531](https://github.com/chef/inspec/issues/531)

**Merged pull requests:**

- 0.16.0 [\#557](https://github.com/chef/inspec/pull/557) ([arlimus](https://github.com/arlimus))
- mock fetcher [\#550](https://github.com/chef/inspec/pull/550) ([arlimus](https://github.com/arlimus))
- testing: add inspec exec tests with json formatter [\#549](https://github.com/chef/inspec/pull/549) ([arlimus](https://github.com/arlimus))
- dont generate pretty json by default [\#548](https://github.com/chef/inspec/pull/548) ([arlimus](https://github.com/arlimus))
- Add title, description, code, and source\_location to example metadata [\#543](https://github.com/chef/inspec/pull/543) ([vjeffrey](https://github.com/vjeffrey))
- add functional tests for cli [\#542](https://github.com/chef/inspec/pull/542) ([arlimus](https://github.com/arlimus))
- Add a Gitter chat badge to README.md [\#530](https://github.com/chef/inspec/pull/530) ([gitter-badger](https://github.com/gitter-badger))

## [v0.15.0](https://github.com/chef/inspec/tree/v0.15.0) (2016-03-09)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.8...v0.15.0)

**Implemented enhancements:**

- add color output + make it the default [\#523](https://github.com/chef/inspec/pull/523) ([arlimus](https://github.com/arlimus))
- select controls to execute [\#522](https://github.com/chef/inspec/pull/522) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- Rename internal File and OS resource classes [\#527](https://github.com/chef/inspec/pull/527) ([arlimus](https://github.com/arlimus))
- Placing all resources in the Inspec::Resources namespace [\#526](https://github.com/chef/inspec/pull/526) ([adamleff](https://github.com/adamleff))
- bugfix: inheritance of local profiles [\#524](https://github.com/chef/inspec/pull/524) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- Colo\[u\]r those dots and Fs! [\#518](https://github.com/chef/inspec/issues/518)

**Merged pull requests:**

- 0.15.0 [\#528](https://github.com/chef/inspec/pull/528) ([arlimus](https://github.com/arlimus))
- 0.14.9 [\#525](https://github.com/chef/inspec/pull/525) ([arlimus](https://github.com/arlimus))
- 0.14.8 [\#520](https://github.com/chef/inspec/pull/520) ([arlimus](https://github.com/arlimus))

## [v0.14.8](https://github.com/chef/inspec/tree/v0.14.8) (2016-03-04)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.7...v0.14.8)

**Closed issues:**

- Question: Cron? [\#490](https://github.com/chef/inspec/issues/490)

**Merged pull requests:**

- expose control impacts in json [\#519](https://github.com/chef/inspec/pull/519) ([arlimus](https://github.com/arlimus))

## [v0.14.7](https://github.com/chef/inspec/tree/v0.14.7) (2016-03-01)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.6...v0.14.7)

**Fixed bugs:**

- `compliance` command does not work with self-signed https [\#511](https://github.com/chef/inspec/issues/511)
- check error - digest: no implicit conversion of nil into String \(TypeError\) [\#509](https://github.com/chef/inspec/issues/509)

**Merged pull requests:**

- 0.14.7 [\#513](https://github.com/chef/inspec/pull/513) ([chris-rock](https://github.com/chris-rock))
- adds a insecure option  [\#512](https://github.com/chef/inspec/pull/512) ([chris-rock](https://github.com/chris-rock))

## [v0.14.6](https://github.com/chef/inspec/tree/v0.14.6) (2016-03-01)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.5...v0.14.6)

**Implemented enhancements:**

- Improve Supermarket CLI [\#508](https://github.com/chef/inspec/pull/508) ([alexpop](https://github.com/alexpop))

**Fixed bugs:**

- add missing supermarket loader [\#506](https://github.com/chef/inspec/pull/506) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- 0.14.6 [\#510](https://github.com/chef/inspec/pull/510) ([chris-rock](https://github.com/chris-rock))

## [v0.14.5](https://github.com/chef/inspec/tree/v0.14.5) (2016-02-29)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.4...v0.14.5)

**Merged pull requests:**

- 0.14.5 [\#505](https://github.com/chef/inspec/pull/505) ([chris-rock](https://github.com/chris-rock))
- Fix license warning during gem build. [\#503](https://github.com/chef/inspec/pull/503) ([juliandunn](https://github.com/juliandunn))

## [v0.14.4](https://github.com/chef/inspec/tree/v0.14.4) (2016-02-26)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.3...v0.14.4)

**Implemented enhancements:**

- add xinetd\_conf resource [\#499](https://github.com/chef/inspec/pull/499) ([arlimus](https://github.com/arlimus))
- add `describe.one`: collection of tests with at least one passing [\#497](https://github.com/chef/inspec/pull/497) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- don't crash on empty metadata during finalize [\#500](https://github.com/chef/inspec/pull/500) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- 0.14.4 [\#501](https://github.com/chef/inspec/pull/501) ([arlimus](https://github.com/arlimus))

## [v0.14.3](https://github.com/chef/inspec/tree/v0.14.3) (2016-02-24)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.2...v0.14.3)

**Implemented enhancements:**

- cmp matcher should compare expected string == number [\#487](https://github.com/chef/inspec/pull/487) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- expose inspec errors during profile read [\#492](https://github.com/chef/inspec/pull/492) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- 0.14.3 [\#493](https://github.com/chef/inspec/pull/493) ([arlimus](https://github.com/arlimus))

## [v0.14.2](https://github.com/chef/inspec/tree/v0.14.2) (2016-02-22)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.1...v0.14.2)

**Implemented enhancements:**

- load plugins in the same gem installation [\#482](https://github.com/chef/inspec/pull/482) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- fix cc upload [\#483](https://github.com/chef/inspec/pull/483) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- 0.14.2 [\#484](https://github.com/chef/inspec/pull/484) ([arlimus](https://github.com/arlimus))

## [v0.14.1](https://github.com/chef/inspec/tree/v0.14.1) (2016-02-22)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.0...v0.14.1)

**Implemented enhancements:**

- optimize appveyor [\#479](https://github.com/chef/inspec/pull/479) ([chris-rock](https://github.com/chris-rock))
- fix windows tests [\#478](https://github.com/chef/inspec/pull/478) ([srenatus](https://github.com/srenatus))

**Fixed bugs:**

- ignore `pax\_global\_header` as valid file [\#480](https://github.com/chef/inspec/pull/480) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- 0.14.1 [\#481](https://github.com/chef/inspec/pull/481) ([chris-rock](https://github.com/chris-rock))

## [v0.14.0](https://github.com/chef/inspec/tree/v0.14.0) (2016-02-22)
[Full Changelog](https://github.com/chef/inspec/compare/v0.13.0...v0.14.0)

**Fixed bugs:**

- force encoding to utf-8 [\#476](https://github.com/chef/inspec/pull/476) ([arlimus](https://github.com/arlimus))
- bugfix: make sure version is always a string [\#475](https://github.com/chef/inspec/pull/475) ([arlimus](https://github.com/arlimus))
- bugfix: handle edge-cases in upstart service [\#474](https://github.com/chef/inspec/pull/474) ([arlimus](https://github.com/arlimus))
- replace targets with fetcher+reader system [\#473](https://github.com/chef/inspec/pull/473) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- 0.14.0 [\#477](https://github.com/chef/inspec/pull/477) ([arlimus](https://github.com/arlimus))

## [v0.13.0](https://github.com/chef/inspec/tree/v0.13.0) (2016-02-19)
[Full Changelog](https://github.com/chef/inspec/compare/v0.12.0...v0.13.0)

**Implemented enhancements:**

- add shadow resource for /etc/shadow [\#471](https://github.com/chef/inspec/pull/471) ([arlimus](https://github.com/arlimus))
- improve url handling [\#470](https://github.com/chef/inspec/pull/470) ([chris-rock](https://github.com/chris-rock))
- add filters to passwd resource + deprecate old accessors [\#467](https://github.com/chef/inspec/pull/467) ([arlimus](https://github.com/arlimus))
- cmp for single-entry arrays; add cmp docs [\#466](https://github.com/chef/inspec/pull/466) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- Windows 2008 Still not detected correctly [\#453](https://github.com/chef/inspec/issues/453)
- Service-related docs, bugs, integration tests [\#463](https://github.com/chef/inspec/pull/463) ([srenatus](https://github.com/srenatus))
- fix url target resolution with zip and tar [\#462](https://github.com/chef/inspec/pull/462) ([arlimus](https://github.com/arlimus))
- ensure permissions of inspec-compliance config.json on store [\#461](https://github.com/chef/inspec/pull/461) ([srenatus](https://github.com/srenatus))

**Closed issues:**

- No way to reload the add resources from test code [\#459](https://github.com/chef/inspec/issues/459)
- add documentation for new server runlevel support [\#456](https://github.com/chef/inspec/issues/456)

**Merged pull requests:**

- 0.13.0 [\#472](https://github.com/chef/inspec/pull/472) ([chris-rock](https://github.com/chris-rock))

## [v0.12.0](https://github.com/chef/inspec/tree/v0.12.0) (2016-02-15)
[Full Changelog](https://github.com/chef/inspec/compare/v0.11.0...v0.12.0)

**Implemented enhancements:**

- add runlevel support for System V services [\#455](https://github.com/chef/inspec/pull/455) ([arlimus](https://github.com/arlimus))
- Add a init subcommand [\#454](https://github.com/chef/inspec/pull/454) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- Inspec iptables should have\_rule tests not working [\#420](https://github.com/chef/inspec/issues/420)
- Windows 2008 isn't being detected. [\#346](https://github.com/chef/inspec/issues/346)
- Fix two minor logging and config bugs in CLI [\#452](https://github.com/chef/inspec/pull/452) ([srenatus](https://github.com/srenatus))
- bugfix: verify the target resolver before using it [\#449](https://github.com/chef/inspec/pull/449) ([arlimus](https://github.com/arlimus))
- Fix iptables on CentOS6 + more tests for iptables \(plus small code improvements\) [\#442](https://github.com/chef/inspec/pull/442) ([srenatus](https://github.com/srenatus))

**Merged pull requests:**

- 0.12.0 [\#457](https://github.com/chef/inspec/pull/457) ([arlimus](https://github.com/arlimus))
- rework target to resolver connection [\#447](https://github.com/chef/inspec/pull/447) ([arlimus](https://github.com/arlimus))
- separate directory resolver from target resolver [\#446](https://github.com/chef/inspec/pull/446) ([arlimus](https://github.com/arlimus))

## [v0.11.0](https://github.com/chef/inspec/tree/v0.11.0) (2016-02-10)
[Full Changelog](https://github.com/chef/inspec/compare/v0.10.1...v0.11.0)

**Implemented enhancements:**

- Improve apache resource [\#407](https://github.com/chef/inspec/pull/407) ([chris-rock](https://github.com/chris-rock))
- auditd\_rules rework [\#400](https://github.com/chef/inspec/pull/400) ([srenatus](https://github.com/srenatus))

**Fixed bugs:**

- File stats are not always working properly [\#430](https://github.com/chef/inspec/issues/430)
- Integration test for apache config [\#406](https://github.com/chef/inspec/issues/406)
- rework auditd\_rules resource [\#312](https://github.com/chef/inspec/issues/312)
- resource/auditd\_rules: update rule list format [\#309](https://github.com/chef/inspec/issues/309)

**Merged pull requests:**

- 0.11.0 [\#443](https://github.com/chef/inspec/pull/443) ([arlimus](https://github.com/arlimus))
- Fix supermarket cli registration [\#441](https://github.com/chef/inspec/pull/441) ([chris-rock](https://github.com/chris-rock))
- update to winrm 1.6.1 command scheme [\#439](https://github.com/chef/inspec/pull/439) ([arlimus](https://github.com/arlimus))
- semantics: rename CLI plugins registry -\> commands [\#435](https://github.com/chef/inspec/pull/435) ([arlimus](https://github.com/arlimus))
- avoid automatic plugin loading via library [\#434](https://github.com/chef/inspec/pull/434) ([arlimus](https://github.com/arlimus))
- clarify the role of the plugin API at the moment [\#433](https://github.com/chef/inspec/pull/433) ([arlimus](https://github.com/arlimus))
- Implement Supermarket Extension [\#432](https://github.com/chef/inspec/pull/432) ([chris-rock](https://github.com/chris-rock))
- dedup Gemfiles [\#429](https://github.com/chef/inspec/pull/429) ([srenatus](https://github.com/srenatus))
- fix loading order of plugins [\#428](https://github.com/chef/inspec/pull/428) ([arlimus](https://github.com/arlimus))
- Update dsl\_inspec.rst [\#427](https://github.com/chef/inspec/pull/427) ([GeoFruck](https://github.com/GeoFruck))

## [v0.10.1](https://github.com/chef/inspec/tree/v0.10.1) (2016-02-05)
[Full Changelog](https://github.com/chef/inspec/compare/v0.10.0...v0.10.1)

**Fixed bugs:**

- wrap basecli in inspec module [\#425](https://github.com/chef/inspec/pull/425) ([arlimus](https://github.com/arlimus))

**Merged pull requests:**

- 0.10.1 [\#426](https://github.com/chef/inspec/pull/426) ([chris-rock](https://github.com/chris-rock))

## [v0.10.0](https://github.com/chef/inspec/tree/v0.10.0) (2016-02-05)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.11...v0.10.0)

**Implemented enhancements:**

- Extend Plugin-System for CLI Plugins [\#421](https://github.com/chef/inspec/pull/421) ([chris-rock](https://github.com/chris-rock))
- establish plugin loading dock [\#415](https://github.com/chef/inspec/pull/415) ([arlimus](https://github.com/arlimus))
- JSON output for inspec check [\#411](https://github.com/chef/inspec/pull/411) ([chris-rock](https://github.com/chris-rock))
- Chef Compliance extension [\#409](https://github.com/chef/inspec/pull/409) ([chris-rock](https://github.com/chris-rock))
- RspecRunner: re-export report hash [\#404](https://github.com/chef/inspec/pull/404) ([srenatus](https://github.com/srenatus))

**Fixed bugs:**

- InSpec check crashes on tarball [\#408](https://github.com/chef/inspec/issues/408)
- Looks like supports is ignored from tar files [\#360](https://github.com/chef/inspec/issues/360)
- Check on archives is broken [\#343](https://github.com/chef/inspec/issues/343)
- upstart\_service: fallback to config files if `show-config` is not available [\#419](https://github.com/chef/inspec/pull/419) ([srenatus](https://github.com/srenatus))
- Use target helpers in Inspec::Profile\#from\_file [\#413](https://github.com/chef/inspec/pull/413) ([srenatus](https://github.com/srenatus))
- fix warning in \#find\_files\[\_or\_error\] [\#403](https://github.com/chef/inspec/pull/403) ([srenatus](https://github.com/srenatus))

**Closed issues:**

- be\_enabled for upstart service on RHEL 6 not working correctly [\#417](https://github.com/chef/inspec/issues/417)
- Why is the yml file required? [\#414](https://github.com/chef/inspec/issues/414)
- remove leftover OS check methods from the file resource [\#397](https://github.com/chef/inspec/issues/397)

**Merged pull requests:**

- 0.10.0 [\#424](https://github.com/chef/inspec/pull/424) ([chris-rock](https://github.com/chris-rock))
- ensure bundler is installed on travis [\#422](https://github.com/chef/inspec/pull/422) ([chris-rock](https://github.com/chris-rock))
- ec2 name tag instances for easier cleanup [\#418](https://github.com/chef/inspec/pull/418) ([alexpop](https://github.com/alexpop))
- add an simple describe for profile example [\#416](https://github.com/chef/inspec/pull/416) ([chris-rock](https://github.com/chris-rock))
- enable to configure the logger via cli [\#405](https://github.com/chef/inspec/pull/405) ([chris-rock](https://github.com/chris-rock))
- 0.9.11 [\#402](https://github.com/chef/inspec/pull/402) ([chris-rock](https://github.com/chris-rock))
- remove os check exposure in file resource [\#398](https://github.com/chef/inspec/pull/398) ([arlimus](https://github.com/arlimus))

## [v0.9.11](https://github.com/chef/inspec/tree/v0.9.11) (2016-01-29)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.10...v0.9.11)

**Implemented enhancements:**

- ec2 integration test [\#399](https://github.com/chef/inspec/pull/399) ([chris-rock](https://github.com/chris-rock))
- add  winrm transport to Gemfile for test-kitchen [\#396](https://github.com/chef/inspec/pull/396) ([chris-rock](https://github.com/chris-rock))
- Solaris Support [\#395](https://github.com/chef/inspec/pull/395) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- Logging in profile processing [\#349](https://github.com/chef/inspec/issues/349)
- runit\_service: fix resource, improve integration tests [\#401](https://github.com/chef/inspec/pull/401) ([srenatus](https://github.com/srenatus))
- basic logging setup for `inspec exec` [\#392](https://github.com/chef/inspec/pull/392) ([srenatus](https://github.com/srenatus))

**Merged pull requests:**

- Readme fixes [\#390](https://github.com/chef/inspec/pull/390) ([jzohrab](https://github.com/jzohrab))

## [v0.9.10](https://github.com/chef/inspec/tree/v0.9.10) (2016-01-25)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.9...v0.9.10)

**Implemented enhancements:**

- specify process supervision type in service resource [\#242](https://github.com/chef/inspec/issues/242)
- optimize the error output for missing registry keys to `nil` [\#388](https://github.com/chef/inspec/pull/388) ([chris-rock](https://github.com/chris-rock))
- update readme [\#382](https://github.com/chef/inspec/pull/382) ([chris-rock](https://github.com/chris-rock))
- add service overrides for picking specific service managers, add runit\_service [\#380](https://github.com/chef/inspec/pull/380) ([srenatus](https://github.com/srenatus))
- integration tests: stop using alpine iso [\#379](https://github.com/chef/inspec/pull/379) ([srenatus](https://github.com/srenatus))
- warn about legacy supports fields in metadata [\#378](https://github.com/chef/inspec/pull/378) ([arlimus](https://github.com/arlimus))
- Update README links to the examples directory [\#376](https://github.com/chef/inspec/pull/376) ([frightenedmonkey](https://github.com/frightenedmonkey))
- add profile tests \(non-legacy\) [\#375](https://github.com/chef/inspec/pull/375) ([arlimus](https://github.com/arlimus))
- Fix typo [\#372](https://github.com/chef/inspec/pull/372) ([jcreedcmu](https://github.com/jcreedcmu))
- separate RSpec handling in runner [\#371](https://github.com/chef/inspec/pull/371) ([arlimus](https://github.com/arlimus))
- Improve the description and summary of the InSpec gem. [\#370](https://github.com/chef/inspec/pull/370) ([arlimus](https://github.com/arlimus))

**Fixed bugs:**

- Windows OS Detection [\#383](https://github.com/chef/inspec/issues/383)
- security\_policy is not returning the right value [\#373](https://github.com/chef/inspec/issues/373)
- PostgreSQL\_Session Resource  [\#302](https://github.com/chef/inspec/issues/302)
- bugfix: write given ID to metadata json [\#389](https://github.com/chef/inspec/pull/389) ([arlimus](https://github.com/arlimus))
- resources/launchd\_service: fix parsing of non-running services [\#387](https://github.com/chef/inspec/pull/387) ([srenatus](https://github.com/srenatus))
- bugfix: pin net-ssh 2.9 in gem file [\#386](https://github.com/chef/inspec/pull/386) ([chris-rock](https://github.com/chris-rock))
- resource/postgres\_session: add integration tests, change error handling [\#381](https://github.com/chef/inspec/pull/381) ([srenatus](https://github.com/srenatus))

**Merged pull requests:**

- 0.9.10 [\#391](https://github.com/chef/inspec/pull/391) ([chris-rock](https://github.com/chris-rock))
- Enable appveyor for unit tests on Windows [\#361](https://github.com/chef/inspec/pull/361) ([chris-rock](https://github.com/chris-rock))

## [v0.9.9](https://github.com/chef/inspec/tree/v0.9.9) (2016-01-16)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.8...v0.9.9)

**Fixed bugs:**

- Resource registry\_key { should\_not exist } unavailable [\#322](https://github.com/chef/inspec/issues/322)
- bugfix: only skip regkey if required [\#364](https://github.com/chef/inspec/pull/364) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- 0.9.9 [\#369](https://github.com/chef/inspec/pull/369) ([chris-rock](https://github.com/chris-rock))
- add tests for loading metadata yaml internals [\#368](https://github.com/chef/inspec/pull/368) ([arlimus](https://github.com/arlimus))
- make metadata.rb legacy mode consistent for supports [\#367](https://github.com/chef/inspec/pull/367) ([arlimus](https://github.com/arlimus))
- lint with rubocop 0.36 [\#366](https://github.com/chef/inspec/pull/366) ([arlimus](https://github.com/arlimus))
- Fix ssh\_config example [\#365](https://github.com/chef/inspec/pull/365) ([tas50](https://github.com/tas50))
- Correctly detect UDP ports on linux [\#363](https://github.com/chef/inspec/pull/363) ([mivok](https://github.com/mivok))
- Update the title of the gordon-1.0 control [\#359](https://github.com/chef/inspec/pull/359) ([chris-rock](https://github.com/chris-rock))
- Inspec::Targets::UrlHelper: fix github handling, add tests [\#357](https://github.com/chef/inspec/pull/357) ([srenatus](https://github.com/srenatus))
- Fix systemd service enabled check [\#356](https://github.com/chef/inspec/pull/356) ([jmccann](https://github.com/jmccann))
- Adding AIX classes, tests, and targetted ssh testing [\#333](https://github.com/chef/inspec/pull/333) ([foobarbam](https://github.com/foobarbam))

## [v0.9.8](https://github.com/chef/inspec/tree/v0.9.8) (2016-01-11)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.7...v0.9.8)

**Implemented enhancements:**

- Control Numbers and Display in Compliance GUI [\#306](https://github.com/chef/inspec/issues/306)
- Support supports for resources [\#282](https://github.com/chef/inspec/issues/282)
- Unify metadata and collect it from target resolver [\#342](https://github.com/chef/inspec/pull/342) ([arlimus](https://github.com/arlimus))
- implement `mount` resource [\#341](https://github.com/chef/inspec/pull/341) ([chris-rock](https://github.com/chris-rock))
- Update Integration Tests [\#314](https://github.com/chef/inspec/pull/314) ([chris-rock](https://github.com/chris-rock))
- RFC: Compliance Profile Structure [\#252](https://github.com/chef/inspec/pull/252) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- Inspec doesn't read controls [\#351](https://github.com/chef/inspec/issues/351)
- not working under windows, installed from gem [\#323](https://github.com/chef/inspec/issues/323)
- Resource 'file' missing 'be\_mounted.with' [\#310](https://github.com/chef/inspec/issues/310)
- `inspec check` on examples generates errors [\#215](https://github.com/chef/inspec/issues/215)
- bugfix: ignore supports when generating a profile's json representation [\#355](https://github.com/chef/inspec/pull/355) ([srenatus](https://github.com/srenatus))
- Support old "supports" field in metadata [\#347](https://github.com/chef/inspec/pull/347) ([srenatus](https://github.com/srenatus))
- Fix custom resource loading from `libraries` [\#337](https://github.com/chef/inspec/pull/337) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- Create RFC on profile structure [\#296](https://github.com/chef/inspec/issues/296)

**Merged pull requests:**

- fix reading profiles bug [\#352](https://github.com/chef/inspec/pull/352) ([srenatus](https://github.com/srenatus))
- 0.9.8 [\#350](https://github.com/chef/inspec/pull/350) ([chris-rock](https://github.com/chris-rock))
- clarify how to bump version in rake [\#348](https://github.com/chef/inspec/pull/348) ([arlimus](https://github.com/arlimus))
- Add `supports` to metadata to specify supported systems [\#344](https://github.com/chef/inspec/pull/344) ([arlimus](https://github.com/arlimus))
- Update list of examples [\#340](https://github.com/chef/inspec/pull/340) ([chris-rock](https://github.com/chris-rock))
- add a description for custom resources [\#339](https://github.com/chef/inspec/pull/339) ([arlimus](https://github.com/arlimus))
- ignore auto-generated controls during verify check [\#332](https://github.com/chef/inspec/pull/332) ([arlimus](https://github.com/arlimus))
- Set exit status to return value of Inspec Runner [\#331](https://github.com/chef/inspec/pull/331) ([rbhitchcock](https://github.com/rbhitchcock))
- Verify profile metadata contents correctly [\#330](https://github.com/chef/inspec/pull/330) ([arlimus](https://github.com/arlimus))

## [v0.9.7](https://github.com/chef/inspec/tree/v0.9.7) (2015-12-21)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.6...v0.9.7)

**Implemented enhancements:**

- Configuration number comparisons [\#308](https://github.com/chef/inspec/issues/308)
- Allow for reading options from a file [\#284](https://github.com/chef/inspec/issues/284)
- file resource mode matcher does not display file permissions correctly on failure [\#230](https://github.com/chef/inspec/issues/230)

**Fixed bugs:**

- remove commandline defaults, they break json config [\#327](https://github.com/chef/inspec/pull/327) ([srenatus](https://github.com/srenatus))
- Fixing issue with security policy always returning nil [\#321](https://github.com/chef/inspec/pull/321) ([jeremymv2](https://github.com/jeremymv2))
- reset rspec configuration when initializing Inspec::Runner [\#320](https://github.com/chef/inspec/pull/320) ([srenatus](https://github.com/srenatus))
- EL package resource improvements: catch missing newlines & add release info [\#248](https://github.com/chef/inspec/pull/248) ([troyready](https://github.com/troyready))

**Closed issues:**

- convert logindef values to integer if possible [\#121](https://github.com/chef/inspec/issues/121)

**Merged pull requests:**

- 0.9.7 [\#328](https://github.com/chef/inspec/pull/328) ([arlimus](https://github.com/arlimus))
- remove format default for `inspec exec` [\#326](https://github.com/chef/inspec/pull/326) ([srenatus](https://github.com/srenatus))
- teach `cmp` matcher octal tricks [\#324](https://github.com/chef/inspec/pull/324) ([srenatus](https://github.com/srenatus))

## [v0.9.6](https://github.com/chef/inspec/tree/v0.9.6) (2015-12-11)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.5...v0.9.6)

**Implemented enhancements:**

- JSON configuration [\#292](https://github.com/chef/inspec/issues/292)
- Replace the `pry... ` bits in inspec shell [\#267](https://github.com/chef/inspec/issues/267)
- Better wording for check [\#260](https://github.com/chef/inspec/issues/260)
- OS resource with string and symbol support [\#227](https://github.com/chef/inspec/issues/227)
- matcher for less-restrictive comparison [\#318](https://github.com/chef/inspec/pull/318) ([chris-rock](https://github.com/chris-rock))
- add readme to examples [\#313](https://github.com/chef/inspec/pull/313) ([chris-rock](https://github.com/chris-rock))
- Minor `inspec shell` improvements [\#283](https://github.com/chef/inspec/pull/283) ([srenatus](https://github.com/srenatus))
- add kitchen-ansible inspec example [\#275](https://github.com/chef/inspec/pull/275) ([alexpop](https://github.com/alexpop))
- add kitchen-puppet example with inspec testing [\#273](https://github.com/chef/inspec/pull/273) ([alexpop](https://github.com/alexpop))
- Feature: Add shell `help resource` command [\#269](https://github.com/chef/inspec/pull/269) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- auditd\_conf parameters should be case insensitive [\#307](https://github.com/chef/inspec/issues/307)
- Processes resource doesn't handle user or state [\#295](https://github.com/chef/inspec/issues/295)
- JSON configuration [\#292](https://github.com/chef/inspec/issues/292)
- Windows file matcher does not match existing files [\#288](https://github.com/chef/inspec/issues/288)
- Inspec hangs when executing some windows profiles against linux machine [\#279](https://github.com/chef/inspec/issues/279)
- Utils::FindFiles doesn't work [\#276](https://github.com/chef/inspec/issues/276)
- etc\_group not implemented for centos [\#266](https://github.com/chef/inspec/issues/266)
- Port resource returns arrays [\#256](https://github.com/chef/inspec/issues/256)
- Custom resource not available, undefined local variable or method `gordon\_config` [\#232](https://github.com/chef/inspec/issues/232)
- File permission checks should return false unless file exists [\#301](https://github.com/chef/inspec/pull/301) ([adamleff](https://github.com/adamleff))
- remove json doc for windows\_feature [\#272](https://github.com/chef/inspec/pull/272) ([chris-rock](https://github.com/chris-rock))
- improvement: add etc\_group support for centos and add integration test [\#270](https://github.com/chef/inspec/pull/270) ([chris-rock](https://github.com/chris-rock))

**Merged pull requests:**

- 0.9.6 [\#319](https://github.com/chef/inspec/pull/319) ([arlimus](https://github.com/arlimus))
- Bugfix: Properly initialize script resource [\#316](https://github.com/chef/inspec/pull/316) ([chris-rock](https://github.com/chris-rock))
- improve shell prompt and help [\#315](https://github.com/chef/inspec/pull/315) ([chris-rock](https://github.com/chris-rock))
- port resource: array attributes, resource alternative [\#303](https://github.com/chef/inspec/pull/303) ([srenatus](https://github.com/srenatus))
- support string and symbol for os resource [\#299](https://github.com/chef/inspec/pull/299) ([chris-rock](https://github.com/chris-rock))
- \[resources/apache\_conf\]: add tests, fix bug [\#298](https://github.com/chef/inspec/pull/298) ([srenatus](https://github.com/srenatus))
- \[resources/processes\] add user\(s\), state\(s\) attribute [\#297](https://github.com/chef/inspec/pull/297) ([srenatus](https://github.com/srenatus))
- fix small grammar error [\#294](https://github.com/chef/inspec/pull/294) ([juliandunn](https://github.com/juliandunn))
- read config from file/stdin [\#293](https://github.com/chef/inspec/pull/293) ([srenatus](https://github.com/srenatus))
- revert to old find\_files interface [\#291](https://github.com/chef/inspec/pull/291) ([srenatus](https://github.com/srenatus))
- Adding support for Wind River Linux [\#289](https://github.com/chef/inspec/pull/289) ([adamleff](https://github.com/adamleff))
- travis workarounds [\#286](https://github.com/chef/inspec/pull/286) ([srenatus](https://github.com/srenatus))
- Support mint in the integration tests [\#281](https://github.com/chef/inspec/pull/281) ([artem-sidorenko](https://github.com/artem-sidorenko))
- align cli documentation with cli [\#278](https://github.com/chef/inspec/pull/278) ([chris-rock](https://github.com/chris-rock))
- Remove description of custom resource [\#277](https://github.com/chef/inspec/pull/277) ([chris-rock](https://github.com/chris-rock))
- add rake tasks for showing and bumping the version of inspec [\#265](https://github.com/chef/inspec/pull/265) ([arlimus](https://github.com/arlimus))

## [v0.9.5](https://github.com/chef/inspec/tree/v0.9.5) (2015-11-25)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.4...v0.9.5)

**Implemented enhancements:**

- Support the -i switch for key files as per ssh [\#261](https://github.com/chef/inspec/issues/261)
- Add -p alias for --port like ssh [\#263](https://github.com/chef/inspec/pull/263) ([alexmanly](https://github.com/alexmanly))

**Merged pull requests:**

- 0.9.5 [\#264](https://github.com/chef/inspec/pull/264) ([arlimus](https://github.com/arlimus))
- Add -i alias for --key\_files like ssh [\#262](https://github.com/chef/inspec/pull/262) ([jcreedcmu](https://github.com/jcreedcmu))

## [v0.9.4](https://github.com/chef/inspec/tree/v0.9.4) (2015-11-24)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.3...v0.9.4)

**Fixed bugs:**

- registry\_key needs to be case insensitive [\#254](https://github.com/chef/inspec/issues/254)
- User resource doesn't handle group names with spaces [\#238](https://github.com/chef/inspec/issues/238)
- inspec does not extract section name from test file header [\#182](https://github.com/chef/inspec/issues/182)
- bugfix: user resources support for group with whitespace [\#258](https://github.com/chef/inspec/pull/258) ([chris-rock](https://github.com/chris-rock))
- Bugfix: make registry\_key resource case-insensitive [\#255](https://github.com/chef/inspec/pull/255) ([alexpop](https://github.com/alexpop))

**Merged pull requests:**

- 0.9.4 [\#259](https://github.com/chef/inspec/pull/259) ([arlimus](https://github.com/arlimus))
- Improve conf file resources \(csv, json, yaml, ini\) [\#257](https://github.com/chef/inspec/pull/257) ([chris-rock](https://github.com/chris-rock))
- improvement: update install instructions and add notes for windows builds [\#253](https://github.com/chef/inspec/pull/253) ([chris-rock](https://github.com/chris-rock))

## [v0.9.3](https://github.com/chef/inspec/tree/v0.9.3) (2015-11-20)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.2...v0.9.3)

**Implemented enhancements:**

- Support the control keyword, synonymous to rule [\#188](https://github.com/chef/inspec/issues/188)

**Fixed bugs:**

- Multiple computed calls to describe aren't registered [\#246](https://github.com/chef/inspec/issues/246)

**Closed issues:**

- port resource does not work on CentOS [\#239](https://github.com/chef/inspec/issues/239)
- os\_env not working [\#236](https://github.com/chef/inspec/issues/236)
- service resource misbehaves on upstart hosts [\#226](https://github.com/chef/inspec/issues/226)
- OS resource requires requires a Symbol not a String \(wrong in docs\) [\#224](https://github.com/chef/inspec/issues/224)
- Cannot run against remote WinRM SSL systems [\#221](https://github.com/chef/inspec/issues/221)
- Proper Changelog [\#211](https://github.com/chef/inspec/issues/211)

**Merged pull requests:**

- 0.9.3 [\#251](https://github.com/chef/inspec/pull/251) ([arlimus](https://github.com/arlimus))
- Introduce automated changelog generation [\#250](https://github.com/chef/inspec/pull/250) ([arlimus](https://github.com/arlimus))
- ensure all test directories are on the runner $LOAD\_PATH [\#249](https://github.com/chef/inspec/pull/249) ([schisamo](https://github.com/schisamo))
- bugfix: support multiple computed calls to describe [\#247](https://github.com/chef/inspec/pull/247) ([arlimus](https://github.com/arlimus))
- Add Windows support to the `os\_env` resource [\#245](https://github.com/chef/inspec/pull/245) ([schisamo](https://github.com/schisamo))
- Added links to the different sections. [\#244](https://github.com/chef/inspec/pull/244) ([jjasghar](https://github.com/jjasghar))
- bugfix: run integration tests on windows [\#243](https://github.com/chef/inspec/pull/243) ([chris-rock](https://github.com/chris-rock))
- add port support for centos [\#241](https://github.com/chef/inspec/pull/241) ([chris-rock](https://github.com/chris-rock))
- api: don't force root on os\_env [\#237](https://github.com/chef/inspec/pull/237) ([arlimus](https://github.com/arlimus))
- change test-kitchen example from rule to control [\#235](https://github.com/chef/inspec/pull/235) ([chris-rock](https://github.com/chris-rock))
- lint [\#234](https://github.com/chef/inspec/pull/234) ([arlimus](https://github.com/arlimus))
- improvement: rewrite registry\_key resource, serverspec compatibility and add integration tests [\#233](https://github.com/chef/inspec/pull/233) ([alexpop](https://github.com/alexpop))
- Upstart with System V fallback [\#228](https://github.com/chef/inspec/pull/228) ([chris-rock](https://github.com/chris-rock))
- OS resource requires a Symbol not a String [\#225](https://github.com/chef/inspec/pull/225) ([stuartpreston](https://github.com/stuartpreston))
- Update README.md [\#223](https://github.com/chef/inspec/pull/223) ([jjasghar](https://github.com/jjasghar))
- add a tiny sudo example to the readme [\#222](https://github.com/chef/inspec/pull/222) ([arlimus](https://github.com/arlimus))

## [v0.9.2](https://github.com/chef/inspec/tree/v0.9.2) (2015-11-06)
[Full Changelog](https://github.com/chef/inspec/compare/0.9.1...v0.9.2)

**Merged pull requests:**

- 0.9.2 [\#220](https://github.com/chef/inspec/pull/220) ([arlimus](https://github.com/arlimus))
- bugfix: correct add\_content call to new param structure [\#219](https://github.com/chef/inspec/pull/219) ([arlimus](https://github.com/arlimus))
- Add version to resource declaration [\#218](https://github.com/chef/inspec/pull/218) ([jcreedcmu](https://github.com/jcreedcmu))
- Not using git in the gemspec file [\#217](https://github.com/chef/inspec/pull/217) ([tyler-ball](https://github.com/tyler-ball))
- Updating Gemfile grouped dependencies to match what is already in the ChefDK [\#216](https://github.com/chef/inspec/pull/216) ([tyler-ball](https://github.com/tyler-ball))
- Fix contain / should match confusion [\#214](https://github.com/chef/inspec/pull/214) ([zmalone](https://github.com/zmalone))
- Massively improve README [\#208](https://github.com/chef/inspec/pull/208) ([echohack](https://github.com/echohack))

## [0.9.1](https://github.com/chef/inspec/tree/0.9.1) (2015-11-04)
[Full Changelog](https://github.com/chef/inspec/compare/v0.9.1...0.9.1)

**Closed issues:**

- add cla bot [\#180](https://github.com/chef/inspec/issues/180)
- update license [\#130](https://github.com/chef/inspec/issues/130)

**Merged pull requests:**

- add inspec and friends, thank you @chris-rock, @nathenharvey, @colincam, @juliandunn [\#209](https://github.com/chef/inspec/pull/209) ([arlimus](https://github.com/arlimus))
- Fix package resource documentation example. [\#207](https://github.com/chef/inspec/pull/207) ([fnichol](https://github.com/fnichol))
- Rename gem in test-kitchen example [\#206](https://github.com/chef/inspec/pull/206) ([srenatus](https://github.com/srenatus))
- 0.9.1 [\#205](https://github.com/chef/inspec/pull/205) ([arlimus](https://github.com/arlimus))
- relax pry version [\#204](https://github.com/chef/inspec/pull/204) ([chris-rock](https://github.com/chris-rock))
- push to rubygems [\#203](https://github.com/chef/inspec/pull/203) ([arlimus](https://github.com/arlimus))
- update table style [\#202](https://github.com/chef/inspec/pull/202) ([chris-rock](https://github.com/chris-rock))
- Apache 2.0 LICENSE [\#201](https://github.com/chef/inspec/pull/201) ([jamesc](https://github.com/jamesc))

## [v0.9.1](https://github.com/chef/inspec/tree/v0.9.1) (2015-11-03)
[Full Changelog](https://github.com/chef/inspec/compare/0.9.0...v0.9.1)

## [0.9.0](https://github.com/chef/inspec/tree/0.9.0) (2015-11-03)
[Full Changelog](https://github.com/chef/inspec/compare/0.8.0...0.9.0)

**Closed issues:**

- Make text replacements in documentation work correctly [\#170](https://github.com/chef/inspec/issues/170)
- rename project to inspec [\#129](https://github.com/chef/inspec/issues/129)
- resource integration tests [\#73](https://github.com/chef/inspec/issues/73)

**Merged pull requests:**

- Fix typo and warning in command exist? check [\#198](https://github.com/chef/inspec/pull/198) ([arlimus](https://github.com/arlimus))
- improvement: fail properly if os is not supported [\#196](https://github.com/chef/inspec/pull/196) ([chris-rock](https://github.com/chris-rock))
- bugfix: relax fail for command.exist? for inspec check command [\#195](https://github.com/chef/inspec/pull/195) ([chris-rock](https://github.com/chris-rock))
- api: introduce control keyword [\#194](https://github.com/chef/inspec/pull/194) ([arlimus](https://github.com/arlimus))
- feature: introduce group title for files [\#193](https://github.com/chef/inspec/pull/193) ([arlimus](https://github.com/arlimus))
- thank you serverspec! [\#192](https://github.com/chef/inspec/pull/192) ([arlimus](https://github.com/arlimus))
- change library loading from /lib -\> /libraries and fix auto-loading [\#191](https://github.com/chef/inspec/pull/191) ([arlimus](https://github.com/arlimus))
- improve command.exist? for more operating systems [\#190](https://github.com/chef/inspec/pull/190) ([chris-rock](https://github.com/chris-rock))
- formatting, mostly ... also package =\> oneget [\#189](https://github.com/chef/inspec/pull/189) ([jamescott](https://github.com/jamescott))
- bugfix: ignore delivery when building the gem [\#186](https://github.com/chef/inspec/pull/186) ([arlimus](https://github.com/arlimus))
- api: change `--disable-sudo` to `--sudo` [\#185](https://github.com/chef/inspec/pull/185) ([arlimus](https://github.com/arlimus))
- remove dup method users, use usernames, fix example [\#183](https://github.com/chef/inspec/pull/183) ([chris-rock](https://github.com/chris-rock))
- Update docs [\#181](https://github.com/chef/inspec/pull/181) ([chris-rock](https://github.com/chris-rock))
- do not expose stderr method via os\_env [\#179](https://github.com/chef/inspec/pull/179) ([chris-rock](https://github.com/chris-rock))
- deactivate group policy [\#178](https://github.com/chef/inspec/pull/178) ([chris-rock](https://github.com/chris-rock))
- MAINTAINERS listed in the project [\#177](https://github.com/chef/inspec/pull/177) ([nathenharvey](https://github.com/nathenharvey))
- fix os\_env example [\#173](https://github.com/chef/inspec/pull/173) ([chris-rock](https://github.com/chris-rock))
- add abbreviations for docs [\#172](https://github.com/chef/inspec/pull/172) ([chris-rock](https://github.com/chris-rock))
- Update README.md [\#171](https://github.com/chef/inspec/pull/171) ([jcreedcmu](https://github.com/jcreedcmu))
- Fix docs so they at least compile with rst2html.py [\#169](https://github.com/chef/inspec/pull/169) ([jcreedcmu](https://github.com/jcreedcmu))
- Update ctl\_inspec.rst [\#168](https://github.com/chef/inspec/pull/168) ([jcreedcmu](https://github.com/jcreedcmu))
- Minor changes to the README [\#167](https://github.com/chef/inspec/pull/167) ([nathenharvey](https://github.com/nathenharvey))
- add draft version of InSpec DSL topic [\#165](https://github.com/chef/inspec/pull/165) ([jamescott](https://github.com/jamescott))
- sync words [\#164](https://github.com/chef/inspec/pull/164) ([jamescott](https://github.com/jamescott))
- Improve docs [\#163](https://github.com/chef/inspec/pull/163) ([chris-rock](https://github.com/chris-rock))
- update docs [\#160](https://github.com/chef/inspec/pull/160) ([chris-rock](https://github.com/chris-rock))
- resource =\> audit resource [\#159](https://github.com/chef/inspec/pull/159) ([jamescott](https://github.com/jamescott))

## [0.8.0](https://github.com/chef/inspec/tree/0.8.0) (2015-10-21)
[Full Changelog](https://github.com/chef/inspec/compare/0.7.0...0.8.0)

**Implemented enhancements:**

- pretty-print resources [\#78](https://github.com/chef/inspec/issues/78)
- Add networking resources [\#68](https://github.com/chef/inspec/issues/68)
- Add WinRM transport layer [\#64](https://github.com/chef/inspec/issues/64)

**Fixed bugs:**

- expose all necessary methods in OS resource [\#79](https://github.com/chef/inspec/issues/79)

**Closed issues:**

- script resource [\#74](https://github.com/chef/inspec/issues/74)
- add project docs [\#72](https://github.com/chef/inspec/issues/72)
- OS detection on debian does not detect versions [\#39](https://github.com/chef/inspec/issues/39)
- ensure all resources have a proper to\_s method [\#98](https://github.com/chef/inspec/issues/98)
- Escape commands before we execute them [\#70](https://github.com/chef/inspec/issues/70)



\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*