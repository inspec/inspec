+++
title = "Chef InSpec Deprecations"
draft = false
gh_repo = "inspec"

[menu]
  [menu.inspec]
    title = "Deprecations"
    identifier = "inspec/deprecations"
    parent = "inspec"
    weight = 120
+++

# Overview
InSpec 7 introduces several changes to the core resources. Some core resources have been deprecated as part of these changes and are now available as resource packs. This document lists the deprecated core resources and guides you through accessing them through resource packs.

## Deprecated core resources
The list of deprecated core resources in InSpec 7 are:

1. docker_container
2. docker_image
3. docker_plugin
4. docker_service
5. elasticsearch
6. ibmdb2_conf
7. ibmdb2_session
8. mongodb
9. mongodb_conf
10. mongodb_session
11. podman
12. podman_container
13. podman_image
14. podman_network
15. podman_pod
16. podman_volume
17. rabbitmq_config
18. ssh_config
19. ssh_key
20. sybase_conf
21. sybase_session

## Accessing deprecated resources
Include the appropriate resource packs in your InSpec profiles to continue using the deprecated resources. Resource packs (collection of resources) can also extend the functionality of your profiles.Resource packs are collections of resources that can be included in your profiles to extend their functionality.

## Steps to include resource packs

1. Identify the resource pack.
    Determine which resource pack contains the deprecated resource you need. The table below lists (non-exhaustive) the deprecated resources along with the resource pack names where they are now available.

      | Resource          | Resource Pack Name            |
      |-------------------|-------------------------------|
      | docker_container  | inspec-docker-resources       |
      | docker_image      | inspec-docker-resources       |
      | docker_plugin     | inspec-docker-resources       |
      | docker_service    | inspec-docker-resources       |
      | elasticsearch     | inspec-elasticsearch-resources|
      | ibmdb2_conf       | inspec-ibmdb2-resources       |
      | ibmdb2_session    | inspec-ibmdb2-resources       |
      | mongodb           | inspec-mongodb-resources      |
      | mongodb_conf      | inspec-mongodb-resources      |
      | mongodb_session   | inspec-mongodb-resources      |
      | podman            | inspec-podman-resources       |
      | podman_container  | inspec-podman-resources       |
      | podman_image      | inspec-podman-resources       |
      | podman_network    | inspec-podman-resources       |
      | podman_pod        | inspec-podman-resources       |
      | podman_volume     | inspec-podman-resources       |
      | rabbitmq_config   | inspec-rabbitmq-resources     |
      | ssh_config        | inspec-ssh-resources          |
      | ssh_key           | inspec-ssh-resources          |
      | sybase_conf       | inspec-sybase-resources       |
      | sybase_session    | inspec-sybase-resources       |

2. Update your InSpec Profile.
    Modify your inspec.yml file to include the resource pack. Below is an example of how to include a resource pack in your profile:

      ```yaml
      name: my-profile
      title: My InSpec Profile
      version: 0.1.0
      depends:
        - name: inspec-docker-resources
          gem: inspec-docker-resources
      ```

      or

      ```yaml
      name: my-profile
      title: My InSpec Profile
      version: 0.1.0
      depends:
        - name: inspec-docker-resources
          url: https://github.com/inspec/inspec-docker-resources.git
      ```

      or

      ```yaml
      name: my-profile
      title: My InSpec Profile
      version: 0.1.0
      depends:
        - name: inspec-docker-resources
          path: <local-path-to-docker-resources-resource-pack>
      ```

3. Use the deprecated resource.
    Use the deprecated resource in your controls once you include the resource pack. For example:

      ```ruby
      control 'example-control' do
        impact 1.0
        title 'Example Control Using Deprecated Resource'
        desc 'This control uses a deprecated resource from a resource pack.'
        describe docker_image("ubuntu") do
          it { should exist }
        end
      end
      ```

## Conclusion
While InSpec 7 deprecates specific core resources, they remain accessible through resource packs. You can continue using these resources without interruption by including the appropriate resource packs in your profiles. For more information on resource packs and deprecated resources, please refer to the official [InSpec documentation](https://docs.chef.io/inspec/resources/).
