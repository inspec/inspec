# encoding: utf-8

class Vulcano::Backends::SpecinfraHelper
  module Exec
    def self.configure(_conf)
      Specinfra.configuration.backend = :exec
    end
  end
end
