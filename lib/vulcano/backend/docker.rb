# encoding: utf-8

module Vulcano::Backend::Docker

  def self.configure(conf)
    host = conf['host'].to_s
    Specinfra.configuration.backend = :docker
    Specinfra.configuration.docker_container = host
  end

end

Vulcano::Backend.add_module('docker', Vulcano::Backend::Docker)
