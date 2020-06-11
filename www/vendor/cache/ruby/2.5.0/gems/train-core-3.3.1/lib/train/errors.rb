# encoding: utf-8
#
# Author:: Fletcher Nichol (<fnichol@nichol.ca>)
# Author:: Dominik Richter (<dominik.richter@gmail.com>)
# Author:: Christoph Hartmann (<chris@lollyrock.com>)
#
# Copyright (C) 2013, Fletcher Nichol
#
# Licensed under the Apache License, Version 2.0 (the "License");

module Train
  # Base exception for any exception explicitly raised by the Train library.
  class Error < ::StandardError
    attr_reader :reason

    def initialize(message = "", reason = :not_provided)
      super(message)
      @reason = reason
    end
  end

  # Base exception class for all exceptions that are caused by user input
  # errors.
  class UserError < Error; end

  # We could not load a plugin, because of a user error
  class PluginLoadError < UserError
    attr_accessor :transport_name
  end

  # Base exception class for all exceptions that are caused by incorrect use
  # of an API.
  class ClientError < Error; end

  # Base exception class for all exceptions that are caused by other failures
  # in the transport layer.
  class TransportError < Error; end

  # Exception for when no platform can be detected.
  class PlatformDetectionFailed < Error; end

  # Exception for when a invalid cache type is passed.
  class UnknownCacheType < Error; end
end
