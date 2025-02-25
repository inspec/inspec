module DeprecatedCoreResourcesList
  CORE_RESOURCES_DEPRECATED = %i{
    docker_container
    docker_image
    docker_plugin
    docker_service
    elasticsearch
    ibmdb2_conf
    ibmdb2_session
    mongodb
    mongodb_conf
    mongodb_session
    podman
    podman_container
    podman_image
    podman_network
    podman_pod
    podman_volume
    rabbitmq_config
    ssh_config
    ssh_key
    sybase_conf
    sybase_session
    opa_api
    opa_cli
  }.freeze
end
