# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class Vulcano::Backends::SpecinfraHelper
  module Docker
    def self.configure(_conf)
      host = @conf['host'].to_s
      Specinfra.configuration.backend = :docker
      Specinfra.configuration.docker_container = host
    end
  end
end
