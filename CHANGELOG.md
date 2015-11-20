# Change Log

## [v0.9.2](https://github.com/chef/inspec/tree/v0.9.2) (2015-11-06)
[Full Changelog](https://github.com/chef/inspec/compare/0.9.1...v0.9.2)

**Merged pull requests:**

- 0.9.2 [\#220](https://github.com/chef/inspec/pull/220) ([arlimus](https://github.com/arlimus))
- bugfix: correct add\_content call to new param structure [\#219](https://github.com/chef/inspec/pull/219) ([arlimus](https://github.com/arlimus))
- Add version to resource declaration [\#218](https://github.com/chef/inspec/pull/218) ([jcreedcmu](https://github.com/jcreedcmu))
- Not using git in the gemspec file [\#217](https://github.com/chef/inspec/pull/217) ([tyler-ball](https://github.com/tyler-ball))
- Updating Gemfile grouped dependencies to match what is already in the ChefDK [\#216](https://github.com/chef/inspec/pull/216) ([tyler-ball](https://github.com/tyler-ball))
- Fix contain / should match confusion [\#214](https://github.com/chef/inspec/pull/214) ([zmalone](https://github.com/zmalone))
- Fix doc typos [\#213](https://github.com/chef/inspec/pull/213) ([juliandunn](https://github.com/juliandunn))
- Add test-kitchen example reference to readme [\#212](https://github.com/chef/inspec/pull/212) ([chris-rock](https://github.com/chris-rock))
- Massively improve README [\#208](https://github.com/chef/inspec/pull/208) ([echohack](https://github.com/echohack))

## [0.9.1](https://github.com/chef/inspec/tree/0.9.1) (2015-11-04)
[Full Changelog](https://github.com/chef/inspec/compare/0.9.0...0.9.1)

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

## [0.9.0](https://github.com/chef/inspec/tree/0.9.0) (2015-11-03)
[Full Changelog](https://github.com/chef/inspec/compare/0.8.0...0.9.0)

**Closed issues:**

- Make text replacements in documentation work correctly [\#170](https://github.com/chef/inspec/issues/170)
- rename project to inspec [\#129](https://github.com/chef/inspec/issues/129)
- resource integration tests [\#73](https://github.com/chef/inspec/issues/73)

**Merged pull requests:**

- 0.9.0 [\#200](https://github.com/chef/inspec/pull/200) ([arlimus](https://github.com/arlimus))
- bugfix: dont skip controls during json generation [\#199](https://github.com/chef/inspec/pull/199) ([arlimus](https://github.com/arlimus))
- Fix typo and warning in command exist? check [\#198](https://github.com/chef/inspec/pull/198) ([arlimus](https://github.com/arlimus))
- rename rule to control [\#197](https://github.com/chef/inspec/pull/197) ([chris-rock](https://github.com/chris-rock))
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
- use new internal structure for inspect check [\#184](https://github.com/chef/inspec/pull/184) ([chris-rock](https://github.com/chris-rock))
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
- Don't resolve `send` calls with dot-notation [\#162](https://github.com/chef/inspec/pull/162) ([arlimus](https://github.com/arlimus))
- Align profile structure [\#161](https://github.com/chef/inspec/pull/161) ([arlimus](https://github.com/arlimus))
- update docs [\#160](https://github.com/chef/inspec/pull/160) ([chris-rock](https://github.com/chris-rock))
- resource =\> audit resource [\#159](https://github.com/chef/inspec/pull/159) ([jamescott](https://github.com/jamescott))
- update readme [\#158](https://github.com/chef/inspec/pull/158) ([chris-rock](https://github.com/chris-rock))
- add apache base config [\#157](https://github.com/chef/inspec/pull/157) ([chris-rock](https://github.com/chris-rock))
- update to new kitchen-inspect [\#156](https://github.com/chef/inspec/pull/156) ([chris-rock](https://github.com/chris-rock))
- consistently set an empty logger in non-verbose mode [\#155](https://github.com/chef/inspec/pull/155) ([arlimus](https://github.com/arlimus))
- update query syntax [\#154](https://github.com/chef/inspec/pull/154) ([jamescott](https://github.com/jamescott))
- bugfixes for json dummy module [\#153](https://github.com/chef/inspec/pull/153) ([arlimus](https://github.com/arlimus))
- bugfix: correctly remove prefix from folder [\#152](https://github.com/chef/inspec/pull/152) ([arlimus](https://github.com/arlimus))
- Rename vulcanosec -\> inspec [\#151](https://github.com/chef/inspec/pull/151) ([arlimus](https://github.com/arlimus))
- feature: bring back profile check [\#150](https://github.com/chef/inspec/pull/150) ([arlimus](https://github.com/arlimus))
- Metadata [\#149](https://github.com/chef/inspec/pull/149) ([arlimus](https://github.com/arlimus))
- ignore local bundle config [\#148](https://github.com/chef/inspec/pull/148) ([arlimus](https://github.com/arlimus))
- simplify auditd name [\#147](https://github.com/chef/inspec/pull/147) ([chris-rock](https://github.com/chris-rock))
- Json [\#146](https://github.com/chef/inspec/pull/146) ([arlimus](https://github.com/arlimus))
- bugfix: delivery only build necessary gems [\#145](https://github.com/chef/inspec/pull/145) ([arlimus](https://github.com/arlimus))
- fix travis builds for 1.9.3 [\#144](https://github.com/chef/inspec/pull/144) ([arlimus](https://github.com/arlimus))
- more integration tests [\#143](https://github.com/chef/inspec/pull/143) ([chris-rock](https://github.com/chris-rock))
- json =\> exec [\#141](https://github.com/chef/inspec/pull/141) ([jamescott](https://github.com/jamescott))
- add InSpec CLI reference topic [\#140](https://github.com/chef/inspec/pull/140) ([jamescott](https://github.com/jamescott))
- encryptiong =\> encryption [\#139](https://github.com/chef/inspec/pull/139) ([jamescott](https://github.com/jamescott))
- edit out words [\#138](https://github.com/chef/inspec/pull/138) ([jamescott](https://github.com/jamescott))
- remove old docs file [\#136](https://github.com/chef/inspec/pull/136) ([chris-rock](https://github.com/chris-rock))
- Integration tests [\#135](https://github.com/chef/inspec/pull/135) ([chris-rock](https://github.com/chris-rock))
- add audit\_policy resource [\#134](https://github.com/chef/inspec/pull/134) ([jamescott](https://github.com/jamescott))
- add file resource + lots of matchers [\#132](https://github.com/chef/inspec/pull/132) ([jamescott](https://github.com/jamescott))

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

**Merged pull requests:**

- 0.8.0 [\#131](https://github.com/chef/inspec/pull/131) ([chris-rock](https://github.com/chris-rock))
- more CentOS support [\#128](https://github.com/chef/inspec/pull/128) ([chris-rock](https://github.com/chris-rock))
- add more usage headers [\#127](https://github.com/chef/inspec/pull/127) ([chris-rock](https://github.com/chris-rock))
- add test-kitchen example [\#126](https://github.com/chef/inspec/pull/126) ([chris-rock](https://github.com/chris-rock))
- fix the header structure [\#124](https://github.com/chef/inspec/pull/124) ([jamescott](https://github.com/jamescott))
- add resources, sync matcher patterns [\#123](https://github.com/chef/inspec/pull/123) ([jamescott](https://github.com/jamescott))
- move markdown docs to rst [\#122](https://github.com/chef/inspec/pull/122) ([chris-rock](https://github.com/chris-rock))
- delivery: select build node on new fqdn [\#119](https://github.com/chef/inspec/pull/119) ([arlimus](https://github.com/arlimus))
- add first round of audit resource docs [\#118](https://github.com/chef/inspec/pull/118) ([jamescott](https://github.com/jamescott))
- Add support for `expect` [\#117](https://github.com/chef/inspec/pull/117) ([arlimus](https://github.com/arlimus))
- test: group resource tests [\#116](https://github.com/chef/inspec/pull/116) ([arlimus](https://github.com/arlimus))
- Fixes [\#115](https://github.com/chef/inspec/pull/115) ([chris-rock](https://github.com/chris-rock))
- simplify yum implementation [\#114](https://github.com/chef/inspec/pull/114) ([chris-rock](https://github.com/chris-rock))
- take care of ruby warnings [\#112](https://github.com/chef/inspec/pull/112) ([arlimus](https://github.com/arlimus))
- Train [\#111](https://github.com/chef/inspec/pull/111) ([arlimus](https://github.com/arlimus))
- make default rake tasks test+lint [\#110](https://github.com/chef/inspec/pull/110) ([arlimus](https://github.com/arlimus))
- make default rake tasks test+lint [\#109](https://github.com/chef/inspec/pull/109) ([arlimus](https://github.com/arlimus))
- make default rake tasks test+lint [\#108](https://github.com/chef/inspec/pull/108) ([arlimus](https://github.com/arlimus))
- Improve unit tests [\#106](https://github.com/chef/inspec/pull/106) ([chris-rock](https://github.com/chris-rock))
- add to\_s methods to resources, fixes \#98 [\#105](https://github.com/chef/inspec/pull/105) ([chris-rock](https://github.com/chris-rock))
- 0.7.0 release [\#104](https://github.com/chef/inspec/pull/104) ([chris-rock](https://github.com/chris-rock))
- implement iptables resource [\#103](https://github.com/chef/inspec/pull/103) ([chris-rock](https://github.com/chris-rock))
- bugfix: return function if data is already cached [\#102](https://github.com/chef/inspec/pull/102) ([chris-rock](https://github.com/chris-rock))
- implement apt resource [\#101](https://github.com/chef/inspec/pull/101) ([chris-rock](https://github.com/chris-rock))
- improve shell [\#100](https://github.com/chef/inspec/pull/100) ([chris-rock](https://github.com/chris-rock))
- implement host resource [\#99](https://github.com/chef/inspec/pull/99) ([chris-rock](https://github.com/chris-rock))
- implement bridge resource [\#97](https://github.com/chef/inspec/pull/97) ([chris-rock](https://github.com/chris-rock))
- interactive shell [\#95](https://github.com/chef/inspec/pull/95) ([arlimus](https://github.com/arlimus))
- interface resource [\#94](https://github.com/chef/inspec/pull/94) ([chris-rock](https://github.com/chris-rock))
- lint: dont use undefined vars [\#93](https://github.com/chef/inspec/pull/93) ([arlimus](https://github.com/arlimus))
- fix delivery dependencies [\#92](https://github.com/chef/inspec/pull/92) ([arlimus](https://github.com/arlimus))
- improvement: add default print method to resources [\#91](https://github.com/chef/inspec/pull/91) ([arlimus](https://github.com/arlimus))
- extend os backend helper [\#90](https://github.com/chef/inspec/pull/90) ([chris-rock](https://github.com/chris-rock))
- integrate docs [\#89](https://github.com/chef/inspec/pull/89) ([chris-rock](https://github.com/chris-rock))
- integrate docs [\#88](https://github.com/chef/inspec/pull/88) ([chris-rock](https://github.com/chris-rock))
- script resource [\#87](https://github.com/chef/inspec/pull/87) ([chris-rock](https://github.com/chris-rock))
- implement group resource [\#85](https://github.com/chef/inspec/pull/85) ([chris-rock](https://github.com/chris-rock))
- add author header [\#84](https://github.com/chef/inspec/pull/84) ([chris-rock](https://github.com/chris-rock))
- Resource bugfix [\#83](https://github.com/chef/inspec/pull/83) ([arlimus](https://github.com/arlimus))
- Resource in resource [\#80](https://github.com/chef/inspec/pull/80) ([arlimus](https://github.com/arlimus))
- ignore local delivery config [\#77](https://github.com/chef/inspec/pull/77) ([arlimus](https://github.com/arlimus))
- bugfix user resource for windows [\#76](https://github.com/chef/inspec/pull/76) ([chris-rock](https://github.com/chris-rock))
- activate lint in travis [\#75](https://github.com/chef/inspec/pull/75) ([arlimus](https://github.com/arlimus))
- Simplify SSL configuration [\#69](https://github.com/chef/inspec/pull/69) ([arlimus](https://github.com/arlimus))
- implement user resource [\#67](https://github.com/chef/inspec/pull/67) ([chris-rock](https://github.com/chris-rock))
- switch from open4 -\> mixlib-shellout [\#66](https://github.com/chef/inspec/pull/66) ([arlimus](https://github.com/arlimus))
- WinRM path [\#63](https://github.com/chef/inspec/pull/63) ([arlimus](https://github.com/arlimus))
- bugfix: catch cases where oneget returns an array [\#62](https://github.com/chef/inspec/pull/62) ([chris-rock](https://github.com/chris-rock))
- extend delivery tests to extra docker images [\#61](https://github.com/chef/inspec/pull/61) ([arlimus](https://github.com/arlimus))
- rename --key-file to --key on cli [\#60](https://github.com/chef/inspec/pull/60) ([arlimus](https://github.com/arlimus))
- Simpleconfig groups [\#57](https://github.com/chef/inspec/pull/57) ([arlimus](https://github.com/arlimus))
- OS detection tests [\#56](https://github.com/chef/inspec/pull/56) ([arlimus](https://github.com/arlimus))
- Start Linting remaining resources [\#55](https://github.com/chef/inspec/pull/55) ([arlimus](https://github.com/arlimus))
- fix various robocop lint issues [\#54](https://github.com/chef/inspec/pull/54) ([chris-rock](https://github.com/chris-rock))
- overhaul rule structure [\#53](https://github.com/chef/inspec/pull/53) ([arlimus](https://github.com/arlimus))
- Verify ssh transport backend [\#51](https://github.com/chef/inspec/pull/51) ([arlimus](https://github.com/arlimus))
- Unit test for service resource [\#50](https://github.com/chef/inspec/pull/50) ([chris-rock](https://github.com/chris-rock))
- Ssh backend tests [\#49](https://github.com/chef/inspec/pull/49) ([arlimus](https://github.com/arlimus))
- Docker concurrency [\#48](https://github.com/chef/inspec/pull/48) ([arlimus](https://github.com/arlimus))
- unit tests for package resource [\#47](https://github.com/chef/inspec/pull/47) ([chris-rock](https://github.com/chris-rock))
- Docker runner test [\#46](https://github.com/chef/inspec/pull/46) ([arlimus](https://github.com/arlimus))
- add port resource [\#45](https://github.com/chef/inspec/pull/45) ([chris-rock](https://github.com/chris-rock))
- bugfix: windows server 2008 detection [\#44](https://github.com/chef/inspec/pull/44) ([arlimus](https://github.com/arlimus))
- Add detect command [\#43](https://github.com/chef/inspec/pull/43) ([arlimus](https://github.com/arlimus))
- unit test mock os [\#42](https://github.com/chef/inspec/pull/42) ([chris-rock](https://github.com/chris-rock))
- let travis do dockerized resource tests [\#41](https://github.com/chef/inspec/pull/41) ([arlimus](https://github.com/arlimus))
- docker test run [\#40](https://github.com/chef/inspec/pull/40) ([arlimus](https://github.com/arlimus))
- bugfix: detect os via unames [\#38](https://github.com/chef/inspec/pull/38) ([arlimus](https://github.com/arlimus))
- run kitchen test instead of converge [\#37](https://github.com/chef/inspec/pull/37) ([arlimus](https://github.com/arlimus))
- bugfix: local file owner [\#36](https://github.com/chef/inspec/pull/36) ([arlimus](https://github.com/arlimus))
- bugfix: backend description for local + docker [\#35](https://github.com/chef/inspec/pull/35) ([arlimus](https://github.com/arlimus))
- implement fake os method for mock backend \(for now\) [\#34](https://github.com/chef/inspec/pull/34) ([chris-rock](https://github.com/chris-rock))
- add Windows feature resource [\#33](https://github.com/chef/inspec/pull/33) ([chris-rock](https://github.com/chris-rock))
- add linux kernel resources [\#32](https://github.com/chef/inspec/pull/32) ([chris-rock](https://github.com/chris-rock))
- Exist vs exists [\#31](https://github.com/chef/inspec/pull/31) ([arlimus](https://github.com/arlimus))
- File formats [\#30](https://github.com/chef/inspec/pull/30) ([chris-rock](https://github.com/chris-rock))
- OS detection and resource [\#29](https://github.com/chef/inspec/pull/29) ([arlimus](https://github.com/arlimus))
- bugfix: fix simplified runner configuration [\#28](https://github.com/chef/inspec/pull/28) ([chris-rock](https://github.com/chris-rock))
- improvement: simplify runner configuration [\#27](https://github.com/chef/inspec/pull/27) ([arlimus](https://github.com/arlimus))
- bugfix: catch cases, where no service is available [\#26](https://github.com/chef/inspec/pull/26) ([chris-rock](https://github.com/chris-rock))
- support package for windows [\#25](https://github.com/chef/inspec/pull/25) ([chris-rock](https://github.com/chris-rock))
- implement service for FreeBSD [\#24](https://github.com/chef/inspec/pull/24) ([chris-rock](https://github.com/chris-rock))
- move integration dependencies to Gemfile [\#23](https://github.com/chef/inspec/pull/23) ([chris-rock](https://github.com/chris-rock))
- add oracle linux docker tests [\#22](https://github.com/chef/inspec/pull/22) ([arlimus](https://github.com/arlimus))
- Support FreeBSD [\#21](https://github.com/chef/inspec/pull/21) ([arlimus](https://github.com/arlimus))
- Service resource [\#20](https://github.com/chef/inspec/pull/20) ([chris-rock](https://github.com/chris-rock))
- Improvements [\#19](https://github.com/chef/inspec/pull/19) ([chris-rock](https://github.com/chris-rock))
- bugfix: set host for ssh config in specinfra [\#18](https://github.com/chef/inspec/pull/18) ([chris-rock](https://github.com/chris-rock))
- improve readme [\#17](https://github.com/chef/inspec/pull/17) ([chris-rock](https://github.com/chris-rock))
- Integration tests for the backend runner [\#16](https://github.com/chef/inspec/pull/16) ([arlimus](https://github.com/arlimus))
- Fix specinfra OS detection [\#15](https://github.com/chef/inspec/pull/15) ([arlimus](https://github.com/arlimus))
- Os detection [\#14](https://github.com/chef/inspec/pull/14) ([chris-rock](https://github.com/chris-rock))
- bugfix: require specinfra backend [\#13](https://github.com/chef/inspec/pull/13) ([chris-rock](https://github.com/chris-rock))
- improve docker test runner structure [\#12](https://github.com/chef/inspec/pull/12) ([arlimus](https://github.com/arlimus))
- Concurrent integrationtest [\#11](https://github.com/chef/inspec/pull/11) ([arlimus](https://github.com/arlimus))
- add oneget resource [\#10](https://github.com/chef/inspec/pull/10) ([chris-rock](https://github.com/chris-rock))
- Winrm [\#9](https://github.com/chef/inspec/pull/9) ([chris-rock](https://github.com/chris-rock))
- bugfix: linux file stat parameters and mount [\#8](https://github.com/chef/inspec/pull/8) ([arlimus](https://github.com/arlimus))
- Mysql conf [\#7](https://github.com/chef/inspec/pull/7) ([arlimus](https://github.com/arlimus))
- Lint update [\#6](https://github.com/chef/inspec/pull/6) ([arlimus](https://github.com/arlimus))
- SSH PTY [\#5](https://github.com/chef/inspec/pull/5) ([arlimus](https://github.com/arlimus))
- Start Docker + SSH backends [\#4](https://github.com/chef/inspec/pull/4) ([arlimus](https://github.com/arlimus))
- travis checks [\#3](https://github.com/chef/inspec/pull/3) ([chris-rock](https://github.com/chris-rock))
- Package [\#2](https://github.com/chef/inspec/pull/2) ([chris-rock](https://github.com/chris-rock))
- shared linux file handling + specinfra config + cleanup [\#1](https://github.com/chef/inspec/pull/1) ([arlimus](https://github.com/arlimus))

# Changelog

## 0.9.2

* #219 bugfix: fix add_content to make `inspec shell` work again
* #218 add version to resource declaration
* #217 specify gemspec files directly (without git)
* #216 update gemfile grouped dependencies
* #214 fix legacy `should contain` in docs
* #213 fix typos in readme
* #212 add test-kitchen example to readme
* #208 improved readme

## 0.8.0

* #105 add to_s methods to resources, fixes #98
* #106 Improve unit tests
* #110 make default rake tasks test+lint
* #111 Train
* #112 take care of ruby warnings
* #115 Fixes
* #116 test: group resource tests
* #117 Add support for `expect`
* #119 delivery: select build node on new fqdn
* #118 add first round of audit resource docs
* #122 move markdown docs to rst
* #114 simplify yum implementation
* #123 add resources, sync matcher patterns
* #124 fix the header structure
* #126 add test-kitchen example
* #127 add more usage headers
* #128 more CentOS support

## 0.7.0

* complete rewrite of execution backend for ssh and docker
* replace previous command execution layer
* replace previous file transfer mechanism
* rewrite os detection mechanism
* add more resources: apt, bond, bridge, group, host, interface, iptables, kernel_module, kernel_parameter, oneget, package, pip, port, user, script, service, windows_feature
* add unit tests for resources
* add backend tests with docker test infrastructure
* add tests with Chef Delivery
* full rubocop linting
* add vulcano shell feature
* rewrite mysql_conf to use simpleconfig
* improve debug output
* use mixlib-shellout instead of open4
* add basic docs


\* *This Change Log was automatically generated by [github_changelog_generator](https://github.com/skywinder/Github-Changelog-Generator)*
