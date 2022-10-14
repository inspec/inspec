# Change Log
<!-- usage documentation: http://expeditor-docs.es.chef.io/configuration/changelog/ -->
<!-- latest_release 6.1.0 -->
## [v6.1.0](https://github.com/inspec/inspec/tree/v6.1.0) (2022-09-30)

#### Merged Pull Requests
- CFINSPEC-246/CFINSPEC-247 Attestation changes for N/R outcomes [#6222](https://github.com/inspec/inspec/pull/6222) ([Nik08](https://github.com/Nik08))
<!-- latest_release -->

<!-- release_rollup since=5.18.14 -->
### Changes since 5.18.14 release

#### Merged Pull Requests
- CFINSPEC-246/CFINSPEC-247 Attestation changes for N/R outcomes [#6222](https://github.com/inspec/inspec/pull/6222) ([Nik08](https://github.com/Nik08)) <!-- 6.1.0 -->
- CFINSPEC-452 Added Inspec parallel logging for warn/error [#6245](https://github.com/inspec/inspec/pull/6245) ([Nik08](https://github.com/Nik08)) <!-- 6.0.1 -->
- Fix the dependabot adding  ffi (1.15.5-x64-unknown) to omnibus bump [#6213](https://github.com/inspec/inspec/pull/6213) ([Vasu1105](https://github.com/Vasu1105)) <!-- 5.20.1 -->
- Adds podman resources. [#6183](https://github.com/inspec/inspec/pull/6183) ([Vasu1105](https://github.com/Vasu1105)) <!-- 5.20.0 -->
- CFINSPEC-237 Added enhanced_outcomes option [#6145](https://github.com/inspec/inspec/pull/6145) ([Nik08](https://github.com/Nik08)) <!-- 5.19.0 -->
- CFINSPEC-400 Fix for verify pipeline failure [#6218](https://github.com/inspec/inspec/pull/6218) ([Vasu1105](https://github.com/Vasu1105)) <!-- 5.18.17 -->
- Docs spellcheck [#6214](https://github.com/inspec/inspec/pull/6214) ([IanMadd](https://github.com/IanMadd)) <!-- 5.18.16 -->
- Trivial README change to trigger new omnibus build [#6203](https://github.com/inspec/inspec/pull/6203) ([clintoncwolfe](https://github.com/clintoncwolfe)) <!-- 5.18.15 -->
<!-- release_rollup -->

<!-- latest_stable_release -->
## [v5.18.14](https://github.com/inspec/inspec/tree/v5.18.14) (2022-07-13)

#### Merged Pull Requests
- Bump rack from 2.2.3 to 2.2.3.1 in /omnibus [#6098](https://github.com/inspec/inspec/pull/6098) ([dependabot[bot]](https://github.com/dependabot[bot]))
- CFINSPEC-95: Enhance `x509_certificate` resource [#6041](https://github.com/inspec/inspec/pull/6041) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-267: resource_ids group 6 [#6101](https://github.com/inspec/inspec/pull/6101) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-262 Adds resource_id group 1 [#6102](https://github.com/inspec/inspec/pull/6102) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-266: resource_ids group 5 [#6103](https://github.com/inspec/inspec/pull/6103) ([ahasunos](https://github.com/ahasunos))
- Fix the key duplication error warning in the mock_loader.rb [#6120](https://github.com/inspec/inspec/pull/6120) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-268 Adds resource_id group 7 [#6105](https://github.com/inspec/inspec/pull/6105) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-269 Adds resource_id group 8 [#6107](https://github.com/inspec/inspec/pull/6107) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-265  Group 4 - Added resource_id in resources [#6109](https://github.com/inspec/inspec/pull/6109) ([Nik08](https://github.com/Nik08))
- CFINSPEC-270 Adds resource_id group9 [#6111](https://github.com/inspec/inspec/pull/6111) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-273 Adds resource_id group 12 [#6112](https://github.com/inspec/inspec/pull/6112) ([Vasu1105](https://github.com/Vasu1105))
- Handle resource_id in error situations [#6118](https://github.com/inspec/inspec/pull/6118) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-262 - Handle resource_id in error situation [#6119](https://github.com/inspec/inspec/pull/6119) ([Vasu1105](https://github.com/Vasu1105))
- Bump berkshelf from 8.0.0 to 8.0.2 in /omnibus [#6114](https://github.com/inspec/inspec/pull/6114) ([dependabot[bot]](https://github.com/dependabot[bot]))
- CFINSPEC-167: Profile Signing Rollup [#5995](https://github.com/inspec/inspec/pull/5995) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-291: Fix `processes` resource to consider processes without `path` on Windows [#6100](https://github.com/inspec/inspec/pull/6100) ([ahasunos](https://github.com/ahasunos))
- Fixed Lint/DuplicateMethods: Method Inspec::Resources::Service#resource_id is defined at both [#6132](https://github.com/inspec/inspec/pull/6132) ([Vasu1105](https://github.com/Vasu1105))
- Dk/matchers rewrite [#6007](https://github.com/inspec/inspec/pull/6007) ([dkumaras](https://github.com/dkumaras))
- Add inspec-6 branch as release branch [#6136](https://github.com/inspec/inspec/pull/6136) ([clintoncwolfe](https://github.com/clintoncwolfe))
- add ruby test 3.1 in verify pipeline [#5892](https://github.com/inspec/inspec/pull/5892) ([jayashrig158](https://github.com/jayashrig158))
- Updated plugins doc with send_report functionality [#6144](https://github.com/inspec/inspec/pull/6144) ([Nik08](https://github.com/Nik08))
- Bump octokit from 4.23.0 to 4.25.0 in /omnibus [#6146](https://github.com/inspec/inspec/pull/6146) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Fixes for Buildkite Issues [#6161](https://github.com/inspec/inspec/pull/6161) ([Nik08](https://github.com/Nik08))
- CFINSPEC-238 Enhanced Outcomes Design Doc [#6152](https://github.com/inspec/inspec/pull/6152) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add k8s section to resources index page [#6167](https://github.com/inspec/inspec/pull/6167) ([IanMadd](https://github.com/IanMadd))
- Windows fix for dependent profiles [#6173](https://github.com/inspec/inspec/pull/6173) ([Nik08](https://github.com/Nik08))
- Bump omnibus-software from `a9b13a0` to `7bb8c7b` in /omnibus [#6191](https://github.com/inspec/inspec/pull/6191) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Trial - Update the omnibus/Gemfile.lock (can be the reason for omnibus build failure) [#6195](https://github.com/inspec/inspec/pull/6195) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-239 Attestations Design Doc [#6188](https://github.com/inspec/inspec/pull/6188) ([clintoncwolfe](https://github.com/clintoncwolfe))
<!-- latest_stable_release -->

## [v5.17.4](https://github.com/inspec/inspec/tree/v5.17.4) (2022-05-25)

#### Merged Pull Requests
- chore: Set permissions for GitHub actions [#5990](https://github.com/inspec/inspec/pull/5990) ([neilnaveen](https://github.com/neilnaveen))
- CFINSPEC-88: Extend `file` resource documentation with be_mounted matcher [#5999](https://github.com/inspec/inspec/pull/5999) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-185: Updates inspec check cli docs to include --with-cookstyle option [#6000](https://github.com/inspec/inspec/pull/6000) ([Vasu1105](https://github.com/Vasu1105))
- Fix for issue 5809 Service checks failing on Amazon linux 2022 [#5998](https://github.com/inspec/inspec/pull/5998) ([ahasunos](https://github.com/ahasunos))
- Bump berkshelf from 7.2.2 to 8.0.0 in /omnibus [#6020](https://github.com/inspec/inspec/pull/6020) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Add a sample validation key, to be used in testing key fetching [#6030](https://github.com/inspec/inspec/pull/6030) ([clintoncwolfe](https://github.com/clintoncwolfe))
- CFINSPEC-96: Add `zfs` resource [#6004](https://github.com/inspec/inspec/pull/6004) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-250: Fix for inspec json command does not populate the inputs for the profile [#6056](https://github.com/inspec/inspec/pull/6056) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-252: Fix profile gem dependency installation is failing when  gem version is not specified [#6057](https://github.com/inspec/inspec/pull/6057) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-84: Add `x509_private_key` resource [#6018](https://github.com/inspec/inspec/pull/6018) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-90: Enhance `host` resource [#6045](https://github.com/inspec/inspec/pull/6045) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-92: Enhance `processes` resource [#5991](https://github.com/inspec/inspec/pull/5991) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-81: Add `php_config` resource [#6010](https://github.com/inspec/inspec/pull/6010) ([ahasunos](https://github.com/ahasunos))
- UNIT_TESTS: update yaml reporter test for Ruby 3+ [#6040](https://github.com/inspec/inspec/pull/6040) ([marijus-ravickas](https://github.com/marijus-ravickas))
- fixing bad markdown syntax [#6066](https://github.com/inspec/inspec/pull/6066) ([replicajune](https://github.com/replicajune))
- Add vale config to docs in inspec repository [#6065](https://github.com/inspec/inspec/pull/6065) ([IanMadd](https://github.com/IanMadd))
- Remove Hugo version from Netlify config [#6075](https://github.com/inspec/inspec/pull/6075) ([IanMadd](https://github.com/IanMadd))

## [v5.14.0](https://github.com/inspec/inspec/tree/v5.14.0) (2022-04-21)

#### Merged Pull Requests
- Fix unit test for service resource [#5980](https://github.com/inspec/inspec/pull/5980) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-75: Add default_gateway resource [#5979](https://github.com/inspec/inspec/pull/5979) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-181: Fix unable to upload inspec compliance profile using to… [#5989](https://github.com/inspec/inspec/pull/5989) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-87: Enhance `file` resource [#5986](https://github.com/inspec/inspec/pull/5986) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-93: Enhance `service` resource [#5981](https://github.com/inspec/inspec/pull/5981) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-89: Enhance `group` resource [#5987](https://github.com/inspec/inspec/pull/5987) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-78: Add `linux_audit_system` resource [#5988](https://github.com/inspec/inspec/pull/5988) ([ahasunos](https://github.com/ahasunos))

## [v5.12.2](https://github.com/inspec/inspec/tree/v5.12.2) (2022-04-08)

#### Merged Pull Requests
- Deprecation note for azurerm resources [#5923](https://github.com/inspec/inspec/pull/5923) ([IanMadd](https://github.com/IanMadd))
- Extend CI test timeout to 60 minutes [#5949](https://github.com/inspec/inspec/pull/5949) ([clintoncwolfe](https://github.com/clintoncwolfe))
- updates to reporting detail on progress bar [#5956](https://github.com/inspec/inspec/pull/5956) ([aaronlippold](https://github.com/aaronlippold))
- CFINSPEC-85: Enhance docker_container resource with have_volume matcher [#5944](https://github.com/inspec/inspec/pull/5944) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-86: Enhance docker_image resource [#5945](https://github.com/inspec/inspec/pull/5945) ([ahasunos](https://github.com/ahasunos))
- fix(service): ensure `installed: true` isn&#39;t always returned on FreeBSD [#5948](https://github.com/inspec/inspec/pull/5948) ([myii](https://github.com/myii))
- AliCloud Platform Instructions [#5960](https://github.com/inspec/inspec/pull/5960) ([dkumaras](https://github.com/dkumaras))
- CFINSPEC-94: Enhance user resource [#5959](https://github.com/inspec/inspec/pull/5959) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-80: Add mail alias resource [#5961](https://github.com/inspec/inspec/pull/5961) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-83: Add routing table resource [#5972](https://github.com/inspec/inspec/pull/5972) ([ahasunos](https://github.com/ahasunos))
- Bump omnibus-software from `82b14e3` to `960cb6e` in /omnibus [#5973](https://github.com/inspec/inspec/pull/5973) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Move shortcodes from chef-web-docs to inspec repo [#5969](https://github.com/inspec/inspec/pull/5969) ([IanMadd](https://github.com/IanMadd))

## [v5.10.5](https://github.com/inspec/inspec/tree/v5.10.5) (2022-03-23)

#### Merged Pull Requests
- Update docs makefile [#5927](https://github.com/inspec/inspec/pull/5927) ([IanMadd](https://github.com/IanMadd))
- CFINSPEC-1 Adds the ability to detect the Kubernetes container and Podman container. [#5796](https://github.com/inspec/inspec/pull/5796) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-79: Add linux container resource [#5921](https://github.com/inspec/inspec/pull/5921) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-82: Add ppa resource  [#5931](https://github.com/inspec/inspec/pull/5931) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-73: Add cgroup resource [#5935](https://github.com/inspec/inspec/pull/5935) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-154: postgres_session resource allow query errors to be treat as failures. [#5937](https://github.com/inspec/inspec/pull/5937) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-118 Description added in plugin list and search command [#5936](https://github.com/inspec/inspec/pull/5936) ([Nik08](https://github.com/Nik08))
- CFINSPEC-156 Oracle query fix when empty result [#5938](https://github.com/inspec/inspec/pull/5938) ([Nik08](https://github.com/Nik08))
- Bump omnibus-software from `5947560` to `82b14e3` in /omnibus [#5940](https://github.com/inspec/inspec/pull/5940) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Fix plugin list smoke test [#5946](https://github.com/inspec/inspec/pull/5946) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v5.7.9](https://github.com/inspec/inspec/tree/v5.7.9) (2022-03-17)

#### New Features
- Added Timezone Resource [#5758](https://github.com/inspec/inspec/pull/5758) ([Nik08](https://github.com/Nik08))
- Adds user_permissions property and be_inherited matcher to the registry_key resource [#5778](https://github.com/inspec/inspec/pull/5778) ([Vasu1105](https://github.com/Vasu1105))
- Adds user_permissions property and be_inherited matcher to the file resource for Windows. [#5775](https://github.com/inspec/inspec/pull/5775) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-3 Added kernel_parameters resource [#5782](https://github.com/inspec/inspec/pull/5782) ([Nik08](https://github.com/Nik08))

#### Merged Pull Requests
- Bump Hugo to 0.91.2 [#5780](https://github.com/inspec/inspec/pull/5780) ([IanMadd](https://github.com/IanMadd))
- Adds esx platform support for bash resource [#5785](https://github.com/inspec/inspec/pull/5785) ([Vasu1105](https://github.com/Vasu1105))
- Bump omnibus-software from `d2525ab` to `94ef29b` in /omnibus [#5788](https://github.com/inspec/inspec/pull/5788) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Remove support for EOL Ruby 2.5 [#5783](https://github.com/inspec/inspec/pull/5783) ([tas50](https://github.com/tas50))
- Fix downloads links [#5773](https://github.com/inspec/inspec/pull/5773) ([IanMadd](https://github.com/IanMadd))
- Fix broken link in README. Obvious fix. [#5772](https://github.com/inspec/inspec/pull/5772) ([guyzyl](https://github.com/guyzyl))
- Mssql session fix : Parsing multiline results [#5776](https://github.com/inspec/inspec/pull/5776) ([Nik08](https://github.com/Nik08))
- Check for latest - package resource [#5771](https://github.com/inspec/inspec/pull/5771) ([Nik08](https://github.com/Nik08))
- Latest package version fetching regex fix - Package resource [#5797](https://github.com/inspec/inspec/pull/5797) ([Nik08](https://github.com/Nik08))
- Bump omnibus-software from `94ef29b` to `c2fb9a4` in /omnibus [#5804](https://github.com/inspec/inspec/pull/5804) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Fix for dependent profiles to run with --insecure [#5799](https://github.com/inspec/inspec/pull/5799) ([Nik08](https://github.com/Nik08))
- IP Table resource: Added option to ignore rule comments [#5777](https://github.com/inspec/inspec/pull/5777) ([Nik08](https://github.com/Nik08))
- Bump omnibus-software from `c2fb9a4` to `b646bed` in /omnibus [#5808](https://github.com/inspec/inspec/pull/5808) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Bump ffi from 1.15.4 to 1.15.5 in /omnibus [#5791](https://github.com/inspec/inspec/pull/5791) ([dependabot[bot]](https://github.com/dependabot[bot]))
- CFINSPEC-4 Fix in grub_conf resource to capture non indented grub conf values [#5810](https://github.com/inspec/inspec/pull/5810) ([Nik08](https://github.com/Nik08))
- CFINSPEC-5 Added more detailed description about waivers expiration date. [#5806](https://github.com/inspec/inspec/pull/5806) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-15 Allows inheritance of core resource into the custom resource. [#5816](https://github.com/inspec/inspec/pull/5816) ([Vasu1105](https://github.com/Vasu1105))
- [WIP] Setting up test coverage reporting [#5823](https://github.com/inspec/inspec/pull/5823) ([clintoncwolfe](https://github.com/clintoncwolfe))
- CFINSPEC-30 Fix sestatus command not found error on Amazon Linux 2 [#5828](https://github.com/inspec/inspec/pull/5828) ([Vasu1105](https://github.com/Vasu1105))
- Bump omnibus-software from `b646bed` to `c7a43ec` in /omnibus [#5824](https://github.com/inspec/inspec/pull/5824) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Bump omnibus from `2bf77bb` to `55e74ac` in /omnibus [#5813](https://github.com/inspec/inspec/pull/5813) ([dependabot[bot]](https://github.com/dependabot[bot]))
- CFINSPEC-38 Adds new release branch for InSpec 5 release. [#5835](https://github.com/inspec/inspec/pull/5835) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-38 Adds label in expeditor configuration file for major version bump [#5839](https://github.com/inspec/inspec/pull/5839) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-43 Init plugin functionality extended for streaming_reporter [#5836](https://github.com/inspec/inspec/pull/5836) ([Nik08](https://github.com/Nik08))
- Resolve bugs detected on SonarCloud [#5845](https://github.com/inspec/inspec/pull/5845) ([ahasunos](https://github.com/ahasunos))
- Bump omnibus-software from `c7a43ec` to `a4f4849` in /omnibus [#5849](https://github.com/inspec/inspec/pull/5849) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Fix The Broken Links [#5840](https://github.com/inspec/inspec/pull/5840) ([dishanktiwari2501](https://github.com/dishanktiwari2501))
- CFINSPEC-17 Ruby 3 support [#5822](https://github.com/inspec/inspec/pull/5822) ([Vasu1105](https://github.com/Vasu1105))
- Update README to update ruby version support. [#5855](https://github.com/inspec/inspec/pull/5855) ([Vasu1105](https://github.com/Vasu1105))
- Add sonarscanner [#5856](https://github.com/inspec/inspec/pull/5856) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Make sure verify pipeline is marked public [#5858](https://github.com/inspec/inspec/pull/5858) ([clintoncwolfe](https://github.com/clintoncwolfe))
- CFINSPEC-38: Fix test failing after release branch update. [#5862](https://github.com/inspec/inspec/pull/5862) ([Vasu1105](https://github.com/Vasu1105))
- Always expire the git cache when running omnibus jobs [#5865](https://github.com/inspec/inspec/pull/5865) ([clintoncwolfe](https://github.com/clintoncwolfe))
- CFINSPEC-45: Update rspec version to 3.11 [#5837](https://github.com/inspec/inspec/pull/5837) ([Vasu1105](https://github.com/Vasu1105))
- Descriptions for all the schema attributes [#5790](https://github.com/inspec/inspec/pull/5790) ([Amndeep7](https://github.com/Amndeep7))
- CFINSPEC-2 Added options to allow winrm SSL connection with certificates  [#5793](https://github.com/inspec/inspec/pull/5793) ([Nik08](https://github.com/Nik08))
- Delete resource docs from inspec/inspec [#5868](https://github.com/inspec/inspec/pull/5868) ([IanMadd](https://github.com/IanMadd))
- No diff fix [#5884](https://github.com/inspec/inspec/pull/5884) ([wdower](https://github.com/wdower))
- CFINSPEC-39 Set sonarscanner options using properties file [#5872](https://github.com/inspec/inspec/pull/5872) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Pin openssl to 1.1.1m [#5851](https://github.com/inspec/inspec/pull/5851) ([jayashrig158](https://github.com/jayashrig158))
- CFINSPEC-125 Cassandra unit test fix for windows [#5894](https://github.com/inspec/inspec/pull/5894) ([Nik08](https://github.com/Nik08))
- CFINSPEC-123 Automate version command fix [#5893](https://github.com/inspec/inspec/pull/5893) ([Nik08](https://github.com/Nik08))
- Disable resource integration tests [#5898](https://github.com/inspec/inspec/pull/5898) ([clintoncwolfe](https://github.com/clintoncwolfe))
- CFINSPEC-70 Added resource_id attribute for the custom resources in the base class [#5875](https://github.com/inspec/inspec/pull/5875) ([Nik08](https://github.com/Nik08))
- CFINSPEC-77 : Add Ipnat resource [#5883](https://github.com/inspec/inspec/pull/5883) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-66 : Add Ipfilter resource [#5880](https://github.com/inspec/inspec/pull/5880) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-70 Revert - Added resource_id attribute for the custom resources in the base class [#5901](https://github.com/inspec/inspec/pull/5901) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Temporarily disable habitat builds to unbreak the pipeline [#5904](https://github.com/inspec/inspec/pull/5904) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Disable habitat build and artifact pipeline defs, too [#5906](https://github.com/inspec/inspec/pull/5906) ([clintoncwolfe](https://github.com/clintoncwolfe))
- CFINSPEC-70 resource_id support take 3 [#5903](https://github.com/inspec/inspec/pull/5903) ([clintoncwolfe](https://github.com/clintoncwolfe))
- CFINSPEC-10 Added Progress Bar streaming reporter plugin [#5863](https://github.com/inspec/inspec/pull/5863) ([Nik08](https://github.com/Nik08))
- Bump omnibus-software from `a4f4849` to `5947560` in /omnibus [#5911](https://github.com/inspec/inspec/pull/5911) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Enable habitat builds [#5912](https://github.com/inspec/inspec/pull/5912) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Bump omnibus from `55e74ac` to `124d596` in /omnibus [#5847](https://github.com/inspec/inspec/pull/5847) ([dependabot[bot]](https://github.com/dependabot[bot]))
- CFINSPEC-13:  Adds support for specifying gem dependencies in the metadata file of InSpec Profile. [#5871](https://github.com/inspec/inspec/pull/5871) ([Vasu1105](https://github.com/Vasu1105))
- Fix failing test for ibmdb2_session resource. [#5909](https://github.com/inspec/inspec/pull/5909) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-74 Adds the cron resource. [#5891](https://github.com/inspec/inspec/pull/5891) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-26: Adds entitlement_id field in metadata file [#5914](https://github.com/inspec/inspec/pull/5914) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-128 : Create a resource generator [#5913](https://github.com/inspec/inspec/pull/5913) ([ahasunos](https://github.com/ahasunos))
- [W.I.P] CFINSPEC-68 Adds target_id in the reporter. [#5895](https://github.com/inspec/inspec/pull/5895) ([Vasu1105](https://github.com/Vasu1105))
- CFINSPEC-129 Removed cloud resources ( AWS &amp; Azure ) from inspec-core [#5915](https://github.com/inspec/inspec/pull/5915) ([Nik08](https://github.com/Nik08))
- Firewalld update -- exposed more fields, updated docs, added custom matchers [#5597](https://github.com/inspec/inspec/pull/5597) ([wdower](https://github.com/wdower))
- Fix test failure for plugin due to ambiguity in method name [#5920](https://github.com/inspec/inspec/pull/5920) ([ahasunos](https://github.com/ahasunos))
- CFINSPEC-137: Deprecate --target-id option [#5918](https://github.com/inspec/inspec/pull/5918) ([Vasu1105](https://github.com/Vasu1105))
- RESOURCE-312 extend filter table to lazy loading for resource instances [#5916](https://github.com/inspec/inspec/pull/5916) ([sathish-progress](https://github.com/sathish-progress))
- Update copyright year in README [#5928](https://github.com/inspec/inspec/pull/5928) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.52.9](https://github.com/inspec/inspec/tree/v4.52.9) (2021-12-20)

#### New Features
- Target support for Alpine Linux [#5744](https://github.com/inspec/inspec/pull/5744) ([Nik08](https://github.com/Nik08))
- Implemented CLI option for executing private supermarket profiles [#5749](https://github.com/inspec/inspec/pull/5749) ([Nik08](https://github.com/Nik08))

#### Bug Fixes
- Fix ibmdb2_session resource : Added double quotes around the IBM db2 query [#5742](https://github.com/inspec/inspec/pull/5742) ([Vasu1105](https://github.com/Vasu1105))

#### Merged Pull Requests
- Fix typos and improve code highlighting in docs [#5692](https://github.com/inspec/inspec/pull/5692) ([tas50](https://github.com/tas50))
- Update dsl_inspec.md [#5721](https://github.com/inspec/inspec/pull/5721) ([paulcalabro](https://github.com/paulcalabro))
- Remove the instance_eval and eval_gemfile calls in omnibus [#5733](https://github.com/inspec/inspec/pull/5733) ([tas50](https://github.com/tas50))
- Fix docs to make property listing in the website docs more useful. [#5677](https://github.com/inspec/inspec/pull/5677) ([Vasu1105](https://github.com/Vasu1105))
- Fix FreeBSD service enabled check substring edge-case [#5606](https://github.com/inspec/inspec/pull/5606) ([zofrex](https://github.com/zofrex))
- Bump omnibus-software from `24f508c` to `7501e20` in /omnibus [#5735](https://github.com/inspec/inspec/pull/5735) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Bump omnibus from `37897ad` to `2c309fa` in /omnibus [#5736](https://github.com/inspec/inspec/pull/5736) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Bump test-kitchen from 3.1.0 to 3.2.0 in /omnibus [#5737](https://github.com/inspec/inspec/pull/5737) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Fixes some minor docs formatting problems [#5739](https://github.com/inspec/inspec/pull/5739) ([IanMadd](https://github.com/IanMadd))
- Bump kitchen-vagrant from 1.10.0 to 1.11.0 in /omnibus [#5740](https://github.com/inspec/inspec/pull/5740) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Bump omnibus-software from `7501e20` to `8560231` in /omnibus [#5752](https://github.com/inspec/inspec/pull/5752) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Stop producing packages for macOS 10.14 [#5716](https://github.com/inspec/inspec/pull/5716) ([tas50](https://github.com/tas50))
- Bump test-kitchen from 3.2.0 to 3.2.2 in /omnibus [#5755](https://github.com/inspec/inspec/pull/5755) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Oracle session fix when nil in query output [#5717](https://github.com/inspec/inspec/pull/5717) ([Nik08](https://github.com/Nik08))
- Fix docs to make property listing in the website docs more useful. [#5746](https://github.com/inspec/inspec/pull/5746) ([Vasu1105](https://github.com/Vasu1105))
- Fix a bunch of docs formatting problems [#5763](https://github.com/inspec/inspec/pull/5763) ([IanMadd](https://github.com/IanMadd))
- Fix: Alpine packages list command to only list installed packages [#5765](https://github.com/inspec/inspec/pull/5765) ([Nik08](https://github.com/Nik08))
- Bump omnibus-software from `8560231` to `d2525ab` in /omnibus [#5767](https://github.com/inspec/inspec/pull/5767) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Bump omnibus from `2c309fa` to `2bf77bb` in /omnibus [#5764](https://github.com/inspec/inspec/pull/5764) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Active support version fix for ruby versions less then 2.7 [#5770](https://github.com/inspec/inspec/pull/5770) ([Nik08](https://github.com/Nik08))
- Apply cookstyle to the example profile [#5680](https://github.com/inspec/inspec/pull/5680) ([tas50](https://github.com/tas50))
- Adds tls1.3 support in ssl resource. [#5762](https://github.com/inspec/inspec/pull/5762) ([Vasu1105](https://github.com/Vasu1105))

## [v4.50.3](https://github.com/inspec/inspec/tree/v4.50.3) (2021-11-19)

#### New Features
- Add Windows support for http resource. [#5697](https://github.com/inspec/inspec/pull/5697) ([Vasu1105](https://github.com/Vasu1105))

#### Bug Fixes
- Updates habitat test for windows to match install logic for linux [#5718](https://github.com/inspec/inspec/pull/5718) ([collinmcneese](https://github.com/collinmcneese))

#### Merged Pull Requests
- Move cookstyle dep from inspec gemspec to inspec-core, add rake [#5722](https://github.com/inspec/inspec/pull/5722) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Disable CookStyle integration on Windows  [#5724](https://github.com/inspec/inspec/pull/5724) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Move rake and cookstyle deps out of inspec core gemspec [#5732](https://github.com/inspec/inspec/pull/5732) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Remove license note + update resource count in main docs page [#5639](https://github.com/inspec/inspec/pull/5639) ([tas50](https://github.com/tas50))

## [v4.49.0](https://github.com/inspec/inspec/tree/v4.49.0) (2021-10-27)

#### New Features
- Add support for Cassandra DB [#5683](https://github.com/inspec/inspec/pull/5683) ([Nik08](https://github.com/Nik08))

#### Merged Pull Requests
- Replaced /main/ from /master/ [#5678](https://github.com/inspec/inspec/pull/5678) ([dishanktiwari2501](https://github.com/dishanktiwari2501))
- Add back Ubuntu 16.04 packages + testing [#5689](https://github.com/inspec/inspec/pull/5689) ([tas50](https://github.com/tas50))
- Update OpenSSL on macOS to 1.1.1l [#5687](https://github.com/inspec/inspec/pull/5687) ([tas50](https://github.com/tas50))
- Update the unit test files to use latest versions of OS rather than the older.  [#5681](https://github.com/inspec/inspec/pull/5681) ([Vasu1105](https://github.com/Vasu1105))
- Improvements to the inspec.yml docs [#5679](https://github.com/inspec/inspec/pull/5679) ([tas50](https://github.com/tas50))
- Update GCS Storage class list [#5676](https://github.com/inspec/inspec/pull/5676) ([pradeepbhadani](https://github.com/pradeepbhadani))
- Group &amp; User Resources - Resolve name case-sensitivity issue for windows [#5667](https://github.com/inspec/inspec/pull/5667) ([Nik08](https://github.com/Nik08))
- Renamed Inspec DSL to Inspec Language [#5694](https://github.com/inspec/inspec/pull/5694) ([dishanktiwari2501](https://github.com/dishanktiwari2501))
- Fix google_container_node_pool.md [#5696](https://github.com/inspec/inspec/pull/5696) ([pradeepbhadani](https://github.com/pradeepbhadani))
- Enable repeatable builds by bundling Gemfile.lock [#5688](https://github.com/inspec/inspec/pull/5688) ([tas50](https://github.com/tas50))
- Oracle db session resource fix - when invoking query using os user and db role [#5702](https://github.com/inspec/inspec/pull/5702) ([Nik08](https://github.com/Nik08))
- Fix Oracle db session resource issues  [#5706](https://github.com/inspec/inspec/pull/5706) ([Nik08](https://github.com/Nik08))
- InSpec Waivers: --filter-waived-controls [#5327](https://github.com/inspec/inspec/pull/5327) ([Schwad](https://github.com/Schwad))
- Fix windows_firewall resource fails to validate more than 1 rule depending on how it&#39;s executed [#5704](https://github.com/inspec/inspec/pull/5704) ([Vasu1105](https://github.com/Vasu1105))
- Integrate InSpec check with Cookstyle [#5618](https://github.com/inspec/inspec/pull/5618) ([Nik08](https://github.com/Nik08))

## [v4.46.13](https://github.com/inspec/inspec/tree/v4.46.13) (2021-09-30)

#### New Features
- Add support for Sybase databases [#5561](https://github.com/inspec/inspec/pull/5561) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add ibmdb2_conf and ibmdb2_session resource [#5614](https://github.com/inspec/inspec/pull/5614) ([Vasu1105](https://github.com/Vasu1105))
- adds chrony_conf InSpec resource [#5589](https://github.com/inspec/inspec/pull/5589) ([collinmcneese](https://github.com/collinmcneese))

#### Enhancements
- Add csv without headers support in csv resource [#5665](https://github.com/inspec/inspec/pull/5665) ([Vasu1105](https://github.com/Vasu1105))
- Add option in `postgres_session` resource to establish socket connection [#5664](https://github.com/inspec/inspec/pull/5664) ([Nik08](https://github.com/Nik08))

#### Bug Fixes
- Fix main in expeditor script [#5669](https://github.com/inspec/inspec/pull/5669) ([kagarmoe](https://github.com/kagarmoe))
- Fix --tags filter for dependent profiles [#5657](https://github.com/inspec/inspec/pull/5657) ([Nik08](https://github.com/Nik08))

#### Merged Pull Requests
- Add labeler workflow with docs label [#5655](https://github.com/inspec/inspec/pull/5655) ([IanMadd](https://github.com/IanMadd))
- Docs edits [#5654](https://github.com/inspec/inspec/pull/5654) ([IanMadd](https://github.com/IanMadd))
- Fix branch name in docs makefile [#5660](https://github.com/inspec/inspec/pull/5660) ([IanMadd](https://github.com/IanMadd))
- Update inspec check docs for --format option [#5617](https://github.com/inspec/inspec/pull/5617) ([Vasu1105](https://github.com/Vasu1105))
- Add support for Mssql Conf resource [#5574](https://github.com/inspec/inspec/pull/5574) ([Nik08](https://github.com/Nik08))
- Add support for Oracle Configuration Resources (Oracle Db Conf &amp; Oracle Listener Conf) [#5573](https://github.com/inspec/inspec/pull/5573) ([Nik08](https://github.com/Nik08))
- Added missing cli commands in cli doc [#5634](https://github.com/inspec/inspec/pull/5634) ([Nik08](https://github.com/Nik08))
- Fix google_project_alert_policy Examples in the docs [#5426](https://github.com/inspec/inspec/pull/5426) ([wmetaw](https://github.com/wmetaw))
- Update code to remove ruby 2.4 support [#5645](https://github.com/inspec/inspec/pull/5645) ([Vasu1105](https://github.com/Vasu1105))
- Minor docs fixes. [#5662](https://github.com/inspec/inspec/pull/5662) ([IanMadd](https://github.com/IanMadd))
- Add rocky and almalinux to service resource [#5604](https://github.com/inspec/inspec/pull/5604) ([sspans-sbp](https://github.com/sspans-sbp))
- Change the deprecation warning to mention inputs [#5668](https://github.com/inspec/inspec/pull/5668) ([damacus](https://github.com/damacus))
- Build packages for debian 11, macos 12, windows 11/2022 [#5675](https://github.com/inspec/inspec/pull/5675) ([tas50](https://github.com/tas50))
- Fix --controls option was not working for dependent profile [#5656](https://github.com/inspec/inspec/pull/5656) ([Vasu1105](https://github.com/Vasu1105))
- Fix opa_cli and opa_api resource unable to verify empty result {} [#5671](https://github.com/inspec/inspec/pull/5671) ([Vasu1105](https://github.com/Vasu1105))

## [v4.41.20](https://github.com/inspec/inspec/tree/v4.41.20) (2021-09-01)

#### Merged Pull Requests
- Build fix for ruby version 2.5 - HTML Proofer gem installation error  [#5610](https://github.com/inspec/inspec/pull/5610) ([Nik08](https://github.com/Nik08))
- Fix range based filtering in filter tables [#5598](https://github.com/inspec/inspec/pull/5598) ([Nik08](https://github.com/Nik08))
- Fix apache_conf issue when Server Root is not present in configuration [#5601](https://github.com/inspec/inspec/pull/5601) ([Nik08](https://github.com/Nik08))
- Fix `--insecure` not working with profile  [#5600](https://github.com/inspec/inspec/pull/5600) ([Nik08](https://github.com/Nik08))
- Fix `--chef-license=accept` option to only show license accepted message [#5609](https://github.com/inspec/inspec/pull/5609) ([Nik08](https://github.com/Nik08))
- Fix postgres_session error Unable to connect to database [#5619](https://github.com/inspec/inspec/pull/5619) ([Vasu1105](https://github.com/Vasu1105))
- Fix merging of included conf and main conf params in apache conf  [#5623](https://github.com/inspec/inspec/pull/5623) ([Nik08](https://github.com/Nik08))
- Add aliyun3 support to service resource [#5578](https://github.com/inspec/inspec/pull/5578) ([elsnepal](https://github.com/elsnepal))
- Fedora runtime support documented [#5628](https://github.com/inspec/inspec/pull/5628) ([Nik08](https://github.com/Nik08))
- Updated inspec-aws git url to replace branch to master to main [#5637](https://github.com/inspec/inspec/pull/5637) ([Vasu1105](https://github.com/Vasu1105))
- Replace use of wmic from security_identifier resource as it will be deprecated soon [#5636](https://github.com/inspec/inspec/pull/5636) ([Vasu1105](https://github.com/Vasu1105))
- Updated security_policy resource docs [#5633](https://github.com/inspec/inspec/pull/5633) ([Vasu1105](https://github.com/Vasu1105))
- Added info about the Minitest framework in contributing doc [#5630](https://github.com/inspec/inspec/pull/5630) ([Nik08](https://github.com/Nik08))
- Fix for security_policy resource does not return array for local groups [#5629](https://github.com/inspec/inspec/pull/5629) ([Vasu1105](https://github.com/Vasu1105))
- Proposed implementation for installation warnings [#5625](https://github.com/inspec/inspec/pull/5625) ([tecracer-theinen](https://github.com/tecracer-theinen))
- Update location of default branch for omnibus and omnibus-software [#5648](https://github.com/inspec/inspec/pull/5648) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix url fetcher when default git profile branch is not master [#5638](https://github.com/inspec/inspec/pull/5638) ([Nik08](https://github.com/Nik08))
- Fix tags processing issue in profiles [#5643](https://github.com/inspec/inspec/pull/5643) ([Nik08](https://github.com/Nik08))

## [v4.41.2](https://github.com/inspec/inspec/tree/v4.41.2) (2021-08-16)

#### New Features
- Add support for OPA: add resource opa_cli and opa_api [#5592](https://github.com/inspec/inspec/pull/5592) ([Vasu1105](https://github.com/Vasu1105))

#### Bug Fixes
- Pin mongo gem to 2.13.2 to avoid broken symlink [#5615](https://github.com/inspec/inspec/pull/5615) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Add mongodb_session resource and docs. [#5572](https://github.com/inspec/inspec/pull/5572) ([Vasu1105](https://github.com/Vasu1105))
- Filter active controls in profile by tags [#5596](https://github.com/inspec/inspec/pull/5596) ([Nik08](https://github.com/Nik08))
- Remove empty .gitmodules file [#5616](https://github.com/inspec/inspec/pull/5616) ([tduffield](https://github.com/tduffield))
- Fix the typo in documentation file for opa_api resource [#5608](https://github.com/inspec/inspec/pull/5608) ([Vasu1105](https://github.com/Vasu1105))

## [v4.38.9](https://github.com/inspec/inspec/tree/v4.38.9) (2021-07-22)

#### Enhancements
- Remove default port for mssql_session, allowing named connections [#5584](https://github.com/inspec/inspec/pull/5584) ([Nik08](https://github.com/Nik08))
- Update postgresql resources to normalize it for platform supports  [#5576](https://github.com/inspec/inspec/pull/5576) ([Vasu1105](https://github.com/Vasu1105))

#### Merged Pull Requests
- Oracle Session Exception Handling [#5567](https://github.com/inspec/inspec/pull/5567) ([Nik08](https://github.com/Nik08))
- Waiver file expiration dates misinterpretation fix [#5586](https://github.com/inspec/inspec/pull/5586) ([Nik08](https://github.com/Nik08))
- Need to back out x25519 gem as its causing issues for ssh [#5590](https://github.com/inspec/inspec/pull/5590) ([Vasu1105](https://github.com/Vasu1105))
- Use ruby 2.7.4 [#5602](https://github.com/inspec/inspec/pull/5602) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Remove mention of AWS tests from README [#5603](https://github.com/inspec/inspec/pull/5603) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.38.3](https://github.com/inspec/inspec/tree/v4.38.3) (2021-07-02)

#### Merged Pull Requests
- Add support for mongodb_conf resource in InSpec [#5562](https://github.com/inspec/inspec/pull/5562) ([Vasu1105](https://github.com/Vasu1105))
- Fix AWS secret key environment variable name in docs [#5566](https://github.com/inspec/inspec/pull/5566) ([sandratiffin](https://github.com/sandratiffin))
- Fix relative links [#5556](https://github.com/inspec/inspec/pull/5556) ([IanMadd](https://github.com/IanMadd))
- Misc updates to the README [#5526](https://github.com/inspec/inspec/pull/5526) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.37.30](https://github.com/inspec/inspec/tree/v4.37.30) (2021-06-16)

#### Bug Fixes
- Include x25519 KEX module in omnibus build [#5563](https://github.com/inspec/inspec/pull/5563) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Minor MD reformatting for dev-docs page [#5550](https://github.com/inspec/inspec/pull/5550) ([IanMadd](https://github.com/IanMadd))
- Fix mysql_session resource to raise exception if there is a error in connection or in query [#5551](https://github.com/inspec/inspec/pull/5551) ([Vasu1105](https://github.com/Vasu1105))
- Fix postgres_session resource to raise exception if there is a error in connection or in query [#5553](https://github.com/inspec/inspec/pull/5553) ([Vasu1105](https://github.com/Vasu1105))
- Restrict x25519 gem to x86 architectures [#5564](https://github.com/inspec/inspec/pull/5564) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.37.25](https://github.com/inspec/inspec/tree/v4.37.25) (2021-06-10)

#### Merged Pull Requests
- sshd_config is for daemon, not client - typo [#5549](https://github.com/inspec/inspec/pull/5549) ([jblaine](https://github.com/jblaine))
- Fix related to loading dependent profiles from a profile in shell [#5547](https://github.com/inspec/inspec/pull/5547) ([Nik08](https://github.com/Nik08))

## [v4.37.23](https://github.com/inspec/inspec/tree/v4.37.23) (2021-06-03)

#### Merged Pull Requests
- Update inspec init plugin  [#5536](https://github.com/inspec/inspec/pull/5536) ([Vasu1105](https://github.com/Vasu1105))
- Removed support for compliance and a1 server from InSpec compliance [#5534](https://github.com/inspec/inspec/pull/5534) ([Nik08](https://github.com/Nik08))
- Add Ubuntu to list of FIPS platforms [#5533](https://github.com/inspec/inspec/pull/5533) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.37.20](https://github.com/inspec/inspec/tree/v4.37.20) (2021-05-26)

#### Merged Pull Requests
- Added new automate doc link for login tokens in `inspec automate login --help` command [#5529](https://github.com/inspec/inspec/pull/5529) ([Nik08](https://github.com/Nik08))
- Bugfix for `inspec detect --no-color` to not return colourful output [#5530](https://github.com/inspec/inspec/pull/5530) ([Nik08](https://github.com/Nik08))
- Drop EOL Ubuntu 16.04, build on 18.04 [#5532](https://github.com/inspec/inspec/pull/5532) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.37.17](https://github.com/inspec/inspec/tree/v4.37.17) (2021-05-20)

#### Enhancements
- Fix for port resource performance: adding more specific search while using ss command [#5522](https://github.com/inspec/inspec/pull/5522) ([Vasu1105](https://github.com/Vasu1105))

#### Merged Pull Requests
- Fix the lint and failing test for windows_feature resource [#5524](https://github.com/inspec/inspec/pull/5524) ([Vasu1105](https://github.com/Vasu1105))
- Support zfs_pool and zfs_dataset resources on Linux. Handled #5075 [#5523](https://github.com/inspec/inspec/pull/5523) ([kannanr](https://github.com/kannanr))
- Add basic docs for toml resource [#5514](https://github.com/inspec/inspec/pull/5514) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add CI-CD docs [#5489](https://github.com/inspec/inspec/pull/5489) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add explicit RHEL8 builders to omnibus build [#5527](https://github.com/inspec/inspec/pull/5527) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Changes returns nil on file non-existence through matcher `more_permissive_than` [#5519](https://github.com/inspec/inspec/pull/5519) ([Nik08](https://github.com/Nik08))
- Update control-eval Readme docs. [#5516](https://github.com/inspec/inspec/pull/5516) ([Vasu1105](https://github.com/Vasu1105))
- Added Common Errors page doc [#5517](https://github.com/inspec/inspec/pull/5517) ([Nik08](https://github.com/Nik08))

## [v4.37.8](https://github.com/inspec/inspec/tree/v4.37.8) (2021-05-12)

#### Merged Pull Requests
- Update `bond0` example to use params properly [#5518](https://github.com/inspec/inspec/pull/5518) ([gscho](https://github.com/gscho))
- HTTP resource response body coerced into UTF-8 [#5510](https://github.com/inspec/inspec/pull/5510) ([Nik08](https://github.com/Nik08))
- Fixed `automate login` fake feedback on failure [#5509](https://github.com/inspec/inspec/pull/5509) ([Nik08](https://github.com/Nik08))
- Document auxiliary reporter options on the reporter docs page [#5504](https://github.com/inspec/inspec/pull/5504) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update chefstyle requirement from ~&gt; 1.7.1 to ~&gt; 2.0.3 [#5508](https://github.com/inspec/inspec/pull/5508) ([dependabot[bot]](https://github.com/dependabot[bot]))
- Update Hugo and correct how build previews are generated [#5507](https://github.com/inspec/inspec/pull/5507) ([IanMadd](https://github.com/IanMadd))
- Modified windows_feature to indicate enabled rather than just available [#5506](https://github.com/inspec/inspec/pull/5506) ([jwdean](https://github.com/jwdean))
- Remove outdated instructions about testing AWS and Azure resources [#5499](https://github.com/inspec/inspec/pull/5499) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.37.0](https://github.com/inspec/inspec/tree/v4.37.0) (2021-05-05)

#### Enhancements
- Reinstate resource testing on supported platforms using Test-Kitchen [#5204](https://github.com/inspec/inspec/pull/5204) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- Fix : windows_firewall_rule fails to validate more than 1 rule depending on how it&#39;s executed  [#5502](https://github.com/inspec/inspec/pull/5502) ([Vasu1105](https://github.com/Vasu1105))

#### Merged Pull Requests
- Update openssl to 1.1.1k on macos [#5493](https://github.com/inspec/inspec/pull/5493) ([tas50](https://github.com/tas50))
- Update Ruby in omnibus packages to 2.7.3 [#5492](https://github.com/inspec/inspec/pull/5492) ([tas50](https://github.com/tas50))
- Make sure we use chef-telemetry 1.0.8+ [#5491](https://github.com/inspec/inspec/pull/5491) ([tas50](https://github.com/tas50))
- Upgrade to GitHub-native Dependabot [#5488](https://github.com/inspec/inspec/pull/5488) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Fixes for the integration-resources pipeline [#5501](https://github.com/inspec/inspec/pull/5501) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix bad link [#5498](https://github.com/inspec/inspec/pull/5498) ([IanMadd](https://github.com/IanMadd))
- Fix  undefined method `+&#39; for nil:NilClass\n\nProfile: - when using profile dependencies and require_controls [#5487](https://github.com/inspec/inspec/pull/5487) ([Vasu1105](https://github.com/Vasu1105))
- Remove coverage testing [#5500](https://github.com/inspec/inspec/pull/5500) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Added alias command `automate` for `inspec compliance` [#5490](https://github.com/inspec/inspec/pull/5490) ([Nik08](https://github.com/Nik08))

## [v4.36.4](https://github.com/inspec/inspec/tree/v4.36.4) (2021-04-29)

#### New Features
- Add selinux resource with basic feature support [#5458](https://github.com/inspec/inspec/pull/5458) ([Vasu1105](https://github.com/Vasu1105))
- New input option `pattern` added for DSL and metadata inputs [#5466](https://github.com/inspec/inspec/pull/5466) ([Nik08](https://github.com/Nik08))

#### Enhancements
- Add selinux resource support for modules and booleans [#5463](https://github.com/inspec/inspec/pull/5463) ([Vasu1105](https://github.com/Vasu1105))

#### Bug Fixes
- Fix for group resource when member does not exist [#5470](https://github.com/inspec/inspec/pull/5470) ([Nik08](https://github.com/Nik08))

#### Merged Pull Requests
- Update faraday requirement from &gt;= 0.9.0, &lt; 1.4 to &gt;= 0.9.0, &lt; 1.5 [#5469](https://github.com/inspec/inspec/pull/5469) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Minor fix - Method expected to return boolean but it was returning nil if condition check fails [#5480](https://github.com/inspec/inspec/pull/5480) ([Vasu1105](https://github.com/Vasu1105))
- updating Gemfile to support environment variables [#5485](https://github.com/inspec/inspec/pull/5485) ([jayashrig158](https://github.com/jayashrig158))
- Group &amp; Groups doc updated - about using local and etc groups [#5483](https://github.com/inspec/inspec/pull/5483) ([Nik08](https://github.com/Nik08))
- Added new property `members_array` for group &amp; groups resources. [#5479](https://github.com/inspec/inspec/pull/5479) ([Nik08](https://github.com/Nik08))

## [v4.33.1](https://github.com/inspec/inspec/tree/v4.33.1) (2021-04-21)

#### New Features
- Optionally include controls source code in CLI reporter [#5465](https://github.com/inspec/inspec/pull/5465) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Update postgres_ident_conf.md [#5461](https://github.com/inspec/inspec/pull/5461) ([tobiasbp](https://github.com/tobiasbp))
- Remove default of 3600 seconds for command timeout [#5472](https://github.com/inspec/inspec/pull/5472) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.32.0](https://github.com/inspec/inspec/tree/v4.32.0) (2021-04-14)

#### New Features
- Added ability to pass inputs to InSpec shell using input file and cli [#5452](https://github.com/inspec/inspec/pull/5452) ([Nik08](https://github.com/Nik08))

## [v4.31.1](https://github.com/inspec/inspec/tree/v4.31.1) (2021-04-08)

#### Bug Fixes
- Use default command timeout value if timeout is 0 [#5455](https://github.com/inspec/inspec/pull/5455) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.31.0](https://github.com/inspec/inspec/tree/v4.31.0) (2021-04-07)

#### New Features
- Add --docker-url CLI option [#5445](https://github.com/inspec/inspec/pull/5445) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Fix for Deprecation warning and FilterTable::ExceptionCatcher to show exact failure message. [#5441](https://github.com/inspec/inspec/pull/5441) ([Vasu1105](https://github.com/Vasu1105))
- Update inputs.md [#5449](https://github.com/inspec/inspec/pull/5449) ([IanMadd](https://github.com/IanMadd))
- Add timeout option to command resource [#5443](https://github.com/inspec/inspec/pull/5443) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update platforms doc [#5442](https://github.com/inspec/inspec/pull/5442) ([IanMadd](https://github.com/IanMadd))
- Bug fix for loading hashmap inputs consistently [#5446](https://github.com/inspec/inspec/pull/5446) ([Nik08](https://github.com/Nik08))

## [v4.29.3](https://github.com/inspec/inspec/tree/v4.29.3) (2021-03-25)

#### Bug Fixes
- Fix for -controls option is not working as expected. [#5434](https://github.com/inspec/inspec/pull/5434) ([Vasu1105](https://github.com/Vasu1105))
- Fix for executing git profiles independent of the name of the default branch [#5438](https://github.com/inspec/inspec/pull/5438) ([Nik08](https://github.com/Nik08))

#### Merged Pull Requests
- Minor Docs edits [#5433](https://github.com/inspec/inspec/pull/5433) ([IanMadd](https://github.com/IanMadd))
- Add quotation around -name option for apt resource to work properly with zsh [#5437](https://github.com/inspec/inspec/pull/5437) ([ymotongpoo](https://github.com/ymotongpoo))
- Updates profile init for cloud platforms to use inputs [#5435](https://github.com/inspec/inspec/pull/5435) ([collinmcneese](https://github.com/collinmcneese))
- Move Passthrough Config from Automate to JSON Reporter [#5430](https://github.com/inspec/inspec/pull/5430) ([tohch4](https://github.com/tohch4))
- Update codeowners for docs [#5440](https://github.com/inspec/inspec/pull/5440) ([IanMadd](https://github.com/IanMadd))
- Improve resource page menu titles [#5439](https://github.com/inspec/inspec/pull/5439) ([IanMadd](https://github.com/IanMadd))
- Add m1 support to MacOS build list [#5432](https://github.com/inspec/inspec/pull/5432) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.28.0](https://github.com/inspec/inspec/tree/v4.28.0) (2021-03-17)

#### New Features
- Support &#39;clear_cache&#39; [#5266](https://github.com/inspec/inspec/pull/5266) ([Schwad](https://github.com/Schwad))

#### Enhancements
- Fixes #5373 : Add option to filter empty profiles from report [#5425](https://github.com/inspec/inspec/pull/5425) ([Vasu1105](https://github.com/Vasu1105))

#### Bug Fixes
- Don&#39;t pass -u on AIX in crontab command [#5418](https://github.com/inspec/inspec/pull/5418) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add git to Docker build [#5420](https://github.com/inspec/inspec/pull/5420) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Remove .0 from macos builder name [#5413](https://github.com/inspec/inspec/pull/5413) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix backtrace occurs when using `cmp` to compare nil to an expectation [#5427](https://github.com/inspec/inspec/pull/5427) ([Vasu1105](https://github.com/Vasu1105))
- Clarify include matcher docs on crontab resource [#5419](https://github.com/inspec/inspec/pull/5419) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update README to add note about Ruby 2.5 support [#5424](https://github.com/inspec/inspec/pull/5424) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Expose conf_path, content, and params on auditd_conf [#5422](https://github.com/inspec/inspec/pull/5422) ([yarick](https://github.com/yarick))
- Update json_schemer requirement from &gt;= 0.2.1, &lt; 0.2.18 to &gt;= 0.2.1, &lt; 0.2.19 [#5423](https://github.com/inspec/inspec/pull/5423) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))

## [v4.26.13](https://github.com/inspec/inspec/tree/v4.26.13) (2021-02-24)

#### Bug Fixes
- Skip controls deeply [#5411](https://github.com/inspec/inspec/pull/5411) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Use first value of repeated settings in ssh_config and sshd_config [#5414](https://github.com/inspec/inspec/pull/5414) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Fix dead links [#5399](https://github.com/inspec/inspec/pull/5399) ([IanMadd](https://github.com/IanMadd))
- Fix another link [#5407](https://github.com/inspec/inspec/pull/5407) ([IanMadd](https://github.com/IanMadd))
- Add metadata to each page in docs.chef.io/inspec, update Edit on GitHub links [#5406](https://github.com/inspec/inspec/pull/5406) ([IanMadd](https://github.com/IanMadd))
- Update install.md [#5403](https://github.com/inspec/inspec/pull/5403) ([tduffield](https://github.com/tduffield))
- Update chefstyle requirement from ~&gt; 1.5.7 to ~&gt; 1.7.1 [#5409](https://github.com/inspec/inspec/pull/5409) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Document the json-automate reporter [#5408](https://github.com/inspec/inspec/pull/5408) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Switch to MacOS 10.14 builder [#5415](https://github.com/inspec/inspec/pull/5415) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.26.4](https://github.com/inspec/inspec/tree/v4.26.4) (2021-01-27)

#### Enhancements
- Add method_missing to nginx_conf [#5285](https://github.com/inspec/inspec/pull/5285) ([rgeissert](https://github.com/rgeissert))

#### Bug Fixes
- Add faraday_middleware to gemspec [#5391](https://github.com/inspec/inspec/pull/5391) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Update oracledb_session.rb [#5193](https://github.com/inspec/inspec/pull/5193) ([pacopal](https://github.com/pacopal))
- Add option for winrm-shell-type [#5263](https://github.com/inspec/inspec/pull/5263) ([catriona1](https://github.com/catriona1))
- Enable programmatic setting of plugin configuration [#5393](https://github.com/inspec/inspec/pull/5393) ([tecracer-theinen](https://github.com/tecracer-theinen))
- Pin back parslet to avoid conflict with toml in chef infra [#5394](https://github.com/inspec/inspec/pull/5394) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Improve programmatic plugin configuration [#5395](https://github.com/inspec/inspec/pull/5395) ([tecracer-theinen](https://github.com/tecracer-theinen))

## [v4.25.1](https://github.com/inspec/inspec/tree/v4.25.1) (2021-01-20)

#### Merged Pull Requests
- Allow for rspec 3.9 in the gemspec [#5381](https://github.com/inspec/inspec/pull/5381) ([tas50](https://github.com/tas50))
- Build arm packages for Debian/SLES/Ubuntu [#5386](https://github.com/inspec/inspec/pull/5386) ([tas50](https://github.com/tas50))
- Update json_schemer requirement from &gt;= 0.2.1, &lt; 0.2.12 to &gt;= 0.2.1, &lt; 0.2.18 [#5356](https://github.com/inspec/inspec/pull/5356) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))

## [v4.24.32](https://github.com/inspec/inspec/tree/v4.24.32) (2021-01-13)

#### Merged Pull Requests
- Add ENV var to skip live net tests in plugin installer unit tests [#5378](https://github.com/inspec/inspec/pull/5378) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Switch Docker build to be omnibus-based [#5362](https://github.com/inspec/inspec/pull/5362) ([nkierpiec](https://github.com/nkierpiec))
- clarify the inspec check command [#5379](https://github.com/inspec/inspec/pull/5379) ([chrisbirster](https://github.com/chrisbirster))
- Update faraday requirement from &gt;= 0.9.0, &lt; 1.2 to &gt;= 0.9.0, &lt; 1.4 [#5371](https://github.com/inspec/inspec/pull/5371) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Update minimum ruby version in README [#5380](https://github.com/inspec/inspec/pull/5380) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.24.28](https://github.com/inspec/inspec/tree/v4.24.28) (2021-01-06)

#### Enhancements
- Truncate code_desc when truncating reports [#5372](https://github.com/inspec/inspec/pull/5372) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- Avoid ffi 1.14.2 [#5375](https://github.com/inspec/inspec/pull/5375) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.24.26](https://github.com/inspec/inspec/tree/v4.24.26) (2021-01-04)

#### Enhancements
- Updated Supported Platforms for MSSQL_SESSION [#5366](https://github.com/inspec/inspec/pull/5366) ([kclinden](https://github.com/kclinden))

#### Merged Pull Requests
- Remove macOS 10.13 from the build matrix [#5311](https://github.com/inspec/inspec/pull/5311) ([tas50](https://github.com/tas50))
- Clean up docs previews [#5344](https://github.com/inspec/inspec/pull/5344) ([IanMadd](https://github.com/IanMadd))
- Fix link to image in compliance plugin README [#5329](https://github.com/inspec/inspec/pull/5329) ([phiggins](https://github.com/phiggins))
- Accept arrays in parse_config&#39;s method_missing [#5252](https://github.com/inspec/inspec/pull/5252) ([rgeissert](https://github.com/rgeissert))
- Remove &#39;integration&#39; group from Gemfile [#5341](https://github.com/inspec/inspec/pull/5341) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update hashie requirement from ~&gt; 3.4 to &gt;= 3.4, &lt; 5.0 [#5348](https://github.com/inspec/inspec/pull/5348) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Update tomlrb requirement from ~&gt; 1.2.0 to &gt;= 1.2, &lt; 2.1 [#5350](https://github.com/inspec/inspec/pull/5350) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Update simplecov requirement from ~&gt; 0.10, &lt;= 0.18.2 to ~&gt; 0.18 [#5351](https://github.com/inspec/inspec/pull/5351) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Update rubyzip requirement from ~&gt; 1.2, &gt;= 1.2.2 to &gt;= 1.2.2, &lt; 3.0 [#5347](https://github.com/inspec/inspec/pull/5347) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Replace DK with Workstation in docs [#5352](https://github.com/inspec/inspec/pull/5352) ([tas50](https://github.com/tas50))
- Update faraday requirement from &gt;= 0.9.0, &lt; 1.1 to &gt;= 0.9.0, &lt; 1.2 [#5355](https://github.com/inspec/inspec/pull/5355) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Require ruby 2.5+ / allow ruby 3 [#5357](https://github.com/inspec/inspec/pull/5357) ([tas50](https://github.com/tas50))
- Re-Enable Omnibus Builds on MacOS 10.13 [#5363](https://github.com/inspec/inspec/pull/5363) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Loosen RSpec pin to ~&gt; 3.10 [#5342](https://github.com/inspec/inspec/pull/5342) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Bump chefstyle to 1.5.7 [#5358](https://github.com/inspec/inspec/pull/5358) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update parslet requirement from ~&gt; 1.5 to &gt;= 1.5, &lt; 3.0 [#5354](https://github.com/inspec/inspec/pull/5354) ([dependabot-preview[bot]](https://github.com/dependabot-preview[bot]))
- Remove windows test skip timebomb [#5364](https://github.com/inspec/inspec/pull/5364) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.24.8](https://github.com/inspec/inspec/tree/v4.24.8) (2020-12-10)

#### New Features
- InSpec Cloud: Reporting by Resource [#5241](https://github.com/inspec/inspec/pull/5241) ([Schwad](https://github.com/Schwad))

#### Bug Fixes
- Don&#39;t reload plugins if load_all is called repeatedly [#5308](https://github.com/inspec/inspec/pull/5308) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Pin rspec to 3.9 [#5297](https://github.com/inspec/inspec/pull/5297) ([james-stocks](https://github.com/james-stocks))
- Add ed25519 support to the habitat package [#5299](https://github.com/inspec/inspec/pull/5299) ([btm](https://github.com/btm))
- replace deprecated attributes section with inputs [#5295](https://github.com/inspec/inspec/pull/5295) ([KonradSchieban](https://github.com/KonradSchieban))
- Bumps parallel for ruby 2.4 issue [#5304](https://github.com/inspec/inspec/pull/5304) ([Schwad](https://github.com/Schwad))
- Update Codeowners file for Docs [#5298](https://github.com/inspec/inspec/pull/5298) ([mjingle](https://github.com/mjingle))
- grub_conf - handle no menuentry config [#5306](https://github.com/inspec/inspec/pull/5306) ([james-stocks](https://github.com/james-stocks))
- Update Ruby to 2.7.2 [#5281](https://github.com/inspec/inspec/pull/5281) ([tas50](https://github.com/tas50))
- Drop EOL Ruby 2.4 from testing, Fix Ruby 2.5 Gem build [#5321](https://github.com/inspec/inspec/pull/5321) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix escaping of Windows package names [#5323](https://github.com/inspec/inspec/pull/5323) ([ramereth](https://github.com/ramereth))
- Return arrays for wmi properties [#5314](https://github.com/inspec/inspec/pull/5314) ([alexpop](https://github.com/alexpop))
- Reenabling Docker image builds using Dobi [#5318](https://github.com/inspec/inspec/pull/5318) ([Schwad](https://github.com/Schwad))
- Remove Gemfile.local support to use Dependabot [#5324](https://github.com/inspec/inspec/pull/5324) ([tas50](https://github.com/tas50))
- Remove the dependency on json_schemer [#5325](https://github.com/inspec/inspec/pull/5325) ([tas50](https://github.com/tas50))
- Added platform-name wildcard support [#5302](https://github.com/inspec/inspec/pull/5302) ([yarick](https://github.com/yarick))
- Fix issue Dir.home would break when HOME env absent [#5317](https://github.com/inspec/inspec/pull/5317) ([vsingh-msys](https://github.com/vsingh-msys))
- Remove kitchen-ec2 dep + add lower floor to other kitchen deps [#5331](https://github.com/inspec/inspec/pull/5331) ([tas50](https://github.com/tas50))
- Remove outdated / unmaintained maintainers task / docs [#5332](https://github.com/inspec/inspec/pull/5332) ([tas50](https://github.com/tas50))
- Parallel restored Ruby 2.4 support so unpin it [#5335](https://github.com/inspec/inspec/pull/5335) ([tas50](https://github.com/tas50))
- Remove the pin on EOL Chef releases [#5339](https://github.com/inspec/inspec/pull/5339) ([tas50](https://github.com/tas50))
- Remove the docker releasing rake task [#5336](https://github.com/inspec/inspec/pull/5336) ([tas50](https://github.com/tas50))
- Remove unused build-essential dep in berksfile [#5337](https://github.com/inspec/inspec/pull/5337) ([tas50](https://github.com/tas50))
- Remove the kitchen.chef.yml file [#5338](https://github.com/inspec/inspec/pull/5338) ([tas50](https://github.com/tas50))

## [v4.23.15](https://github.com/inspec/inspec/tree/v4.23.15) (2020-10-23)

#### Merged Pull Requests
- Fix &quot;Edit on GitHub&quot; links [#5268](https://github.com/inspec/inspec/pull/5268) ([IanMadd](https://github.com/IanMadd))
- Remove thread requires as this is built in now [#5251](https://github.com/inspec/inspec/pull/5251) ([tas50](https://github.com/tas50))
- Added another example to illustrate use for only_if [#5269](https://github.com/inspec/inspec/pull/5269) ([unixengineer](https://github.com/unixengineer))
- Update Hugo version to 0.76.4 [#5279](https://github.com/inspec/inspec/pull/5279) ([IanMadd](https://github.com/IanMadd))
- Ensure that we populate information about waiver expiration regardless of `run: true/false` [#5278](https://github.com/inspec/inspec/pull/5278) ([Schwad](https://github.com/Schwad))
- Upgrade the habitat Ruby dependency to 2.6 [#5287](https://github.com/inspec/inspec/pull/5287) ([btm](https://github.com/btm))

## [v4.23.11](https://github.com/inspec/inspec/tree/v4.23.11) (2020-09-28)

#### Merged Pull Requests
- Add Chef patent URL to --help, tidy help output [#5255](https://github.com/inspec/inspec/pull/5255) ([james-stocks](https://github.com/james-stocks))

## [v4.23.10](https://github.com/inspec/inspec/tree/v4.23.10) (2020-09-23)

#### Merged Pull Requests
- autoload pry [#5246](https://github.com/inspec/inspec/pull/5246) ([mwrock](https://github.com/mwrock))
- Improve handling of bracketed options in deb source [#5210](https://github.com/inspec/inspec/pull/5210) ([Udyrfrykte](https://github.com/Udyrfrykte))
- skip_windows! documentation and clearing [#5213](https://github.com/inspec/inspec/pull/5213) ([Schwad](https://github.com/Schwad))
- Bump faraday dependencies [#5181](https://github.com/inspec/inspec/pull/5181) ([Schwad](https://github.com/Schwad))
- Cw/reporter plugin junit [#5244](https://github.com/inspec/inspec/pull/5244) ([Schwad](https://github.com/Schwad))
- Update documentation for junit plugins [#5259](https://github.com/inspec/inspec/pull/5259) ([james-stocks](https://github.com/james-stocks))

## [v4.23.4](https://github.com/inspec/inspec/tree/v4.23.4) (2020-09-14)

#### New Features
- RunData Filters; sensitive inputs; suppress diff; sorted output [#5054](https://github.com/inspec/inspec/pull/5054) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- changed inspec.yml example to use platform-family instead of os-family, since that&#39;s the recommended property name [#5151](https://github.com/inspec/inspec/pull/5151) ([bcwood](https://github.com/bcwood))
- Add ability to disable input caching for kitchen-inspec use [#5211](https://github.com/inspec/inspec/pull/5211) ([tecracer-theinen](https://github.com/tecracer-theinen))
- First pass at fixing issue #5183. [#5185](https://github.com/inspec/inspec/pull/5185) ([StylusEaterChef](https://github.com/StylusEaterChef))
- Allow license-acceptance 2.x gem dep [#5229](https://github.com/inspec/inspec/pull/5229) ([tas50](https://github.com/tas50))
- Run ps with an ulimited width on linux [#5232](https://github.com/inspec/inspec/pull/5232) ([rgeissert](https://github.com/rgeissert))

## [v4.22.22](https://github.com/inspec/inspec/tree/v4.22.22) (2020-08-27)

#### Merged Pull Requests
- Try to force expeditor cooperation [#5186](https://github.com/inspec/inspec/pull/5186) ([Schwad](https://github.com/Schwad))
- We require version bumps for expeditor to be read against master [#5187](https://github.com/inspec/inspec/pull/5187) ([Schwad](https://github.com/Schwad))
- Enforced bump. Fully allow this to build before merge. [#5188](https://github.com/inspec/inspec/pull/5188) ([Schwad](https://github.com/Schwad))
- Convert JUnit Reporter to a Plugin [#5084](https://github.com/inspec/inspec/pull/5084) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add new windows_firewall and windows_firewall_rule resources [#4979](https://github.com/inspec/inspec/pull/4979) ([tecracer-theinen](https://github.com/tecracer-theinen))
- Ensure Darwin is always detected in the install scripts [#5175](https://github.com/inspec/inspec/pull/5175) ([tas50](https://github.com/tas50))
- Update to Chefstyle 1.2.1 [#5196](https://github.com/inspec/inspec/pull/5196) ([tas50](https://github.com/tas50))
- Remove unused term-ansicolor [#5201](https://github.com/inspec/inspec/pull/5201) ([tas50](https://github.com/tas50))
- Remove htmlentities dependency [#5203](https://github.com/inspec/inspec/pull/5203) ([tas50](https://github.com/tas50))
- Don&#39;t ship the readme in the gem [#5202](https://github.com/inspec/inspec/pull/5202) ([tas50](https://github.com/tas50))
- Update omnibus builds to Ruby 2.6.6 [#5198](https://github.com/inspec/inspec/pull/5198) ([tas50](https://github.com/tas50))
- Don&#39;t build packages for EOL Debian 8 [#5197](https://github.com/inspec/inspec/pull/5197) ([tas50](https://github.com/tas50))
- Create expeditor-development release branch [#5220](https://github.com/inspec/inspec/pull/5220) ([Schwad](https://github.com/Schwad))
- Fix mysql_session stdout, stderr and exit_status parameters [#5219](https://github.com/inspec/inspec/pull/5219) ([ramereth](https://github.com/ramereth))
- Add MacOS 11 Tester [#5217](https://github.com/inspec/inspec/pull/5217) ([christopher-snapp](https://github.com/christopher-snapp))
- Currently disables feature branch which may be upsetting builder [#5228](https://github.com/inspec/inspec/pull/5228) ([Schwad](https://github.com/Schwad))

## [v4.22.8](https://github.com/inspec/inspec/tree/v4.22.8) (2020-08-05)

#### Merged Pull Requests
- feat(sensitive): add sensitive output to mysql and postgres sessions [#5124](https://github.com/inspec/inspec/pull/5124) ([fzipi](https://github.com/fzipi))
- Fix freebsd osfamily user group tests [#5123](https://github.com/inspec/inspec/pull/5123) ([fzipi](https://github.com/fzipi))
- Ensure truncate message only returns on truncated values [#5165](https://github.com/inspec/inspec/pull/5165) ([Schwad](https://github.com/Schwad))
- Move windows bomb forward pre-emptively [#5176](https://github.com/inspec/inspec/pull/5176) ([Schwad](https://github.com/Schwad))
- Fix missing docs content [#5159](https://github.com/inspec/inspec/pull/5159) ([IanMadd](https://github.com/IanMadd))
- fix error in passwd example [#5171](https://github.com/inspec/inspec/pull/5171) ([chrisbirster](https://github.com/chrisbirster))
- Supports Scientific Linux in service resource [#5164](https://github.com/inspec/inspec/pull/5164) ([Schwad](https://github.com/Schwad))

## [v4.22.1](https://github.com/inspec/inspec/tree/v4.22.1) (2020-07-21)

#### Merged Pull Requests
- Temporary comment out to get expeditor build to complete [#5150](https://github.com/inspec/inspec/pull/5150) ([Schwad](https://github.com/Schwad))
- Habitat should not expand $PATH at buildtime [#5148](https://github.com/inspec/inspec/pull/5148) ([james-stocks](https://github.com/james-stocks))

## [v4.22.0](https://github.com/inspec/inspec/tree/v4.22.0) (2020-07-17)

#### Merged Pull Requests
- Add the generic &#39;darwin&#39; to the service resource [#5130](https://github.com/inspec/inspec/pull/5130) ([btm](https://github.com/btm))
- WIP: Make progress on `skip_windows!` [#5063](https://github.com/inspec/inspec/pull/5063) ([Schwad](https://github.com/Schwad))
- Allow ‘=‘ character in CLI inputs [#5135](https://github.com/inspec/inspec/pull/5135) ([Schwad](https://github.com/Schwad))
- skip apt-cdrom repos in apt resource when parsing lists [#5138](https://github.com/inspec/inspec/pull/5138) ([jrbeilke](https://github.com/jrbeilke))
- Report faulty profiles instead of crashing [#5128](https://github.com/inspec/inspec/pull/5128) ([james-stocks](https://github.com/james-stocks))

## [v4.21.3](https://github.com/inspec/inspec/tree/v4.21.3) (2020-07-02)

#### Merged Pull Requests
- Address test:isolated failure [#5117](https://github.com/inspec/inspec/pull/5117) ([james-stocks](https://github.com/james-stocks))
- Log to stderr when using html2 reporter [#5126](https://github.com/inspec/inspec/pull/5126) ([james-stocks](https://github.com/james-stocks))

## [v4.21.1](https://github.com/inspec/inspec/tree/v4.21.1) (2020-06-29)

#### New Features
- Improved HTML Reporter [#5045](https://github.com/inspec/inspec/pull/5045) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Additions to the interface resource [#5036](https://github.com/inspec/inspec/pull/5036) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.20.10](https://github.com/inspec/inspec/tree/v4.20.10) (2020-06-18)

#### New Features
- Telemetry - determine run context from stack introspection [#4907](https://github.com/inspec/inspec/pull/4907) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- Revert &quot;Make CLI reporter into a plugin&quot; [#5100](https://github.com/inspec/inspec/pull/5100) ([Schwad](https://github.com/Schwad))

#### Merged Pull Requests
- Update sslshake test for sslshake 1.13.1 [#5101](https://github.com/inspec/inspec/pull/5101) ([james-stocks](https://github.com/james-stocks))
- Arbitrary .md change to bump version [#5103](https://github.com/inspec/inspec/pull/5103) ([james-stocks](https://github.com/james-stocks))

## [v4.20.6](https://github.com/inspec/inspec/tree/v4.20.6) (2020-06-17)

#### Merged Pull Requests
- Make the JSON-min Reporter into Plugin [#5062](https://github.com/inspec/inspec/pull/5062) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix tomlrb dependency [#5091](https://github.com/inspec/inspec/pull/5091) ([james-stocks](https://github.com/james-stocks))
- Add Windows 8 Tester [#5077](https://github.com/inspec/inspec/pull/5077) ([christopher-snapp](https://github.com/christopher-snapp))
- Change ffi pinning [#5078](https://github.com/inspec/inspec/pull/5078) ([james-stocks](https://github.com/james-stocks))
- Make CLI reporter into a plugin [#5069](https://github.com/inspec/inspec/pull/5069) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.20.2](https://github.com/inspec/inspec/tree/v4.20.2) (2020-06-10)

#### New Features
- Boolean, Numeric, and Structured CLI inputs [#5011](https://github.com/inspec/inspec/pull/5011) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Fix unmatched backticks in docs [#5053](https://github.com/inspec/inspec/pull/5053) ([james-stocks](https://github.com/james-stocks))
- CLI Option to silence deprecations [#5026](https://github.com/inspec/inspec/pull/5026) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Expand docs and tests for only_if [#5038](https://github.com/inspec/inspec/pull/5038) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add newline in Dockerfile to facilitate patching by 3rd party distros [#5051](https://github.com/inspec/inspec/pull/5051) ([bobchaos](https://github.com/bobchaos))
- Update installer license text [#5073](https://github.com/inspec/inspec/pull/5073) ([james-stocks](https://github.com/james-stocks))

## [v4.19.2](https://github.com/inspec/inspec/tree/v4.19.2) (2020-06-04)

#### Bug Fixes
- Pin ffi to 1.12.2 due to Windows crash [#5060](https://github.com/inspec/inspec/pull/5060) ([james-stocks](https://github.com/james-stocks))

#### Merged Pull Requests
- Add several Builders and Testers to Omnibus [#4981](https://github.com/inspec/inspec/pull/4981) ([christopher-snapp](https://github.com/christopher-snapp))
- Revert aarch64 build targets [#5057](https://github.com/inspec/inspec/pull/5057) ([james-stocks](https://github.com/james-stocks))
- Pin ffi in omnibus/Gemfile [#5065](https://github.com/inspec/inspec/pull/5065) ([james-stocks](https://github.com/james-stocks))

## [v4.19.0](https://github.com/inspec/inspec/tree/v4.19.0) (2020-05-29)

#### New Features
- Stores output of `inspec json` to archive and artifact [#5017](https://github.com/inspec/inspec/pull/5017) ([Schwad](https://github.com/Schwad))
- Reporters as Plugins [#5007](https://github.com/inspec/inspec/pull/5007) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Update for incoming ruby openSSL deprecations [#5035](https://github.com/inspec/inspec/pull/5035) ([Schwad](https://github.com/Schwad))
- Allow for waiver time as well as date [#5039](https://github.com/inspec/inspec/pull/5039) ([james-stocks](https://github.com/james-stocks))
- Fix expeditor minor bump config, bump to 4.19 [#5044](https://github.com/inspec/inspec/pull/5044) ([james-stocks](https://github.com/james-stocks))
- Innocuous change to allow expeditor bump [#5049](https://github.com/inspec/inspec/pull/5049) ([Schwad](https://github.com/Schwad))

## [v4.18.114](https://github.com/inspec/inspec/tree/v4.18.114) (2020-05-14)

#### Enhancements
- Reporter options to truncate message and suppress stacktrace [#4994](https://github.com/inspec/inspec/pull/4994) ([james-stocks](https://github.com/james-stocks))

#### Merged Pull Requests
- Updates README.md to clarify running InSpec local [#4993](https://github.com/inspec/inspec/pull/4993) ([Schwad](https://github.com/Schwad))
- No longer need to include rubygems or bundler software dep [#5020](https://github.com/inspec/inspec/pull/5020) ([tyler-ball](https://github.com/tyler-ball))

## [v4.18.111](https://github.com/inspec/inspec/tree/v4.18.111) (2020-05-06)

#### Bug Fixes
- Fix for warning when input is provided [#4995](https://github.com/inspec/inspec/pull/4995) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Updating automate reporter example config to valid json [#5010](https://github.com/inspec/inspec/pull/5010) ([devopsdina](https://github.com/devopsdina))
- Allows input and control to have the same name [#5001](https://github.com/inspec/inspec/pull/5001) ([Schwad](https://github.com/Schwad))

## [v4.18.108](https://github.com/inspec/inspec/tree/v4.18.108) (2020-04-27)

#### Bug Fixes
- Fixes for tests under ruby 2.7 [#4970](https://github.com/inspec/inspec/pull/4970) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Release process documentation [#4974](https://github.com/inspec/inspec/pull/4974) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add additional debug logging for automate login [#4990](https://github.com/inspec/inspec/pull/4990) ([TheLunaticScripter](https://github.com/TheLunaticScripter))

## [v4.18.104](https://github.com/inspec/inspec/tree/v4.18.104) (2020-04-08)

#### Enhancements
- Fix deprecation warning on auditd test [#4955](https://github.com/inspec/inspec/pull/4955) ([tecracer-theinen](https://github.com/tecracer-theinen))

#### Merged Pull Requests
- removed beta from waivers link in sidebar nav [#4944](https://github.com/inspec/inspec/pull/4944) ([kekaichinose](https://github.com/kekaichinose))
- Remove .html to fix install link [#4945](https://github.com/inspec/inspec/pull/4945) ([mjingle](https://github.com/mjingle))
- Document describe.one usage [#4957](https://github.com/inspec/inspec/pull/4957) ([james-stocks](https://github.com/james-stocks))
- Fix service not working correctly on windows machines [#4951](https://github.com/inspec/inspec/pull/4951) ([Axuba](https://github.com/Axuba))
- Add support for alternate Gem source for plugin installation/search [#4949](https://github.com/inspec/inspec/pull/4949) ([tecracer-theinen](https://github.com/tecracer-theinen))
- Improve virtualization resource [#4954](https://github.com/inspec/inspec/pull/4954) ([tecracer-theinen](https://github.com/tecracer-theinen))
- Add Windows 10 support and fix Omnibus tests to use embedded Ruby [#4968](https://github.com/inspec/inspec/pull/4968) ([christopher-snapp](https://github.com/christopher-snapp))

## [v4.18.100](https://github.com/inspec/inspec/tree/v4.18.100) (2020-03-03)

#### Enhancements
- Add functional tests that try each of the cloud resource packs [#4932](https://github.com/inspec/inspec/pull/4932) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Explicitly require the compliance fetcher [#4938](https://github.com/inspec/inspec/pull/4938) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update rake deps for security issue [#4939](https://github.com/inspec/inspec/pull/4939) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix platform detection on hab [#4934](https://github.com/inspec/inspec/pull/4934) ([clintoncwolfe](https://github.com/clintoncwolfe))
- remove beta language and fix usage string order [#4942](https://github.com/inspec/inspec/pull/4942) ([kekaichinose](https://github.com/kekaichinose))

## [v4.18.97](https://github.com/inspec/inspec/tree/v4.18.97) (2020-02-25)

#### New Features
- Detect install type via install path [#4856](https://github.com/inspec/inspec/pull/4856) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- Fix artifact-habitat testing for inspec. [#4905](https://github.com/inspec/inspec/pull/4905) ([zenspider](https://github.com/zenspider))
- Distinguish between user plugin gems and system gems and load system gems normally. [#4898](https://github.com/inspec/inspec/pull/4898) ([zenspider](https://github.com/zenspider))
- Fix auditd resource processing of action and list [#4665](https://github.com/inspec/inspec/pull/4665) ([trevor-vaughan](https://github.com/trevor-vaughan))

#### Merged Pull Requests
- Jh/schema improvements [#4865](https://github.com/inspec/inspec/pull/4865) ([miah](https://github.com/miah))
- With the release version 1.5.0 of habitat, lets not worry about &lt;0.85 [#4878](https://github.com/inspec/inspec/pull/4878) ([miah](https://github.com/miah))
- Cleanup ruby before fixing gem permissions [#4914](https://github.com/inspec/inspec/pull/4914) ([tas50](https://github.com/tas50))
- Build packages on Debian [#4912](https://github.com/inspec/inspec/pull/4912) ([tas50](https://github.com/tas50))
- Fix hab builds. [#4908](https://github.com/inspec/inspec/pull/4908) ([zenspider](https://github.com/zenspider))
- Set trigger back on hab builds [#4918](https://github.com/inspec/inspec/pull/4918) ([zenspider](https://github.com/zenspider))
- Refactor oracledb_session resource [#4910](https://github.com/inspec/inspec/pull/4910) ([rmoles](https://github.com/rmoles))
- In habitat, train-* are system gems [#4897](https://github.com/inspec/inspec/pull/4897) ([miah](https://github.com/miah))
- Update SLAs [#4923](https://github.com/inspec/inspec/pull/4923) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Rollback library eval context de-meta-programming [#4927](https://github.com/inspec/inspec/pull/4927) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.18.85](https://github.com/inspec/inspec/tree/v4.18.85) (2020-02-06)

#### New Features
- Add: certificate content x509_certificate [#4845](https://github.com/inspec/inspec/pull/4845) ([frezbo](https://github.com/frezbo))
- Use an archive if possible when fetching fails and --airgap is provided [#4806](https://github.com/inspec/inspec/pull/4806) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Added --inspect option to inspect shell command. [#4864](https://github.com/inspec/inspec/pull/4864) ([zenspider](https://github.com/zenspider))

#### Enhancements
- Remove the references to the core/cacerts so customers can specify it [#4848](https://github.com/inspec/inspec/pull/4848) ([TheLunaticScripter](https://github.com/TheLunaticScripter))
- issue 4807: test for inputs in profiles [#4883](https://github.com/inspec/inspec/pull/4883) ([nazliBeit](https://github.com/nazliBeit))

#### Bug Fixes
- upstream is basic_auth_only not basic_auth [#4834](https://github.com/inspec/inspec/pull/4834) ([shawnifoley](https://github.com/shawnifoley))
- Missing end quote in oracledb_session [#4852](https://github.com/inspec/inspec/pull/4852) ([miah](https://github.com/miah))
- Don&#39;t try to fool Thor&#39;s option type checker for --airgap on archive [#4892](https://github.com/inspec/inspec/pull/4892) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Latest version of rubygems is starting to blow up because of bundler executable overwrite warnings [#4790](https://github.com/inspec/inspec/pull/4790) ([zenspider](https://github.com/zenspider))
- Allow Thor 1.x versions to be used [#4795](https://github.com/inspec/inspec/pull/4795) ([tas50](https://github.com/tas50))
- Update Ruby to 2.6.5 [#4796](https://github.com/inspec/inspec/pull/4796) ([tas50](https://github.com/tas50))
- postfix_conf: Changed supported platform to unix [#4794](https://github.com/inspec/inspec/pull/4794) ([fzipi](https://github.com/fzipi))
- Add suport for freebsd package resource [#4789](https://github.com/inspec/inspec/pull/4789) ([fzipi](https://github.com/fzipi))
- Set test skip bomb date to end of 2020Q1 [#4819](https://github.com/inspec/inspec/pull/4819) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Removed all metaprogramming from ControlEvalContext [#4778](https://github.com/inspec/inspec/pull/4778) ([zenspider](https://github.com/zenspider))
- Found and fixed more mocha/setup deprecations. [#4821](https://github.com/inspec/inspec/pull/4821) ([zenspider](https://github.com/zenspider))
- Fix empty attributes array in json reporter [#4815](https://github.com/inspec/inspec/pull/4815) ([nazliBeit](https://github.com/nazliBeit))
- updates file resource doc to add example for sticky bit with leading … [#4823](https://github.com/inspec/inspec/pull/4823) ([collinmcneese](https://github.com/collinmcneese))
- Fixed duplicate groups on osx by merging members by gid. [#4833](https://github.com/inspec/inspec/pull/4833) ([zenspider](https://github.com/zenspider))
- Windows 7 EOL Docs Update [#4841](https://github.com/inspec/inspec/pull/4841) ([mjingle](https://github.com/mjingle))
- Refactor some of resources/service.rb [#4849](https://github.com/inspec/inspec/pull/4849) ([zenspider](https://github.com/zenspider))
- Fixes all notarization issues [#4835](https://github.com/inspec/inspec/pull/4835) ([jonsmorrow](https://github.com/jonsmorrow))
- Fix windows plugin functional tests [#4861](https://github.com/inspec/inspec/pull/4861) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Properly report errors with bad tarball files. [#4825](https://github.com/inspec/inspec/pull/4825) ([zenspider](https://github.com/zenspider))
- Rework and unify gemspecs. [#4854](https://github.com/inspec/inspec/pull/4854) ([zenspider](https://github.com/zenspider))
- Fix up the platform on etc_hosts, virtualization, ini, and xml resources to fix OS disparity. [#4862](https://github.com/inspec/inspec/pull/4862) ([zenspider](https://github.com/zenspider))
- Add support for yocto linux in service resource [#4843](https://github.com/inspec/inspec/pull/4843) ([michaellihs](https://github.com/michaellihs))
- bad master merge... rushing this through [#4871](https://github.com/inspec/inspec/pull/4871) ([zenspider](https://github.com/zenspider))
- the correct, un-panicked fix. [#4872](https://github.com/inspec/inspec/pull/4872) ([zenspider](https://github.com/zenspider))
- I *think* this will fix habitat. [#4877](https://github.com/inspec/inspec/pull/4877) ([zenspider](https://github.com/zenspider))
- I _think_ this should fix omnibus. [#4880](https://github.com/inspec/inspec/pull/4880) ([zenspider](https://github.com/zenspider))
- make command.exist? POSIX conform [#4822](https://github.com/inspec/inspec/pull/4822) ([PiQuer](https://github.com/PiQuer))
- Refactored crontab resource [#4869](https://github.com/inspec/inspec/pull/4869) ([zenspider](https://github.com/zenspider))
- Remove skips from windows testing in &#39;inputs&#39; and &#39;archive&#39; functional tests [#4860](https://github.com/inspec/inspec/pull/4860) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix minor style issues. [#4882](https://github.com/inspec/inspec/pull/4882) ([zenspider](https://github.com/zenspider))
- Removed ~50% of metaprogramming from LibraryEvalContext &amp; Resource [#4814](https://github.com/inspec/inspec/pull/4814) ([zenspider](https://github.com/zenspider))

## [v4.18.51](https://github.com/inspec/inspec/tree/v4.18.51) (2019-12-16)

#### New Features
- Wire up backend to rspec metadata, allowing for example groups to use resources [#4768](https://github.com/inspec/inspec/pull/4768) ([zenspider](https://github.com/zenspider))

#### Merged Pull Requests
- Move lib/fetchers to lib/inspec/fetchers and re-namspace [#4734](https://github.com/inspec/inspec/pull/4734) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix ruby 2.7 warnings/errors [#4739](https://github.com/inspec/inspec/pull/4739) ([zenspider](https://github.com/zenspider))
- Suppress output from rubygems installs. [#4743](https://github.com/inspec/inspec/pull/4743) ([zenspider](https://github.com/zenspider))
- Enable Codeclimate Test Coverage [#4745](https://github.com/inspec/inspec/pull/4745) ([miah](https://github.com/miah))
- Add last login date to WindowsUser [#4724](https://github.com/inspec/inspec/pull/4724) ([mbaitelman](https://github.com/mbaitelman))
- Removes broken search button and icon [#4753](https://github.com/inspec/inspec/pull/4753) ([kagarmoe](https://github.com/kagarmoe))
- Bump windows deadline AGAIN. [#4759](https://github.com/inspec/inspec/pull/4759) ([zenspider](https://github.com/zenspider))
- Hook up logger to inspec detect. [#4760](https://github.com/inspec/inspec/pull/4760) ([zenspider](https://github.com/zenspider))
- Make fetchers fail consistently [#4736](https://github.com/inspec/inspec/pull/4736) ([clintoncwolfe](https://github.com/clintoncwolfe))
- sum multiple test runs together for codeclimate [#4761](https://github.com/inspec/inspec/pull/4761) ([miah](https://github.com/miah))
- Bump rspec to 3.9 and fix broken tests. [#4771](https://github.com/inspec/inspec/pull/4771) ([zenspider](https://github.com/zenspider))
- Fix warnings coming from ruby -w [#4766](https://github.com/inspec/inspec/pull/4766) ([zenspider](https://github.com/zenspider))
- remove inspec from pkg_deps/pkg_build_deps in template [#4754](https://github.com/inspec/inspec/pull/4754) ([joshbrand](https://github.com/joshbrand))

## [v4.18.39](https://github.com/inspec/inspec/tree/v4.18.39) (2019-11-15)

#### Merged Pull Requests
- Removing the osx? guard that has been pushed to minitest and released. [#4728](https://github.com/inspec/inspec/pull/4728) ([zenspider](https://github.com/zenspider))

## [v4.18.38](https://github.com/inspec/inspec/tree/v4.18.38) (2019-11-14)

#### New Features
- Add startuser systemd service v2 [#4516](https://github.com/inspec/inspec/pull/4516) ([mbaitelman](https://github.com/mbaitelman))

#### Bug Fixes
- Make input() work in describe.one [#4666](https://github.com/inspec/inspec/pull/4666) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix for invocation when calling npm under sudo [#4548](https://github.com/inspec/inspec/pull/4548) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- incorporate changes from chef hab plan [#4662](https://github.com/inspec/inspec/pull/4662) ([miah](https://github.com/miah))
- Change &quot;an Chef Inspec&quot; to &quot;a Chef Inspec&quot;. [#4663](https://github.com/inspec/inspec/pull/4663) ([kcrouch](https://github.com/kcrouch))
- Fix false positives on bundle caching check in buildkite. [#4660](https://github.com/inspec/inspec/pull/4660) ([zenspider](https://github.com/zenspider))
- Pre-load the gem resource to override the global gem method. [#4670](https://github.com/inspec/inspec/pull/4670) ([zenspider](https://github.com/zenspider))
- Revamp www/doco setup [#4674](https://github.com/inspec/inspec/pull/4674) ([zenspider](https://github.com/zenspider))
- Bump chefstyle and fix up flagged code. [#4677](https://github.com/inspec/inspec/pull/4677) ([zenspider](https://github.com/zenspider))
- Moved test/unit/mock/* to test/fixtures [#4681](https://github.com/inspec/inspec/pull/4681) ([zenspider](https://github.com/zenspider))
- Deprecate inspec/object/* classes [#4680](https://github.com/inspec/inspec/pull/4680) ([btm](https://github.com/btm))
- Fix windows testing [#4390](https://github.com/inspec/inspec/pull/4390) ([zenspider](https://github.com/zenspider))
- Correct filesystem resource docs for windows example [#4713](https://github.com/inspec/inspec/pull/4713) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fixes parsing of apt config files with arch specifier. [#4707](https://github.com/inspec/inspec/pull/4707) ([zenspider](https://github.com/zenspider))
- Dropping chef-core from dependencies. [#4722](https://github.com/inspec/inspec/pull/4722) ([zenspider](https://github.com/zenspider))

## [v4.18.24](https://github.com/inspec/inspec/tree/v4.18.24) (2019-11-01)

#### Bug Fixes
- Replace input to_hash method, and add unit test for it [#4545](https://github.com/inspec/inspec/pull/4545) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix TarProvider when the tarball has empty files in it. [#4619](https://github.com/inspec/inspec/pull/4619) ([zenspider](https://github.com/zenspider))
- iis_app_pool better handling of non-existent pools. [#4636](https://github.com/inspec/inspec/pull/4636) ([miah](https://github.com/miah))
- Fix filesystem resource when device has long name [#4637](https://github.com/inspec/inspec/pull/4637) ([miah](https://github.com/miah))
- Add #to_s to etc_hosts_allow, and add tests [#4638](https://github.com/inspec/inspec/pull/4638) ([miah](https://github.com/miah))
- Improve testing for yum.repo in CentOS 8 [#4568](https://github.com/inspec/inspec/pull/4568) ([ramereth](https://github.com/ramereth))
- Fix config reference in `compliance exec` [#4650](https://github.com/inspec/inspec/pull/4650) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Telemetry: add chef-core [#4569](https://github.com/inspec/inspec/pull/4569) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Goodbye Gordon! [#4577](https://github.com/inspec/inspec/pull/4577) ([miah](https://github.com/miah))
- Re-organize test-kitchen files. Add BK Pipeline [#4601](https://github.com/inspec/inspec/pull/4601) ([miah](https://github.com/miah))
- Empty resources yml until I build it. [#4610](https://github.com/inspec/inspec/pull/4610) ([miah](https://github.com/miah))
- Dont trigger yet [#4611](https://github.com/inspec/inspec/pull/4611) ([miah](https://github.com/miah))
- Use a good profile with inspec check test [#4612](https://github.com/inspec/inspec/pull/4612) ([miah](https://github.com/miah))
- Refactored and added an alternative test mock resource system. [#4566](https://github.com/inspec/inspec/pull/4566) ([zenspider](https://github.com/zenspider))
- Make shell script executable [#4618](https://github.com/inspec/inspec/pull/4618) ([miah](https://github.com/miah))
- Fix the path for our scripts, I don&#39;t know where I got /workdir [#4620](https://github.com/inspec/inspec/pull/4620) ([miah](https://github.com/miah))
- Fix the search button wiring. [#4625](https://github.com/inspec/inspec/pull/4625) ([zenspider](https://github.com/zenspider))
- Rescue SystemStackError to make errors during inspec check/archive more graceful. [#4597](https://github.com/inspec/inspec/pull/4597) ([zenspider](https://github.com/zenspider))
- Clean up testing in inspec exec by stripping ansi color codes from output. [#4598](https://github.com/inspec/inspec/pull/4598) ([zenspider](https://github.com/zenspider))
- JSON processing and resource cleanup [#4627](https://github.com/inspec/inspec/pull/4627) ([zenspider](https://github.com/zenspider))
- Update waivers.md [#4631](https://github.com/inspec/inspec/pull/4631) ([larryebaum](https://github.com/larryebaum))
- Add ruby 2.7 preview [#4600](https://github.com/inspec/inspec/pull/4600) ([miah](https://github.com/miah))
- Fix a crash from users resource if the password has never been updated [#4635](https://github.com/inspec/inspec/pull/4635) ([zenspider](https://github.com/zenspider))
- Create a user &#39;normal&#39; and use it to run tests. Also bundle caching. [#4626](https://github.com/inspec/inspec/pull/4626) ([zenspider](https://github.com/zenspider))
- Fixed the rest of the minitest deprecations by removing FuncTestRunResult. [#4628](https://github.com/inspec/inspec/pull/4628) ([zenspider](https://github.com/zenspider))
- bumped the windows tests again [#4649](https://github.com/inspec/inspec/pull/4649) ([zenspider](https://github.com/zenspider))
- Fix building the website [#4652](https://github.com/inspec/inspec/pull/4652) ([btm](https://github.com/btm))
- Fixed problem with accessing backend in TestDslLazyLoader#method_missing. [#4648](https://github.com/inspec/inspec/pull/4648) ([zenspider](https://github.com/zenspider))
- oracledb_session fixes [#4654](https://github.com/inspec/inspec/pull/4654) ([miah](https://github.com/miah))
- Nginx Resource: Add parsing support for wildcard, dot prefix, and regex [#4653](https://github.com/inspec/inspec/pull/4653) ([landychan](https://github.com/landychan))
- Ooops. I didn&#39;t need to remove this just yet. html parser is using it. [#4658](https://github.com/inspec/inspec/pull/4658) ([miah](https://github.com/miah))
- Fixed runner tests for windows. [#4659](https://github.com/inspec/inspec/pull/4659) ([zenspider](https://github.com/zenspider))

## [v4.18.0](https://github.com/inspec/inspec/tree/v4.18.0) (2019-10-10)

#### Bug Fixes
- Fix problem in method_missing in rspec extensions when backend unavailable. [#4565](https://github.com/inspec/inspec/pull/4565) ([zenspider](https://github.com/zenspider))

#### Merged Pull Requests
- Fixed tests to work with rspec-expectations 3.8.5+. [#4557](https://github.com/inspec/inspec/pull/4557) ([zenspider](https://github.com/zenspider))
- First pass at cleaning deprecations for old minitest/spec-style tests. [#4563](https://github.com/inspec/inspec/pull/4563) ([zenspider](https://github.com/zenspider))
- Fixed apt resource incorrectly parsing deb files w/ quoted URIs. [#4560](https://github.com/inspec/inspec/pull/4560) ([zenspider](https://github.com/zenspider))
- Missing require for EnvPrinter means `inspec env` stacktraced. [#4554](https://github.com/inspec/inspec/pull/4554) ([miah](https://github.com/miah))
- Add name property to interface resource [#4558](https://github.com/inspec/inspec/pull/4558) ([miah](https://github.com/miah))
- Remove unused polyfill.rb file adding to_h to Struct [#4553](https://github.com/inspec/inspec/pull/4553) ([miah](https://github.com/miah))
- Don&#39;t use #at when you can use #[] for array (or hash) access. [#4556](https://github.com/inspec/inspec/pull/4556) ([zenspider](https://github.com/zenspider))
- User windows fix [#4452](https://github.com/inspec/inspec/pull/4452) ([mhackethal](https://github.com/mhackethal))
- Pin RSpec to 3.8.6 to avoid test failures for now [#4576](https://github.com/inspec/inspec/pull/4576) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Waivers Feedback - Per control reporting and other minor issues [#4567](https://github.com/inspec/inspec/pull/4567) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.17.17](https://github.com/inspec/inspec/tree/v4.17.17) (2019-10-03)

#### Merged Pull Requests
- Added method_missing to Inspec::DescribeBase (used by describe.one) to fix resource loading [#4549](https://github.com/inspec/inspec/pull/4549) ([zenspider](https://github.com/zenspider))
- Add no-op resource and switch Rule to use it for skipped resources. [#4550](https://github.com/inspec/inspec/pull/4550) ([zenspider](https://github.com/zenspider))

## [v4.17.15](https://github.com/inspec/inspec/tree/v4.17.15) (2019-10-01)

#### Merged Pull Requests
- Pass access token [#4544](https://github.com/inspec/inspec/pull/4544) ([miah](https://github.com/miah))
- Fix config clearing [#4483](https://github.com/inspec/inspec/pull/4483) ([frezbo](https://github.com/frezbo))

## [v4.17.14](https://github.com/inspec/inspec/tree/v4.17.14) (2019-09-30)

#### Bug Fixes
- Add resource stub for sshd_config [#4538](https://github.com/inspec/inspec/pull/4538) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add missing resource stubs for &#39;group&#39; resource [#4537](https://github.com/inspec/inspec/pull/4537) ([baurmatt](https://github.com/baurmatt))

#### Merged Pull Requests
- Yet another bump of our skip_windows! due date. [#4540](https://github.com/inspec/inspec/pull/4540) ([zenspider](https://github.com/zenspider))

## [v4.17.11](https://github.com/inspec/inspec/tree/v4.17.11) (2019-09-28)

#### Merged Pull Requests
- Remove maintainers task from require [#4531](https://github.com/inspec/inspec/pull/4531) ([miah](https://github.com/miah))
- Add resource stubs so the resource loader will find all resources [#4526](https://github.com/inspec/inspec/pull/4526) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fixed inspec lazy resource loader for rspec test dsl (eg before/after) [#4534](https://github.com/inspec/inspec/pull/4534) ([zenspider](https://github.com/zenspider))
- fix Gemfile for inspec-core-bin gem [#4535](https://github.com/inspec/inspec/pull/4535) ([lamont-granquist](https://github.com/lamont-granquist))

## [v4.17.7](https://github.com/inspec/inspec/tree/v4.17.7) (2019-09-27)

#### Bug Fixes
- Fixed file resource raising UndefinedMethod on source_path [#4214](https://github.com/inspec/inspec/pull/4214) ([zenspider](https://github.com/zenspider))
-    Fix broken unit test by adding require [#4469](https://github.com/inspec/inspec/pull/4469) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add to_s definitions to several resources [#4478](https://github.com/inspec/inspec/pull/4478) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Resolve issue where the Inspec::Tag to_ruby method outputs invalid Ruby [#4434](https://github.com/inspec/inspec/pull/4434) ([irvingpop](https://github.com/irvingpop))
- Use File.realpath in Loader#plugin_gem_path to resolve all symlinks. [#4476](https://github.com/inspec/inspec/pull/4476) ([zenspider](https://github.com/zenspider))

#### Merged Pull Requests
- Use new logo branding [#4433](https://github.com/inspec/inspec/pull/4433) ([btm](https://github.com/btm))
- update LCR Roadtrip announcement to 13 cities [#4440](https://github.com/inspec/inspec/pull/4440) ([shaunyap](https://github.com/shaunyap))
- Extended skip_windows to the end of September. [#4441](https://github.com/inspec/inspec/pull/4441) ([zenspider](https://github.com/zenspider))
- Fixed the formatting of `inspec exec -h` by not using long_desc. [#4436](https://github.com/inspec/inspec/pull/4436) ([zenspider](https://github.com/zenspider))
- Guard against nil in apt repo parser. [#4435](https://github.com/inspec/inspec/pull/4435) ([zenspider](https://github.com/zenspider))
- Clean up our use of SecureRandom in Rakefile. [#4447](https://github.com/inspec/inspec/pull/4447) ([zenspider](https://github.com/zenspider))
- Rework activator plugin to be more idiomatic. [#4446](https://github.com/inspec/inspec/pull/4446) ([zenspider](https://github.com/zenspider))
- Fix for postfix_conf when using a non-standard config location [#4443](https://github.com/inspec/inspec/pull/4443) ([ramereth](https://github.com/ramereth))
- Try to decode archive contents to UTF-8 to avoid encoding corruption. [#4451](https://github.com/inspec/inspec/pull/4451) ([zenspider](https://github.com/zenspider))
- Make inspec much faster for most commands. [#4365](https://github.com/inspec/inspec/pull/4365) ([zenspider](https://github.com/zenspider))
- waivers: functional test fixture and eval-time skipping [#4427](https://github.com/inspec/inspec/pull/4427) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Rough draft on waiver input [#4437](https://github.com/inspec/inspec/pull/4437) ([zenspider](https://github.com/zenspider))
- json resource: Add handling for `command:` error [#3844](https://github.com/inspec/inspec/pull/3844) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Update rubygems and use gem env for system details. [#4475](https://github.com/inspec/inspec/pull/4475) ([zenspider](https://github.com/zenspider))
- Fix simple typo: becuase -&gt; because [#4484](https://github.com/inspec/inspec/pull/4484) ([timgates42](https://github.com/timgates42))
- Added test:isolate task that runs tests isolated but in parallel. [#4480](https://github.com/inspec/inspec/pull/4480) ([zenspider](https://github.com/zenspider))
- Split out Inspec::Input functional code from the code generation code. [#4485](https://github.com/inspec/inspec/pull/4485) ([zenspider](https://github.com/zenspider))
- Expand sys_info resource functionality [#4388](https://github.com/inspec/inspec/pull/4388) ([Vancelot11](https://github.com/Vancelot11))
- Waivers Phase 3 [#4493](https://github.com/inspec/inspec/pull/4493) ([miah](https://github.com/miah))
- Fixed MssqlSession.query not escaping double quote correctly [#4393](https://github.com/inspec/inspec/pull/4393) ([dalee-bis](https://github.com/dalee-bis))
- Split and parallelize some tests to make them faster [#4490](https://github.com/inspec/inspec/pull/4490) ([zenspider](https://github.com/zenspider))
- Fixed Inspec::Plugin::V2::Registry#detect_system_plugins [#4513](https://github.com/inspec/inspec/pull/4513) ([zenspider](https://github.com/zenspider))
- Added first draft of waiver doco. [#4518](https://github.com/inspec/inspec/pull/4518) ([zenspider](https://github.com/zenspider))

## [v4.16.0](https://github.com/inspec/inspec/tree/v4.16.0) (2019-08-29)

#### New Resources
- Add a Postfix-specific configuration testing resource [#4378](https://github.com/inspec/inspec/pull/4378) ([dmgasper](https://github.com/dmgasper))

#### New Features
- Accept input keys via the Runner API [#4398](https://github.com/inspec/inspec/pull/4398) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add plugin config settings to Config [#4406](https://github.com/inspec/inspec/pull/4406) ([clintoncwolfe](https://github.com/clintoncwolfe))
- inputs: Accept bare input from the command line [#4401](https://github.com/inspec/inspec/pull/4401) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Ignore .swp files [#4389](https://github.com/inspec/inspec/pull/4389) ([Vancelot11](https://github.com/Vancelot11))
- inspec check: warn if inspec_version is not supported by current inspec [#4419](https://github.com/inspec/inspec/pull/4419) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- Ensure that resources are always initialized in all cases [#4366](https://github.com/inspec/inspec/pull/4366) ([zenspider](https://github.com/zenspider))
- inspec plugins: List system plugins and other UX improvements [#4387](https://github.com/inspec/inspec/pull/4387) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Refactor lib/source_readers/inspec.rb [#4376](https://github.com/inspec/inspec/pull/4376) ([zenspider](https://github.com/zenspider))
- Remove inspec-vault from the plugin exclusion list [#4411](https://github.com/inspec/inspec/pull/4411) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Let expeditor respond to pull requests. [#4430](https://github.com/inspec/inspec/pull/4430) ([miah](https://github.com/miah))
- Deprecate macOS 10.12 and add macOS 10.15 support [#4421](https://github.com/inspec/inspec/pull/4421) ([jaymalasinha](https://github.com/jaymalasinha))

## [v4.12.0](https://github.com/inspec/inspec/tree/v4.12.0) (2019-08-15)

#### New Features
- Add startuser windows service [#4363](https://github.com/inspec/inspec/pull/4363) ([mbaitelman](https://github.com/mbaitelman))

#### Bug Fixes
- Fixed syntax errors in wmi doco. [#4370](https://github.com/inspec/inspec/pull/4370) ([zenspider](https://github.com/zenspider))
- group resource: Modified DarwinGroup to collect all users properly on macos [#4343](https://github.com/inspec/inspec/pull/4343) ([zenspider](https://github.com/zenspider))

#### Merged Pull Requests
- Only bump versions when we modify InSpec. [#4348](https://github.com/inspec/inspec/pull/4348) ([miah](https://github.com/miah))
- Move some resources into Inspec::Resources module [#4361](https://github.com/inspec/inspec/pull/4361) ([KrisShannon](https://github.com/KrisShannon))
- Add a retry to expeditor defaults, per shain&#39;s advice. [#4369](https://github.com/inspec/inspec/pull/4369) ([zenspider](https://github.com/zenspider))
- Remove timebombs on skip_until and licensing tests. [#4351](https://github.com/inspec/inspec/pull/4351) ([zenspider](https://github.com/zenspider))
- Stop building Chef InSpec on SLES 11 [#4374](https://github.com/inspec/inspec/pull/4374) ([schisamo](https://github.com/schisamo))
- Fixed typo in umask example [#4360](https://github.com/inspec/inspec/pull/4360) ([kclinden](https://github.com/kclinden))
- README: Add platform detail to support info in runtime list [#4375](https://github.com/inspec/inspec/pull/4375) ([clintoncwolfe](https://github.com/clintoncwolfe))
- I didn&#39;t get the BK setup right, nor did the verification check this. [#4380](https://github.com/inspec/inspec/pull/4380) ([zenspider](https://github.com/zenspider))
- change announcement to LCR Road Trip [#4379](https://github.com/inspec/inspec/pull/4379) ([shaunyap](https://github.com/shaunyap))
- Moved the osx? guard below minitest/autorun. [#4381](https://github.com/inspec/inspec/pull/4381) ([zenspider](https://github.com/zenspider))
- Begin signing MSI&#39;s with renewed Windows Signing Cert [#4386](https://github.com/inspec/inspec/pull/4386) ([schisamo](https://github.com/schisamo))
- Add deps on train 3 and train-winrm 0.2 [#4355](https://github.com/inspec/inspec/pull/4355) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v4.10.4](https://github.com/inspec/inspec/tree/v4.10.4) (2019-08-01)

#### New Features
- Transition the Habitat plugin to use scaffolding [#4320](https://github.com/inspec/inspec/pull/4320) ([TheLunaticScripter](https://github.com/TheLunaticScripter))
- Permit plugin to be in path with git ref [#4251](https://github.com/inspec/inspec/pull/4251) ([james-stocks](https://github.com/james-stocks))
- Relative Path Support for the Git Fetcher [#4217](https://github.com/inspec/inspec/pull/4217) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Initial pass to clean up functional testing wrt exit codes and output. [#4324](https://github.com/inspec/inspec/pull/4324) ([zenspider](https://github.com/zenspider))
- Add SHA512 password example to `shadow` resource [#4314](https://github.com/inspec/inspec/pull/4314) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- windows_task: Fix handling of multiple triggers [#4242](https://github.com/inspec/inspec/pull/4242) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Change expeditor timeout from 30 to 45. [#4335](https://github.com/inspec/inspec/pull/4335) ([zenspider](https://github.com/zenspider))
- Found more tests that we&#39;ve probably never actually run. [#4334](https://github.com/inspec/inspec/pull/4334) ([zenspider](https://github.com/zenspider))
- Removed lib/inspec/utils/latest_version.rb and associated code. [#4337](https://github.com/inspec/inspec/pull/4337) ([zenspider](https://github.com/zenspider))
- Remove travis and appveyor [#4339](https://github.com/inspec/inspec/pull/4339) ([miah](https://github.com/miah))
- Remove appveyor and travis badges; switch to buildkite [#4341](https://github.com/inspec/inspec/pull/4341) ([miah](https://github.com/miah))
- Apply new UI code to CLI and plugin-manager-cli [#4000](https://github.com/inspec/inspec/pull/4000) ([miah](https://github.com/miah))
- Add integration pipelines, and a schedule (it does nothing) [#4346](https://github.com/inspec/inspec/pull/4346) ([miah](https://github.com/miah))
- point badge to master [#4347](https://github.com/inspec/inspec/pull/4347) ([miah](https://github.com/miah))
- changed legal refs to point to chef.io proper [#4345](https://github.com/inspec/inspec/pull/4345) ([kekaichinose](https://github.com/kekaichinose))
- Bump skipped license tests by 2 weeks. [#4352](https://github.com/inspec/inspec/pull/4352) ([zenspider](https://github.com/zenspider))

## [v4.7.24](https://github.com/inspec/inspec/tree/v4.7.24) (2019-07-26)

#### Bug Fixes
- Suppress gem docs when installing plugins [#4286](https://github.com/inspec/inspec/pull/4286) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Un-deprecate the be_running matcher on service resource [#4295](https://github.com/inspec/inspec/pull/4295) ([clintoncwolfe](https://github.com/clintoncwolfe))
- add resource sys_info.manufacturer and sys_info.model [#4230](https://github.com/inspec/inspec/pull/4230) ([yeoldegrove](https://github.com/yeoldegrove))
- Add windows to verify pipeline [#4325](https://github.com/inspec/inspec/pull/4325) ([miah](https://github.com/miah))
- Fix exceptions when resources are used with incompatible transports [#4316](https://github.com/inspec/inspec/pull/4316) ([zenspider](https://github.com/zenspider))
- bye netlify [#4332](https://github.com/inspec/inspec/pull/4332) ([miah](https://github.com/miah))

## [v4.7.18](https://github.com/inspec/inspec/tree/v4.7.18) (2019-07-18)

#### Merged Pull Requests
- use --- and +++ to improve the log view on buildkite [#4281](https://github.com/inspec/inspec/pull/4281) ([miah](https://github.com/miah))
- omnibus test will now run more than inspec version [#4283](https://github.com/inspec/inspec/pull/4283) ([miah](https://github.com/miah))
- Put buildkite verify commands into a bash script [#4284](https://github.com/inspec/inspec/pull/4284) ([miah](https://github.com/miah))
- chefstyle -a [#4276](https://github.com/inspec/inspec/pull/4276) ([miah](https://github.com/miah))
- Push back test time limit by one month [#4293](https://github.com/inspec/inspec/pull/4293) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Updating Maintainers [#4287](https://github.com/inspec/inspec/pull/4287) ([kekaichinose](https://github.com/kekaichinose))
- This should get buildkite green for now. [#4304](https://github.com/inspec/inspec/pull/4304) ([zenspider](https://github.com/zenspider))
- Typo in class name (obvious fix) [#4302](https://github.com/inspec/inspec/pull/4302) ([TheLonelyGhost](https://github.com/TheLonelyGhost))
- Enable RHEL 8 packages [#4294](https://github.com/inspec/inspec/pull/4294) ([jaymalasinha](https://github.com/jaymalasinha))
- Adding inspec-aws to contrib [#4298](https://github.com/inspec/inspec/pull/4298) ([kekaichinose](https://github.com/kekaichinose))
- Removed integration tests [#4307](https://github.com/inspec/inspec/pull/4307) ([zenspider](https://github.com/zenspider))
- LANG should have gone into coverage as wel [#4308](https://github.com/inspec/inspec/pull/4308) ([zenspider](https://github.com/zenspider))
- Enable Windows 2019 packages [#4311](https://github.com/inspec/inspec/pull/4311) ([jaymalasinha](https://github.com/jaymalasinha))
- Automatically publish release notes and announce releases [#4312](https://github.com/inspec/inspec/pull/4312) ([schisamo](https://github.com/schisamo))
- Create private pipelines for website management. [#4313](https://github.com/inspec/inspec/pull/4313) ([miah](https://github.com/miah))

## [v4.7.3](https://github.com/inspec/inspec/tree/v4.7.3) (2019-07-09)

#### New Resources
- Add ip6tables resource [#4236](https://github.com/inspec/inspec/pull/4236) ([ramereth](https://github.com/ramereth))

#### Enhancements
- Add CLI target examples for Windows domain users [#4238](https://github.com/inspec/inspec/pull/4238) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Bug Fixes
- Debian service detection for Buster [#4233](https://github.com/inspec/inspec/pull/4233) ([jaredledvina](https://github.com/jaredledvina))

#### Merged Pull Requests
- Deprecate Ubuntu-14 [#4254](https://github.com/inspec/inspec/pull/4254) ([christopher-snapp](https://github.com/christopher-snapp))
- Add a verify pipeline to buildkite [#4257](https://github.com/inspec/inspec/pull/4257) ([miah](https://github.com/miah))
- Update azure_resource_group.md.erb [#4259](https://github.com/inspec/inspec/pull/4259) ([kekaichinose](https://github.com/kekaichinose))
- Add steps to verify pipeline [#4258](https://github.com/inspec/inspec/pull/4258) ([miah](https://github.com/miah))
- properly declare environment variable [#4262](https://github.com/inspec/inspec/pull/4262) ([miah](https://github.com/miah))
- maintainer_group is deprecated [#4263](https://github.com/inspec/inspec/pull/4263) ([miah](https://github.com/miah))
- Add test coverage to pipeline [#4264](https://github.com/inspec/inspec/pull/4264) ([miah](https://github.com/miah))
- Use correct indentation levels in .expeditor/config.yml [#4267](https://github.com/inspec/inspec/pull/4267) ([tduffield](https://github.com/tduffield))
- skip lint, just run tests [#4266](https://github.com/inspec/inspec/pull/4266) ([miah](https://github.com/miah))
- Add allowed users example to Users resource [#4269](https://github.com/inspec/inspec/pull/4269) ([shoekstra](https://github.com/shoekstra))
- chefstyle recent pr [#4272](https://github.com/inspec/inspec/pull/4272) ([miah](https://github.com/miah))
- 30 minute timeout [#4275](https://github.com/inspec/inspec/pull/4275) ([miah](https://github.com/miah))
- Pin Chefstyle. [#4280](https://github.com/inspec/inspec/pull/4280) ([miah](https://github.com/miah))

## [v4.6.9](https://github.com/inspec/inspec/tree/v4.6.9) (2019-07-01)

#### Bug Fixes
- Set the umask on travis in before_install so that file resource permission matcher can be tested [#4223](https://github.com/inspec/inspec/pull/4223) ([zenspider](https://github.com/zenspider))

#### Merged Pull Requests
- Allow to switch off the license check for community distributions [#4156](https://github.com/inspec/inspec/pull/4156) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Update date on our timebomb. [#4232](https://github.com/inspec/inspec/pull/4232) ([miah](https://github.com/miah))
- Add .bldr.toml for Linux 2 Habitat builds [#4231](https://github.com/inspec/inspec/pull/4231) ([TheLunaticScripter](https://github.com/TheLunaticScripter))
- use stdlib SecureRandom to generate a password [#4246](https://github.com/inspec/inspec/pull/4246) ([robbkidd](https://github.com/robbkidd))

## [v4.6.4](https://github.com/inspec/inspec/tree/v4.6.4) (2019-06-19)

#### Bug Fixes
- nginx_conf: Fix commented/empty file parsing [#4215](https://github.com/inspec/inspec/pull/4215) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v4.6.3](https://github.com/inspec/inspec/tree/v4.6.3) (2019-06-17)

#### New Features
- Rename &#39;attribute&#39; DSL method to &#39;input&#39; [#4008](https://github.com/inspec/inspec/pull/4008) ([clintoncwolfe](https://github.com/clintoncwolfe))
- New plugin type: Input [#4019](https://github.com/inspec/inspec/pull/4019) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Rename attributes -&gt; inputs in profile metadata files [#4017](https://github.com/inspec/inspec/pull/4017) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Add inspec-*-bin to the plugin filter list [#4018](https://github.com/inspec/inspec/pull/4018) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Improve testing on inputs that do not have values [#4007](https://github.com/inspec/inspec/pull/4007) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add missing tests for DataSeries#enabled? #disable [#4036](https://github.com/inspec/inspec/pull/4036) ([miah](https://github.com/miah))
- Add inspec-core-bin as a gem [#4009](https://github.com/inspec/inspec/pull/4009) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- inspec check: Send log to STDERR when running with --format json [#4001](https://github.com/inspec/inspec/pull/4001) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix two misrendering hyperlinks in resource docs [#4173](https://github.com/inspec/inspec/pull/4173) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix Expeditor Version Bump Script [#4205](https://github.com/inspec/inspec/pull/4205) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Remove clean-static-libs from omnibus build [#4207](https://github.com/inspec/inspec/pull/4207) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Update software names in readme [#4014](https://github.com/inspec/inspec/pull/4014) ([mjingle](https://github.com/mjingle))
- Update resource registry_key documentation example [#4004](https://github.com/inspec/inspec/pull/4004) ([miah](https://github.com/miah))
- Update the omnibus build license to the Chef EULA [#4038](https://github.com/inspec/inspec/pull/4038) ([btm](https://github.com/btm))
- Modernize use of Minitest. [#4023](https://github.com/inspec/inspec/pull/4023) ([zenspider](https://github.com/zenspider))
- Change software name from InSpec to Chef Inspec in documentation [#3987](https://github.com/inspec/inspec/pull/3987) ([IanMadd](https://github.com/IanMadd))
- First step to get inspec names changeable [#3954](https://github.com/inspec/inspec/pull/3954) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Enable user telemetry opt-in / opt-out on cli [#4025](https://github.com/inspec/inspec/pull/4025) ([miah](https://github.com/miah))
- Add Coveralls.io support to InSpec [#3988](https://github.com/inspec/inspec/pull/3988) ([miah](https://github.com/miah))
- Remove `# encoding: utf8` magic comments [#4041](https://github.com/inspec/inspec/pull/4041) ([miah](https://github.com/miah))
- Configure expeditor to delete the branch after it is merged. [#4024](https://github.com/inspec/inspec/pull/4024) ([miah](https://github.com/miah))
- Convert Chef EULA to a local file [#4045](https://github.com/inspec/inspec/pull/4045) ([btm](https://github.com/btm))
- Relocate core resources from lib/resources to lib/inspec/resources [#4042](https://github.com/inspec/inspec/pull/4042) ([miah](https://github.com/miah))
- Wrap resources in backticks and remove resource name capitalizing [#4043](https://github.com/inspec/inspec/pull/4043) ([alexpop](https://github.com/alexpop))
- Fix broken tests after removing magic comments. [#4046](https://github.com/inspec/inspec/pull/4046) ([miah](https://github.com/miah))
- Remove more magic comments [#4050](https://github.com/inspec/inspec/pull/4050) ([miah](https://github.com/miah))
- Emergency test fixes! [#4066](https://github.com/inspec/inspec/pull/4066) ([zenspider](https://github.com/zenspider))
- Add codeclimate to our pipeline [#4044](https://github.com/inspec/inspec/pull/4044) ([miah](https://github.com/miah))
- Make the postgres resource more defensive [#4037](https://github.com/inspec/inspec/pull/4037) ([alexpop](https://github.com/alexpop))
- Removed unneeded &#39;supports: windows&#39; [#4052](https://github.com/inspec/inspec/pull/4052) ([aaronlippold](https://github.com/aaronlippold))
- Include info about Chef License Requirements [#4071](https://github.com/inspec/inspec/pull/4071) ([mjingle](https://github.com/mjingle))
- Update our Code of Conduct [#4072](https://github.com/inspec/inspec/pull/4072) ([miah](https://github.com/miah))
- Upgrade to Ruby 2.6.3 [#4073](https://github.com/inspec/inspec/pull/4073) ([tas50](https://github.com/tas50))
- Cleanup and fix failing Kitchen tests [#4074](https://github.com/inspec/inspec/pull/4074) ([tas50](https://github.com/tas50))
- Add kitchen rake testing [#4076](https://github.com/inspec/inspec/pull/4076) ([lamont-granquist](https://github.com/lamont-granquist))
-  Build the InSpec gem directly in Kitchen so we can run locally  [#4077](https://github.com/inspec/inspec/pull/4077) ([tas50](https://github.com/tas50))
- Remove the deprecated linux_kernel_parameter resource test [#4078](https://github.com/inspec/inspec/pull/4078) ([tas50](https://github.com/tas50))
- `rubocop -a` on kitchen directory [#4082](https://github.com/inspec/inspec/pull/4082) ([miah](https://github.com/miah))
- Updates the init profile description to show proper usage [#4085](https://github.com/inspec/inspec/pull/4085) ([burtlo](https://github.com/burtlo))
- Fix up sporadically failing tests and ensure tests can run independently [#4031](https://github.com/inspec/inspec/pull/4031) ([zenspider](https://github.com/zenspider))
- Fix circular require in telemetry [#4083](https://github.com/inspec/inspec/pull/4083) ([miah](https://github.com/miah))
- Fix @profile_name not initialized [#4081](https://github.com/inspec/inspec/pull/4081) ([miah](https://github.com/miah))
- Use #key? rather than #has_key? in profile_name ternary [#4101](https://github.com/inspec/inspec/pull/4101) ([miah](https://github.com/miah))
- Turn off logging in our test. [#4103](https://github.com/inspec/inspec/pull/4103) ([zenspider](https://github.com/zenspider))
- Fix @unique_controls uninitialized warning [#4079](https://github.com/inspec/inspec/pull/4079) ([miah](https://github.com/miah))
- This needed to be a flat_map because :profiles was an array. [#4110](https://github.com/inspec/inspec/pull/4110) ([zenspider](https://github.com/zenspider))
- Fixes a test interaction bug between installer and loader. [#4111](https://github.com/inspec/inspec/pull/4111) ([zenspider](https://github.com/zenspider))
- json was required twice. [#4118](https://github.com/inspec/inspec/pull/4118) ([miah](https://github.com/miah))
- Fix missing requires in toml, postgres_conf resources [#4119](https://github.com/inspec/inspec/pull/4119) ([miah](https://github.com/miah))
- Add support for Gemfile.local [#4105](https://github.com/inspec/inspec/pull/4105) ([zenspider](https://github.com/zenspider))
- Clean up API doco [#4114](https://github.com/inspec/inspec/pull/4114) ([zenspider](https://github.com/zenspider))
- Just use math. [#4113](https://github.com/inspec/inspec/pull/4113) ([zenspider](https://github.com/zenspider))
- Clean more requires [#4116](https://github.com/inspec/inspec/pull/4116) ([zenspider](https://github.com/zenspider))
- Stop using method(...).call(...) [#4115](https://github.com/inspec/inspec/pull/4115) ([zenspider](https://github.com/zenspider))
- Delete test/unit/helper.rb [#4108](https://github.com/inspec/inspec/pull/4108) ([zenspider](https://github.com/zenspider))
- Fixed missing requires. [#4100](https://github.com/inspec/inspec/pull/4100) ([zenspider](https://github.com/zenspider))
- Minor require cleanup for telemetry. [#4107](https://github.com/inspec/inspec/pull/4107) ([zenspider](https://github.com/zenspider))
- Ensure AwsResourceMixin returns a resource name in deprecation message [#4104](https://github.com/inspec/inspec/pull/4104) ([miah](https://github.com/miah))
- Fix github url regex. Add period for repo [#4089](https://github.com/inspec/inspec/pull/4089) ([mirskiy](https://github.com/mirskiy))
- GCP Update for InSpec Cloud Platform documentation [#4122](https://github.com/inspec/inspec/pull/4122) ([mjingle](https://github.com/mjingle))
- Flag `rubocop:disable` comments as something to be fixed. [#4123](https://github.com/inspec/inspec/pull/4123) ([miah](https://github.com/miah))
- No tabs. [#4143](https://github.com/inspec/inspec/pull/4143) ([zenspider](https://github.com/zenspider))
- supermakert -&gt; supermarket [#4140](https://github.com/inspec/inspec/pull/4140) ([zenspider](https://github.com/zenspider))
- Extracting mock_loader to its own helper file. [#4141](https://github.com/inspec/inspec/pull/4141) ([zenspider](https://github.com/zenspider))
- Update author/email tags in gemspec [#4137](https://github.com/inspec/inspec/pull/4137) ([miah](https://github.com/miah))
- Move utils under inspec directory namespace [#4063](https://github.com/inspec/inspec/pull/4063) ([miah](https://github.com/miah))
- Remove authors tags from source files. [#4147](https://github.com/inspec/inspec/pull/4147) ([miah](https://github.com/miah))
- Dist branding for some of plugins [#4136](https://github.com/inspec/inspec/pull/4136) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Cache the .rvm directory in travis [#4153](https://github.com/inspec/inspec/pull/4153) ([miah](https://github.com/miah))
- Make travis green again [#4160](https://github.com/inspec/inspec/pull/4160) ([zenspider](https://github.com/zenspider))
- Windows fixes [#4159](https://github.com/inspec/inspec/pull/4159) ([zenspider](https://github.com/zenspider))
- Clean unnecessary requires [#4142](https://github.com/inspec/inspec/pull/4142) ([zenspider](https://github.com/zenspider))
- Update sunset messages on 2 resources [#4164](https://github.com/inspec/inspec/pull/4164) ([clintoncwolfe](https://github.com/clintoncwolfe))
- This should fix our licensing failures [#4165](https://github.com/inspec/inspec/pull/4165) ([zenspider](https://github.com/zenspider))
- Replace Jenkins omnibus build/test pipeline with Buildkite [#4169](https://github.com/inspec/inspec/pull/4169) ([jeremiahsnapp](https://github.com/jeremiahsnapp))
- Mention inspec-bin gem in installation instructions [#4163](https://github.com/inspec/inspec/pull/4163) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Remove all leading newlines. [#4152](https://github.com/inspec/inspec/pull/4152) ([miah](https://github.com/miah))
- Minor cleanup on test/helper.rb [#4109](https://github.com/inspec/inspec/pull/4109) ([zenspider](https://github.com/zenspider))
- Creating and Publishing InSpec Team Working Agreement [#4171](https://github.com/inspec/inspec/pull/4171) ([kekaichinose](https://github.com/kekaichinose))
- Replace jsonschema with json-schema [#4172](https://github.com/inspec/inspec/pull/4172) ([miah](https://github.com/miah))
- Turn off parallel testing (for now?) [#4177](https://github.com/inspec/inspec/pull/4177) ([zenspider](https://github.com/zenspider))
- Stabilize windows functional testing [#4180](https://github.com/inspec/inspec/pull/4180) ([zenspider](https://github.com/zenspider))
- Fixing docs so Warning note appears [#4183](https://github.com/inspec/inspec/pull/4183) ([mjingle](https://github.com/mjingle))
- Changed version check network timeout from 1 to 3 seconds. [#4132](https://github.com/inspec/inspec/pull/4132) ([zenspider](https://github.com/zenspider))
- Fixed up interactions between minitest &amp; simplecov. [#4188](https://github.com/inspec/inspec/pull/4188) ([zenspider](https://github.com/zenspider))
- Add maintainer branches to travis [#4184](https://github.com/inspec/inspec/pull/4184) ([zenspider](https://github.com/zenspider))
- Test execution changes for Rake, Travis, and Appveyor [#4102](https://github.com/inspec/inspec/pull/4102) ([miah](https://github.com/miah))
- Close at 400 days, with a message. [#4189](https://github.com/inspec/inspec/pull/4189) ([miah](https://github.com/miah))
- Apply chefstyle to codebase [#4194](https://github.com/inspec/inspec/pull/4194) ([zenspider](https://github.com/zenspider))
- Speed up inspec [#4193](https://github.com/inspec/inspec/pull/4193) ([zenspider](https://github.com/zenspider))
- Disable rubocop on Code Climate. [#4195](https://github.com/inspec/inspec/pull/4195) ([miah](https://github.com/miah))
- Create Inputs documentation page [#4185](https://github.com/inspec/inspec/pull/4185) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Re-add `rake test:` [#4197](https://github.com/inspec/inspec/pull/4197) ([miah](https://github.com/miah))
- Update test code to rename attribute() to input() in DSL [#4192](https://github.com/inspec/inspec/pull/4192) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Lets discuss this next week when we&#39;re all around =) [#4204](https://github.com/inspec/inspec/pull/4204) ([miah](https://github.com/miah))

## [v4.3.2](https://github.com/inspec/inspec/tree/v4.3.2) (2019-04-30)

#### New Features
- Telemetry Object Model [#3928](https://github.com/inspec/inspec/pull/3928) ([miah](https://github.com/miah))
- Add license acceptance to InSpec v4 [#3935](https://github.com/inspec/inspec/pull/3935) ([clintoncwolfe](https://github.com/clintoncwolfe))
- file: add `more_permissive_than?(mode)` matcher [#3895](https://github.com/inspec/inspec/pull/3895) ([aaronlippold](https://github.com/aaronlippold))
- Internal overhaul of Inputs system [#3875](https://github.com/inspec/inspec/pull/3875) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Update AWS profile generation for InSpec 4 to depend on the new resou… [#3831](https://github.com/inspec/inspec/pull/3831) ([skpaterson](https://github.com/skpaterson))
- Add inspec-habitat resources to website docs [#3941](https://github.com/inspec/inspec/pull/3941) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Use deprecation facility everywhere - v4 port [#3956](https://github.com/inspec/inspec/pull/3956) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update to Ruby 2.6.2 and Rubygems 3.0.3 [#3994](https://github.com/inspec/inspec/pull/3994) ([tas50](https://github.com/tas50))

#### Bug Fixes
- inspec compliance: Fix mocked configuration [#3834](https://github.com/inspec/inspec/pull/3834) ([skylerto](https://github.com/skylerto))
- detect postgres 10 on centos properly [#3833](https://github.com/inspec/inspec/pull/3833) ([chris-rock](https://github.com/chris-rock))
- Improve ss parsing code for IPv6 addresses [#3962](https://github.com/inspec/inspec/pull/3962) ([miah](https://github.com/miah))
- update &#39;low&#39; impact value to align with CVSS 3.0 [#3961](https://github.com/inspec/inspec/pull/3961) ([aaronlippold](https://github.com/aaronlippold))

#### Merged Pull Requests
- Attributes-Inputs Rename: Move test files [#3796](https://github.com/inspec/inspec/pull/3796) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Attribute-Input Rename: Rename codefiles [#3803](https://github.com/inspec/inspec/pull/3803) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update support platforms in the readme [#3812](https://github.com/inspec/inspec/pull/3812) ([tas50](https://github.com/tas50))
- Attribute-Input Rename: Add deprecation group [#3805](https://github.com/inspec/inspec/pull/3805) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Moved the AWS init profile to the correct location. [#3820](https://github.com/inspec/inspec/pull/3820) ([skpaterson](https://github.com/skpaterson))
- Add a deprecation group for core AWS resources [#3824](https://github.com/inspec/inspec/pull/3824) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Suppress warnings in unit test output [#3828](https://github.com/inspec/inspec/pull/3828) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add term-ansicolor to inspec-core gem [#3798](https://github.com/inspec/inspec/pull/3798) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Attribute-&gt;Input Rename:  Rename Classes and Methods [#3811](https://github.com/inspec/inspec/pull/3811) ([clintoncwolfe](https://github.com/clintoncwolfe))
- add json example from http request [#3827](https://github.com/inspec/inspec/pull/3827) ([jtimberman](https://github.com/jtimberman))
- Update the integration tests to use dokken-images and newer Chef technologies [#3814](https://github.com/inspec/inspec/pull/3814) ([tas50](https://github.com/tas50))
- Fix broken links in migration docs. [#3907](https://github.com/inspec/inspec/pull/3907) ([joshlarsen](https://github.com/joshlarsen))
- crontab: Add validation for path param [#3899](https://github.com/inspec/inspec/pull/3899) ([skpaterson](https://github.com/skpaterson))
- apt: correct docs to clarify that it matches repositories not packages [#3915](https://github.com/inspec/inspec/pull/3915) ([nqb](https://github.com/nqb))
- Remove EOL Ubuntu / macOS platform testing [#3910](https://github.com/inspec/inspec/pull/3910) ([tas50](https://github.com/tas50))
- Attribute-&gt;Input Rename: Rename cli option [#3879](https://github.com/inspec/inspec/pull/3879) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fix winrm no-such-transport test [#3927](https://github.com/inspec/inspec/pull/3927) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Remove the omnibus override to use train 1.X [#3940](https://github.com/inspec/inspec/pull/3940) ([tas50](https://github.com/tas50))
- Test with webmock 3+ [#3939](https://github.com/inspec/inspec/pull/3939) ([tas50](https://github.com/tas50))
- Support address matchers on interface resource [#3897](https://github.com/inspec/inspec/pull/3897) ([mattlqx](https://github.com/mattlqx))
- Require Ruby 2.4 or later [#3953](https://github.com/inspec/inspec/pull/3953) ([tas50](https://github.com/tas50))
- Use the upstream unf_ext again [#3963](https://github.com/inspec/inspec/pull/3963) ([tas50](https://github.com/tas50))
- Add ed25519 gems in the omnibus group [#3970](https://github.com/inspec/inspec/pull/3970) ([tas50](https://github.com/tas50))
- Remove be_immutable matcher [#3975](https://github.com/inspec/inspec/pull/3975) ([mjingle](https://github.com/mjingle))
- When mssql response is parsed, header might be nil. [#3971](https://github.com/inspec/inspec/pull/3971) ([miah](https://github.com/miah))
- Update plugin test fixtures for Ruby 2.6 and remove for 2.3 [#3978](https://github.com/inspec/inspec/pull/3978) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Make sure we test on Ruby 2.6 [#3937](https://github.com/inspec/inspec/pull/3937) ([tas50](https://github.com/tas50))
- Bump appveyor.yml to build on 2.6 for unit-tests-ruby-2.6. [#3980](https://github.com/inspec/inspec/pull/3980) ([zenspider](https://github.com/zenspider))
- Provide logger to license-acceptance for help debugging in the future [#3958](https://github.com/inspec/inspec/pull/3958) ([tyler-ball](https://github.com/tyler-ball))
- Update deprecation settings for v4 [#3973](https://github.com/inspec/inspec/pull/3973) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Appveyor Config Changes [#3983](https://github.com/inspec/inspec/pull/3983) ([miah](https://github.com/miah))
- Use a updated OS Image in Appveyor [#3985](https://github.com/inspec/inspec/pull/3985) ([miah](https://github.com/miah))
- Package inspec executable as a separate gem [#3982](https://github.com/inspec/inspec/pull/3982) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Accidently not updating main InSpec version via Expeditor [#3997](https://github.com/inspec/inspec/pull/3997) ([tyler-ball](https://github.com/tyler-ball))

## [v3.9.0](https://github.com/inspec/inspec/tree/v3.9.0) (2019-04-02)

#### New Features
- automate reporter: Add top-level &#39;passthrough&#39; field [#3906](https://github.com/inspec/inspec/pull/3906) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Don&#39;t include plugin test files in the gem file [#3911](https://github.com/inspec/inspec/pull/3911) ([tas50](https://github.com/tas50))
- Include train-habitat gem with InSpec [#3912](https://github.com/inspec/inspec/pull/3912) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v3.7.11](https://github.com/inspec/inspec/tree/v3.7.11) (2019-03-22)

#### Enhancements
- Move all gem installation to Gemfile/bundle install [#3860](https://github.com/inspec/inspec/pull/3860) ([lamont-granquist](https://github.com/lamont-granquist))
- Allow http resource to follow redirects [#3509](https://github.com/inspec/inspec/pull/3509) ([cattywampus](https://github.com/cattywampus))
- Decoupling test profiles from example profiles [#3889](https://github.com/inspec/inspec/pull/3889) ([devoptimist](https://github.com/devoptimist))
- Add caching to Inspec::Config [#3873](https://github.com/inspec/inspec/pull/3873) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- http resource: Add fallback to `#to_s` [#3843](https://github.com/inspec/inspec/pull/3843) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- iis_app_pool: Fix PowerShell JSON parsing error [#3842](https://github.com/inspec/inspec/pull/3842) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Repair anchor links to use dashes instead of underscores [#3890](https://github.com/inspec/inspec/pull/3890) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Re-add a bespoke unf_ext to our omnibus build [#3902](https://github.com/inspec/inspec/pull/3902) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Add InSpec init profile for Azure. [#3861](https://github.com/inspec/inspec/pull/3861) ([skpaterson](https://github.com/skpaterson))
- Rewrite inspec-habitat plugin [#3818](https://github.com/inspec/inspec/pull/3818) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Adds a v4 release to the expeditor config [#3816](https://github.com/inspec/inspec/pull/3816) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fixes resource example indentation [#3898](https://github.com/inspec/inspec/pull/3898) ([burtlo](https://github.com/burtlo))

## [v3.7.1](https://github.com/inspec/inspec/tree/v3.7.1) (2019-03-02)

#### New Features
- Config file formalization and credential sets: part 3, credential sets [#3713](https://github.com/inspec/inspec/pull/3713) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- inspec compliance: Fix mocked configuration [#3834](https://github.com/inspec/inspec/pull/3834) ([skylerto](https://github.com/skylerto))
- detect postgres 10 on centos properly [#3833](https://github.com/inspec/inspec/pull/3833) ([chris-rock](https://github.com/chris-rock))
- Force omnibus to link to train 1.7.4 [#3858](https://github.com/inspec/inspec/pull/3858) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Attributes-Inputs Rename: Move test files [#3796](https://github.com/inspec/inspec/pull/3796) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Attribute-Input Rename: Rename codefiles [#3803](https://github.com/inspec/inspec/pull/3803) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update support platforms in the readme [#3812](https://github.com/inspec/inspec/pull/3812) ([tas50](https://github.com/tas50))
- Attribute-Input Rename: Add deprecation group [#3805](https://github.com/inspec/inspec/pull/3805) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Moved the AWS init profile to the correct location. [#3820](https://github.com/inspec/inspec/pull/3820) ([skpaterson](https://github.com/skpaterson))
- Add a deprecation group for core AWS resources [#3824](https://github.com/inspec/inspec/pull/3824) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Suppress warnings in unit test output [#3828](https://github.com/inspec/inspec/pull/3828) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add term-ansicolor to inspec-core gem [#3798](https://github.com/inspec/inspec/pull/3798) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Attribute-&gt;Input Rename:  Rename Classes and Methods [#3811](https://github.com/inspec/inspec/pull/3811) ([clintoncwolfe](https://github.com/clintoncwolfe))
- add json example from http request [#3827](https://github.com/inspec/inspec/pull/3827) ([jtimberman](https://github.com/jtimberman))
- Update the integration tests to use dokken-images and newer Chef technologies [#3814](https://github.com/inspec/inspec/pull/3814) ([tas50](https://github.com/tas50))

## [v3.6.6](https://github.com/inspec/inspec/tree/v3.6.6) (2019-02-12)

#### Merged Pull Requests
- Add logger to train generic options [#3806](https://github.com/inspec/inspec/pull/3806) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update CONTRIBUTING for CI [#3809](https://github.com/inspec/inspec/pull/3809) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v3.6.4](https://github.com/inspec/inspec/tree/v3.6.4) (2019-02-08)

#### Merged Pull Requests
- Add the 2.x branch to expeditor [#3789](https://github.com/inspec/inspec/pull/3789) ([clintoncwolfe](https://github.com/clintoncwolfe))
- inspec detect: Fix for --config trying to read from STDIN twice [#3793](https://github.com/inspec/inspec/pull/3793) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v2.3.28](https://github.com/inspec/inspec/tree/v2.3.28) (2019-02-08)

## [v3.6.2](https://github.com/inspec/inspec/tree/v3.6.2) (2019-02-07)

#### New Features
- filesystem: Add free_kb, size_kb, type, and percent_free properties [#3778](https://github.com/inspec/inspec/pull/3778) ([clintoncwolfe](https://github.com/clintoncwolfe))
- inspec-init plugin: generate inspec plugins [#3629](https://github.com/inspec/inspec/pull/3629) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Formalize Config File [#3750](https://github.com/inspec/inspec/pull/3750) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Fixed Wrong References to pg_hba in postgres_ident_conf documentation [#3776](https://github.com/inspec/inspec/pull/3776) ([eloyekunle](https://github.com/eloyekunle))
- Plugins: Relocate plugin activate() method to Activator class, add simpler search method [#3720](https://github.com/inspec/inspec/pull/3720) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Consolidate attribute-related test-fixture profiles [#3784](https://github.com/inspec/inspec/pull/3784) ([clintoncwolfe](https://github.com/clintoncwolfe))
- inspec-habitat: create mock backend properly  [#3785](https://github.com/inspec/inspec/pull/3785) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v3.5.0](https://github.com/inspec/inspec/tree/v3.5.0) (2019-02-01)

#### New Features
- Add CLI options to disable loading plugins [#3751](https://github.com/inspec/inspec/pull/3751) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- tests: Fix profile_context_test NameError [#3758](https://github.com/inspec/inspec/pull/3758) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add `--help` to CLI plugin activation criteria [#3757](https://github.com/inspec/inspec/pull/3757) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- More meaningful error when including controls from a missing dependency [#3770](https://github.com/inspec/inspec/pull/3770) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Fix Inspec::Attribute.to_ruby and add unit test [#3773](https://github.com/inspec/inspec/pull/3773) ([james-stocks](https://github.com/james-stocks))
- Temporarily pin train to 1.7.1 [#3775](https://github.com/inspec/inspec/pull/3775) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v3.4.1](https://github.com/inspec/inspec/tree/v3.4.1) (2019-01-29)

#### New Features
- Allow :value in addition to :default for setting attribute values [#3759](https://github.com/inspec/inspec/pull/3759) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Update Ruby requirement in README [#3766](https://github.com/inspec/inspec/pull/3766) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v3.3.14](https://github.com/inspec/inspec/tree/v3.3.14) (2019-01-25)

#### New Resources
- Add resources for aws_billing_report and aws_billing_reports. [#2838](https://github.com/inspec/inspec/pull/2838) ([miah](https://github.com/miah))

#### New Features
- Centralized Deprecation Facility [#3690](https://github.com/inspec/inspec/pull/3690) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Fix extra &#39;&amp;&amp;&#39; in windows functional tests, add diagnostics [#3717](https://github.com/inspec/inspec/pull/3717) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Support cran packages for non-utf8 locales [#3613](https://github.com/inspec/inspec/pull/3613) ([atward](https://github.com/atward))
- Allow &#39;Proprietary&#39; as a valid license term. [#3729](https://github.com/inspec/inspec/pull/3729) ([james-stocks](https://github.com/james-stocks))

#### Bug Fixes
- Update Ruby versions used for testing; fix Travis CI issues [#3678](https://github.com/inspec/inspec/pull/3678) ([tas50](https://github.com/tas50))
- postgres_session: Fix postgres directory searching on non-debian os [#3708](https://github.com/inspec/inspec/pull/3708) ([Cerebus](https://github.com/Cerebus))
- Fix AWS tests found during ChefStyle spike [#3739](https://github.com/inspec/inspec/pull/3739) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Fix SSL tests by allowing multiple cipher counts [#3744](https://github.com/inspec/inspec/pull/3744) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- habitat package: Prevent world-writable files in gems [#3736](https://github.com/inspec/inspec/pull/3736) ([jaym](https://github.com/jaym))
- iis_app_pool:  Fixes error with &#39;should not exist&#39; [#3740](https://github.com/inspec/inspec/pull/3740) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Stabilize profile export functional test [#3696](https://github.com/inspec/inspec/pull/3696) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Document additional usage of json resource [#3737](https://github.com/inspec/inspec/pull/3737) ([webframp](https://github.com/webframp))
- Clean up unit test output [#3743](https://github.com/inspec/inspec/pull/3743) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- allow bundler 2.x and bump integration gems [#3723](https://github.com/inspec/inspec/pull/3723) ([lamont-granquist](https://github.com/lamont-granquist))
- Drop bundler contstraint so system ruby on Jenkins can resolve [#3754](https://github.com/inspec/inspec/pull/3754) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update train pin so inspec builds may succeed [#3755](https://github.com/inspec/inspec/pull/3755) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v3.2.6](https://github.com/inspec/inspec/tree/v3.2.6) (2018-12-20)

#### New Resources
- aws_sqs_queue - new resource [#3674](https://github.com/inspec/inspec/pull/3674) ([amitsaha](https://github.com/amitsaha))

#### New Features
- Expose additional WinRM options for transport, basic auth, and SSPI  [#3669](https://github.com/inspec/inspec/pull/3669) ([frezbo](https://github.com/frezbo))

#### Enhancements
- Remove FreeBSD cookbook from omnibus [#3676](https://github.com/inspec/inspec/pull/3676) ([tas50](https://github.com/tas50))

#### Bug Fixes
- docker.containers: Ensure .labels returns an Array [#3673](https://github.com/inspec/inspec/pull/3673) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- habitat packaging: Fix inspec wrapper linking to /bin/bash instead of the bash hab package [#3671](https://github.com/inspec/inspec/pull/3671) ([teknofire](https://github.com/teknofire))

#### Merged Pull Requests
- Rebuild Hab package. [#3670](https://github.com/inspec/inspec/pull/3670) ([jquick](https://github.com/jquick))
- Adjust version number for availability of aws_sqs_queue [#3685](https://github.com/inspec/inspec/pull/3685) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add note to install from OS package when possible [#3686](https://github.com/inspec/inspec/pull/3686) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v3.1.3](https://github.com/inspec/inspec/tree/v3.1.3) (2018-12-13)

#### Enhancements
- UI Object for for CLI work [#3618](https://github.com/inspec/inspec/pull/3618) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- Remove extra files from inspec-core + file appbundling inspec [#3663](https://github.com/inspec/inspec/pull/3663) ([tas50](https://github.com/tas50))
- Incorrect mysql session failure when rows are returned starting with the string &#39;error&#39; [#3660](https://github.com/inspec/inspec/pull/3660) ([wiebe](https://github.com/wiebe))
- Fix git fetcher error detection logic [#3665](https://github.com/inspec/inspec/pull/3665) ([frezbo](https://github.com/frezbo))

#### Merged Pull Requests
- Pin train to 1.5.11 [#3657](https://github.com/inspec/inspec/pull/3657) ([jaredledvina](https://github.com/jaredledvina))
- Modify URL fetcher to accept URI [#3633](https://github.com/inspec/inspec/pull/3633) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v3.0.64](https://github.com/inspec/inspec/tree/v3.0.64) (2018-12-06)

#### Enhancements
- Further slim the files we ship in the gem artifact [#3647](https://github.com/inspec/inspec/pull/3647) ([tas50](https://github.com/tas50))
- Remove Habitat package run time dependencies from Habitat plan [#3645](https://github.com/inspec/inspec/pull/3645) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Update Habitat plugin [#3646](https://github.com/inspec/inspec/pull/3646) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v3.0.61](https://github.com/inspec/inspec/tree/v3.0.61) (2018-11-29)

#### New Features
- Plugin Type: DSLs [#3557](https://github.com/inspec/inspec/pull/3557) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- filesystem: improve Windows support [#3606](https://github.com/inspec/inspec/pull/3606) ([mhackethal](https://github.com/mhackethal))

#### Bug Fixes
- www: remove jquery sticky on the sidebar [#3623](https://github.com/inspec/inspec/pull/3623) ([arlimus](https://github.com/arlimus))
- package: fix package detection on windows [#3607](https://github.com/inspec/inspec/pull/3607) ([mhackethal](https://github.com/mhackethal))

#### Merged Pull Requests
- Create a class to handle the plugins.json file [#3575](https://github.com/inspec/inspec/pull/3575) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Improvements to the functional helper run_inspec_process [#3603](https://github.com/inspec/inspec/pull/3603) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Revert setting RSpec expectation syntax to &#39;should&#39; mode [#3620](https://github.com/inspec/inspec/pull/3620) ([clintoncwolfe](https://github.com/clintoncwolfe))
- lc/add-aws-platform-template [#3622](https://github.com/inspec/inspec/pull/3622) ([Caprowni](https://github.com/Caprowni))
- Add SQLcl to Oracledb_session Doc [#3632](https://github.com/inspec/inspec/pull/3632) ([ibsavage](https://github.com/ibsavage))

## [v3.0.52](https://github.com/inspec/inspec/tree/v3.0.52) (2018-11-15)

#### Enhancements
- aws_security_group: Query against other security group ids in allow_* matchers [#3576](https://github.com/inspec/inspec/pull/3576) ([j00p34](https://github.com/j00p34))
- Adding --no-pager to service checks [#3592](https://github.com/inspec/inspec/pull/3592) ([fernandoalex](https://github.com/fernandoalex))

#### Bug Fixes
- Adds protection against zipslip vulnerability [#3604](https://github.com/inspec/inspec/pull/3604) ([hdost](https://github.com/hdost))

#### Merged Pull Requests
- Load the compliance plugin when the fetcher is needed [#3609](https://github.com/inspec/inspec/pull/3609) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v3.0.46](https://github.com/inspec/inspec/tree/v3.0.46) (2018-11-08)

#### New Features
- Add Git SSH and HTTP basic auth support to `inspec exec` [#3562](https://github.com/inspec/inspec/pull/3562) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Enhancements
- aws_vpc: accept 17 hexadecimal characters for vpc_id [#3564](https://github.com/inspec/inspec/pull/3564) ([kchistova](https://github.com/kchistova))
- Add only_if to Inspec objects [#3577](https://github.com/inspec/inspec/pull/3577) ([james-stocks](https://github.com/james-stocks))
- Added xml resource support for ints, bools, and string responses [#3583](https://github.com/inspec/inspec/pull/3583) ([greenantdotcom](https://github.com/greenantdotcom))
- Allow add_test to accept negation [#3586](https://github.com/inspec/inspec/pull/3586) ([rachelrice](https://github.com/rachelrice))

#### Bug Fixes
- Silence RSpec &#39;should&#39; Warning [#3560](https://github.com/inspec/inspec/pull/3560) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update iis_site bindingInformation construction and add tests [#3492](https://github.com/inspec/inspec/pull/3492) ([mrshanahan](https://github.com/mrshanahan))
- port: Correctly detect FreeBSD [#3579](https://github.com/inspec/inspec/pull/3579) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Fix functional tests issues with vendoring [#3572](https://github.com/inspec/inspec/pull/3572) ([jquick](https://github.com/jquick))
- Fixes (some) ruby warnings related to functional tests [#3561](https://github.com/inspec/inspec/pull/3561) ([TheLonelyGhost](https://github.com/TheLonelyGhost))
- Fixes broken link in documentation [#3588](https://github.com/inspec/inspec/pull/3588) ([dmccown](https://github.com/dmccown))

## [v3.0.25](https://github.com/inspec/inspec/tree/v3.0.25) (2018-11-01)

#### Enhancements
- ✓ adds additional checks for vendored profiles [#3362](https://github.com/inspec/inspec/pull/3362) ([chris-rock](https://github.com/chris-rock))
- Allow help args after Thor commands [#3553](https://github.com/inspec/inspec/pull/3553) ([jquick](https://github.com/jquick))

#### Bug Fixes
- Change usage of `Dir.home` to `Inspec.config_dir` [#3567](https://github.com/inspec/inspec/pull/3567) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Adding inspec init profile for GCP. [#3484](https://github.com/inspec/inspec/pull/3484) ([skpaterson](https://github.com/skpaterson))
- Modernize omnibus config and reduce omnibus package size [#3543](https://github.com/inspec/inspec/pull/3543) ([tas50](https://github.com/tas50))
- Allow end of options during Thor array parsing [#3547](https://github.com/inspec/inspec/pull/3547) ([jquick](https://github.com/jquick))
- Pin to train 1.5.6 [#3568](https://github.com/inspec/inspec/pull/3568) ([jquick](https://github.com/jquick))
- bump expeditor version [#3569](https://github.com/inspec/inspec/pull/3569) ([jquick](https://github.com/jquick))

## [v3.0.12](https://github.com/inspec/inspec/tree/v3.0.12) (2018-10-24)

#### New Resources
- New resource to work with Windows security identifiers (SIDs) [#3405](https://github.com/inspec/inspec/pull/3405) ([james-stocks](https://github.com/james-stocks))

#### Bug Fixes
- Update to safe navigation exit code search [#3541](https://github.com/inspec/inspec/pull/3541) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Add inspec/train vault to plugin exclusion [#3532](https://github.com/inspec/inspec/pull/3532) ([jquick](https://github.com/jquick))

## [v3.0.9](https://github.com/inspec/inspec/tree/v3.0.9) (2018-10-18)

#### Enhancements
- Minor cleanups of plugin documentation. &#39;Plugin&#39; instead of &#39;PluginDefinition&#39; [#3527](https://github.com/inspec/inspec/pull/3527) ([mattray](https://github.com/mattray))

#### Bug Fixes
- FilterTable: allow Strings or Symbols as fields [#3481](https://github.com/inspec/inspec/pull/3481) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fixes corrupt plugins.json when testing a plugin outside of core [#3526](https://github.com/inspec/inspec/pull/3526) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- style: Fix quotes/style on the `docker` resource [#3516](https://github.com/inspec/inspec/pull/3516) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Filter out inspec-k8s and inspec-release [#3525](https://github.com/inspec/inspec/pull/3525) ([miah](https://github.com/miah))
- docs: Fix small issues with the `file` resource [#3515](https://github.com/inspec/inspec/pull/3515) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add debug and sort options for plugins [#3530](https://github.com/inspec/inspec/pull/3530) ([jquick](https://github.com/jquick))
- Pin inspec to the new train [#3531](https://github.com/inspec/inspec/pull/3531) ([jquick](https://github.com/jquick))
- Add missing tests for groups resource, document members property, and assorted fixes. [#3467](https://github.com/inspec/inspec/pull/3467) ([miah](https://github.com/miah))

## [v3.0.0](https://github.com/inspec/inspec/tree/v3.0.0) (2018-10-15)

#### Enhancements
- Inspec 3.0 [#3512](https://github.com/inspec/inspec/pull/3512) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Change `Inspec ` to `InSpec ` where appropriate [#3494](https://github.com/inspec/inspec/pull/3494) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Update the text on the generic default attribute [#3508](https://github.com/inspec/inspec/pull/3508) ([jquick](https://github.com/jquick))

## [v2.3.24](https://github.com/inspec/inspec/tree/v2.3.24) (2018-10-12)

#### Bug Fixes
- Fix plugin install issues in different ruby envs [#3505](https://github.com/inspec/inspec/pull/3505) ([jquick](https://github.com/jquick))

## [v2.3.23](https://github.com/inspec/inspec/tree/v2.3.23) (2018-10-12)

#### Enhancements
- Plugins: Filter Plugins During Search and Install [#3458](https://github.com/inspec/inspec/pull/3458) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- small fix - update to AlpinePkg Class  [#3483](https://github.com/inspec/inspec/pull/3483) ([aaronlippold](https://github.com/aaronlippold))
- Fix error on empty attributes yaml [#3485](https://github.com/inspec/inspec/pull/3485) ([jquick](https://github.com/jquick))
- Backport compliance namespace and add testing for A2 audit report. [#3493](https://github.com/inspec/inspec/pull/3493) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Fix archive with required attributes [#3468](https://github.com/inspec/inspec/pull/3468) ([jquick](https://github.com/jquick))
- Exclude docs and examples from the gem [#3471](https://github.com/inspec/inspec/pull/3471) ([tas50](https://github.com/tas50))
- Fix Packages Resource Docs [#3469](https://github.com/inspec/inspec/pull/3469) ([pwelch](https://github.com/pwelch))
- Enable compression for deb/rpm packages [#3472](https://github.com/inspec/inspec/pull/3472) ([tas50](https://github.com/tas50))
- Remove &#39;demo&#39; from website. [#3475](https://github.com/inspec/inspec/pull/3475) ([miah](https://github.com/miah))
- Skip running appveyor on docs and examples [#3474](https://github.com/inspec/inspec/pull/3474) ([btm](https://github.com/btm))
- docs: Add version to multiple descriptions doc [#3477](https://github.com/inspec/inspec/pull/3477) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Set a static node GUID for travis runs [#3497](https://github.com/inspec/inspec/pull/3497) ([jquick](https://github.com/jquick))
- Fix plugin issues on omni builds [#3499](https://github.com/inspec/inspec/pull/3499) ([jquick](https://github.com/jquick))

## [v2.3.10](https://github.com/inspec/inspec/tree/v2.3.10) (2018-10-04)

#### Enhancements
- Modify `cmp` matcher output to use `.inspect` [#3450](https://github.com/inspec/inspec/pull/3450) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Support finding larger processes on Busybox [#3446](https://github.com/inspec/inspec/pull/3446) ([RoboticCheese](https://github.com/RoboticCheese))
- Move compliance to v2 plugin  [#3423](https://github.com/inspec/inspec/pull/3423) ([jquick](https://github.com/jquick))

#### Bug Fixes
- Fix distinct_exit cli desc to reflect reality [#3463](https://github.com/inspec/inspec/pull/3463) ([teknofire](https://github.com/teknofire))

#### Merged Pull Requests
- Fix `attribute` with empty hash regression [#3454](https://github.com/inspec/inspec/pull/3454) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v2.3.5](https://github.com/inspec/inspec/tree/v2.3.5) (2018-10-01)

#### Bug Fixes
- Update plugin gem install code [#3453](https://github.com/inspec/inspec/pull/3453) ([jquick](https://github.com/jquick))

## [v2.3.4](https://github.com/inspec/inspec/tree/v2.3.4) (2018-09-28)

#### New Features
- Plugins Installer API [#3352](https://github.com/inspec/inspec/pull/3352) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Plugins: Support for Train Plugins in InSpec [#3444](https://github.com/inspec/inspec/pull/3444) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Support the Busybox variant of netstat in the port resource [#3425](https://github.com/inspec/inspec/pull/3425) ([RoboticCheese](https://github.com/RoboticCheese))

#### Bug Fixes
- Remove load locks for cloud resources [#3420](https://github.com/inspec/inspec/pull/3420) ([jquick](https://github.com/jquick))
- Grammar correction in error message: use &quot;an&quot; with attribute and unknown [#3439](https://github.com/inspec/inspec/pull/3439) ([alexpop](https://github.com/alexpop))

#### Merged Pull Requests
- Add new resource: aws_ebs_volume [#3381](https://github.com/inspec/inspec/pull/3381) ([jmassardo](https://github.com/jmassardo))
- Fix v2 loader appveyor issue [#3434](https://github.com/inspec/inspec/pull/3434) ([jquick](https://github.com/jquick))
- Plugins: Load all CLI commands on usage on empty invocation [#3428](https://github.com/inspec/inspec/pull/3428) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add support for multiple descriptions for controls [#3424](https://github.com/inspec/inspec/pull/3424) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Bump minor version [#3448](https://github.com/inspec/inspec/pull/3448) ([jquick](https://github.com/jquick))
- RFC inspec style guide [#3356](https://github.com/inspec/inspec/pull/3356) ([arlimus](https://github.com/arlimus))
- Pin postgresql to a lower cookbook version [#3449](https://github.com/inspec/inspec/pull/3449) ([jquick](https://github.com/jquick))
- Plugins: Example CLI Plugin, a Resource Lister [#3421](https://github.com/inspec/inspec/pull/3421) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v2.2.112](https://github.com/inspec/inspec/tree/v2.2.112) (2018-09-19)

#### New Features
- Added db_name flag [#3383](https://github.com/inspec/inspec/pull/3383) ([kdoores](https://github.com/kdoores))
- Update AWS Security Group to work with IPV6 rules. [#3394](https://github.com/inspec/inspec/pull/3394) ([MartinLogan](https://github.com/MartinLogan))

#### Enhancements
- Plugins: Add support for &#39;bundles&#39; migration [#3384](https://github.com/inspec/inspec/pull/3384) ([clintoncwolfe](https://github.com/clintoncwolfe))
- adding `versions` to the `gem` resource [#3398](https://github.com/inspec/inspec/pull/3398) ([majormoses](https://github.com/majormoses))

#### Merged Pull Requests
- Fix rendering of profiles docs [#3393](https://github.com/inspec/inspec/pull/3393) ([jquick](https://github.com/jquick))
- Move habitat to v2 plugin [#3404](https://github.com/inspec/inspec/pull/3404) ([jquick](https://github.com/jquick))
- Fix json automate tests and render call [#3408](https://github.com/inspec/inspec/pull/3408) ([jquick](https://github.com/jquick))
- Fix gem tests from recent merge [#3409](https://github.com/inspec/inspec/pull/3409) ([jquick](https://github.com/jquick))
- Move inspec init to v2 plugins [#3407](https://github.com/inspec/inspec/pull/3407) ([jquick](https://github.com/jquick))
- Move artifact to v2 plugin  [#3406](https://github.com/inspec/inspec/pull/3406) ([jquick](https://github.com/jquick))

## [v2.2.102](https://github.com/inspec/inspec/tree/v2.2.102) (2018-09-17)

#### Merged Pull Requests
- Add json-automate to the report method [#3401](https://github.com/inspec/inspec/pull/3401) ([jquick](https://github.com/jquick))

## [v2.2.101](https://github.com/inspec/inspec/tree/v2.2.101) (2018-09-14)

#### New Features
- Add string impact options for controls [#3359](https://github.com/inspec/inspec/pull/3359) ([jquick](https://github.com/jquick))

#### Enhancements
- handle errors from automate report and display them to the user [#3360](https://github.com/inspec/inspec/pull/3360) ([chris-rock](https://github.com/chris-rock))
- Harmonize vendoring (ensure archives are extracted and local paths do not vendor on exec) [#3286](https://github.com/inspec/inspec/pull/3286) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- do not show success message since its confusing [#3366](https://github.com/inspec/inspec/pull/3366) ([chris-rock](https://github.com/chris-rock))

#### Bug Fixes
- ensure we use the mock backend when we upload profiles [#3370](https://github.com/inspec/inspec/pull/3370) ([chris-rock](https://github.com/chris-rock))
- use multipart gem for upload to support upload on windows [#3369](https://github.com/inspec/inspec/pull/3369) ([chris-rock](https://github.com/chris-rock))
- Fix vendoring functional test cleanup [#3377](https://github.com/inspec/inspec/pull/3377) ([jquick](https://github.com/jquick))
- enforce utf encoding for cli output [#3376](https://github.com/inspec/inspec/pull/3376) ([chris-rock](https://github.com/chris-rock))
- Fixing AWS integration tests. [#3374](https://github.com/inspec/inspec/pull/3374) ([MartinLogan](https://github.com/MartinLogan))
- Prevent logs from showing up when running inspec json [#3391](https://github.com/inspec/inspec/pull/3391) ([jquick](https://github.com/jquick))
- Fix the compliance target error checks [#3392](https://github.com/inspec/inspec/pull/3392) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Allow target-id passthrough [#3320](https://github.com/inspec/inspec/pull/3320) ([jquick](https://github.com/jquick))
- Update rubyzip to resolve a directory traversal security vulnerability. [#3388](https://github.com/inspec/inspec/pull/3388) ([miah](https://github.com/miah))
- Implement InSpec global attributes [#3318](https://github.com/inspec/inspec/pull/3318) ([jquick](https://github.com/jquick))
- Revert uuid change from A2 report [#3387](https://github.com/inspec/inspec/pull/3387) ([jquick](https://github.com/jquick))
- Populate code for inspec json inheritance [#3386](https://github.com/inspec/inspec/pull/3386) ([jquick](https://github.com/jquick))
- Add windows functional tests [#3385](https://github.com/inspec/inspec/pull/3385) ([jquick](https://github.com/jquick))
- Bump omnibus ruby to 2.5.1 [#3390](https://github.com/inspec/inspec/pull/3390) ([jquick](https://github.com/jquick))
- Add platforms schema command [#3346](https://github.com/inspec/inspec/pull/3346) ([jquick](https://github.com/jquick))
- Fix profile vendoring on Windows [#3378](https://github.com/inspec/inspec/pull/3378) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v2.2.78](https://github.com/inspec/inspec/tree/v2.2.78) (2018-08-30)

#### New Features
- Support erb rendering [#3338](https://github.com/inspec/inspec/pull/3338) ([frezbo](https://github.com/frezbo))
- Add HTTP basic auth for URL based inspec deps [#3341](https://github.com/inspec/inspec/pull/3341) ([frezbo](https://github.com/frezbo))

#### Bug Fixes
- fix skip message not being passed for merge [#3329](https://github.com/inspec/inspec/pull/3329) ([frezbo](https://github.com/frezbo))

#### Merged Pull Requests
- Cached profiles with Compliance Fetcher [#3221](https://github.com/inspec/inspec/pull/3221) ([itmustbejj](https://github.com/itmustbejj))
- bump inspec/train version [#3331](https://github.com/inspec/inspec/pull/3331) ([tomqwu](https://github.com/tomqwu))
- Convert legacy supports to their platform counterparts [#3333](https://github.com/inspec/inspec/pull/3333) ([jquick](https://github.com/jquick))
- Fix the brew command to install inspec [#3335](https://github.com/inspec/inspec/pull/3335) ([tas50](https://github.com/tas50))
- Update demo site nom packages [#3343](https://github.com/inspec/inspec/pull/3343) ([miah](https://github.com/miah))

## [v2.2.70](https://github.com/inspec/inspec/tree/v2.2.70) (2018-08-24)

#### Enhancements
- Infer `--sudo` when `--sudo-password` is used [#3313](https://github.com/inspec/inspec/pull/3313) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Bug Fixes
- Fix skip hash being passed instead of boolean value [#3323](https://github.com/inspec/inspec/pull/3323) ([frezbo](https://github.com/frezbo))

#### Merged Pull Requests
- Add cloudlinux under redhat family [#2935](https://github.com/inspec/inspec/pull/2935) ([tarcinil](https://github.com/tarcinil))
- Suppress logs for json-automate reporter [#3324](https://github.com/inspec/inspec/pull/3324) ([jquick](https://github.com/jquick))
- Rebuild InSpec omni bundles [#3327](https://github.com/inspec/inspec/pull/3327) ([jquick](https://github.com/jquick))

## [v2.2.64](https://github.com/inspec/inspec/tree/v2.2.64) (2018-08-17)

#### Merged Pull Requests
- Update `only_if` to allow user specified messages. [#3267](https://github.com/inspec/inspec/pull/3267) ([miah](https://github.com/miah))
- Allow the jsonAutomate report to be executed from cli [#3285](https://github.com/inspec/inspec/pull/3285) ([jquick](https://github.com/jquick))
- Dummy PR to bump expeditor version. [#3298](https://github.com/inspec/inspec/pull/3298) ([jquick](https://github.com/jquick))

## [v2.2.61](https://github.com/inspec/inspec/tree/v2.2.61) (2018-08-09)

#### New Resources
- Add new resource: aws_ecs_cluster [#3213](https://github.com/inspec/inspec/pull/3213) ([meringu](https://github.com/meringu))
- add iis_app_pool resource [#2400](https://github.com/inspec/inspec/pull/2400) ([strocknar](https://github.com/strocknar))

#### Enhancements
- Adding docker plugin support [#3074](https://github.com/inspec/inspec/pull/3074) ([frezbo](https://github.com/frezbo))

#### Bug Fixes
- Add support in aws_route_table to allow 17 hexadecimal characters [#3277](https://github.com/inspec/inspec/pull/3277) ([kchistova](https://github.com/kchistova))
- Error cleanly if a reporter errors while rendering [#3280](https://github.com/inspec/inspec/pull/3280) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Enable inspec archive, check, and json to run as unpriveleged user [#3263](https://github.com/inspec/inspec/pull/3263) ([phiggins](https://github.com/phiggins))

## [v2.2.55](https://github.com/inspec/inspec/tree/v2.2.55) (2018-08-03)

#### Enhancements
- Add a merged json report for A2 [#3261](https://github.com/inspec/inspec/pull/3261) ([jquick](https://github.com/jquick))

## [v2.2.54](https://github.com/inspec/inspec/tree/v2.2.54) (2018-08-02)

#### Enhancements
- Bump the chef client version for tests. [#3260](https://github.com/inspec/inspec/pull/3260) ([jquick](https://github.com/jquick))
- Populate report code for merged controls [#3264](https://github.com/inspec/inspec/pull/3264) ([jquick](https://github.com/jquick))
- Escaping package names for windows packages [#3259](https://github.com/inspec/inspec/pull/3259) ([frezbo](https://github.com/frezbo))

#### Merged Pull Requests
- Ability to render contrib resource pack docs on main website [#3184](https://github.com/inspec/inspec/pull/3184) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v2.2.50](https://github.com/inspec/inspec/tree/v2.2.50) (2018-07-26)

#### New Features
- windows_feature resource: Add DISM support [#3224](https://github.com/inspec/inspec/pull/3224) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Enhancements
- Add extra fault checking to git fetcher [#3239](https://github.com/inspec/inspec/pull/3239) ([james-stocks](https://github.com/james-stocks))
- alpine resource: Fix small style issues [#3238](https://github.com/inspec/inspec/pull/3238) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Since /proc/xen is an empty dir in Amazon Linux, inspec falsely detects docker instances as platform=&#39;xen&#39; [#3243](https://github.com/inspec/inspec/pull/3243) ([woneill](https://github.com/woneill))

#### Merged Pull Requests
- update README.md to fix travis and appveyor&#39;s badges. [#3244](https://github.com/inspec/inspec/pull/3244) ([takahashim](https://github.com/takahashim))
- Fix the unit tests ssl issue [#3251](https://github.com/inspec/inspec/pull/3251) ([jquick](https://github.com/jquick))
- cli: Downcase supermarket tool name to match URL [#3242](https://github.com/inspec/inspec/pull/3242) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Satisfy RuboCop by adding `x` bit to `bin/inspec` [#3249](https://github.com/inspec/inspec/pull/3249) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Fix for profile version not being included in the compliance upload c… [#3252](https://github.com/inspec/inspec/pull/3252) ([devoptimist](https://github.com/devoptimist))

## [v2.2.41](https://github.com/inspec/inspec/tree/v2.2.41) (2018-07-20)

#### New Features
- command resource: Allow redacting `#to_s` [#3207](https://github.com/inspec/inspec/pull/3207) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add Alpine package provider [#3215](https://github.com/inspec/inspec/pull/3215) ([damacus](https://github.com/damacus))

#### Enhancements
- Refactor &#39;inspec init profile&#39; into a reusable component. [#3214](https://github.com/inspec/inspec/pull/3214) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Ensure resources fail that target something that isn&#39;t supported [#3231](https://github.com/inspec/inspec/pull/3231) ([miah](https://github.com/miah))

#### Merged Pull Requests
- docs: Fix formatting/style on InSpec DSL page [#3201](https://github.com/inspec/inspec/pull/3201) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Update hab package to use psql client [#3234](https://github.com/inspec/inspec/pull/3234) ([jquick](https://github.com/jquick))

## [v2.2.35](https://github.com/inspec/inspec/tree/v2.2.35) (2018-07-12)

#### New Features
- A number of bug fixes and new features for oracledb_session resource [#3170](https://github.com/inspec/inspec/pull/3170) ([voroniys](https://github.com/voroniys))

## [v2.2.34](https://github.com/inspec/inspec/tree/v2.2.34) (2018-07-05)

#### New Features
- cli: Add `--insecure` option for `exec` and `shell` [#3195](https://github.com/inspec/inspec/pull/3195) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Enhancements
- Update the node platform issues to warn severity [#3186](https://github.com/inspec/inspec/pull/3186) ([jquick](https://github.com/jquick))
- Accept regexes for --controls option to inspec exec [#3179](https://github.com/inspec/inspec/pull/3179) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- Fix some issues with the vendor functional tests [#3196](https://github.com/inspec/inspec/pull/3196) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- fix for apache_conf to handle quoted Includes [#3193](https://github.com/inspec/inspec/pull/3193) ([voroniys](https://github.com/voroniys))

#### Merged Pull Requests
- Fix vendor functional test to not validate a repo hash that can change. [#3198](https://github.com/inspec/inspec/pull/3198) ([miah](https://github.com/miah))
- Prevent Slashes in profile names [#3175](https://github.com/inspec/inspec/pull/3175) ([miah](https://github.com/miah))

## [v2.2.27](https://github.com/inspec/inspec/tree/v2.2.27) (2018-06-29)

#### New Features
- Set parent_profile field on child profiles (json report) [#3164](https://github.com/inspec/inspec/pull/3164) ([jquick](https://github.com/jquick))
- Document exit codes for &#39;inspec exec&#39; and add --no-distinct-exit option [#3178](https://github.com/inspec/inspec/pull/3178) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- apache_conf resource: Strip quotes from values [#3142](https://github.com/inspec/inspec/pull/3142) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Update core resources with filtertable API changes [#3117](https://github.com/inspec/inspec/pull/3117) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- Add support for shallow link paths [#3168](https://github.com/inspec/inspec/pull/3168) ([ColinHebert](https://github.com/ColinHebert))
- Detect inspec-core mode and do not attempt to load cloud resources [#3163](https://github.com/inspec/inspec/pull/3163) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Add functional tests for nested attributes [#3157](https://github.com/inspec/inspec/pull/3157) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v2.2.20](https://github.com/inspec/inspec/tree/v2.2.20) (2018-06-21)

#### Enhancements
- updated skip message to reflect accurate version of audit support [#3153](https://github.com/inspec/inspec/pull/3153) ([jeremymv2](https://github.com/jeremymv2))
- auditd resource: Add handling for sudo/no command [#3151](https://github.com/inspec/inspec/pull/3151) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Fix control merging when overriding child controls [#3155](https://github.com/inspec/inspec/pull/3155) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Accept symbols and downcased criteria in aws_iam_policy have_statement matcher [#3129](https://github.com/inspec/inspec/pull/3129) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v2.2.16](https://github.com/inspec/inspec/tree/v2.2.16) (2018-06-15)

#### Enhancements
- Fix unit tests for ruby 2.5 [#3125](https://github.com/inspec/inspec/pull/3125) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Translate `auditd -s` RHEL output to match CentOS [#3114](https://github.com/inspec/inspec/pull/3114) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add list properties back to shadow [#3140](https://github.com/inspec/inspec/pull/3140) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add insecure option to the automate report json [#3124](https://github.com/inspec/inspec/pull/3124) ([jquick](https://github.com/jquick))
- Bump train version for inspec [#3147](https://github.com/inspec/inspec/pull/3147) ([jquick](https://github.com/jquick))
- deprecate azure_generic_resource [#3132](https://github.com/inspec/inspec/pull/3132) ([chris-rock](https://github.com/chris-rock))

## [v2.2.10](https://github.com/inspec/inspec/tree/v2.2.10) (2018-06-08)

#### New Resources
- Adds a aws_flow_log resource with unit and integration testing. [#2906](https://github.com/inspec/inspec/pull/2906) ([miah](https://github.com/miah))
- Add aws_elb and aws_elbs resources [#3079](https://github.com/inspec/inspec/pull/3079) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Detect windows packages with trailing/leading spaces [#3106](https://github.com/inspec/inspec/pull/3106) ([jquick](https://github.com/jquick))
- Add common methods to FilterTable [#3104](https://github.com/inspec/inspec/pull/3104) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Allow custom resources to access all other resources [#3108](https://github.com/inspec/inspec/pull/3108) ([jquick](https://github.com/jquick))

#### Bug Fixes
- Two fixes to FilterTable `where` criteria handling [#3045](https://github.com/inspec/inspec/pull/3045) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update documentation for shadow resource. [#3042](https://github.com/inspec/inspec/pull/3042) ([miah](https://github.com/miah))

#### Merged Pull Requests
- support local npm package searches [#3105](https://github.com/inspec/inspec/pull/3105) ([arlimus](https://github.com/arlimus))
- Spellcheck FilterTable Developer Documentation [#3111](https://github.com/inspec/inspec/pull/3111) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Refactor: Perform internal rename and add comments to FilterTable [#3047](https://github.com/inspec/inspec/pull/3047) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Add lazy-loading to FilterTable [#3093](https://github.com/inspec/inspec/pull/3093) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Update Junit.rb to add failures attribute [#3086](https://github.com/inspec/inspec/pull/3086) ([scboucher](https://github.com/scboucher))
- Clean up issues in documentation [#3058](https://github.com/inspec/inspec/pull/3058) ([miah](https://github.com/miah))

## [v2.1.84](https://github.com/inspec/inspec/tree/v2.1.84) (2018-05-31)

#### Merged Pull Requests
- Generate new org builds [#3087](https://github.com/inspec/inspec/pull/3087) ([jquick](https://github.com/jquick))

## [v2.1.83](https://github.com/chef/inspec/tree/v2.1.83) (2018-05-18)

#### Merged Pull Requests
- Update ruby required version. [#3070](https://github.com/chef/inspec/pull/3070) ([jquick](https://github.com/jquick))
- Test new gem builds [#3071](https://github.com/chef/inspec/pull/3071) ([jquick](https://github.com/jquick))

## [v2.1.81](https://github.com/chef/inspec/tree/v2.1.81) (2018-05-17)

#### Merged Pull Requests
- Update Train pin to pull in msi env [#3068](https://github.com/chef/inspec/pull/3068) ([jquick](https://github.com/jquick))

## [v2.1.80](https://github.com/chef/inspec/tree/v2.1.80) (2018-05-17)

#### Merged Pull Requests
- Add job_uuid passthrough for automate report [#3064](https://github.com/chef/inspec/pull/3064) ([jquick](https://github.com/jquick))
- Bump train pin [#3065](https://github.com/chef/inspec/pull/3065) ([jquick](https://github.com/jquick))

## [v2.1.78](https://github.com/chef/inspec/tree/v2.1.78) (2018-05-16)

#### Bug Fixes
- Fix matcher output when the args to the matcher are a hash for two resources [#3044](https://github.com/chef/inspec/pull/3044) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Updating Copy To Clipboard for ruby users InSpec installation command [#3054](https://github.com/chef/inspec/pull/3054) ([subramani95](https://github.com/subramani95))
- Add a passthrough for report_uuid [#3057](https://github.com/chef/inspec/pull/3057) ([jquick](https://github.com/jquick))
- Fix www build for node v10 [#3049](https://github.com/chef/inspec/pull/3049) ([miah](https://github.com/miah))
- Add train GCP transport [#3046](https://github.com/chef/inspec/pull/3046) ([jquick](https://github.com/jquick))
- Adds middleware dependecy for Azure [#3061](https://github.com/chef/inspec/pull/3061) ([dmccown](https://github.com/dmccown))

## [v2.1.72](https://github.com/chef/inspec/tree/v2.1.72) (2018-05-10)

#### New Resources
- Skeletal aws_ec2_instances resource [#3023](https://github.com/chef/inspec/pull/3023) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Add git dependency to habitat plan. [#3037](https://github.com/chef/inspec/pull/3037) ([phiggins](https://github.com/phiggins))

#### Bug Fixes
- Allow the depends key to be exposed in json profiles report [#3033](https://github.com/chef/inspec/pull/3033) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Fix typo in os_env_spec [#3028](https://github.com/chef/inspec/pull/3028) ([Happycoil](https://github.com/Happycoil))

## [v2.1.68](https://github.com/chef/inspec/tree/v2.1.68) (2018-05-04)

#### Merged Pull Requests
- Fix the A2 vendoring with depends on the A2 server [#3022](https://github.com/chef/inspec/pull/3022) ([jquick](https://github.com/jquick))

## [v2.1.67](https://github.com/chef/inspec/tree/v2.1.67) (2018-05-03)

#### New Features
-  #2810 - Add check if aws s3 bucket is encrypted. [#2937](https://github.com/chef/inspec/pull/2937) ([UranusBytes](https://github.com/UranusBytes))

#### Enhancements
- Refactors Terraform plan to break out steps [#2996](https://github.com/chef/inspec/pull/2996) ([dmccown](https://github.com/dmccown))
- Split inspec into a core gem. [#3008](https://github.com/chef/inspec/pull/3008) ([miah](https://github.com/miah))

#### Bug Fixes
- nginx_conf resource: Fix include paths with quotes [#2726](https://github.com/chef/inspec/pull/2726) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add A2 support for profile compliance depends [#3014](https://github.com/chef/inspec/pull/3014) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- Update Habitat plan [#3000](https://github.com/chef/inspec/pull/3000) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- cmp should recognise a string being a negative int [#3007](https://github.com/chef/inspec/pull/3007) ([james-stocks](https://github.com/james-stocks))
- Add inspec-core gem to expeditor release [#3018](https://github.com/chef/inspec/pull/3018) ([jquick](https://github.com/jquick))

## [v2.1.59](https://github.com/chef/inspec/tree/v2.1.59) (2018-04-26)

#### Enhancements
- Update shadow#to_s to return @path instead of hardcoded `/etc/shadow` [#2978](https://github.com/chef/inspec/pull/2978) ([miah](https://github.com/miah))

#### Bug Fixes
- Catch exceptions in control blocks and fail the control [#2987](https://github.com/chef/inspec/pull/2987) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Merged Pull Requests
- Makes JSON resource enumerable, despite method_missing magic [#2910](https://github.com/chef/inspec/pull/2910) ([TheLonelyGhost](https://github.com/TheLonelyGhost))
- Fix case where res is nil in etc_group [#2984](https://github.com/chef/inspec/pull/2984) ([chris-rock](https://github.com/chris-rock))
- os_env resource returns only user&#39;s environment variable on Windows [#2945](https://github.com/chef/inspec/pull/2945) ([omar-irizarry](https://github.com/omar-irizarry))

## [v2.1.54](https://github.com/chef/inspec/tree/v2.1.54) (2018-04-19)

#### New Features
- Inline and attached policies for aws_iam_user and aws_iam_users [#2947](https://github.com/chef/inspec/pull/2947) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- updating output for aws_iam_role to match other AWS resources [#2960](https://github.com/chef/inspec/pull/2960) ([tmonk42](https://github.com/tmonk42))
- Amazon linux service mgmt detection [#2970](https://github.com/chef/inspec/pull/2970) ([meringu](https://github.com/meringu))
- Upgrade Terraform version pins for integration testing [#2968](https://github.com/chef/inspec/pull/2968) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Make names for AWS Config service objects optional [#2928](https://github.com/chef/inspec/pull/2928) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- aws_iam_policy statement search fix for degenerate policies [#2958](https://github.com/chef/inspec/pull/2958) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Fixed numerous naming errors in aws_iam_vpcs integration tests [#2961](https://github.com/chef/inspec/pull/2961) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Policy statement search: don&#39;t stacktrace on missing field [#2962](https://github.com/chef/inspec/pull/2962) ([clintoncwolfe](https://github.com/clintoncwolfe))
- updating kitchen-puppet example for the `puppet_apply` provisioner [#2972](https://github.com/chef/inspec/pull/2972) ([moutons](https://github.com/moutons))
- Add missing `git` to Dockerfile. [#2969](https://github.com/chef/inspec/pull/2969) ([miah](https://github.com/miah))

#### Merged Pull Requests
- Add A2 support to the inspec-compliance toolset [#2963](https://github.com/chef/inspec/pull/2963) ([jquick](https://github.com/jquick))

## [v2.1.43](https://github.com/chef/inspec/tree/v2.1.43) (2018-04-12)

#### New Features
- aws_iam_group feature: test users in an iam group [#2888](https://github.com/chef/inspec/pull/2888) ([dromazmj](https://github.com/dromazmj))
- aws_cloudtrail_trail feature: test how many days ago logs were delivered [#2887](https://github.com/chef/inspec/pull/2887) ([dromazmj](https://github.com/dromazmj))
- AWS Security Group Rules properties and matchers [#2876](https://github.com/chef/inspec/pull/2876) ([clintoncwolfe](https://github.com/clintoncwolfe))
- New attribute JUnit reporter - target [#2839](https://github.com/chef/inspec/pull/2839) ([piotrgo](https://github.com/piotrgo))
- Policy Statement Search capability for aws_iam_policy [#2918](https://github.com/chef/inspec/pull/2918) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Basic fields for aws_vpcs [#2930](https://github.com/chef/inspec/pull/2930) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Enhancements
- Add warning when returning DEFAULT_ATTRIBUTE [#2934](https://github.com/chef/inspec/pull/2934) ([TrevorBramble](https://github.com/TrevorBramble))
- Ensure @params in shadow resource always has a valid value. [#2939](https://github.com/chef/inspec/pull/2939) ([miah](https://github.com/miah))
- Require a key attribute for the key_rsa resource [#2891](https://github.com/chef/inspec/pull/2891) ([omar-irizarry](https://github.com/omar-irizarry))
- Add Cisco IOS `enable_password` support [#2905](https://github.com/chef/inspec/pull/2905) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Update filesystem.md.erb [#2909](https://github.com/chef/inspec/pull/2909) ([tlmikulski](https://github.com/tlmikulski))
- Fixes configuration for Azure integrationt tests [#2941](https://github.com/chef/inspec/pull/2941) ([dmccown](https://github.com/dmccown))
- powershell resource: Add support line for Unix [#2952](https://github.com/chef/inspec/pull/2952) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v2.1.30](https://github.com/chef/inspec/tree/v2.1.30) (2018-04-05)

#### New Resources
- New Resource: Chocolatey Package [#2793](https://github.com/chef/inspec/pull/2793) ([TheLonelyGhost](https://github.com/TheLonelyGhost))
- New Skeletal Resource aws_s3_buckets [#2653](https://github.com/chef/inspec/pull/2653) ([dromazmj](https://github.com/dromazmj))
- New Skeletal Resource aws_route_tables [#2643](https://github.com/chef/inspec/pull/2643) ([dromazmj](https://github.com/dromazmj))

#### Enhancements
- Add AWS hardware MFA matcher [#2892](https://github.com/chef/inspec/pull/2892) ([pwelch](https://github.com/pwelch))
- add systemd service for amazon linux 2 [#2901](https://github.com/chef/inspec/pull/2901) ([zakhark](https://github.com/zakhark))

#### Merged Pull Requests
- Wrong matcher name in example for aws_config_recorder [#2899](https://github.com/chef/inspec/pull/2899) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Added a description to steer people to correct resource [#2908](https://github.com/chef/inspec/pull/2908) ([username-is-already-taken2](https://github.com/username-is-already-taken2))
- Update example resource syntax [#2904](https://github.com/chef/inspec/pull/2904) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add automate reporter [#2902](https://github.com/chef/inspec/pull/2902) ([jquick](https://github.com/jquick))

## [v2.1.21](https://github.com/chef/inspec/tree/v2.1.21) (2018-03-29)

#### New Resources
- New Skeletal Resource aws_kms_key [#2746](https://github.com/chef/inspec/pull/2746) ([dromazmj](https://github.com/dromazmj))
- New Skeletal Resource aws_config_delivery_channel [#2641](https://github.com/chef/inspec/pull/2641) ([dromazmj](https://github.com/dromazmj))
- new resource: aws rds instance (singular) [#2866](https://github.com/chef/inspec/pull/2866) ([HackerShark](https://github.com/HackerShark))

#### Enhancements
- registry_key resource was returning an incorrect value [#2871](https://github.com/chef/inspec/pull/2871) ([omar-irizarry](https://github.com/omar-irizarry))
- powershell resource: Add support other OSs [#2894](https://github.com/chef/inspec/pull/2894) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Bug Fixes
- Pin concurrent-ruby to version 1.0 to fix kitchen-ansible example [#2879](https://github.com/chef/inspec/pull/2879) ([visibilityspots](https://github.com/visibilityspots))
- Change route_table_id Regular Expression for correctness [#2885](https://github.com/chef/inspec/pull/2885) ([TrevorBramble](https://github.com/TrevorBramble))
- Pw/pip windows bug [#2883](https://github.com/chef/inspec/pull/2883) ([pwelch](https://github.com/pwelch))

#### Merged Pull Requests
- Mitigate trivial warning output on test [#2872](https://github.com/chef/inspec/pull/2872) ([eramoto](https://github.com/eramoto))
- Add `pry-byebug` to our Gemfile.  [#2889](https://github.com/chef/inspec/pull/2889) ([miah](https://github.com/miah))
- Pin to Train 1.3.0. [#2898](https://github.com/chef/inspec/pull/2898) ([jquick](https://github.com/jquick))

## [v2.1.10](https://github.com/chef/inspec/tree/v2.1.10) (2018-03-22)

#### New Resources
- Skelatal resource: aws_s3_bucket_object [#2620](https://github.com/chef/inspec/pull/2620) ([dromazmj](https://github.com/dromazmj))
- New Skeletal Resource aws_sns_topics [#2696](https://github.com/chef/inspec/pull/2696) ([dromazmj](https://github.com/dromazmj))
- New Skeletal Resource aws_sns_subscription [#2697](https://github.com/chef/inspec/pull/2697) ([dromazmj](https://github.com/dromazmj))

#### Enhancements
- Upgrade Thor to version 0.20.0. [#2843](https://github.com/chef/inspec/pull/2843) ([jquick](https://github.com/jquick))
- Remove supports binding for generic resources [#2848](https://github.com/chef/inspec/pull/2848) ([jquick](https://github.com/jquick))
- Unify method in which file content is read across all resources [#2359](https://github.com/chef/inspec/pull/2359) ([eramoto](https://github.com/eramoto))
- Added support for proxy_command for remote SSH connections [#2385](https://github.com/chef/inspec/pull/2385) ([cbeckr](https://github.com/cbeckr))

#### Bug Fixes
- Correct support platform for audit_policy [#2850](https://github.com/chef/inspec/pull/2850) ([pwelch](https://github.com/pwelch))
- Revise /etc/hosts for correctness and clarity [#2863](https://github.com/chef/inspec/pull/2863) ([TrevorBramble](https://github.com/TrevorBramble))

#### Merged Pull Requests
- Remove obsolete mock [#2869](https://github.com/chef/inspec/pull/2869) ([TrevorBramble](https://github.com/TrevorBramble))

## [v2.1.0](https://github.com/chef/inspec/tree/v2.1.0) (2018-03-15)

#### Enhancements
- quote password when generating mysql command string [#2685](https://github.com/chef/inspec/pull/2685) ([tolland](https://github.com/tolland))
- Pin to new Train version and update InSpec defaults [#2827](https://github.com/chef/inspec/pull/2827) ([jquick](https://github.com/jquick))

#### Bug Fixes
- Write version_constraints as an array for inspec.lock [#2619](https://github.com/chef/inspec/pull/2619) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Docs: Describe support boundary between RSpec and InSpec [#2753](https://github.com/chef/inspec/pull/2753) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Sort file list for unit tests [#2812](https://github.com/chef/inspec/pull/2812) ([eramoto](https://github.com/eramoto))

## [v2.0.45](https://github.com/chef/inspec/tree/v2.0.45) (2018-03-08)

#### Enhancements
- Fix aws-iam-users pagination [#2761](https://github.com/chef/inspec/pull/2761) ([trickyearlobe](https://github.com/trickyearlobe))
- AWS API Pagination fixes [#2762](https://github.com/chef/inspec/pull/2762) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Host resource: use bash over netcat in Linux [#2607](https://github.com/chef/inspec/pull/2607) ([jvale](https://github.com/jvale))
- Update shadow resource to use FilterTable [#2642](https://github.com/chef/inspec/pull/2642) ([miah](https://github.com/miah))
- Create reporter output directory if it does not exist [#2798](https://github.com/chef/inspec/pull/2798) ([jquick](https://github.com/jquick))
- Remove os checks from initialize [#2797](https://github.com/chef/inspec/pull/2797) ([miah](https://github.com/miah))
- Refine deprecated methods to be consistent with supported fields in shadow file. [#2801](https://github.com/chef/inspec/pull/2801) ([miah](https://github.com/miah))

#### Bug Fixes
- command resource: Add `exist?` for Alpine Linux [#2768](https://github.com/chef/inspec/pull/2768) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- return 1 as exit code for commands that are not available [#2792](https://github.com/chef/inspec/pull/2792) ([chris-rock](https://github.com/chris-rock))
- Fix http with connection error [#2770](https://github.com/chef/inspec/pull/2770) ([Wing924](https://github.com/Wing924))

#### Merged Pull Requests
- Update name of subnet fixture, fixing 3 failing integration tests [#2765](https://github.com/chef/inspec/pull/2765) ([clintoncwolfe](https://github.com/clintoncwolfe))
- iptables resource: Add support for other bin paths [#2783](https://github.com/chef/inspec/pull/2783) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Added the missing variable reference [#2794](https://github.com/chef/inspec/pull/2794) ([frezbo](https://github.com/frezbo))

## [v2.0.32](https://github.com/chef/inspec/tree/v2.0.32) (2018-03-01)

#### Bug Fixes
- package resource: Fix `brew` package detection [#2730](https://github.com/chef/inspec/pull/2730) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- InSpec SEO [#2725](https://github.com/chef/inspec/pull/2725) ([hannah-radish](https://github.com/hannah-radish))
- remove release-2.0 branch from Travis [#2718](https://github.com/chef/inspec/pull/2718) ([juliandunn](https://github.com/juliandunn))
- Update maintainers file [#2728](https://github.com/chef/inspec/pull/2728) ([jquick](https://github.com/jquick))
- Reword `it` block in `inspec check` tests to match actual test [#2721](https://github.com/chef/inspec/pull/2721) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Fix inspec check to work with platforms [#2737](https://github.com/chef/inspec/pull/2737) ([jquick](https://github.com/jquick))
- Move AWS/Azure tests to integration directory [#2675](https://github.com/chef/inspec/pull/2675) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Various small fixes/adjustments to the integration tests for AWS and Azure [#2745](https://github.com/chef/inspec/pull/2745) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Ensure we have a proper exit code and report data for ad-hoc runners [#2747](https://github.com/chef/inspec/pull/2747) ([jquick](https://github.com/jquick))
- http resource: Support OPTIONS method [#2742](https://github.com/chef/inspec/pull/2742) ([cbeckr](https://github.com/cbeckr))
- New Resource aws_config_recorder [#2635](https://github.com/chef/inspec/pull/2635) ([dromazmj](https://github.com/dromazmj))
- Updated omnibus `postinst` script to symlink to appbundle created binstubs [#2732](https://github.com/chef/inspec/pull/2732) ([miah](https://github.com/miah))
- virtualization_resource: Fix `NoMethodError` on `nil:NilClass` [#2603](https://github.com/chef/inspec/pull/2603) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Docs: Clarify Matchers page to speak about Universal matchers [#2754](https://github.com/chef/inspec/pull/2754) ([clintoncwolfe](https://github.com/clintoncwolfe))
- mssql_session -  Handling cases where the data is nil [#2752](https://github.com/chef/inspec/pull/2752) ([frezbo](https://github.com/frezbo))

## [v2.0.17](https://github.com/chef/inspec/tree/v2.0.17) (2018-02-20)

#### Merged Pull Requests
- Update shell detect to work with platforms [#2712](https://github.com/chef/inspec/pull/2712) ([jquick](https://github.com/jquick))

## [v2.0.16](https://github.com/chef/inspec/tree/v2.0.16) (2018-02-20)

#### Merged Pull Requests
- Fix the /private/var osx issue causing functional tests to fail [#2616](https://github.com/chef/inspec/pull/2616) ([jquick](https://github.com/jquick))
- package resource: Fix Windows package detection [#2624](https://github.com/chef/inspec/pull/2624) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add in release-2.0 changes to master [#2655](https://github.com/chef/inspec/pull/2655) ([jquick](https://github.com/jquick))
- Prevent resources from loading if supports check fails [#2665](https://github.com/chef/inspec/pull/2665) ([jquick](https://github.com/jquick))
- Remove duplicated encryption key test. [#2671](https://github.com/chef/inspec/pull/2671) ([juliandunn](https://github.com/juliandunn))
- Add `Release:` to AWS `inspec detect` example [#2672](https://github.com/chef/inspec/pull/2672) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Fixes merge conflict messages [#2677](https://github.com/chef/inspec/pull/2677) ([kagarmoe](https://github.com/kagarmoe))
- Fix bundle exec calls [#2670](https://github.com/chef/inspec/pull/2670) ([jquick](https://github.com/jquick))
- Capture ArgumentErrors from aws. [#2673](https://github.com/chef/inspec/pull/2673) ([jquick](https://github.com/jquick))
- Hannah Review1 [#2683](https://github.com/chef/inspec/pull/2683) ([hannah-radish](https://github.com/hannah-radish))
- Revert download button [#2684](https://github.com/chef/inspec/pull/2684) ([hannah-radish](https://github.com/hannah-radish))
- Add example profiles for AWS/Azure [#2680](https://github.com/chef/inspec/pull/2680) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Fix legacy reporter output to file [#2667](https://github.com/chef/inspec/pull/2667) ([jquick](https://github.com/jquick))
- Add correct `supports platform` to resources. [#2674](https://github.com/chef/inspec/pull/2674) ([miah](https://github.com/miah))
- www: fix sidebar stickiness [#2698](https://github.com/chef/inspec/pull/2698) ([arlimus](https://github.com/arlimus))
- HM website optimization [#2699](https://github.com/chef/inspec/pull/2699) ([hannah-radish](https://github.com/hannah-radish))
- move /tutorial to /demo [#2700](https://github.com/chef/inspec/pull/2700) ([arlimus](https://github.com/arlimus))
- HM Mobile IE [#2705](https://github.com/chef/inspec/pull/2705) ([hannah-radish](https://github.com/hannah-radish))

## [v1.51.18](https://github.com/chef/inspec/tree/v1.51.18) (2018-02-12)

#### Merged Pull Requests
- Force a default reporter for ad-hoc runners [#2610](https://github.com/chef/inspec/pull/2610) ([jquick](https://github.com/jquick))
- Allow ad-hoc runners to use rspec formats. [#2621](https://github.com/chef/inspec/pull/2621) ([jquick](https://github.com/jquick))
- Add json fields to schema and add tests. [#2618](https://github.com/chef/inspec/pull/2618) ([jquick](https://github.com/jquick))

## [v1.51.15](https://github.com/chef/inspec/tree/v1.51.15) (2018-02-09)

#### Merged Pull Requests
- Refactors http doc [#2540](https://github.com/chef/inspec/pull/2540) ([kagarmoe](https://github.com/kagarmoe))
- Refactors iis_app docs [#2541](https://github.com/chef/inspec/pull/2541) ([kagarmoe](https://github.com/kagarmoe))
- Refactors iis_site doc [#2542](https://github.com/chef/inspec/pull/2542) ([kagarmoe](https://github.com/kagarmoe))
- Refactors inetd_conf doc [#2543](https://github.com/chef/inspec/pull/2543) ([kagarmoe](https://github.com/kagarmoe))
- Refactors ini docs [#2544](https://github.com/chef/inspec/pull/2544) ([kagarmoe](https://github.com/kagarmoe))
- Kg/interface [#2550](https://github.com/chef/inspec/pull/2550) ([kagarmoe](https://github.com/kagarmoe))
- Refactors grub_conf doc sligtly; adds os metadata [#2537](https://github.com/chef/inspec/pull/2537) ([kagarmoe](https://github.com/kagarmoe))
- Use the version of LicenseScout that comes with the Omnibus gem. [#2554](https://github.com/chef/inspec/pull/2554) ([tduffield](https://github.com/tduffield))
- Fix runner report and json newline [#2601](https://github.com/chef/inspec/pull/2601) ([jquick](https://github.com/jquick))

## [v1.51.6](https://github.com/chef/inspec/tree/v1.51.6) (2018-02-08)

#### New Features
- Add new &quot;reporter&quot; system (replacement for &quot;formatters&quot;), support multiple reporters per run [#2464](https://github.com/chef/inspec/pull/2464) ([jquick](https://github.com/jquick))

#### Enhancements
- packages resource: Add `architectures` support [#2469](https://github.com/chef/inspec/pull/2469) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- add Inspec::Describe for abstract describe state [#2010](https://github.com/chef/inspec/pull/2010) ([arlimus](https://github.com/arlimus))
- apache resource: document and deprecate [#2494](https://github.com/chef/inspec/pull/2494) ([adamleff](https://github.com/adamleff))
-  Improve links to Learn Chef Rally [#2476](https://github.com/chef/inspec/pull/2476) ([tpetchel](https://github.com/tpetchel))
- Fix travis-ci bundler issue [#2533](https://github.com/chef/inspec/pull/2533) ([jquick](https://github.com/jquick))

## [v1.51.0](https://github.com/chef/inspec/tree/v1.51.0) (2018-01-25)

#### New Resources
- new docker_service resource to inspect Docker Swarm services [#2456](https://github.com/chef/inspec/pull/2456) ([mattlqx](https://github.com/mattlqx))
- filesystem resource: inspect linux filesystems [#2441](https://github.com/chef/inspec/pull/2441) ([tarcinil](https://github.com/tarcinil))

#### Enhancements
- Update security_policy resource to return Names, not SIDs [#2462](https://github.com/chef/inspec/pull/2462) ([ViolentOr](https://github.com/ViolentOr))

#### Bug Fixes
- grub_conf resource: fix menuentry detection [#2408](https://github.com/chef/inspec/pull/2408) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- service resource: attempt a SysV fallback if SystemD unit file is not found [#2473](https://github.com/chef/inspec/pull/2473) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Sort library files before loading them so load order is predictable [#2475](https://github.com/chef/inspec/pull/2475) ([clintoncwolfe](https://github.com/clintoncwolfe))

## [v1.50.1](https://github.com/chef/inspec/tree/v1.50.1) (2018-01-17)

#### Enhancements
- mssql_session resource: add port parameter [#2429](https://github.com/chef/inspec/pull/2429) ([tarcinil](https://github.com/tarcinil))
- xml resource: support fetching attributes [#2423](https://github.com/chef/inspec/pull/2423) ([tarcinil](https://github.com/tarcinil))

#### Bug Fixes
- firewalld resource: prepend rule string only when necessary [#2430](https://github.com/chef/inspec/pull/2430) ([tarcinil](https://github.com/tarcinil))
- package resource: fix NilClass errors on arch linux [#2437](https://github.com/chef/inspec/pull/2437) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- http resource: make header keys case insensitive [#2457](https://github.com/chef/inspec/pull/2457) ([adamleff](https://github.com/adamleff))

#### Merged Pull Requests
- Fix package manager detection on Arch Linux [#2436](https://github.com/chef/inspec/pull/2436) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Update the inspec support check to warn to stderr. [#2446](https://github.com/chef/inspec/pull/2446) ([jquick](https://github.com/jquick))
- Bump Omnibus Ruby (and Travis Rubies) to 2.4.3 [#2452](https://github.com/chef/inspec/pull/2452) ([adamleff](https://github.com/adamleff))
- Bump minor version [#2465](https://github.com/chef/inspec/pull/2465) ([adamleff](https://github.com/adamleff))
- Bump version manually to trigger Habitat build [#2466](https://github.com/chef/inspec/pull/2466) ([adamleff](https://github.com/adamleff))

## [v1.49.2](https://github.com/chef/inspec/tree/v1.49.2) (2018-01-04)

#### Enhancements
- bond resource: Add bonding mode matcher [#2414](https://github.com/chef/inspec/pull/2414) ([ehanlon](https://github.com/ehanlon))
- file resource: adds `Synchronize` permission to windows ACL checks [#2399](https://github.com/chef/inspec/pull/2399) ([TheLonelyGhost](https://github.com/TheLonelyGhost))
- Add platform resource and platform supports [#2393](https://github.com/chef/inspec/pull/2393) ([jquick](https://github.com/jquick))
- Deprecate and warn when comparing against OS name with capitals/spaces [#2397](https://github.com/chef/inspec/pull/2397) ([jquick](https://github.com/jquick))
- load local dependencies in inspec shell [#2438](https://github.com/chef/inspec/pull/2438) ([arlimus](https://github.com/arlimus))

#### Bug Fixes
- package resource: Enhance resource error handling [#2388](https://github.com/chef/inspec/pull/2388) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- default attributes for nil and false [#2410](https://github.com/chef/inspec/pull/2410) ([arlimus](https://github.com/arlimus))
- Fix OWCA detection for `compliance login` [#2401](https://github.com/chef/inspec/pull/2401) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Fix `x509_certificate` integration tests [#2431](https://github.com/chef/inspec/pull/2431) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Fix Docker build in the Expeditor pipeline [#2432](https://github.com/chef/inspec/pull/2432) ([adamleff](https://github.com/adamleff))
- Add support for Darwin Directory Service groups [#2403](https://github.com/chef/inspec/pull/2403) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Update apache_conf regular expression to exclude whitespace. [#2416](https://github.com/chef/inspec/pull/2416) ([miah](https://github.com/miah))
- dependency chaining in libraries [#2428](https://github.com/chef/inspec/pull/2428) ([arlimus](https://github.com/arlimus))
- Modify `inspec json` to use `check_mode` [#2435](https://github.com/chef/inspec/pull/2435) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Split unit tests from functional [#2391](https://github.com/chef/inspec/pull/2391) ([adamleff](https://github.com/adamleff))
- Bump minor version and cleanup changelog for release [#2440](https://github.com/chef/inspec/pull/2440) ([adamleff](https://github.com/adamleff))

## [v1.48.0](https://github.com/chef/inspec/tree/v1.48.0) (2017-12-07)

#### Enhancements
- Update default cli options to be uniq per command type [#2378](https://github.com/chef/inspec/pull/2378) ([jquick](https://github.com/jquick))
- Allow crontab resource to read crontab at user specified paths. [#2328](https://github.com/chef/inspec/pull/2328) ([miah](https://github.com/miah))

#### Bug Fixes
- Update rspec cli control summary to not uniq fails/skips [#2362](https://github.com/chef/inspec/pull/2362) ([jquick](https://github.com/jquick))
- Resolve merge issue with json-config vs thor defaults [#2377](https://github.com/chef/inspec/pull/2377) ([jquick](https://github.com/jquick))
- Remove rainbow dependency, fix duplicate rake gem [#2374](https://github.com/chef/inspec/pull/2374) ([adamleff](https://github.com/adamleff))
- Allow `inspec check` to ignore `only_if` [#2250](https://github.com/chef/inspec/pull/2250) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Update command resource to check for mock backend [#2353](https://github.com/chef/inspec/pull/2353) ([jquick](https://github.com/jquick))
- Fix inspec appveyor test with the new local train transport [#2376](https://github.com/chef/inspec/pull/2376) ([jquick](https://github.com/jquick))
- Fix changelog categories, bump minor version for release [#2381](https://github.com/chef/inspec/pull/2381) ([adamleff](https://github.com/adamleff))

## [v1.47.0](https://github.com/chef/inspec/tree/v1.47.0) (2017-12-04)

#### New Features
- Enable caching for backend calls [#2309](https://github.com/chef/inspec/pull/2309) ([jquick](https://github.com/jquick))

#### Bug Fixes
- Unique export file for security policy resource [#2350](https://github.com/chef/inspec/pull/2350) ([jquick](https://github.com/jquick))
- json resource: ensure params is not nil in event of read/parse failure [#2354](https://github.com/chef/inspec/pull/2354) ([adamleff](https://github.com/adamleff))
- key_rsa resource: fix inline shell documentation help, wrong resource name used in examples [#2364](https://github.com/chef/inspec/pull/2364) ([eramoto](https://github.com/eramoto))
- security_policy resource: use PID for filename instead of random [#2368](https://github.com/chef/inspec/pull/2368) ([jquick](https://github.com/jquick))

#### Merged Pull Requests
- docker_image resource: properly handle registries in image strings [#2356](https://github.com/chef/inspec/pull/2356) ([adamleff](https://github.com/adamleff))

## [v1.46.2](https://github.com/chef/inspec/tree/v1.46.2) (2017-11-29)

#### Enhancements
- allow override of attribute identifier  [#2347](https://github.com/chef/inspec/pull/2347) ([chris-rock](https://github.com/chris-rock))

#### Bug Fixes
- json resource (et. al.): allow inspec check to succeed when using command [#2317](https://github.com/chef/inspec/pull/2317) ([adamleff](https://github.com/adamleff))
- grub_conf resource: correct grub path for RHEL-7-based OS [#2332](https://github.com/chef/inspec/pull/2332) ([atomic111](https://github.com/atomic111))
- http resource: properly support HEAD request with remote worker [#2340](https://github.com/chef/inspec/pull/2340) ([adamleff](https://github.com/adamleff))
- file resource: fix NilClass error when using advanced windows permissions [#2344](https://github.com/chef/inspec/pull/2344) ([TheLonelyGhost](https://github.com/TheLonelyGhost))
- wmi resource: properly escape quotes in WMI query [#2342](https://github.com/chef/inspec/pull/2342) ([TheLonelyGhost](https://github.com/TheLonelyGhost))
- Allow skipping/failing resources in FilterTable [#2349](https://github.com/chef/inspec/pull/2349) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v1.45.13](https://github.com/chef/inspec/tree/v1.45.13) (2017-11-21)

#### Merged Pull Requests
- Remove debug message from unit test [#2313](https://github.com/chef/inspec/pull/2313) ([eramoto](https://github.com/eramoto))
- Remove bundler install during Appveyor tests [#2322](https://github.com/chef/inspec/pull/2322) ([adamleff](https://github.com/adamleff))
- Bump Rubocop to 0.49.1 [#2323](https://github.com/chef/inspec/pull/2323) ([adamleff](https://github.com/adamleff))
- Bump train to 0.29.2 [#2327](https://github.com/chef/inspec/pull/2327) ([adamleff](https://github.com/adamleff))

## [v1.45.9](https://github.com/chef/inspec/tree/v1.45.9) (2017-11-16)

#### Enhancements
- Correctly format skip exceptions in formatters [#2307](https://github.com/chef/inspec/pull/2307) ([adamleff](https://github.com/adamleff))
- http resource: Add basic param handling to remote HTTP worker [#2286](https://github.com/chef/inspec/pull/2286) ([schisamo](https://github.com/schisamo))

#### Bug Fixes
- port resource: handle ss output from older iproute package [#2305](https://github.com/chef/inspec/pull/2305) ([Wing924](https://github.com/Wing924))
- Fix classname in JUnit formatter [#2283](https://github.com/chef/inspec/pull/2283) ([adamleff](https://github.com/adamleff))
- oracledb_session resource: fix credential passing to sql/sqlplus [#2308](https://github.com/chef/inspec/pull/2308) ([bratdim](https://github.com/bratdim))
- xinetd_conf resource: fix false positives when config file or directory doesn&#39;t exist [#2302](https://github.com/chef/inspec/pull/2302) ([eramoto](https://github.com/eramoto))

#### Merged Pull Requests
- Bumping train to 0.29.1 [#2306](https://github.com/chef/inspec/pull/2306) ([adamleff](https://github.com/adamleff))
- Habitat build works for all versions, eliminates rake [#2301](https://github.com/chef/inspec/pull/2301) ([adamleff](https://github.com/adamleff))
- Fix gid filtering for etc_group resource [#2297](https://github.com/chef/inspec/pull/2297) ([eramoto](https://github.com/eramoto))
- Require Ruby 2.3 and later [#2293](https://github.com/chef/inspec/pull/2293) ([adamleff](https://github.com/adamleff))
- Update Rubocop to TargetRubyVersion 2.3 [#2311](https://github.com/chef/inspec/pull/2311) ([adamleff](https://github.com/adamleff))

## [v1.44.8](https://github.com/chef/inspec/tree/v1.44.8) (2017-11-09)

#### Enhancements
- Add non-halting exception support to resources [#2235](https://github.com/chef/inspec/pull/2235) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- allow users to specify user/namespace when fetching profiles from Chef Automate [#2275](https://github.com/chef/inspec/pull/2275) ([arlimus](https://github.com/arlimus))
- http resource: supply max-time option using read_timeout and open_timeout [#2289](https://github.com/chef/inspec/pull/2289) ([bdellegrazie](https://github.com/bdellegrazie))
- Issue warning during check if profile name contains slash [#2231](https://github.com/chef/inspec/pull/2231) ([clintoncwolfe](https://github.com/clintoncwolfe))

#### Bug Fixes
- http resource: use proper syntax in `curl` header option [#2285](https://github.com/chef/inspec/pull/2285) ([schisamo](https://github.com/schisamo))
- nginx resource: support quoted identifiers [#2292](https://github.com/chef/inspec/pull/2292) ([adamleff](https://github.com/adamleff))
- Properly compare profile version strings as SemVer [#2280](https://github.com/chef/inspec/pull/2280) ([adamleff](https://github.com/adamleff))

#### Merged Pull Requests
- Pin RubyGems to 2.6.14 [#2287](https://github.com/chef/inspec/pull/2287) ([adamleff](https://github.com/adamleff))
- Switch to tomlrb for TOML parsing [#2295](https://github.com/chef/inspec/pull/2295) ([adamleff](https://github.com/adamleff))
- Use Ruby 2.4.2 in the Omnibus InSpec packages [#2294](https://github.com/chef/inspec/pull/2294) ([adamleff](https://github.com/adamleff))
- Eliminate deprecation warnings on resource skipped messages [#2296](https://github.com/chef/inspec/pull/2296) ([adamleff](https://github.com/adamleff))

## [v1.43.8](https://github.com/chef/inspec/tree/v1.43.8) (2017-11-02)

#### Bug Fixes
- inspec compliance login: Ensure supplied server has a proper URI scheme [#2268](https://github.com/chef/inspec/pull/2268) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- mount resource: fix for Device-/Sharenames and Mountpoints including … [#2257](https://github.com/chef/inspec/pull/2257) ([mgrobelin](https://github.com/mgrobelin))
- service resource: properly search for SysV Init S files [#2274](https://github.com/chef/inspec/pull/2274) ([Wing924](https://github.com/Wing924))

## [v1.43.5](https://github.com/chef/inspec/tree/v1.43.5) (2017-10-26)

#### New Resources
- new resource: elasticsearch resource, test cluster/node state [#2261](https://github.com/chef/inspec/pull/2261) ([adamleff](https://github.com/adamleff))
- cpan resource: check for Perl module installation [#2254](https://github.com/chef/inspec/pull/2254) ([mgrobelin](https://github.com/mgrobelin))
- cran resource: check for R module installation [#2255](https://github.com/chef/inspec/pull/2255) ([mgrobelin](https://github.com/mgrobelin))

#### Enhancements
- Include ref when writing out inspec control objects [#2259](https://github.com/chef/inspec/pull/2259) ([arlimus](https://github.com/arlimus))
- Add Chef Automate support to `inspec compliance login` [#2203](https://github.com/chef/inspec/pull/2203) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Bug Fixes
- Fix regression when uploading compliance profiles [#2264](https://github.com/chef/inspec/pull/2264) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v1.42.3](https://github.com/chef/inspec/tree/v1.42.3) (2017-10-19)

#### Enhancements
- etc_fstab resource: properly namespace the resource, add nfs_file_systems documentation [#2190](https://github.com/chef/inspec/pull/2190) ([jburns12](https://github.com/jburns12))
- Uses netstat to detect open ports on AIX [#2210](https://github.com/chef/inspec/pull/2210) ([cattywampus](https://github.com/cattywampus))
- Add missed &#39;html&#39; to &#39;format&#39; option explanation and arrange formatters in alphabetical order [#2244](https://github.com/chef/inspec/pull/2244) ([strangeman](https://github.com/strangeman))
- Add inspec habitat profile setup command [#2239](https://github.com/chef/inspec/pull/2239) ([adamleff](https://github.com/adamleff))
- Extend Windows ACL matchers [#1744](https://github.com/chef/inspec/pull/1744) ([TheLonelyGhost](https://github.com/TheLonelyGhost))
- windows_hotfix resource: Replace WMI query with PowerShell cmdlet &quot;get-hotfix&quot; [#2252](https://github.com/chef/inspec/pull/2252) ([mattray](https://github.com/mattray))

#### Bug Fixes
- Resolve the weird encoding issue within inspec shell [#2234](https://github.com/chef/inspec/pull/2234) ([username-is-already-taken2](https://github.com/username-is-already-taken2))
- Fix typo in error message in postgres resource [#2248](https://github.com/chef/inspec/pull/2248) ([rndmh3ro](https://github.com/rndmh3ro))
- Support PAX-formatted tar files, standardize file lists [#2225](https://github.com/chef/inspec/pull/2225) ([adamleff](https://github.com/adamleff))
- Fix port ressource ss line parsing [#2243](https://github.com/chef/inspec/pull/2243) ([narkaTee](https://github.com/narkaTee))
- Fix `only_if` behavior when used outside controls [#2216](https://github.com/chef/inspec/pull/2216) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Update the profile tempate [#2238](https://github.com/chef/inspec/pull/2238) ([nathenharvey](https://github.com/nathenharvey))
- Fix documentation of `split` matcher [#2240](https://github.com/chef/inspec/pull/2240) ([eramoto](https://github.com/eramoto))
- Squashed some unit test warnings [#2242](https://github.com/chef/inspec/pull/2242) ([username-is-already-taken2](https://github.com/username-is-already-taken2))

## [v1.41.0](https://github.com/chef/inspec/tree/v1.41.0) (2017-10-09)

#### Enhancements
- Add bsd platform family to etc_hosts resource [#2192](https://github.com/chef/inspec/pull/2192) ([ctbarrett](https://github.com/ctbarrett))
- http resource: properly execute tests on remote target [#2209](https://github.com/chef/inspec/pull/2209) ([adamleff](https://github.com/adamleff))
- Add output for port/protocol for host resource. [#2202](https://github.com/chef/inspec/pull/2202) ([jquick](https://github.com/jquick))
- Update shell resource help to return what is defined [#2219](https://github.com/chef/inspec/pull/2219) ([jquick](https://github.com/jquick))
- processes resource: support busybox ps [#2222](https://github.com/chef/inspec/pull/2222) ([adamleff](https://github.com/adamleff))
- Enhance cmp matcher to work with symbols, fix file documentation [#2224](https://github.com/chef/inspec/pull/2224) ([adamleff](https://github.com/adamleff))

#### Bug Fixes
- Add nil check for sshd config file [#2217](https://github.com/chef/inspec/pull/2217) ([jquick](https://github.com/jquick))
- Support symbol keys in ObjectTraverser [#2221](https://github.com/chef/inspec/pull/2221) ([adamleff](https://github.com/adamleff))
- Fix loading profile files when executing multiple profiles [#2223](https://github.com/chef/inspec/pull/2223) ([adamleff](https://github.com/adamleff))
- ssl resource: properly raise error when unable to determine if port is enabled [#2205](https://github.com/chef/inspec/pull/2205) ([jquick](https://github.com/jquick))

## [v1.40.0](https://github.com/chef/inspec/tree/v1.40.0) (2017-09-28)

#### New Resources
- firewalld resource: inspect the status and configuration of firewalld [#2074](https://github.com/chef/inspec/pull/2074) ([dromazmj](https://github.com/dromazmj))

## [v1.39.0](https://github.com/chef/inspec/tree/v1.39.0) (2017-09-25)

#### New Resources
- windows_hotfix resource: test whether a Windows HotFix is installed [#2178](https://github.com/chef/inspec/pull/2178) ([mattray](https://github.com/mattray))
- etc_hosts_allow and etc_hosts_deny resources: test the content of the tcpwrappers configuration files [#2073](https://github.com/chef/inspec/pull/2073) ([dromazmj](https://github.com/dromazmj))

#### Merged Pull Requests
- Bump train to 0.28 to allow for more net-ssh versions [#2185](https://github.com/chef/inspec/pull/2185) ([adamleff](https://github.com/adamleff))

## [v1.38.8](https://github.com/chef/inspec/tree/v1.38.8) (2017-09-23)

#### New Resources
- auditd resource: test active auditd configuration against the audit daemon [#2133](https://github.com/chef/inspec/pull/2133) ([jburns12](https://github.com/jburns12))

#### Enhancements
- Add wildcard support to `Utils::FindFiles` [#2159](https://github.com/chef/inspec/pull/2159) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Add wildcard/multiple server support to nginx_conf resource [#2141](https://github.com/chef/inspec/pull/2141) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Support array syntax for registry_key resource [#2160](https://github.com/chef/inspec/pull/2160) ([adamleff](https://github.com/adamleff))
- forgiving default attributes [#2177](https://github.com/chef/inspec/pull/2177) ([arlimus](https://github.com/arlimus))

#### Bug Fixes
- Modify `DirProvider` to allow special characters [#2174](https://github.com/chef/inspec/pull/2174) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Properly return postgres query errors on failure [#2179](https://github.com/chef/inspec/pull/2179) ([adamleff](https://github.com/adamleff))
- Update method in which Pry hooks are removed [#2170](https://github.com/chef/inspec/pull/2170) ([adamleff](https://github.com/adamleff))
- quote username and hostname in mssql_session.rb [#2151](https://github.com/chef/inspec/pull/2151) ([bratdim](https://github.com/bratdim))
- Support `false` for attribute value [#2168](https://github.com/chef/inspec/pull/2168) ([adamleff](https://github.com/adamleff))
- Modify Upstart enabled check to use config file [#2163](https://github.com/chef/inspec/pull/2163) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

#### Merged Pull Requests
- Add deprecation warning to auditd_rules resource [#2156](https://github.com/chef/inspec/pull/2156) ([adamleff](https://github.com/adamleff))
- Bump train to 0.27 [#2180](https://github.com/chef/inspec/pull/2180) ([adamleff](https://github.com/adamleff))

## [v1.37.6](https://github.com/chef/inspec/tree/v1.37.6) (2017-09-14)

#### New Resources
- etc_fstab resource: test contents of the /etc/fstab file [#2064](https://github.com/chef/inspec/pull/2064) ([dromazmj](https://github.com/dromazmj))
- nginx resource: audit the nginx binary and how it was compiled [#1958](https://github.com/chef/inspec/pull/1958) ([rx294](https://github.com/rx294))

#### Enhancements
- Support profile versions for automate profiles storage [#2128](https://github.com/chef/inspec/pull/2128) ([alexpop](https://github.com/alexpop))
- Show versions for inspec compliance profiles [#2143](https://github.com/chef/inspec/pull/2143) ([alexpop](https://github.com/alexpop))

#### Bug Fixes
- Ignore linked container names when parsing docker containers [#2134](https://github.com/chef/inspec/pull/2134) ([adamleff](https://github.com/adamleff))
- package resource: assume a default Homebrew path [#2140](https://github.com/chef/inspec/pull/2140) ([adamleff](https://github.com/adamleff))

#### Merged Pull Requests
- Bump Ruby to 2.3.5 for Omnibus build [#2149](https://github.com/chef/inspec/pull/2149) ([adamleff](https://github.com/adamleff))

## [v1.36.1](https://github.com/chef/inspec/tree/v1.36.1) (2017-09-07)

#### Enhancements
- File Resource: add be_setgid, be_setuid, be_sticky matchers [#2104](https://github.com/chef/inspec/pull/2104) ([clintoncwolfe](https://github.com/clintoncwolfe))
- add nginx_conf accessors for http, servers, and locations [#2119](https://github.com/chef/inspec/pull/2119) ([arlimus](https://github.com/arlimus))

#### Bug Fixes
- Modify linux regular expression to handle process names with spaces [#2117](https://github.com/chef/inspec/pull/2117) ([ChadScott](https://github.com/ChadScott))
- Fix alternate path profile chaining [#2121](https://github.com/chef/inspec/pull/2121) ([trevor-vaughan](https://github.com/trevor-vaughan))

## [v1.35.1](https://github.com/chef/inspec/tree/v1.35.1) (2017-08-31)

#### New Resources
- aide_conf resource: test configuration of the AIDE file integrity tool [#2063](https://github.com/chef/inspec/pull/2063) ([jburns12](https://github.com/jburns12))
- Add support for XML files [#2107](https://github.com/chef/inspec/pull/2107) ([jonathanmorley](https://github.com/jonathanmorley))
- etc_hosts resource: test the contents of the /etc/hosts file [#2065](https://github.com/chef/inspec/pull/2065) ([dromazmj](https://github.com/dromazmj))

#### Enhancements
- pip resource: support non-default pip locations, such as virtualenvs [#2097](https://github.com/chef/inspec/pull/2097) ([tonybaloney](https://github.com/tonybaloney))
- port resource: support ss instead of netstat [#2110](https://github.com/chef/inspec/pull/2110) ([adamleff](https://github.com/adamleff))

#### Bug Fixes
- auditd_rules resource: fix get_keys error on lines that have no keys [#2103](https://github.com/chef/inspec/pull/2103) ([jburns12](https://github.com/jburns12))
- http resource: prevent repeat calls during a control with multiple tests [#2108](https://github.com/chef/inspec/pull/2108) ([mivok](https://github.com/mivok))
- Support mixed-case group entries [#2101](https://github.com/chef/inspec/pull/2101) ([adamleff](https://github.com/adamleff))

#### Merged Pull Requests
- Add sensitive flag to resources to restrict logging output [#2017](https://github.com/chef/inspec/pull/2017) ([arothian](https://github.com/arothian))

## [v1.34.1](https://github.com/chef/inspec/tree/v1.34.1) (2017-08-24)

#### Enhancements
- Refine the profile/test summary output of the CLI formatter [#2094](https://github.com/chef/inspec/pull/2094) ([adamleff](https://github.com/adamleff))

## [v1.33.12](https://github.com/chef/inspec/tree/v1.33.12) (2017-08-18)

#### Bug Fixes
- fix command.exists for mock environments [#2056](https://github.com/chef/inspec/pull/2056) ([chris-rock](https://github.com/chris-rock))
- Add missing command mocks to fix tests after train 0.26.1 upgrade [#2069](https://github.com/chef/inspec/pull/2069) ([adamleff](https://github.com/adamleff))
- Assume sqlplus as oracle_session as default for mock environments  [#2057](https://github.com/chef/inspec/pull/2057) ([chris-rock](https://github.com/chris-rock))
- add mock support for os_env resource [#2070](https://github.com/chef/inspec/pull/2070) ([chris-rock](https://github.com/chris-rock))
- Moves logic from os_env from initialize phase to runtime phase [#2072](https://github.com/chef/inspec/pull/2072) ([chris-rock](https://github.com/chris-rock))
- fix case where skip is called for os_env [#2078](https://github.com/chef/inspec/pull/2078) ([chris-rock](https://github.com/chris-rock))
- [docker_container] fix repo property [#2083](https://github.com/chef/inspec/pull/2083) ([srenatus](https://github.com/srenatus))
- Properly handle held packages on dpkg-flavored OS [#2087](https://github.com/chef/inspec/pull/2087) ([adamleff](https://github.com/adamleff))

#### Merged Pull Requests
- add functional tests for inspec check [#2077](https://github.com/chef/inspec/pull/2077) ([chris-rock](https://github.com/chris-rock))
- Move bug fixes in CHANGELOG to correct header [#2089](https://github.com/chef/inspec/pull/2089) ([adamleff](https://github.com/adamleff))

## [v1.33.1](https://github.com/chef/inspec/tree/v1.33.1) (2017-08-10)

#### Features & Enhancements
- New &#39;be_in&#39; matcher for matching against values in a list [#2022](https://github.com/chef/inspec/pull/2022) ([rx294](https://github.com/rx294))

#### Merged Pull Requests
- Fix docker_container.tag to use last element of image [#2052](https://github.com/chef/inspec/pull/2052) ([mattlqx](https://github.com/mattlqx))
- Bump project minor version, bump train dependency version [#2058](https://github.com/chef/inspec/pull/2058) ([adamleff](https://github.com/adamleff))

## [v1.32.1](https://github.com/chef/inspec/tree/v1.32.1) (2017-08-03)

#### Merged Pull Requests
- bug fix: properly support profile files that are more than one directory deep
- bug fix: fix mysql_session resource to not use socket for host target [#2020](https://github.com/chef/inspec/pull/2020) ([n-rodriguez](https://github.com/n-rodriguez))
- host resource now properly handles localhost lookup
- bugfix: empty file strings from archive readers [#2027](https://github.com/chef/inspec/pull/2027) ([arlimus](https://github.com/arlimus))
- Fix issue when xinetd.conf does not end in newline [#2040](https://github.com/chef/inspec/pull/2040) ([kareiva](https://github.com/kareiva))
- catch newline issues in xinet.d [#2043](https://github.com/chef/inspec/pull/2043) ([arlimus](https://github.com/arlimus))
- Prep for 1.32.0 release [#2046](https://github.com/chef/inspec/pull/2046) ([adamleff](https://github.com/adamleff))



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

## [v1.20.0](https://github.com/chef/inspec/tree/v1.20.0) (2017-04-13)
[Full Changelog](https://github.com/chef/inspec/compare/v1.19.2...v1.20.0)

**Fixed bugs:**

- gem resource :chef symbol isn't valid on Windows [\#1645](https://github.com/chef/inspec/issues/1645)

**Closed issues:**

- List on-tap hard to use [\#1644](https://github.com/chef/inspec/issues/1644)
- inspec vendor meta profiles fails when dependency profile is in Automate asset store [\#1632](https://github.com/chef/inspec/issues/1632)
- cannot upload meta profile to Automate [\#1631](https://github.com/chef/inspec/issues/1631)

**Merged pull requests:**

- Release 1.20.0 [\#1657](https://github.com/chef/inspec/pull/1657) ([adamleff](https://github.com/adamleff))
- Habitat packages should run as root [\#1656](https://github.com/chef/inspec/pull/1656) ([adamleff](https://github.com/adamleff))
- harmonize compliance profiles view with supermarket views [\#1654](https://github.com/chef/inspec/pull/1654) ([chris-rock](https://github.com/chris-rock))
- \[www\] Update community page [\#1651](https://github.com/chef/inspec/pull/1651) ([adamleff](https://github.com/adamleff))
- Fix gem resource on Windows [\#1650](https://github.com/chef/inspec/pull/1650) ([adamleff](https://github.com/adamleff))
- add support for hostname detection on macOS [\#1648](https://github.com/chef/inspec/pull/1648) ([chris-rock](https://github.com/chris-rock))
- allow Automate profile dependencies [\#1647](https://github.com/chef/inspec/pull/1647) ([jeremymv2](https://github.com/jeremymv2))
- pass options hash sans target key [\#1646](https://github.com/chef/inspec/pull/1646) ([jeremymv2](https://github.com/jeremymv2))
- add `rabbitmq\_config` resource [\#1639](https://github.com/chef/inspec/pull/1639) ([arlimus](https://github.com/arlimus))
- \[www\] Adding a website acceptance environment [\#1634](https://github.com/chef/inspec/pull/1634) ([adamleff](https://github.com/adamleff))
- Adding SNI utilization to ssl resource [\#1624](https://github.com/chef/inspec/pull/1624) ([supergicko](https://github.com/supergicko))
- Add OSX support for host resource [\#1608](https://github.com/chef/inspec/pull/1608) ([RyanJarv](https://github.com/RyanJarv))

## [v1.19.2](https://github.com/chef/inspec/tree/v1.19.2) (2017-04-07)
[Full Changelog](https://github.com/chef/inspec/compare/v1.19.1...v1.19.2)

**Fixed bugs:**

- Bug or doc problem with `registry\_key` [\#1268](https://github.com/chef/inspec/issues/1268)

**Closed issues:**

- Strange `registry\_key` behavior \(Unable to get .NET Version\) [\#1131](https://github.com/chef/inspec/issues/1131)

**Merged pull requests:**

- Release 1.19.2 patch release [\#1638](https://github.com/chef/inspec/pull/1638) ([adamleff](https://github.com/adamleff))
- Fix and document registry issues [\#1635](https://github.com/chef/inspec/pull/1635) ([chris-rock](https://github.com/chris-rock))
- \[www\] Add warning to the http resource documentation [\#1623](https://github.com/chef/inspec/pull/1623) ([adamleff](https://github.com/adamleff))

## [v1.19.1](https://github.com/chef/inspec/tree/v1.19.1) (2017-04-04)
[Full Changelog](https://github.com/chef/inspec/compare/v1.19.0...v1.19.1)

**Merged pull requests:**

- Releasing v1.19.1 [\#1628](https://github.com/chef/inspec/pull/1628) ([adamleff](https://github.com/adamleff))
- Loosen addressable version pin [\#1627](https://github.com/chef/inspec/pull/1627) ([adamleff](https://github.com/adamleff))

## [v1.19.0](https://github.com/chef/inspec/tree/v1.19.0) (2017-04-04)
[Full Changelog](https://github.com/chef/inspec/compare/v1.18.0...v1.19.0)

**Implemented enhancements:**

- dh\_params resource \(proposed\) [\#1617](https://github.com/chef/inspec/issues/1617)
- Fix \#1617 Add dh\_params resource [\#1618](https://github.com/chef/inspec/pull/1618) ([4-20ma](https://github.com/4-20ma))
- Allow apache\_conf to include symlinked configuration files [\#1406](https://github.com/chef/inspec/pull/1406) ([carldjohnston](https://github.com/carldjohnston))

**Closed issues:**

- SSL Resource - Protocols Filter has wrong description [\#1620](https://github.com/chef/inspec/issues/1620)
- Inspec multi-server queries [\#1616](https://github.com/chef/inspec/issues/1616)

**Merged pull requests:**

- Releasing v1.19.0 [\#1626](https://github.com/chef/inspec/pull/1626) ([adamleff](https://github.com/adamleff))
- Fix protocols matcher text on ssl resource docs [\#1622](https://github.com/chef/inspec/pull/1622) ([adamleff](https://github.com/adamleff))
- Replace Nokogiri with REXML in the JUnit formatter [\#1621](https://github.com/chef/inspec/pull/1621) ([adamleff](https://github.com/adamleff))
- obvious fix in README.md [\#1619](https://github.com/chef/inspec/pull/1619) ([lucky-sideburn](https://github.com/lucky-sideburn))
- \[www\] Fixing rake www:release task [\#1611](https://github.com/chef/inspec/pull/1611) ([adamleff](https://github.com/adamleff))
- \[www\] Resurrect global message, promote ChefConf and NYC Meetup [\#1607](https://github.com/chef/inspec/pull/1607) ([adamleff](https://github.com/adamleff))

## [v1.18.0](https://github.com/chef/inspec/tree/v1.18.0) (2017-03-30)
[Full Changelog](https://github.com/chef/inspec/compare/v1.17.0...v1.18.0)

**Implemented enhancements:**

- Requesting x509\_certificate and x509\_private\_key [\#1459](https://github.com/chef/inspec/issues/1459)
- generate profile CLI command [\#410](https://github.com/chef/inspec/issues/410)

**Fixed bugs:**

- YAML file extensions support only \(.yml\) [\#1569](https://github.com/chef/inspec/issues/1569)
- yum.repo with should\_not exist fails with NoMethodError: undefined method `\[\]' for nil:NilClass [\#1553](https://github.com/chef/inspec/issues/1553)

**Closed issues:**

- Cannot install on CentOS 7 [\#1609](https://github.com/chef/inspec/issues/1609)
- port should be\_listening busted in 1.17.0? [\#1602](https://github.com/chef/inspec/issues/1602)
- inspec fails to install on centos 7 [\#1597](https://github.com/chef/inspec/issues/1597)
- Invalid name argument error after upgrading Inspec [\#1588](https://github.com/chef/inspec/issues/1588)
- Fix-up www build processes due to Gemfile change [\#1586](https://github.com/chef/inspec/issues/1586)
- inspec outputs full hash when testing ini style file option with \[header\] [\#1541](https://github.com/chef/inspec/issues/1541)
- inspec compliance upload fails on automate server [\#1360](https://github.com/chef/inspec/issues/1360)
- Add JSON Schema validation [\#884](https://github.com/chef/inspec/issues/884)

**Merged pull requests:**

- Release v1.18.0 [\#1610](https://github.com/chef/inspec/pull/1610) ([adamleff](https://github.com/adamleff))
- Fix port resource for invalid IP address in netstat output [\#1603](https://github.com/chef/inspec/pull/1603) ([adamleff](https://github.com/adamleff))
- Remove errant puts in inspec habitat CLI command [\#1601](https://github.com/chef/inspec/pull/1601) ([adamleff](https://github.com/adamleff))
- Add docs for habitat CLI commands [\#1600](https://github.com/chef/inspec/pull/1600) ([adamleff](https://github.com/adamleff))
- Require Ruby 2.1 [\#1599](https://github.com/chef/inspec/pull/1599) ([adamleff](https://github.com/adamleff))
- Extend `gem` to take an optional `gem\_binary` [\#1596](https://github.com/chef/inspec/pull/1596) ([nvwls](https://github.com/nvwls))
- Feature/fix ability to pass in supermarket url [\#1595](https://github.com/chef/inspec/pull/1595) ([rylarson](https://github.com/rylarson))
- Support vendored profiles in Habitat-packaged profiles [\#1594](https://github.com/chef/inspec/pull/1594) ([adamleff](https://github.com/adamleff))
- Yum resource fix for non-existent repos and repo info [\#1593](https://github.com/chef/inspec/pull/1593) ([adamleff](https://github.com/adamleff))
- Fixing www/docs rake tasks [\#1591](https://github.com/chef/inspec/pull/1591) ([adamleff](https://github.com/adamleff))
- add tag object [\#1590](https://github.com/chef/inspec/pull/1590) ([chris-rock](https://github.com/chris-rock))
- Support YAML attributes files ending in .yaml [\#1589](https://github.com/chef/inspec/pull/1589) ([mr-exz](https://github.com/mr-exz))
- Fix Habitat plan for nokogiri support [\#1587](https://github.com/chef/inspec/pull/1587) ([adamleff](https://github.com/adamleff))
- x509\_certificate and key\_rsa resource [\#1567](https://github.com/chef/inspec/pull/1567) ([chris-rock](https://github.com/chris-rock))
- implement JSON schema for `inspec exec` json outputs [\#1564](https://github.com/chef/inspec/pull/1564) ([arlimus](https://github.com/arlimus))
- Provide a method-based accessor for SimpleConfig hashes [\#1544](https://github.com/chef/inspec/pull/1544) ([adamleff](https://github.com/adamleff))

## [v1.17.0](https://github.com/chef/inspec/tree/v1.17.0) (2017-03-21)
[Full Changelog](https://github.com/chef/inspec/compare/v1.16.1...v1.17.0)

**Implemented enhancements:**

- Calendar for Line Chart [\#1558](https://github.com/chef/inspec/issues/1558)
- Need better error message for improper inspec.yml formatting [\#1549](https://github.com/chef/inspec/issues/1549)

**Fixed bugs:**

- cannot load such file -- nokogiri [\#1562](https://github.com/chef/inspec/issues/1562)
- Failure to parse tcp6 URI [\#1521](https://github.com/chef/inspec/issues/1521)

**Closed issues:**

- json resource array index access not working [\#1560](https://github.com/chef/inspec/issues/1560)
- Crontab regex matching [\#1526](https://github.com/chef/inspec/issues/1526)

**Merged pull requests:**

- Move simulator gems to www [\#1585](https://github.com/chef/inspec/pull/1585) ([adamleff](https://github.com/adamleff))
- release 1.17.0 [\#1583](https://github.com/chef/inspec/pull/1583) ([adamleff](https://github.com/adamleff))
- Fix omnibus configuration [\#1579](https://github.com/chef/inspec/pull/1579) ([adamleff](https://github.com/adamleff))
- moving the nokogiri reference into the gemspec file [\#1576](https://github.com/chef/inspec/pull/1576) ([jkerry](https://github.com/jkerry))
- Hide Event Feature on Homepage [\#1563](https://github.com/chef/inspec/pull/1563) ([hannah-radish](https://github.com/hannah-radish))
- Fix ObjectTraverser when accessing array values [\#1561](https://github.com/chef/inspec/pull/1561) ([adamleff](https://github.com/adamleff))
- Add additional example for matching crontab commands [\#1559](https://github.com/chef/inspec/pull/1559) ([adamleff](https://github.com/adamleff))
- Update file.md with example how to test symlinked files [\#1555](https://github.com/chef/inspec/pull/1555) ([nvtkaszpir](https://github.com/nvtkaszpir))
- Provide better error message when inspec.yml is invalid [\#1552](https://github.com/chef/inspec/pull/1552) ([adamleff](https://github.com/adamleff))
- try to use sysv fallback if is not producing proper output [\#1550](https://github.com/chef/inspec/pull/1550) ([chris-rock](https://github.com/chris-rock))
- update readme for install scripts [\#1548](https://github.com/chef/inspec/pull/1548) ([chris-rock](https://github.com/chris-rock))
- Fixing port check with v4 IPs in a v6 netstat line [\#1547](https://github.com/chef/inspec/pull/1547) ([adamleff](https://github.com/adamleff))
- Fixing a typo [\#1536](https://github.com/chef/inspec/pull/1536) ([tescalada](https://github.com/tescalada))
- windows\_task docs: Correct syntax error and misspelled word [\#1525](https://github.com/chef/inspec/pull/1525) ([spiffytech](https://github.com/spiffytech))

## [v1.16.1](https://github.com/chef/inspec/tree/v1.16.1) (2017-03-06)
[Full Changelog](https://github.com/chef/inspec/compare/v1.16.0...v1.16.1)

**Fixed bugs:**

- "inspec version" waits for connection timeout inside firewall [\#1537](https://github.com/chef/inspec/issues/1537)

**Merged pull requests:**

- releasing 1.16.1 with a bug fix and omnibus fix [\#1540](https://github.com/chef/inspec/pull/1540) ([adamleff](https://github.com/adamleff))
- Fix omnibus build after new JUnit formatter [\#1539](https://github.com/chef/inspec/pull/1539) ([adamleff](https://github.com/adamleff))
- Avoid connection timeout of "inspec version" [\#1538](https://github.com/chef/inspec/pull/1538) ([makotots](https://github.com/makotots))
- Write Habitat-driven InSpec output to svc\_var directory [\#1533](https://github.com/chef/inspec/pull/1533) ([adamleff](https://github.com/adamleff))
- Updating .gitignore for Habitat and direnv [\#1531](https://github.com/chef/inspec/pull/1531) ([adamleff](https://github.com/adamleff))
- Ready for review - inspec.io bug fixes, \#1440, \#1420, \#1465, \#1421, \#1437,\#1226, \#1494, \#1495 [\#1512](https://github.com/chef/inspec/pull/1512) ([hannah-radish](https://github.com/hannah-radish))

## [v1.16.0](https://github.com/chef/inspec/tree/v1.16.0) (2017-03-02)
[Full Changelog](https://github.com/chef/inspec/compare/v1.15.0...v1.16.0)

**Implemented enhancements:**

- jUnit reports are hard to read [\#1438](https://github.com/chef/inspec/issues/1438)
- Functional JUnit reporter [\#1454](https://github.com/chef/inspec/pull/1454) ([jkerry](https://github.com/jkerry))

**Closed issues:**

- Small bug on the registry\_key docs page [\#1523](https://github.com/chef/inspec/issues/1523)

**Merged pull requests:**

- 1.16.0 [\#1530](https://github.com/chef/inspec/pull/1530) ([adamleff](https://github.com/adamleff))
- use -- for description of inspec login\_automate [\#1527](https://github.com/chef/inspec/pull/1527) ([chris-rock](https://github.com/chris-rock))
- fix ident in cmp matcher docs [\#1524](https://github.com/chef/inspec/pull/1524) ([chris-rock](https://github.com/chris-rock))
- Add Rake to Habitat build Gemfile [\#1520](https://github.com/chef/inspec/pull/1520) ([adamleff](https://github.com/adamleff))
- Fix kernel\_module for centos/redhat [\#1513](https://github.com/chef/inspec/pull/1513) ([postgred](https://github.com/postgred))
- Added oracle linux to rhel platform section of 'service' resource. [\#1511](https://github.com/chef/inspec/pull/1511) ([carldjohnston](https://github.com/carldjohnston))
- Add FreeBSD support for ZFS datasets and pools [\#1501](https://github.com/chef/inspec/pull/1501) ([jbenden](https://github.com/jbenden))

## [v1.15.0](https://github.com/chef/inspec/tree/v1.15.0) (2017-02-27)
[Full Changelog](https://github.com/chef/inspec/compare/v1.14.1...v1.15.0)

**Implemented enhancements:**

- Wrong rendering of InSpec.io header [\#1421](https://github.com/chef/inspec/issues/1421)

**Fixed bugs:**

- New Inspec.io is crashing on Edge if window is resized to a smaller window [\#1420](https://github.com/chef/inspec/issues/1420)

**Closed issues:**

- Colours and symbols broken on Windows [\#1508](https://github.com/chef/inspec/issues/1508)
- be\_reacheable matcher for host resource should not always use ping on linux [\#1504](https://github.com/chef/inspec/issues/1504)
- Inspec login fails [\#1503](https://github.com/chef/inspec/issues/1503)
- Develop an inspec test for selinux [\#1496](https://github.com/chef/inspec/issues/1496)
- Inspec.io: Add webinar/notifications bar in index.html [\#1495](https://github.com/chef/inspec/issues/1495)
- Inspec.io: Try Demo Button Bug [\#1494](https://github.com/chef/inspec/issues/1494)
- \[chef-compliance\]  Scan Report Calculations [\#1491](https://github.com/chef/inspec/issues/1491)
- Create url for demo that can be pointed to from outbound campaigns [\#1485](https://github.com/chef/inspec/issues/1485)
- After inspec update from 1.5 to 1.10 it breaks with \[undefined method `\[\]=' for nil:NilClass\] [\#1456](https://github.com/chef/inspec/issues/1456)
- Inspec.io and IE11 [\#1437](https://github.com/chef/inspec/issues/1437)
- Link to robert\_config.rb is broken on inspec.io [\#1226](https://github.com/chef/inspec/issues/1226)

**Merged pull requests:**

- 1.15.0 [\#1519](https://github.com/chef/inspec/pull/1519) ([adamleff](https://github.com/adamleff))
- Fix formatting and colors on Windows [\#1510](https://github.com/chef/inspec/pull/1510) ([trickyearlobe](https://github.com/trickyearlobe))
- Adding a Habitat profile artifact creator [\#1505](https://github.com/chef/inspec/pull/1505) ([adamleff](https://github.com/adamleff))
- create inspec.io/tutorial.html [\#1490](https://github.com/chef/inspec/pull/1490) ([arlimus](https://github.com/arlimus))
- Doc fix for SourceReaders::InspecReader [\#1489](https://github.com/chef/inspec/pull/1489) ([adamleff](https://github.com/adamleff))
- Generate default profile names, fix bug when using multiple flat profiles [\#1488](https://github.com/chef/inspec/pull/1488) ([adamleff](https://github.com/adamleff))
- Packages resource support for RedHat [\#1487](https://github.com/chef/inspec/pull/1487) ([alexpop](https://github.com/alexpop))
- Adding new crontab resource [\#1482](https://github.com/chef/inspec/pull/1482) ([adamleff](https://github.com/adamleff))
- Provide target info on shell invocation [\#1475](https://github.com/chef/inspec/pull/1475) ([adamleff](https://github.com/adamleff))

## [v1.14.1](https://github.com/chef/inspec/tree/v1.14.1) (2017-02-10)
[Full Changelog](https://github.com/chef/inspec/compare/v1.14.0...v1.14.1)

**Closed issues:**

- go /profiles service modifications [\#1483](https://github.com/chef/inspec/issues/1483)
- inspec compliance login\* should support a hostname for the SERVER argument [\#1473](https://github.com/chef/inspec/issues/1473)

**Merged pull requests:**

- Skip packages resource for unsupported OS [\#1484](https://github.com/chef/inspec/pull/1484) ([alexpop](https://github.com/alexpop))
- add Alex Pop to the list of maintainers [\#1481](https://github.com/chef/inspec/pull/1481) ([arlimus](https://github.com/arlimus))
- remove Jason Reed from the list of maintainers [\#1480](https://github.com/chef/inspec/pull/1480) ([arlimus](https://github.com/arlimus))
- Add Adam Leff as a maintainer [\#1479](https://github.com/chef/inspec/pull/1479) ([adamleff](https://github.com/adamleff))

## [v1.14.0](https://github.com/chef/inspec/tree/v1.14.0) (2017-02-08)
[Full Changelog](https://github.com/chef/inspec/compare/v1.13.0...v1.14.0)

**Fixed bugs:**

- map url to https for compliance plugin [\#1471](https://github.com/chef/inspec/pull/1471) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- Display meaningful error message when uploading profiles to a server with self-signed certs [\#1469](https://github.com/chef/inspec/issues/1469)

**Merged pull requests:**

- Use RuboCop 0.39.0 \(same as chefstyle\) [\#1478](https://github.com/chef/inspec/pull/1478) ([tduffield](https://github.com/tduffield))
- bugfix: warn users about insecure login requirements [\#1472](https://github.com/chef/inspec/pull/1472) ([arlimus](https://github.com/arlimus))
- Add support for "inspec -v" showing the version [\#1470](https://github.com/chef/inspec/pull/1470) ([adamleff](https://github.com/adamleff))
- Replace slack invite form on Community, fix surprise code example [\#1468](https://github.com/chef/inspec/pull/1468) ([adamleff](https://github.com/adamleff))

## [v1.13.0](https://github.com/chef/inspec/tree/v1.13.0) (2017-02-07)
[Full Changelog](https://github.com/chef/inspec/compare/v1.12.0...v1.13.0)

**Implemented enhancements:**

- add "packages" resource [\#1458](https://github.com/chef/inspec/pull/1458) ([jtimberman](https://github.com/jtimberman))
- Provide a way to force it vs its for any argument [\#1457](https://github.com/chef/inspec/pull/1457) ([alexpop](https://github.com/alexpop))

**Closed issues:**

- Ignore me [\#1464](https://github.com/chef/inspec/issues/1464)
- redirect URL downloads.inspec.io to https://downloads.chef.io/inspec [\#1462](https://github.com/chef/inspec/issues/1462)

## [v1.12.0](https://github.com/chef/inspec/tree/v1.12.0) (2017-02-03)
[Full Changelog](https://github.com/chef/inspec/compare/v1.11.0...v1.12.0)

**Implemented enhancements:**

- Allow setting of the tests array [\#1455](https://github.com/chef/inspec/pull/1455) ([alexpop](https://github.com/alexpop))
- switch to faraday as http backend [\#1452](https://github.com/chef/inspec/pull/1452) ([chris-rock](https://github.com/chris-rock))
- Add FilterTable support to processes resource [\#1451](https://github.com/chef/inspec/pull/1451) ([alexpop](https://github.com/alexpop))

**Closed issues:**

- `skip` parameter ignored inside `describe` block [\#1450](https://github.com/chef/inspec/issues/1450)

## [v1.11.0](https://github.com/chef/inspec/tree/v1.11.0) (2017-02-01)
[Full Changelog](https://github.com/chef/inspec/compare/v1.10.0...v1.11.0)

**Implemented enhancements:**

- HTTP request resource [\#336](https://github.com/chef/inspec/issues/336)
- derive xinetd protocol from socket\_type when not defined in the config file [\#1448](https://github.com/chef/inspec/pull/1448) ([alexpop](https://github.com/alexpop))
- Add negate! support for describe.one object [\#1442](https://github.com/chef/inspec/pull/1442) ([alexpop](https://github.com/alexpop))
- Version method for kernel\_module [\#1435](https://github.com/chef/inspec/pull/1435) ([postgred](https://github.com/postgred))

**Fixed bugs:**

- Fix xinetd parsing of services from the same file. Expose resource.protocols [\#1444](https://github.com/chef/inspec/pull/1444) ([alexpop](https://github.com/alexpop))

**Merged pull requests:**

- Make minor grammar/style changes to `inspec.io` [\#1441](https://github.com/chef/inspec/pull/1441) ([jerryaldrichiii](https://github.com/jerryaldrichiii))

## [v1.10.0](https://github.com/chef/inspec/tree/v1.10.0) (2017-01-26)
[Full Changelog](https://github.com/chef/inspec/compare/v1.9.0...v1.10.0)

**Closed issues:**

- fix functional tests [\#1429](https://github.com/chef/inspec/issues/1429)

**Merged pull requests:**

- 1.10.0 [\#1433](https://github.com/chef/inspec/pull/1433) ([chris-rock](https://github.com/chris-rock))
- improve http header handling [\#1432](https://github.com/chef/inspec/pull/1432) ([chris-rock](https://github.com/chris-rock))
- use new devsec baseline [\#1431](https://github.com/chef/inspec/pull/1431) ([chris-rock](https://github.com/chris-rock))
- 'execution' is spelled correctly [\#1428](https://github.com/chef/inspec/pull/1428) ([nathenharvey](https://github.com/nathenharvey))
- Bug fixes + New Elements [\#1426](https://github.com/chef/inspec/pull/1426) ([hannah-radish](https://github.com/hannah-radish))
- Docs: fix resource name \('processes' instead of 'process'\) [\#1423](https://github.com/chef/inspec/pull/1423) ([techraf](https://github.com/techraf))
- update copyright of the year [\#1422](https://github.com/chef/inspec/pull/1422) ([chris-rock](https://github.com/chris-rock))
- Link to the 1.0 release webinar [\#1419](https://github.com/chef/inspec/pull/1419) ([nathenharvey](https://github.com/nathenharvey))
- Updated compliance api requests to actually use refresh token correctly [\#1416](https://github.com/chef/inspec/pull/1416) ([brentm5](https://github.com/brentm5))
- Docs examples: use double quotes to prevent escaping backslash in the expected string [\#1413](https://github.com/chef/inspec/pull/1413) ([techraf](https://github.com/techraf))
- Fixed error in OS docs, added CentOS to redhat family docs. [\#1407](https://github.com/chef/inspec/pull/1407) ([gscho](https://github.com/gscho))
- Solicit talks for ChefConf [\#1405](https://github.com/chef/inspec/pull/1405) ([nathenharvey](https://github.com/nathenharvey))
- Add an http test method [\#1403](https://github.com/chef/inspec/pull/1403) ([guilhem](https://github.com/guilhem))
- new inspec.io frontpage [\#1362](https://github.com/chef/inspec/pull/1362) ([hannah-radish](https://github.com/hannah-radish))

## [v1.9.0](https://github.com/chef/inspec/tree/v1.9.0) (2017-01-06)
[Full Changelog](https://github.com/chef/inspec/compare/v1.8.0...v1.9.0)

**Implemented enhancements:**

- Optimize regular expression for postgres config parsing [\#1395](https://github.com/chef/inspec/pull/1395) ([chris-rock](https://github.com/chris-rock))
- print name for supermarket profiles [\#1376](https://github.com/chef/inspec/pull/1376) ([chris-rock](https://github.com/chris-rock))
- call ssh cookbook from prepare cookbook [\#1369](https://github.com/chef/inspec/pull/1369) ([chris-rock](https://github.com/chris-rock))
- display if inspec version is outdated [\#1365](https://github.com/chef/inspec/pull/1365) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- profile upload fails to compliance server [\#1298](https://github.com/chef/inspec/issues/1298)
- undefined method `max\_connections' for PostgreSQL [\#825](https://github.com/chef/inspec/issues/825)
- bugfix: expose postgres\_conf parameters via `its` [\#826](https://github.com/chef/inspec/pull/826) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- Yum.repo should show correct name [\#1390](https://github.com/chef/inspec/issues/1390)
- The 'package' resource is broken in OSX \(with brew as package manager\) [\#1386](https://github.com/chef/inspec/issues/1386)
- JUnit XML dumping fails [\#1383](https://github.com/chef/inspec/issues/1383)
- json.rb produces stacktrace when a target file is unreadable [\#1382](https://github.com/chef/inspec/issues/1382)
- Document Serverspec Migration [\#804](https://github.com/chef/inspec/issues/804)

**Merged pull requests:**

- Download InSpec profiles from Chef Compliance [\#1402](https://github.com/chef/inspec/pull/1402) ([chris-rock](https://github.com/chris-rock))
- Yum.repo should show correct name [\#1391](https://github.com/chef/inspec/pull/1391) ([Wing924](https://github.com/Wing924))
- fixes brew json parsing [\#1389](https://github.com/chef/inspec/pull/1389) ([chris-rock](https://github.com/chris-rock))
- Fix wrong description for the Solaris cases in the unit tests of the 'package' resource [\#1388](https://github.com/chef/inspec/pull/1388) ([jvrplmlmn](https://github.com/jvrplmlmn))
- Unit test the 'package' resource for OSX \(with brew\) [\#1387](https://github.com/chef/inspec/pull/1387) ([jvrplmlmn](https://github.com/jvrplmlmn))
- drop ruby 1.9.3 [\#1384](https://github.com/chef/inspec/pull/1384) ([chris-rock](https://github.com/chris-rock))
- Make "permission denied" condition match that of Train [\#1381](https://github.com/chef/inspec/pull/1381) ([makotots](https://github.com/makotots))
- mention inspec vendor for compliance dependency [\#1380](https://github.com/chef/inspec/pull/1380) ([alexpop](https://github.com/alexpop))
- control and lib\_eval\_context unit tests [\#1373](https://github.com/chef/inspec/pull/1373) ([jeremymv2](https://github.com/jeremymv2))
- Fix Learn Chef tutorial link [\#1372](https://github.com/chef/inspec/pull/1372) ([tpetchel](https://github.com/tpetchel))
- add guidance for Serverspec migration [\#1368](https://github.com/chef/inspec/pull/1368) ([chris-rock](https://github.com/chris-rock))

## [v1.8.0](https://github.com/chef/inspec/tree/v1.8.0) (2016-12-16)
[Full Changelog](https://github.com/chef/inspec/compare/v1.7.2...v1.8.0)

**Fixed bugs:**

- JSON resource's error message is missing filename when file is not found [\#1358](https://github.com/chef/inspec/issues/1358)

**Closed issues:**

- inspec exec doesn't work for SSH [\#1361](https://github.com/chef/inspec/issues/1361)
- inspec-archive should create a zip with version string [\#1350](https://github.com/chef/inspec/issues/1350)
- https and security conserns on inspec.io [\#1217](https://github.com/chef/inspec/issues/1217)
- Resource for windows scheduled task [\#1214](https://github.com/chef/inspec/issues/1214)
- Last steps for inspec.io launch [\#1114](https://github.com/chef/inspec/issues/1114)

**Merged pull requests:**

- add fallback syntax for serverspec tests [\#1367](https://github.com/chef/inspec/pull/1367) ([chris-rock](https://github.com/chris-rock))
- JSON resource's error message is missing filename when file is not found [\#1366](https://github.com/chef/inspec/pull/1366) ([makotots](https://github.com/makotots))
- extending cmp to support better version ops [\#1364](https://github.com/chef/inspec/pull/1364) ([jeremymv2](https://github.com/jeremymv2))
- add windows 10 and windows 2016 as supported platform [\#1359](https://github.com/chef/inspec/pull/1359) ([chris-rock](https://github.com/chris-rock))
- Remove trailing `\\` from iis\_site example [\#1354](https://github.com/chef/inspec/pull/1354) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Adds additional tutorials created by Annie Hedgie [\#1352](https://github.com/chef/inspec/pull/1352) ([burtlo](https://github.com/burtlo))
- Add profile version to archive [\#1351](https://github.com/chef/inspec/pull/1351) ([jaxxstorm](https://github.com/jaxxstorm))
- burtlo/cleaner cli formatter [\#1331](https://github.com/chef/inspec/pull/1331) ([burtlo](https://github.com/burtlo))

## [v1.7.2](https://github.com/chef/inspec/tree/v1.7.2) (2016-12-08)
[Full Changelog](https://github.com/chef/inspec/compare/v1.7.1...v1.7.2)

**Fixed bugs:**

- use cached profile for compliance dependencies if vendored [\#1348](https://github.com/chef/inspec/pull/1348) ([chris-rock](https://github.com/chris-rock))

## [v1.7.1](https://github.com/chef/inspec/tree/v1.7.1) (2016-12-03)
[Full Changelog](https://github.com/chef/inspec/compare/v1.7.0...v1.7.1)

**Implemented enhancements:**

- Use train 0.22.0 for SSH agent support [\#1342](https://github.com/chef/inspec/pull/1342) ([alexpop](https://github.com/alexpop))

**Fixed bugs:**

- Remove check and json logging for now [\#1343](https://github.com/chef/inspec/pull/1343) ([alexpop](https://github.com/alexpop))

**Merged pull requests:**

- dont remove gh-pages if it doesnt exist [\#1340](https://github.com/chef/inspec/pull/1340) ([arlimus](https://github.com/arlimus))

## [v1.7.0](https://github.com/chef/inspec/tree/v1.7.0) (2016-12-02)
[Full Changelog](https://github.com/chef/inspec/compare/v1.6.0...v1.7.0)

**Implemented enhancements:**

- inspec compliance profiles should support automate as a backend [\#1295](https://github.com/chef/inspec/issues/1295)
- this is killing my eyes!!!!!!!!! [\#951](https://github.com/chef/inspec/issues/951)
- Show process name during inspec output [\#1329](https://github.com/chef/inspec/pull/1329) ([jcastillocano](https://github.com/jcastillocano))

**Fixed bugs:**

- inspec.lock not loaded from tarball profiles [\#1322](https://github.com/chef/inspec/issues/1322)
- InSpec tries to re-fetch profiles even if lockfile exists [\#1316](https://github.com/chef/inspec/issues/1316)
- fix docker release script [\#1328](https://github.com/chef/inspec/pull/1328) ([chris-rock](https://github.com/chris-rock))
- Provide inspec.lock for archives as well [\#1323](https://github.com/chef/inspec/pull/1323) ([alexpop](https://github.com/alexpop))
- inspec check and json to use vendored dependencies [\#1321](https://github.com/chef/inspec/pull/1321) ([alexpop](https://github.com/alexpop))

**Closed issues:**

- RegExp in processes resource can't match long-run process [\#1332](https://github.com/chef/inspec/issues/1332)
- inspec archive vendoring [\#1325](https://github.com/chef/inspec/issues/1325)
- inspec compliance upload of a meta-profile [\#1294](https://github.com/chef/inspec/issues/1294)

**Merged pull requests:**

- improve functional tests for vendored profiles [\#1337](https://github.com/chef/inspec/pull/1337) ([chris-rock](https://github.com/chris-rock))
- Adds junit to the inspec help exec [\#1336](https://github.com/chef/inspec/pull/1336) ([burtlo](https://github.com/burtlo))
- Vendor profile when uploading to chef-compliance [\#1334](https://github.com/chef/inspec/pull/1334) ([vjeffrey](https://github.com/vjeffrey))
- fix bug: RegExp in processes resource can't match long-run process \#1332 [\#1333](https://github.com/chef/inspec/pull/1333) ([Wing924](https://github.com/Wing924))
- clean up rspec\_json\_formatter [\#1314](https://github.com/chef/inspec/pull/1314) ([vjeffrey](https://github.com/vjeffrey))
- enable inspec compliance cli support automate [\#1297](https://github.com/chef/inspec/pull/1297) ([vjeffrey](https://github.com/vjeffrey))

## [v1.6.0](https://github.com/chef/inspec/tree/v1.6.0) (2016-11-28)
[Full Changelog](https://github.com/chef/inspec/compare/v1.5.0...v1.6.0)

**Fixed bugs:**

- InSpec loads whichever \*.rb file it finds along the way causing itself to fail [\#1326](https://github.com/chef/inspec/issues/1326)

**Closed issues:**

- command resource check doesn't fail when it should [\#1318](https://github.com/chef/inspec/issues/1318)
- is this a typo....  inpsec? [\#1309](https://github.com/chef/inspec/issues/1309)
- support JUnit format [\#1301](https://github.com/chef/inspec/issues/1301)
- apt resource fails corner cases with optional second column [\#1261](https://github.com/chef/inspec/issues/1261)

**Merged pull requests:**

- do not load controls from test directory [\#1327](https://github.com/chef/inspec/pull/1327) ([chris-rock](https://github.com/chris-rock))
- Replaced Colors for output [\#1320](https://github.com/chef/inspec/pull/1320) ([hannah-radish](https://github.com/hannah-radish))
- Hannah vj/fix tests formatting [\#1319](https://github.com/chef/inspec/pull/1319) ([hannah-radish](https://github.com/hannah-radish))
- revert style changes temporarily [\#1317](https://github.com/chef/inspec/pull/1317) ([vjeffrey](https://github.com/vjeffrey))
- Updated color palettes, label colors and icons [\#1313](https://github.com/chef/inspec/pull/1313) ([hannah-radish](https://github.com/hannah-radish))
- Remove extra `'` in registry key examples [\#1308](https://github.com/chef/inspec/pull/1308) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- also push docker latest tag with each release [\#1307](https://github.com/chef/inspec/pull/1307) ([chris-rock](https://github.com/chris-rock))
- Adding windows\_task resource [\#1306](https://github.com/chef/inspec/pull/1306) ([username-is-already-taken2](https://github.com/username-is-already-taken2))
- Adding JUnit formatter support [\#1304](https://github.com/chef/inspec/pull/1304) ([jkerry](https://github.com/jkerry))

## [v1.5.0](https://github.com/chef/inspec/tree/v1.5.0) (2016-11-21)
[Full Changelog](https://github.com/chef/inspec/compare/v1.4.1...v1.5.0)

**Implemented enhancements:**

- inspec supermarket profiles - update for new supermarket api [\#1255](https://github.com/chef/inspec/issues/1255)

**Fixed bugs:**

- File resource permissions for windows [\#783](https://github.com/chef/inspec/issues/783)
- docs: quoted version for package resource example [\#1296](https://github.com/chef/inspec/pull/1296) ([alexpop](https://github.com/alexpop))

**Merged pull requests:**

- ensure metadata release entry is a string [\#1305](https://github.com/chef/inspec/pull/1305) ([chris-rock](https://github.com/chris-rock))
- Fixes resources in the docs [\#1303](https://github.com/chef/inspec/pull/1303) ([burtlo](https://github.com/burtlo))
- copy vendored dependencies into cache [\#1291](https://github.com/chef/inspec/pull/1291) ([chris-rock](https://github.com/chris-rock))
- fix double-log-level [\#1290](https://github.com/chef/inspec/pull/1290) ([chris-rock](https://github.com/chris-rock))
- update supermarket profile search to use new type param [\#1289](https://github.com/chef/inspec/pull/1289) ([robbkidd](https://github.com/robbkidd))
- Change `Inpsec` to `Inspec` [\#1286](https://github.com/chef/inspec/pull/1286) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- improve vendor command [\#1285](https://github.com/chef/inspec/pull/1285) ([chris-rock](https://github.com/chris-rock))
- improved regex for matching deb sources [\#1280](https://github.com/chef/inspec/pull/1280) ([grimm26](https://github.com/grimm26))

## [v1.4.1](https://github.com/chef/inspec/tree/v1.4.1) (2016-11-04)
[Full Changelog](https://github.com/chef/inspec/compare/v1.4.0...v1.4.1)

**Fixed bugs:**

- Passing attributes to inherited profiles [\#1250](https://github.com/chef/inspec/issues/1250)

**Closed issues:**

- RFC: Harmonize profile location targets in inspec.yml/kitchen.yml/audit cookbook [\#1227](https://github.com/chef/inspec/issues/1227)

**Merged pull requests:**

- Fix attributes in profile dependencies [\#1258](https://github.com/chef/inspec/pull/1258) ([chris-rock](https://github.com/chris-rock))

## [v1.4.0](https://github.com/chef/inspec/tree/v1.4.0) (2016-11-04)
[Full Changelog](https://github.com/chef/inspec/compare/v1.3.0...v1.4.0)

**Fixed bugs:**

- Windows Service State incorrectly interpretted for use in describe service.  [\#1269](https://github.com/chef/inspec/issues/1269)
- /etc/passwd and /etc/shadow checks fail on CentOS [\#1264](https://github.com/chef/inspec/issues/1264)
- Listing profiles on the Supermarket should return all profiles [\#1219](https://github.com/chef/inspec/issues/1219)

**Closed issues:**

- Add file integration tests for docker [\#1277](https://github.com/chef/inspec/issues/1277)
- Solaris Sudo Not Always In /usr/bin/sudo [\#1265](https://github.com/chef/inspec/issues/1265)

**Merged pull requests:**

- activate file integration tests in docker [\#1278](https://github.com/chef/inspec/pull/1278) ([chris-rock](https://github.com/chris-rock))
- Contain matcher maps to include matcher with warning [\#1276](https://github.com/chef/inspec/pull/1276) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Windows Service Check for service enabled state.  [\#1274](https://github.com/chef/inspec/pull/1274) ([hj70ft](https://github.com/hj70ft))
- fix file permission check by mask [\#1273](https://github.com/chef/inspec/pull/1273) ([chris-rock](https://github.com/chris-rock))
- fix \#1226 [\#1272](https://github.com/chef/inspec/pull/1272) ([chris-rock](https://github.com/chris-rock))
- Enable the json resource to accept command output or JSON content [\#1271](https://github.com/chef/inspec/pull/1271) ([jerearista](https://github.com/jerearista))
- Added tutorials for Days 8 & 9 [\#1263](https://github.com/chef/inspec/pull/1263) ([anniehedgpeth](https://github.com/anniehedgpeth))

## [v1.3.0](https://github.com/chef/inspec/tree/v1.3.0) (2016-10-28)
[Full Changelog](https://github.com/chef/inspec/compare/v1.2.1...v1.3.0)

**Implemented enhancements:**

- extend the attributes object with helper methods [\#1220](https://github.com/chef/inspec/pull/1220) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- inetd\_conf resource error [\#1253](https://github.com/chef/inspec/issues/1253)
- Process user should eq \["longusername"\]: usernames get truncated with a '+' at the end [\#995](https://github.com/chef/inspec/issues/995)
- Remove wildcard from windows package detection [\#1259](https://github.com/chef/inspec/pull/1259) ([chris-rock](https://github.com/chris-rock))
- Fix nil timeout and retries [\#1256](https://github.com/chef/inspec/pull/1256) ([alexpop](https://github.com/alexpop))
- Supermarket tools get and filter by tool\_type [\#1254](https://github.com/chef/inspec/pull/1254) ([alexpop](https://github.com/alexpop))
- Fix processes resource user and command truncation [\#1225](https://github.com/chef/inspec/pull/1225) ([alexpop](https://github.com/alexpop))

**Closed issues:**

- inetd and xinetd resources inconsistencies [\#1252](https://github.com/chef/inspec/issues/1252)
- TestKitchen - Duplicate testing when verifier specified in suite definition [\#1240](https://github.com/chef/inspec/issues/1240)
- Document new DCO process in contributing.md [\#1223](https://github.com/chef/inspec/issues/1223)
- Move InSpec Community to https://community-slack.chef.io/ [\#1222](https://github.com/chef/inspec/issues/1222)
- Export Docker package for InSpec from Habitat [\#1212](https://github.com/chef/inspec/issues/1212)
- Test verify action on Windows 2012 fails - \[no implicit conversion of nil into Array\] on default-windows-2012r2 [\#1193](https://github.com/chef/inspec/issues/1193)
- Add InSpec habitat plan [\#843](https://github.com/chef/inspec/issues/843)

**Merged pull requests:**

- Use Slack Badge instead of Gitter badge [\#1262](https://github.com/chef/inspec/pull/1262) ([chris-rock](https://github.com/chris-rock))
- remove accidentally added file [\#1260](https://github.com/chef/inspec/pull/1260) ([chris-rock](https://github.com/chris-rock))
- overwrite exec for inetd because respec its is executing `exec` [\#1257](https://github.com/chef/inspec/pull/1257) ([chris-rock](https://github.com/chris-rock))
- Use include instead of match in the error message [\#1248](https://github.com/chef/inspec/pull/1248) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Code-block directive is not needed here [\#1247](https://github.com/chef/inspec/pull/1247) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Set the global message to display again [\#1246](https://github.com/chef/inspec/pull/1246) ([ryankeairns](https://github.com/ryankeairns))
- Ignore RVM files [\#1245](https://github.com/chef/inspec/pull/1245) ([artem-sidorenko](https://github.com/artem-sidorenko))
- Change global message regarding 10/25 webinar [\#1244](https://github.com/chef/inspec/pull/1244) ([ryankeairns](https://github.com/ryankeairns))
- Fix issue with registry\_key example [\#1243](https://github.com/chef/inspec/pull/1243) ([seththoenen](https://github.com/seththoenen))
- Accessing nested mappings in a yam file [\#1242](https://github.com/chef/inspec/pull/1242) ([chriswessells](https://github.com/chriswessells))
- Fix broken link in README.md [\#1233](https://github.com/chef/inspec/pull/1233) ([swalberg](https://github.com/swalberg))
- DOCS: fix commit amend dash [\#1232](https://github.com/chef/inspec/pull/1232) ([alexpop](https://github.com/alexpop))
- Headers and list elements that include more than one `\_` character we… [\#1231](https://github.com/chef/inspec/pull/1231) ([nathenharvey](https://github.com/nathenharvey))
- Implements profile signing and verification \[Experimental\] [\#1228](https://github.com/chef/inspec/pull/1228) ([metadave](https://github.com/metadave))
- Document new DCO process [\#1224](https://github.com/chef/inspec/pull/1224) ([chris-rock](https://github.com/chris-rock))
- adding by\_user permissions support for windows [\#1215](https://github.com/chef/inspec/pull/1215) ([jeremymv2](https://github.com/jeremymv2))

## [v1.2.1](https://github.com/chef/inspec/tree/v1.2.1) (2016-10-15)
[Full Changelog](https://github.com/chef/inspec/compare/v1.2.0...v1.2.1)

**Implemented enhancements:**

- Show actual value for cmp octal comparisons in string to match expected [\#1211](https://github.com/chef/inspec/pull/1211) ([alexpop](https://github.com/alexpop))

**Fixed bugs:**

- Using "cmp" Against File Mode Fails [\#1188](https://github.com/chef/inspec/issues/1188)
- Unexpected failures with kitchen-inspec and inspec 1.0.0 [\#1187](https://github.com/chef/inspec/issues/1187)
- update train to fix empty target URIs [\#1221](https://github.com/chef/inspec/pull/1221) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- www: typo on inspec.io [\#1197](https://github.com/chef/inspec/issues/1197)

**Merged pull requests:**

- move Inspec Habitat package to chef/inspec. [\#1216](https://github.com/chef/inspec/pull/1216) ([metadave](https://github.com/metadave))
- fix kitchen-inspec integration-1187 [\#1213](https://github.com/chef/inspec/pull/1213) ([vjeffrey](https://github.com/vjeffrey))
- Website: Fix typo in homepage code image [\#1210](https://github.com/chef/inspec/pull/1210) ([magwalk](https://github.com/magwalk))

## [v1.2.0](https://github.com/chef/inspec/tree/v1.2.0) (2016-10-10)
[Full Changelog](https://github.com/chef/inspec/compare/v1.1.0...v1.2.0)

**Implemented enhancements:**

- Support of linux mint or OS detection via distro families [\#280](https://github.com/chef/inspec/issues/280)
- Support of Linux Mint [\#1209](https://github.com/chef/inspec/pull/1209) ([artem-sidorenko](https://github.com/artem-sidorenko))

**Fixed bugs:**

- Online tutorial: weird behavior with backspace, invalid commands [\#1184](https://github.com/chef/inspec/issues/1184)
- parse\_config and parse\_config\_file does not show fully info when test fails \(or even if it succedes\) [\#1147](https://github.com/chef/inspec/issues/1147)
- www: Online tutorial: safari inspec online demo bug! [\#1086](https://github.com/chef/inspec/issues/1086)
- cmp code\_desc missing operation and expected valid [\#1204](https://github.com/chef/inspec/pull/1204) ([alexpop](https://github.com/alexpop))

**Closed issues:**

- Resources on `http://inspec.io/docs/reference/resources/` are not in alphabetical order [\#1195](https://github.com/chef/inspec/issues/1195)
- www: Online tutorial: update inspec tutorial to 1.0.0 version [\#1169](https://github.com/chef/inspec/issues/1169)

**Merged pull requests:**

- fix backspace bug [\#1206](https://github.com/chef/inspec/pull/1206) ([vjeffrey](https://github.com/vjeffrey))
- es5. that is a thing. [\#1191](https://github.com/chef/inspec/pull/1191) ([vjeffrey](https://github.com/vjeffrey))
- tutorial response filename length [\#1159](https://github.com/chef/inspec/pull/1159) ([chris-rock](https://github.com/chris-rock))

## [v1.1.0](https://github.com/chef/inspec/tree/v1.1.0) (2016-10-05)
[Full Changelog](https://github.com/chef/inspec/compare/v1.0.0...v1.1.0)

**Fixed bugs:**

- InSpec in Visibility [\#1117](https://github.com/chef/inspec/issues/1117)
- inspec exec on tar.gz with local library requirements doesn't work [\#779](https://github.com/chef/inspec/issues/779)
- parse\_config\_file fails when it encounters a '\[' [\#687](https://github.com/chef/inspec/issues/687)
- use mock backend for inspec vendor/check/json [\#1202](https://github.com/chef/inspec/pull/1202) ([arlimus](https://github.com/arlimus))
- bugfix: support nil entries in filter table [\#1201](https://github.com/chef/inspec/pull/1201) ([arlimus](https://github.com/arlimus))
- bugfix: always use the mock backend for inspec archive [\#1200](https://github.com/chef/inspec/pull/1200) ([arlimus](https://github.com/arlimus))
- Missing registry keys should not exist [\#1199](https://github.com/chef/inspec/pull/1199) ([alexpop](https://github.com/alexpop))
- bugfix: use correct logger in cli [\#1198](https://github.com/chef/inspec/pull/1198) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- registry\_key ignores failed Get-Item, always "exists" [\#1196](https://github.com/chef/inspec/issues/1196)
- www: Online tutorial doesn't load \(not building\) [\#1182](https://github.com/chef/inspec/issues/1182)
- Issue locally running an inspec check on a service resource [\#1176](https://github.com/chef/inspec/issues/1176)
- Demo at `http://inspec.io/` stuck on `Loading` [\#1165](https://github.com/chef/inspec/issues/1165)
- Confusing reporter output with inherited profiles [\#1071](https://github.com/chef/inspec/issues/1071)
- Provide clear error message if dependency is not available [\#1069](https://github.com/chef/inspec/issues/1069)
- Dependencies: Design UX for scoping of attributes and resources [\#1057](https://github.com/chef/inspec/issues/1057)
- RFC Dependencies [\#888](https://github.com/chef/inspec/issues/888)

**Merged pull requests:**

- Remove pre-1.0 warning from meta-profile [\#1194](https://github.com/chef/inspec/pull/1194) ([chris-rock](https://github.com/chris-rock))
- Add shell options [\#1192](https://github.com/chef/inspec/pull/1192) ([jonathanmorley](https://github.com/jonathanmorley))
- Website: Fix buggy behavior in nav and add global message [\#1190](https://github.com/chef/inspec/pull/1190) ([magwalk](https://github.com/magwalk))
- add example for yumconf-like structured files [\#1185](https://github.com/chef/inspec/pull/1185) ([vjeffrey](https://github.com/vjeffrey))
- add sanity checks and fail build process if requirements aren't met [\#1183](https://github.com/chef/inspec/pull/1183) ([arlimus](https://github.com/arlimus))
- tp/learn links [\#1181](https://github.com/chef/inspec/pull/1181) ([tpetchel](https://github.com/tpetchel))
- include control section in instructions [\#1180](https://github.com/chef/inspec/pull/1180) ([vjeffrey](https://github.com/vjeffrey))
- Changing headings to align with SEO best practices [\#1179](https://github.com/chef/inspec/pull/1179) ([davidwrede](https://github.com/davidwrede))
- move inquirer to deploy [\#1178](https://github.com/chef/inspec/pull/1178) ([vjeffrey](https://github.com/vjeffrey))
- Ignore lockfiles in example profiles [\#1177](https://github.com/chef/inspec/pull/1177) ([stevendanna](https://github.com/stevendanna))
- Remove default parameter in `updateInstructions\(\)` [\#1175](https://github.com/chef/inspec/pull/1175) ([jerryaldrichiii](https://github.com/jerryaldrichiii))
- Website: Fix docs nav functionality and optimize for mobile [\#1174](https://github.com/chef/inspec/pull/1174) ([magwalk](https://github.com/magwalk))
- Adds segment [\#1172](https://github.com/chef/inspec/pull/1172) ([cwebberOps](https://github.com/cwebberOps))
- print profile info before test results \(inherited profiles\) [\#1170](https://github.com/chef/inspec/pull/1170) ([vjeffrey](https://github.com/vjeffrey))
- www: fix wording [\#1168](https://github.com/chef/inspec/pull/1168) ([arlimus](https://github.com/arlimus))
- Update dependency documentation and mention the lockfile [\#1167](https://github.com/chef/inspec/pull/1167) ([alexpop](https://github.com/alexpop))

## [v1.0.0](https://github.com/chef/inspec/tree/v1.0.0) (2016-09-26)
[Full Changelog](https://github.com/chef/inspec/compare/v1.0.0.beta3...v1.0.0)

**Implemented enhancements:**

- InSpec OS package [\#646](https://github.com/chef/inspec/issues/646)
- replace wmi win32\_useraccount with adsi users [\#1149](https://github.com/chef/inspec/pull/1149) ([chris-rock](https://github.com/chris-rock))

**Fixed bugs:**

- README.md has broken link to non-existent file [\#1136](https://github.com/chef/inspec/issues/1136)

**Merged pull requests:**

- update omnibus images [\#1164](https://github.com/chef/inspec/pull/1164) ([chris-rock](https://github.com/chris-rock))
- website / tutorial interaction [\#1163](https://github.com/chef/inspec/pull/1163) ([chris-rock](https://github.com/chris-rock))
- fix buttons on community page [\#1162](https://github.com/chef/inspec/pull/1162) ([arlimus](https://github.com/arlimus))
- fix alignment of community buttons [\#1161](https://github.com/chef/inspec/pull/1161) ([arlimus](https://github.com/arlimus))
- Fix require\_controls DSL method [\#1160](https://github.com/chef/inspec/pull/1160) ([stevendanna](https://github.com/stevendanna))
- Document the require\_resource function [\#1158](https://github.com/chef/inspec/pull/1158) ([stevendanna](https://github.com/stevendanna))
- fix css in docs search [\#1157](https://github.com/chef/inspec/pull/1157) ([arlimus](https://github.com/arlimus))
- update www readme for releasing the site [\#1156](https://github.com/chef/inspec/pull/1156) ([arlimus](https://github.com/arlimus))
- Fix minor typo in sys\_info documentation [\#1155](https://github.com/chef/inspec/pull/1155) ([stevendanna](https://github.com/stevendanna))
- fix outdated link in readme [\#1154](https://github.com/chef/inspec/pull/1154) ([arlimus](https://github.com/arlimus))
- fix minor website bugs [\#1153](https://github.com/chef/inspec/pull/1153) ([arlimus](https://github.com/arlimus))
- clean www before releasing [\#1152](https://github.com/chef/inspec/pull/1152) ([arlimus](https://github.com/arlimus))
- add docs to the website [\#1151](https://github.com/chef/inspec/pull/1151) ([arlimus](https://github.com/arlimus))
- return empty array for known privileges [\#1150](https://github.com/chef/inspec/pull/1150) ([chris-rock](https://github.com/chris-rock))
- Extend example for parse\_config.rb [\#1148](https://github.com/chef/inspec/pull/1148) ([nvtkaszpir](https://github.com/nvtkaszpir))
- Bump lockfile version to 1.0 [\#1141](https://github.com/chef/inspec/pull/1141) ([stevendanna](https://github.com/stevendanna))
- Improve error messages from compliance fetcher [\#1126](https://github.com/chef/inspec/pull/1126) ([stevendanna](https://github.com/stevendanna))

## [v1.0.0.beta3](https://github.com/chef/inspec/tree/v1.0.0.beta3) (2016-09-25)
[Full Changelog](https://github.com/chef/inspec/compare/v1.0.0.beta2...v1.0.0.beta3)

**Implemented enhancements:**

- Improve lockfile handling [\#1070](https://github.com/chef/inspec/issues/1070)
- Show skip\_message and correct title [\#1109](https://github.com/chef/inspec/pull/1109) ([alexpop](https://github.com/alexpop))

**Fixed bugs:**

- InSpec CLI output not showing skip message when control title is defined [\#1097](https://github.com/chef/inspec/issues/1097)
- bugfix: there is one more button to start the online demo [\#1140](https://github.com/chef/inspec/pull/1140) ([arlimus](https://github.com/arlimus))

**Closed issues:**

- add docs to inspec.io [\#1119](https://github.com/chef/inspec/issues/1119)
- Cache key for dependencies needs to be based on content hash for urls [\#1066](https://github.com/chef/inspec/issues/1066)

**Merged pull requests:**

- Enable builds on both Windows and \*nix [\#1145](https://github.com/chef/inspec/pull/1145) ([scotthain](https://github.com/scotthain))
- Website: Minor edits in preparation for launch [\#1144](https://github.com/chef/inspec/pull/1144) ([magwalk](https://github.com/magwalk))
- Truncate long filename. Temporary fix [\#1143](https://github.com/chef/inspec/pull/1143) ([stevendanna](https://github.com/stevendanna))
- add variables to each loops [\#1142](https://github.com/chef/inspec/pull/1142) ([chris-rock](https://github.com/chris-rock))
- embed tutorial in website [\#1139](https://github.com/chef/inspec/pull/1139) ([arlimus](https://github.com/arlimus))
- scope all tutorial assets [\#1138](https://github.com/chef/inspec/pull/1138) ([arlimus](https://github.com/arlimus))
- add build task for online tutorial with all assets [\#1137](https://github.com/chef/inspec/pull/1137) ([arlimus](https://github.com/arlimus))
- implement filter table for group/groups resource [\#1135](https://github.com/chef/inspec/pull/1135) ([chris-rock](https://github.com/chris-rock))
- fix minor typos in user resource [\#1134](https://github.com/chef/inspec/pull/1134) ([chris-rock](https://github.com/chris-rock))
- Website Copy Edits [\#1133](https://github.com/chef/inspec/pull/1133) ([magwalk](https://github.com/magwalk))
- add build tasks for www [\#1132](https://github.com/chef/inspec/pull/1132) ([arlimus](https://github.com/arlimus))
- add resources.md doc generation [\#1130](https://github.com/chef/inspec/pull/1130) ([arlimus](https://github.com/arlimus))
- add all resources to docs [\#1129](https://github.com/chef/inspec/pull/1129) ([arlimus](https://github.com/arlimus))
- reorder and fix sidebar contents for docs [\#1128](https://github.com/chef/inspec/pull/1128) ([arlimus](https://github.com/arlimus))
- add ruby usage in inspec as markdown [\#1127](https://github.com/chef/inspec/pull/1127) ([arlimus](https://github.com/arlimus))
- Add markdown docs [\#1125](https://github.com/chef/inspec/pull/1125) ([arlimus](https://github.com/arlimus))
- Avoid spurious downloads during dependency management [\#1124](https://github.com/chef/inspec/pull/1124) ([stevendanna](https://github.com/stevendanna))
- Website Design Fixes [\#1123](https://github.com/chef/inspec/pull/1123) ([magwalk](https://github.com/magwalk))

## [v1.0.0.beta2](https://github.com/chef/inspec/tree/v1.0.0.beta2) (2016-09-22)
[Full Changelog](https://github.com/chef/inspec/compare/v1.0.0.pre.beta1...v1.0.0.beta2)

**Implemented enhancements:**

- kernel\_parameter does not show fully info when test fails [\#1093](https://github.com/chef/inspec/issues/1093)
- InSpec html demo [\#851](https://github.com/chef/inspec/issues/851)
- Counting and status of controls without tests [\#849](https://github.com/chef/inspec/issues/849)
- supports does not mark resources as skipped [\#354](https://github.com/chef/inspec/issues/354)
- `include Inspec::DSL` anywhere [\#271](https://github.com/chef/inspec/issues/271)
- Suse Support [\#113](https://github.com/chef/inspec/issues/113)
- Update the username and password login method [\#1095](https://github.com/chef/inspec/pull/1095) ([alexpop](https://github.com/alexpop))

**Fixed bugs:**

- InSpec in Workflow [\#1115](https://github.com/chef/inspec/issues/1115)
- uninstalled package shows as installed [\#1092](https://github.com/chef/inspec/issues/1092)
- undefined method `send\_request' for Compliance::API:Class [\#1088](https://github.com/chef/inspec/issues/1088)
- \[package\] Regression on Windows 2008R2 [\#998](https://github.com/chef/inspec/issues/998)
- \[script\] Is there a limit on the number of char's within a script block [\#539](https://github.com/chef/inspec/issues/539)
- Use parenthesis when passing regular expressions [\#1106](https://github.com/chef/inspec/pull/1106) ([alexpop](https://github.com/alexpop))
- Include code description in the output of failed controls [\#1096](https://github.com/chef/inspec/pull/1096) ([alexpop](https://github.com/alexpop))
- Update the username and password login method [\#1095](https://github.com/chef/inspec/pull/1095) ([alexpop](https://github.com/alexpop))

**Closed issues:**

- Package Resource isn't searching 64-bit Registry Hives [\#1100](https://github.com/chef/inspec/issues/1100)
- demo improvements [\#1089](https://github.com/chef/inspec/issues/1089)
- Dependencies: All resources are scoped [\#1058](https://github.com/chef/inspec/issues/1058)
- Improve InSpec tutorial [\#1045](https://github.com/chef/inspec/issues/1045)
- 1.10.2 has an extra space in pip package output [\#1043](https://github.com/chef/inspec/issues/1043)
- Follow up to 1013: find\_files\(\) errors still occurring for apache\_conf resource after 0.33.0 upgrade [\#1030](https://github.com/chef/inspec/issues/1030)
- MVP in-browser inspec demo [\#957](https://github.com/chef/inspec/issues/957)
- Failing tests in inherited tests are not displayed [\#899](https://github.com/chef/inspec/issues/899)

**Merged pull requests:**

- Use the gem version for the omnibus package version [\#1122](https://github.com/chef/inspec/pull/1122) ([yzl](https://github.com/yzl))
- Add legal pages [\#1121](https://github.com/chef/inspec/pull/1121) ([magwalk](https://github.com/magwalk))
- update docs to markdown [\#1120](https://github.com/chef/inspec/pull/1120) ([arlimus](https://github.com/arlimus))
- add readme to www-build [\#1118](https://github.com/chef/inspec/pull/1118) ([arlimus](https://github.com/arlimus))
- Always write lockfiles for local top-level profiles  [\#1116](https://github.com/chef/inspec/pull/1116) ([stevendanna](https://github.com/stevendanna))
- Add `--cache` option to `inspec exec` [\#1113](https://github.com/chef/inspec/pull/1113) ([stevendanna](https://github.com/stevendanna))
- fix double-space in pip to\_s resource [\#1112](https://github.com/chef/inspec/pull/1112) ([chris-rock](https://github.com/chris-rock))
- fixes debian package manager and some of the code examples [\#1111](https://github.com/chef/inspec/pull/1111) ([Anirudh-Gupta](https://github.com/Anirudh-Gupta))
- Add main site footer [\#1110](https://github.com/chef/inspec/pull/1110) ([magwalk](https://github.com/magwalk))
- Add community and tutorials pages [\#1108](https://github.com/chef/inspec/pull/1108) ([magwalk](https://github.com/magwalk))
- Add homepage content and styles [\#1107](https://github.com/chef/inspec/pull/1107) ([magwalk](https://github.com/magwalk))
- Styling setup and main navigation [\#1105](https://github.com/chef/inspec/pull/1105) ([magwalk](https://github.com/magwalk))
- docs task and rst/md formatter separation [\#1104](https://github.com/chef/inspec/pull/1104) ([arlimus](https://github.com/arlimus))
- Fail if a remote source content doesn't match lockfile [\#1103](https://github.com/chef/inspec/pull/1103) ([stevendanna](https://github.com/stevendanna))
- Optimize tutorial [\#1101](https://github.com/chef/inspec/pull/1101) ([chris-rock](https://github.com/chris-rock))
- Build with master of omnibus [\#1099](https://github.com/chef/inspec/pull/1099) ([yzl](https://github.com/yzl))
- use Gem::Version instead of a regular expression for a test version bump [\#1098](https://github.com/chef/inspec/pull/1098) ([chris-rock](https://github.com/chris-rock))
- fix demo instructions [\#1094](https://github.com/chef/inspec/pull/1094) ([vjeffrey](https://github.com/vjeffrey))
- Allow users to reference resources from dependencies [\#1080](https://github.com/chef/inspec/pull/1080) ([stevendanna](https://github.com/stevendanna))
- In ApacheConf\#include\_files, check for abs paths [\#1042](https://github.com/chef/inspec/pull/1042) ([davidcpell](https://github.com/davidcpell))

## [v1.0.0.pre.beta1](https://github.com/chef/inspec/tree/v1.0.0.pre.beta1) (2016-09-19)
[Full Changelog](https://github.com/chef/inspec/compare/v0.35.0...v1.0.0.pre.beta1)

**Implemented enhancements:**

- InSpec output for summary needs to count controls [\#852](https://github.com/chef/inspec/issues/852)
- ssl resource to use inspec.backend.hostname and require train 0.19.1 [\#1084](https://github.com/chef/inspec/pull/1084) ([alexpop](https://github.com/alexpop))
- optimize command simulator auto-generation [\#1078](https://github.com/chef/inspec/pull/1078) ([chris-rock](https://github.com/chris-rock))

**Closed issues:**

- proper scrolling of terminal [\#1053](https://github.com/chef/inspec/issues/1053)

**Merged pull requests:**

- fix inspec shell handling [\#1090](https://github.com/chef/inspec/pull/1090) ([vjeffrey](https://github.com/vjeffrey))
- update responses [\#1087](https://github.com/chef/inspec/pull/1087) ([vjeffrey](https://github.com/vjeffrey))
- print profile summary and test summary [\#1083](https://github.com/chef/inspec/pull/1083) ([vjeffrey](https://github.com/vjeffrey))
- Fix minor typo in documentation [\#1082](https://github.com/chef/inspec/pull/1082) ([Dispader](https://github.com/Dispader))
- uglify wepack content, kudos @chris-rock [\#1081](https://github.com/chef/inspec/pull/1081) ([arlimus](https://github.com/arlimus))
- Static keys in all json [\#811](https://github.com/chef/inspec/pull/811) ([arlimus](https://github.com/arlimus))

## [v0.35.0](https://github.com/chef/inspec/tree/v0.35.0) (2016-09-16)
[Full Changelog](https://github.com/chef/inspec/compare/v0.34.1...v0.35.0)

**Fixed bugs:**

- resource dsl not loded properly inside describe blocks [\#1074](https://github.com/chef/inspec/issues/1074)

**Closed issues:**

- online demo: check style of tutorial text [\#1054](https://github.com/chef/inspec/issues/1054)
- online demo: clear \(linux\) and cls \(windows\) command to clear the terminal [\#1052](https://github.com/chef/inspec/issues/1052)
- respect inspec.yml supports with include\_controls [\#1049](https://github.com/chef/inspec/issues/1049)
- Simplify dependency in inspec.yml [\#1048](https://github.com/chef/inspec/issues/1048)

**Merged pull requests:**

- Process transitive dependencies from lock file [\#1079](https://github.com/chef/inspec/pull/1079) ([stevendanna](https://github.com/stevendanna))
- Don't gpg-sign commits during tests [\#1077](https://github.com/chef/inspec/pull/1077) ([stevendanna](https://github.com/stevendanna))
- Ensure resources are visible inside its blocks [\#1076](https://github.com/chef/inspec/pull/1076) ([stevendanna](https://github.com/stevendanna))
- add gulp build pipeline to online demo [\#1075](https://github.com/chef/inspec/pull/1075) ([arlimus](https://github.com/arlimus))
- inspec simulator [\#1073](https://github.com/chef/inspec/pull/1073) ([chris-rock](https://github.com/chris-rock))
- Skip controls from profiles that don't support the current platform [\#1072](https://github.com/chef/inspec/pull/1072) ([stevendanna](https://github.com/stevendanna))
- add tutorials \(references\) to the site skeleton [\#1068](https://github.com/chef/inspec/pull/1068) ([arlimus](https://github.com/arlimus))
- Vj/improve demo [\#1065](https://github.com/chef/inspec/pull/1065) ([vjeffrey](https://github.com/vjeffrey))
- Provide inspec.yml shortcut syntax [\#1064](https://github.com/chef/inspec/pull/1064) ([stevendanna](https://github.com/stevendanna))

## [v0.34.1](https://github.com/chef/inspec/tree/v0.34.1) (2016-09-13)
[Full Changelog](https://github.com/chef/inspec/compare/v0.34.0...v0.34.1)

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

## [v0.14.8](https://github.com/chef/inspec/tree/v0.14.8) (2016-03-04)
[Full Changelog](https://github.com/chef/inspec/compare/v0.14.7...v0.14.8)

**Closed issues:**

- Question: Cron? [\#490](https://github.com/chef/inspec/issues/490)

**Merged pull requests:**

- 0.14.8 [\#520](https://github.com/chef/inspec/pull/520) ([arlimus](https://github.com/arlimus))
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
- Inspec iptables should have\_rule tests not working [\#420](https://github.com/chef/inspec/issues/420)
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

- 0.9.11 [\#402](https://github.com/chef/inspec/pull/402) ([chris-rock](https://github.com/chris-rock))
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
- Fix doc typos [\#213](https://github.com/chef/inspec/pull/213) ([juliandunn](https://github.com/juliandunn))
- Add test-kitchen example reference to readme [\#212](https://github.com/chef/inspec/pull/212) ([chris-rock](https://github.com/chris-rock))
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

- Add WinRM transport layer [\#64](https://github.com/chef/inspec/issues/64)

**Closed issues:**

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