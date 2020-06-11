# This class represents a Docker Exec Instance.
class Docker::Exec
  include Docker::Base

  # Convert details about the object into a string
  #
  # @return [String] String representation of the Exec instance object
  def to_s
    "Docker::Exec { :id => #{self.id}, :connection => #{self.connection} }"
  end

  # Create a new Exec instance in a running container. Please note, this does
  # NOT execute the instance - you must run #start. Also, each instance is
  # one-time use only.
  #
  # @param options [Hash] Parameters to pass in to the API.
  # @param conn [Docker::Connection] Connection to Docker Remote API
  #
  # @return [Docker::Exec] self
  def self.create(options = {}, conn = Docker.connection)
    container = options.delete('Container')
    resp = conn.post("/containers/#{container}/exec", {},
      body: MultiJson.dump(options))
    hash = Docker::Util.parse_json(resp) || {}
    new(conn, hash)
  end

  # Get info about the Exec instance
  #
  def json
    Docker::Util.parse_json(connection.get(path_for(:json), {}))
  end

  # Start the Exec instance. The Exec instance is deleted after this so this
  # command can only be run once.
  #
  # @param options [Hash] Options to dictate behavior of the instance
  # @option options [Object] :stdin (nil) The object to pass to STDIN.
  # @option options [TrueClass, FalseClass] :detach (false) Whether to attach
  #     to STDOUT/STDERR.
  # @option options [TrueClass, FalseClass] :tty (false) Whether to attach using
  #     a pseudo-TTY.
  #
  # @return [Array, Array, Int] The STDOUT, STDERR and exit code
  def start!(options = {}, &block)

    # Parse the Options
    tty = !!options.delete(:tty)
    detached = !!options.delete(:detach)
    stdin = options[:stdin]
    read_timeout = options[:wait]

    # Create API Request Body
    body = MultiJson.dump(
      'Tty' => tty,
      'Detach' => detached
    )
    excon_params = { body: body }

    msgs = Docker::Messages.new
    unless detached
      if stdin
        excon_params[:hijack_block] = Docker::Util.hijack_for(stdin, block,
          msgs, tty)
      else
        excon_params[:response_block] = Docker::Util.attach_for(block,
          msgs, tty)
      end
    end

    excon_params[:read_timeout] = read_timeout unless read_timeout.nil?

    connection.post(path_for(:start), nil, excon_params)
    [msgs.stdout_messages, msgs.stderr_messages, self.json['ExitCode']]
  end

  # #start! performs the associated action and returns the output.
  # #start does the same, but rescues from ServerErrors.
  [:start].each do |method|
    define_method(method) do |*args|
      begin; public_send(:"#{method}!", *args); rescue ServerError; self end
    end
  end

  # Resize the TTY associated with the Exec instance
  #
  # @param query [Hash] API query parameters
  # @option query [Fixnum] h Height of the TTY
  # @option query [Fixnum] w Width of the TTY
  #
  # @return [Docker::Exec] self
  def resize(query = {})
    connection.post(path_for(:resize), query)
    self
  end

  # Get the request URI for the given endpoint
  #
  # @param endpoint [Symbol] The endpoint to grab
  # @return [String] The full Remote API endpoint with ID
  def path_for(endpoint)
    "/exec/#{self.id}/#{endpoint}"
  end

  private :path_for
  private_class_method :new
end
