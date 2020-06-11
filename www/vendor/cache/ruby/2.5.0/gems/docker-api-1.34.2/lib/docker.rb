require 'cgi'
require 'multi_json'
require 'excon'
require 'tempfile'
require 'base64'
require 'find'
require 'rubygems/package'
require 'uri'
require 'open-uri'

# Add the Hijack middleware at the top of the middleware stack so it can
# potentially hijack HTTP sockets (when attaching to stdin) before other
# middlewares try and parse the response.
require 'excon/middlewares/hijack'
Excon.defaults[:middlewares].unshift Excon::Middleware::Hijack

Excon.defaults[:middlewares] << Excon::Middleware::RedirectFollower

# The top-level module for this gem. Its purpose is to hold global
# configuration variables that are used as defaults in other classes.
module Docker
  attr_accessor :creds, :logger

  require 'docker/error'
  require 'docker/connection'
  require 'docker/base'
  require 'docker/container'
  require 'docker/network'
  require 'docker/event'
  require 'docker/exec'
  require 'docker/image'
  require 'docker/messages_stack'
  require 'docker/messages'
  require 'docker/util'
  require 'docker/version'
  require 'docker/volume'
  require 'docker/rake_task' if defined?(Rake::Task)

  def default_socket_url
    'unix:///var/run/docker.sock'
  end

  def env_url
    ENV['DOCKER_URL'] || ENV['DOCKER_HOST']
  end

  def env_options
    if cert_path = ENV['DOCKER_CERT_PATH']
      {
        client_cert: File.join(cert_path, 'cert.pem'),
        client_key: File.join(cert_path, 'key.pem'),
        ssl_ca_file: File.join(cert_path, 'ca.pem'),
        scheme: 'https'
      }.merge(ssl_options)
    else
      {}
    end
  end

  def ssl_options
    if ENV['DOCKER_SSL_VERIFY'] == 'false'
      {
        ssl_verify_peer: false
      }
    else
      {}
    end
  end

  def url
    @url ||= env_url || default_socket_url
    # docker uses a default notation tcp:// which means tcp://localhost:2375
    if @url == 'tcp://'
      @url = 'tcp://localhost:2375'
    end
    @url
  end

  def options
    @options ||= env_options
  end

  def url=(new_url)
    @url = new_url
    reset_connection!
  end

  def options=(new_options)
    @options = env_options.merge(new_options || {})
    reset_connection!
  end

  def connection
    @connection ||= Connection.new(url, options)
  end

  def reset!
    @url = nil
    @options = nil
    reset_connection!
  end

  def reset_connection!
    @connection = nil
  end

  # Get the version of Go, Docker, and optionally the Git commit.
  def version(connection = self.connection)
    Util.parse_json(connection.get('/version'))
  end

  # Get more information about the Docker server.
  def info(connection = self.connection)
    Util.parse_json(connection.get('/info'))
  end

  # Ping the Docker server.
  def ping(connection = self.connection)
    connection.get('/_ping')
  end

  # Login to the Docker registry.
  def authenticate!(options = {}, connection = self.connection)
    creds = MultiJson.dump(options)
    connection.post('/auth', {}, body: creds)
    @creds = creds
    true
  rescue Docker::Error::ServerError, Docker::Error::UnauthorizedError
    raise Docker::Error::AuthenticationError
  end

  # When the correct version of Docker is installed, returns true. Otherwise,
  # raises a VersionError.
  def validate_version!
    Docker.info
    true
  rescue Docker::Error::TimeoutError
    raise
  rescue Docker::Error::DockerError
    raise Docker::Error::VersionError, "Expected API Version: #{API_VERSION}"
  end

  module_function :default_socket_url, :env_url, :url, :url=, :env_options,
                  :options, :options=, :creds, :creds=, :logger, :logger=,
                  :connection, :reset!, :reset_connection!, :version, :info,
                  :ping, :authenticate!, :validate_version!, :ssl_options
end
