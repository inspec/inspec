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

## [v7.0.35](https://github.com/inspec/inspec/tree/v7.0.35) (2025-02-06)

#### Merged Pull Requests
- Foreport 7284: CHEF-15083: Update groups resource to use `getent` utility [#7290](https://github.com/inspec/inspec/pull/7290) ([ahasunos](https://github.com/ahasunos))

## [v7.0.34](https://github.com/inspec/inspec/tree/v7.0.34) (2025-02-05)

#### Merged Pull Requests
- CHEF-14266 Doc change for gem based resource packs dependencies [#7274](https://github.com/inspec/inspec/pull/7274) ([Nik08](https://github.com/Nik08))

## [v7.0.33](https://github.com/inspec/inspec/tree/v7.0.33) (2025-02-05)

#### Merged Pull Requests
- CHEF-18706: Document deprecations of core InSpec resources [#7285](https://github.com/inspec/inspec/pull/7285) ([ahasunos](https://github.com/ahasunos))

## [v7.0.32](https://github.com/inspec/inspec/tree/v7.0.32) (2025-02-04)

#### Merged Pull Requests
- Pending doc review changes - troubleshooting doc [#7291](https://github.com/inspec/inspec/pull/7291) ([Nik08](https://github.com/Nik08))

## [v7.0.31](https://github.com/inspec/inspec/tree/v7.0.31) (2025-02-04)

#### Merged Pull Requests
- CHEF-14267 Troubleshooting steps doc for resource pack dependency issue [#7278](https://github.com/inspec/inspec/pull/7278) ([Nik08](https://github.com/Nik08))

## [v7.0.30](https://github.com/inspec/inspec/tree/v7.0.30) (2025-01-30)

#### Merged Pull Requests
- Updating Faraday support to match Chef Infra [#7286](https://github.com/inspec/inspec/pull/7286) ([johnmccrae](https://github.com/johnmccrae))

## [v7.0.29](https://github.com/inspec/inspec/tree/v7.0.29) (2025-01-22)

#### Merged Pull Requests
- CHEF-14322 private rubygem server integ [#7275](https://github.com/inspec/inspec/pull/7275) ([sathish-progress](https://github.com/sathish-progress))

## [v7.0.28](https://github.com/inspec/inspec/tree/v7.0.28) (2025-01-21)

#### Merged Pull Requests
- CHEF-14368 Expeditor workflow changes for LTS Hab packages [#7253](https://github.com/inspec/inspec/pull/7253) ([Nik08](https://github.com/Nik08))

## [v7.0.27](https://github.com/inspec/inspec/tree/v7.0.27) (2025-01-21)

#### Merged Pull Requests
- chore: remove mongo dependency from gemspec as it is moved to mongodb resource pack [#7273](https://github.com/inspec/inspec/pull/7273) ([ahasunos](https://github.com/ahasunos))

## [v7.0.26](https://github.com/inspec/inspec/tree/v7.0.26) (2025-01-21)

#### Merged Pull Requests
- CHEF-15118 Remove elasticsearch resources [#7188](https://github.com/inspec/inspec/pull/7188) ([sathish-progress](https://github.com/sathish-progress))

## [v7.0.25](https://github.com/inspec/inspec/tree/v7.0.25) (2025-01-17)

#### Merged Pull Requests
- CHEF-18598 Update Hab packages to use refresh channel [#7265](https://github.com/inspec/inspec/pull/7265) ([Nik08](https://github.com/Nik08)])

## [v7.0.24](https://github.com/inspec/inspec/tree/v7.0.24) (2025-01-16)

#### Merged Pull Requests
- CHEF-16379 auto-resolve gem conflicts [#7258](https://github.com/inspec/inspec/pull/7258) ([sathish-progress](https://github.com/sathish-progress)])

## [v7.0.23](https://github.com/inspec/inspec/tree/v7.0.23) (2025-01-13)

#### Merged Pull Requests
- ci: remove HAB environment for channel [#7264](https://github.com/inspec/inspec/pull/7264) ([ahasunos](https://github.com/ahasunos)])

## [v7.0.22](https://github.com/inspec/inspec/tree/v7.0.22) (2025-01-13)

#### Merged Pull Requests
- CHEF-18302 Remove omnibus support for InSpec [#7249](https://github.com/inspec/inspec/pull/7249) ([Nik08](https://github.com/Nik08)])

## [v7.0.21](https://github.com/inspec/inspec/tree/v7.0.21) (2025-01-13)

#### Merged Pull Requests
- TEST PR: Expeditor workflow config fixes for testing [#7263](https://github.com/inspec/inspec/pull/7263) ([Nik08](https://github.com/Nik08)])

## [v7.0.20](https://github.com/inspec/inspec/tree/v7.0.20) (2025-01-08)

#### Merged Pull Requests
- CHEF-18207 Removed SSH resources and tests [#7248](https://github.com/inspec/inspec/pull/7248) ([sa-progress](https://github.com/sa-progress)])

## [v7.0.19](https://github.com/inspec/inspec/tree/v7.0.19) (2025-01-08)

#### Merged Pull Requests
- CHEF-18347 Fix type mismatch comparison [#7252](https://github.com/inspec/inspec/pull/7252) ([sathish-progress](https://github.com/sathish-progress)])

## [v7.0.18](https://github.com/inspec/inspec/tree/v7.0.18) (2025-01-07)

#### Merged Pull Requests
- Plan file changes to fix Hab build fix for LTS channel [#7257](https://github.com/inspec/inspec/pull/7257) ([Nik08](https://github.com/Nik08)])

## [v7.0.17](https://github.com/inspec/inspec/tree/v7.0.17) (2025-01-07)

#### Merged Pull Requests
- Hab build fix for LTS channel [#7256](https://github.com/inspec/inspec/pull/7256) ([Nik08](https://github.com/Nik08)])

## [v7.0.16](https://github.com/inspec/inspec/tree/v7.0.16) (2025-01-07)

#### Merged Pull Requests
- Revert: Version bump conditionals for hab pipelines [#7255](https://github.com/inspec/inspec/pull/7255) ([Nik08](https://github.com/Nik08)])

## [v7.0.15](https://github.com/inspec/inspec/tree/v7.0.15) (2024-12-24)

#### Merged Pull Requests
- into - TEST PR: Expeditor workflow to enable multiple channel promotion of Hab packages [#7254](https://github.com/inspec/inspec/pull/7254) ([Nik08](https://github.com/Nik08))
- CHEF-18182 Implement sources handling for gem dependencies [#7244](https://github.com/inspec/inspec/pull/7244) ([sathish-progress](https://github.com/sathish-progress))

## [v7.0.14](https://github.com/inspec/inspec/tree/v7.0.14) (2024-12-24)

#### Merged Pull Requests
- CHEF-14246 Implement version handling of resource pack gem via git fetcher [#7239](https://github.com/inspec/inspec/pull/7239) ([Nik08](https://github.com/Nik08))

## [v7.0.13](https://github.com/inspec/inspec/tree/v7.0.13) (2024-12-19)

#### Merged Pull Requests
- CHEF-18094 Remove podman resources [#7238](https://github.com/inspec/inspec/pull/7238) ([balasubramanian-s](https://github.com/balasubramanian-s))

## [v7.0.12](https://github.com/inspec/inspec/tree/v7.0.12) (2024-12-12)

#### Merged Pull Requests
- CHEF-16631 Implement fallback logic when gem caching is manually deleted [#7224](https://github.com/inspec/inspec/pull/7224) ([Nik08](https://github.com/Nik08))

## [v7.0.11](https://github.com/inspec/inspec/tree/v7.0.11) (2024-11-26)

#### Merged Pull Requests
- [Foreport] - Introduce `--legacy` flag for compatibility in `inspec automate upload` with legacy checks and export options [#7205](https://github.com/inspec/inspec/pull/7205) ([ahasunos](https://github.com/ahasunos))

## [v7.0.10](https://github.com/inspec/inspec/tree/v7.0.10) (2024-11-20)

#### Merged Pull Requests
- ci: update digi cert token for windows platforms [#7217](https://github.com/inspec/inspec/pull/7217) ([ahasunos](https://github.com/ahasunos))
- CHEF-16514 remove redundant plugin activation [#7192](https://github.com/inspec/inspec/pull/7192) ([sathish-progress](https://github.com/sathish-progress))

## [v7.0.9](https://github.com/inspec/inspec/tree/v7.0.9) (2024-11-19)

#### Merged Pull Requests
- CHEF-17239: Fix tests to restore green verify pipeline [#7208](https://github.com/inspec/inspec/pull/7208) ([ahasunos](https://github.com/ahasunos))

## [v7.0.8](https://github.com/inspec/inspec/tree/v7.0.8) (2024-11-12)

#### Merged Pull Requests
- CHEF-14729 Habitat LTS channel support [#7191](https://github.com/inspec/inspec/pull/7191) ([Nik08](https://github.com/Nik08))

## [v7.0.7](https://github.com/inspec/inspec/tree/v7.0.7) (2024-11-12)

#### Merged Pull Requests
- CHEF-15119 - Removes docker resources from core [#7170](https://github.com/inspec/inspec/pull/7170) ([Vasu1105](https://github.com/Vasu1105))

## [v7.0.6](https://github.com/inspec/inspec/tree/v7.0.6) (2024-11-12)

#### Merged Pull Requests
- CHEF-15330 Cleanup ibmdb2 resources from Inspec repo [#7190](https://github.com/inspec/inspec/pull/7190) ([Nik08](https://github.com/Nik08))

## [v7.0.5](https://github.com/inspec/inspec/tree/v7.0.5) (2024-11-12)

#### Merged Pull Requests
- CHEF-15332: Cleanup RabbitMQ resources and documentation from InSpec [#7183](https://github.com/inspec/inspec/pull/7183) ([ahasunos](https://github.com/ahasunos))

## [v7.0.4](https://github.com/inspec/inspec/tree/v7.0.4) (2024-10-01)

#### Merged Pull Requests
- CHEF-15331: Removes the sybase resources from core [#7171](https://github.com/inspec/inspec/pull/7171) ([Vasu1105](https://github.com/Vasu1105))

## [v7.0.3](https://github.com/inspec/inspec/tree/v7.0.3) (2024-10-01)

#### Merged Pull Requests
- CHEF-15329: Cleanup MongoDB resources and documentation from InSpec [#7169](https://github.com/inspec/inspec/pull/7169) ([ahasunos](https://github.com/ahasunos))
- Another attempt to fix the verify pipeline [#7177](https://github.com/inspec/inspec/pull/7177) ([Vasu1105](https://github.com/Vasu1105))

## [v7.0.2](https://github.com/inspec/inspec/tree/v7.0.2) (2024-09-27)

#### Merged Pull Requests
- Attempt1 - To fix verify pipeline [#7175](https://github.com/inspec/inspec/pull/7175) ([Vasu1105](https://github.com/Vasu1105))

## [v7.0.1](https://github.com/inspec/inspec/tree/v7.0.1) (2024-09-26)

#### Merged Pull Requests
- CHEF-14242: Support for Gem-Based Resource Packs [#7096](https://github.com/inspec/inspec/pull/7096) ([clintoncwolfe](https://github.com/clintoncwolfe))

<!-- release_rollup -->
<!-- release_rollup -->

<!-- latest_stable_release -->
<!-- latest_stable_release -->
