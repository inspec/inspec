# encoding: utf-8

module Vulcano::Backend::Exec

  def self.configure(conf)
    Specinfra.configuration.backend = :exec
  end

end

Vulcano::Backend.add_module('exec', Vulcano::Backend::Exec)
