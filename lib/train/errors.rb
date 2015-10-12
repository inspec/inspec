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
  # Base exception class for all exceptions that are caused by user input
  # errors.
  class UserError < ::StandardError; end

  # Base exception class for all exceptions that are caused by incorrect use
  # of an API.
  class ClientError < ::StandardError; end

  # Base exception class for all exceptions that are caused by other failures
  # in the transport layer.
  class TransportError < ::StandardError; end
end
