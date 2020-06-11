# This module holds the Errors for the gem.
module Docker::Error

  # The default error. It's never actually raised, but can be used to catch all
  # gem-specific errors that are thrown as they all subclass from this.
  class DockerError < StandardError; end

  # Raised when invalid arguments are passed to a method.
  class ArgumentError < DockerError; end

  # Raised when a request returns a 400.
  class ClientError < DockerError; end

  # Raised when a request returns a 401.
  class UnauthorizedError < DockerError; end

  # Raised when a request returns a 404.
  class NotFoundError < DockerError; end

  # Raised when a request returns a 409.
  class ConflictError < DockerError; end

  # Raised when a request returns a 500.
  class ServerError < DockerError; end

  # Raised when there is an unexpected response code / body.
  class UnexpectedResponseError < DockerError; end

  # Raised when there is an incompatible version of Docker.
  class VersionError < DockerError; end

  # Raised when a request times out.
  class TimeoutError < DockerError; end

  # Raised when login fails.
  class AuthenticationError < DockerError; end

  # Raised when an IO action fails.
  class IOError < DockerError; end
end
