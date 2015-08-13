# encoding: utf-8

module Vulcano
  module Backend

    def configure_localhost(conf)
      Specinfra.configuration.backend = :exec
    end

  end
end
