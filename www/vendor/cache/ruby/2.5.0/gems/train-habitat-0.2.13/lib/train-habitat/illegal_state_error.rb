# frozen_string_literal: true

class IllegalStateError < StandardError
  def initialize(msg = nil)
    super
  end
end

class NoServicesFoundError < IllegalStateError
  def initialize(origin, name)
    super("Expected one service '#{origin}/#{name}', but found none.")
  end
end

class MultipleServicesFoundError < IllegalStateError
  def initialize(origin, name)
    super("Expected one service '#{origin}/#{name}', but found multiple.")
  end
end

class CliNotAvailableError < IllegalStateError
  def initialize(_cli_tranport_names)
    super("No CLI-capable connection options passed - use one of #{cli_transport_names.join(", ")} option sets")
  end
end

class MultipleCliTransportsError < IllegalStateError
  def initialize(_cli_tranport_names)
    super("Too many CLI-capable transports specified - only one may be used at a time.  Saw: #{cli_transport_names.join(", ")}.")
  end
end
