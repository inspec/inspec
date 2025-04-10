# Change Log
<!-- usage documentation: http://expeditor-docs.es.chef.io/configuration/changelog/ -->

<!-- latest_release 7.0.46 -->
## [v7.0.46](https://github.com/inspec/inspec/tree/v7.0.46) (2025-04-09)

#### Merged Pull Requests
- Foreport to InSpec 7: Waivers error handling fix [#7344](https://github.com/inspec/inspec/pull/7344) ([Nik08](https://github.com/Nik08))
<!-- latest_release -->


<!-- release_rollup since=7.0.38.beta -->
### Changes since 7.0.38.beta release

#### Merged Pull Requests
- Foreport to InSpec 7: Waivers error handling fix [#7344](https://github.com/inspec/inspec/pull/7344) ([Nik08](https://github.com/Nik08)) <!-- 7.0.46 -->
- CHEF-19361 Removed Opa resources from Inspec [#7314](https://github.com/inspec/inspec/pull/7314) ([sa-progress](https://github.com/sa-progress)) <!-- 7.0.45 -->
- Sonar config for inspec-7 branch [#7348](https://github.com/inspec/inspec/pull/7348) ([Nik08](https://github.com/Nik08)) <!-- 7.0.44 -->
- Foreport - CHEF-15789 - Improve error handling for audit_policy resource [#7335](https://github.com/inspec/inspec/pull/7335) ([ahasunos](https://github.com/ahasunos)) <!-- 7.0.43 -->
- Foreport: CHEF-20111: Fix inspec check for a profile with only comments or empty file [#7333](https://github.com/inspec/inspec/pull/7333) ([ahasunos](https://github.com/ahasunos)) <!-- 7.0.42 -->
- CHEF-19348-Update tomlrb version [#7328](https://github.com/inspec/inspec/pull/7328) ([balasubramanian-s](https://github.com/balasubramanian-s)) <!-- 7.0.41 -->
- CHEF-18694 windows hab package fix for in spec 7 [#7327](https://github.com/inspec/inspec/pull/7327) ([sa-progress](https://github.com/sa-progress)) <!-- 7.0.40 -->
- CHEF-18694 Windows hab pipeline enabled for InSpec 7 [#7270](https://github.com/inspec/inspec/pull/7270) ([Nik08](https://github.com/Nik08)) <!-- 7.0.39 -->
<!-- release_rollup -->

<!-- latest_stable_release -->
## [v7.0.38.beta](https://github.com/inspec/inspec/tree/v7.0.38.beta) (2025-03-05)

#### Merged Pull Requests
- Bump rexml from 3.3.2 to 3.3.3 in /omnibus [#7116](https://github.com/inspec/inspec/pull/7116) ([dependabot[bot]](https://github.com/dependabot[bot]))
- ci: resume habitat pipeline  [#7109](https://github.com/inspec/inspec/pull/7109) ([ahasunos](https://github.com/ahasunos))
- enhance: improve fetch and persist to catch entitlement exception [#7121](https://github.com/inspec/inspec/pull/7121) ([ahasunos](https://github.com/ahasunos))
- ci: use latest local license server [#7123](https://github.com/inspec/inspec/pull/7123) ([ahasunos](https://github.com/ahasunos))
- added docs changes [#7118](https://github.com/inspec/inspec/pull/7118) ([vviveksharma](https://github.com/vviveksharma))
- Editing for install script docs [#7129](https://github.com/inspec/inspec/pull/7129) ([IanMadd](https://github.com/IanMadd))
- CHEF-14881: Fix habitat pipeline for InSpec 6 [#7127](https://github.com/inspec/inspec/pull/7127) ([ahasunos](https://github.com/ahasunos))
- ci: introduce inspec-7 as part of release branches [#7135](https://github.com/inspec/inspec/pull/7135) ([ahasunos](https://github.com/ahasunos))
- Update install doc [#7144](https://github.com/inspec/inspec/pull/7144) ([IanMadd](https://github.com/IanMadd))
- CHEF-14805 Oracle db session resource fixes [#7136](https://github.com/inspec/inspec/pull/7136) ([Nik08](https://github.com/Nik08))
- CHEF-14242 Support for Gem-Based Resource Packs [#7096](https://github.com/inspec/inspec/pull/7096) ([clintoncwolfe](https://github.com/clintoncwolfe))
- Attempt1 - To fix verify pipeline [#7175](https://github.com/inspec/inspec/pull/7175) ([Vasu1105](https://github.com/Vasu1105))
- Another attempt to fix the verify pipeline [#7177](https://github.com/inspec/inspec/pull/7177) ([Vasu1105](https://github.com/Vasu1105))
- CHEF-15329: Cleanup MongoDB resources and documentation from InSpec [#7169](https://github.com/inspec/inspec/pull/7169) ([ahasunos](https://github.com/ahasunos))
- CHEF-15331 Removes the sybase resources from core  [#7171](https://github.com/inspec/inspec/pull/7171) ([Vasu1105](https://github.com/Vasu1105))
- CHEF-15332: Cleanup RabbitMQ resources and documentation from InSpec [#7183](https://github.com/inspec/inspec/pull/7183) ([ahasunos](https://github.com/ahasunos))
- CHEF-15330 Cleanup ibmdb2 resources from Inspec repo [#7190](https://github.com/inspec/inspec/pull/7190) ([Nik08](https://github.com/Nik08))
- CHEF-15119 - Removes docker resources from core [#7170](https://github.com/inspec/inspec/pull/7170) ([Vasu1105](https://github.com/Vasu1105))
- CHEF-14729 Habitat LTS channel support  [#7191](https://github.com/inspec/inspec/pull/7191) ([Nik08](https://github.com/Nik08))
- CHEF-17239: Fix tests to restore green verify pipeline [#7208](https://github.com/inspec/inspec/pull/7208) ([ahasunos](https://github.com/ahasunos))
- CHEF-16514 remove redundant plugin activation [#7192](https://github.com/inspec/inspec/pull/7192) ([sathish-progress](https://github.com/sathish-progress))
- ci: update digi cert token for windows platforms [#7217](https://github.com/inspec/inspec/pull/7217) ([ahasunos](https://github.com/ahasunos))
- [Foreport] - Introduce `--legacy` flag for compatibility in `inspec automate upload` with legacy checks and export options [#7205](https://github.com/inspec/inspec/pull/7205) ([ahasunos](https://github.com/ahasunos))
- CHEF-16631 Implement fallback logic when gem caching is manually deleted [#7224](https://github.com/inspec/inspec/pull/7224) ([Nik08](https://github.com/Nik08))
- CHEF-18094-Remove podman resources [#7238](https://github.com/inspec/inspec/pull/7238) ([balasubramanian-s](https://github.com/balasubramanian-s))
- CHEF-14246 Implement version handling of resource pack gem via git fetcher [#7239](https://github.com/inspec/inspec/pull/7239) ([Nik08](https://github.com/Nik08))
- CHEF-18182 Implement sources handling for gem dependencies [#7244](https://github.com/inspec/inspec/pull/7244) ([sathish-progress](https://github.com/sathish-progress))
- TEST PR: Expeditor workflow to enable multiple channel promotion of Hab packages  [#7254](https://github.com/inspec/inspec/pull/7254) ([Nik08](https://github.com/Nik08))
- Revert: Version bump conditionals for hab pipelines [#7255](https://github.com/inspec/inspec/pull/7255) ([Nik08](https://github.com/Nik08))
- Hab build fix for LTS channel [#7256](https://github.com/inspec/inspec/pull/7256) ([Nik08](https://github.com/Nik08))
- Plan file changes to fix Hab build fix for LTS channel [#7257](https://github.com/inspec/inspec/pull/7257) ([Nik08](https://github.com/Nik08))
- CHEF-18347 Fix type mismatch comparison [#7252](https://github.com/inspec/inspec/pull/7252) ([sathish-progress](https://github.com/sathish-progress))
- CHEF-18207 Removed SSH resources and tests [#7248](https://github.com/inspec/inspec/pull/7248) ([sa-progress](https://github.com/sa-progress))
- TEST PR: Expeditor workflow config fixes for testing [#7263](https://github.com/inspec/inspec/pull/7263) ([Nik08](https://github.com/Nik08))
- CHEF-18302 Remove omnibus support for InSpec [#7249](https://github.com/inspec/inspec/pull/7249) ([Nik08](https://github.com/Nik08))
- ci: remove HAB environment for channel [#7264](https://github.com/inspec/inspec/pull/7264) ([ahasunos](https://github.com/ahasunos))
- CHEF-16379 auto-resolve gem conflicts [#7258](https://github.com/inspec/inspec/pull/7258) ([sathish-progress](https://github.com/sathish-progress))
- CHEF-18598 Update Hab packages to use refresh channel [#7265](https://github.com/inspec/inspec/pull/7265) ([Nik08](https://github.com/Nik08))
- CHEF-15118 Remove elasticsearch resources [#7188](https://github.com/inspec/inspec/pull/7188) ([sathish-progress](https://github.com/sathish-progress))
- chore: remove mongo dependency from gemspec as it is moved to mongodb resource pack [#7273](https://github.com/inspec/inspec/pull/7273) ([ahasunos](https://github.com/ahasunos))
- CHEF-14368 Expeditor workflow changes for LTS Hab packages [#7253](https://github.com/inspec/inspec/pull/7253) ([Nik08](https://github.com/Nik08))
- CHEF-14322 private rubygem server integ [#7275](https://github.com/inspec/inspec/pull/7275) ([sathish-progress](https://github.com/sathish-progress))
- Updating Faraday support to match Chef Infra [#7286](https://github.com/inspec/inspec/pull/7286) ([johnmccrae](https://github.com/johnmccrae))
- CHEF-14267 Troubleshooting steps doc for resource pack dependency issue [#7278](https://github.com/inspec/inspec/pull/7278) ([Nik08](https://github.com/Nik08))
- Pending doc review changes - troubleshooting doc [#7291](https://github.com/inspec/inspec/pull/7291) ([Nik08](https://github.com/Nik08))
- CHEF-18706: Document deprecations of core InSpec resources [#7285](https://github.com/inspec/inspec/pull/7285) ([ahasunos](https://github.com/ahasunos))
- CHEF-14266 Doc change for gem based resource packs dependencies [#7274](https://github.com/inspec/inspec/pull/7274) ([Nik08](https://github.com/Nik08))
- Foreport 7284: CHEF-15083: Update groups resource to use `getent` utility [#7290](https://github.com/inspec/inspec/pull/7290) ([ahasunos](https://github.com/ahasunos))
- Foreport: Fix main pipeline issue on JSON gem update [#7307](https://github.com/inspec/inspec/pull/7307) ([Nik08](https://github.com/Nik08))
- CHEF-18914 - InSpec 7 release changes with beta tag [#7318](https://github.com/inspec/inspec/pull/7318) ([ahasunos](https://github.com/ahasunos))
<!-- latest_stable_release -->
