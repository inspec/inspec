# This class represents a Docker Image.
class Docker::Image
  include Docker::Base

  # Given a command and optional list of streams to attach to, run a command on
  # an Image. This will not modify the Image, but rather create a new Container
  # to run the Image. If the image has an embedded config, no command is
  # necessary, but it will fail with 500 if no config is saved with the image
  def run(cmd = nil, options = {})
    opts = {'Image' => self.id}.merge(options)
    opts["Cmd"] = cmd.is_a?(String) ? cmd.split(/\s+/) : cmd
    begin
      Docker::Container.create(opts, connection)
                       .tap(&:start!)
    rescue ServerError, ClientError => ex
      if cmd
        raise ex
      else
        raise ex, "No command specified."
      end
    end
  end

  # Push the Image to the Docker registry.
  def push(creds = nil, options = {}, &block)
    repo_tag = options.delete(:repo_tag) || ensure_repo_tags.first
    raise ArgumentError, "Image is untagged" if repo_tag.nil?
    repo, tag = Docker::Util.parse_repo_tag(repo_tag)
    raise ArgumentError, "Image does not have a name to push." if repo.nil?

    body = ""
    credentials = creds || Docker.creds || {}
    headers = Docker::Util.build_auth_header(credentials)
    opts = {:tag => tag}.merge(options)
    connection.post("/images/#{repo}/push", opts, :headers => headers,
                    :response_block => self.class.response_block(body, &block))
    self
  end

  # Tag the Image.
  def tag(opts = {})
    self.info['RepoTags'] ||= []
    connection.post(path_for(:tag), opts)
    repo = opts['repo'] || opts[:repo]
    tag = opts['tag'] || opts[:tag] || 'latest'
    self.info['RepoTags'] << "#{repo}:#{tag}"
  end

  # Given a path of a local file and the path it should be inserted, creates
  # a new Image that has that file.
  def insert_local(opts = {})
    local_paths = opts.delete('localPath')
    output_path = opts.delete('outputPath')

    local_paths = [ local_paths ] unless local_paths.is_a?(Array)

    file_hash = Docker::Util.file_hash_from_paths(local_paths)

    file_hash['Dockerfile'] = dockerfile_for(file_hash, output_path)

    tar = Docker::Util.create_tar(file_hash)
    body = connection.post('/build', opts, :body => tar)
    self.class.send(:new, connection, 'id' => Docker::Util.extract_id(body))
  end

  # Remove the Image from the server.
  def remove(opts = {})
    name = opts.delete(:name) || self.id
    connection.delete("/images/#{name}", opts)
  end
  alias_method :delete, :remove

  # Return a String representation of the Image.
  def to_s
    "Docker::Image { :id => #{self.id}, :info => #{self.info.inspect}, "\
      ":connection => #{self.connection} }"
  end

  # #json returns extra information about an Image, #history returns its
  # history.
  [:json, :history].each do |method|
    define_method(method) do |opts = {}|
      Docker::Util.parse_json(connection.get(path_for(method), opts))
    end
  end

  # Save the image as a tarball
  def save(filename = nil)
    self.class.save(self.id, filename, connection)
  end

  # Save the image as a tarball to an IO object.
  def save_stream(opts = {}, &block)
    self.class.save_stream(self.id, opts, connection, &block)
  end

  # Update the @info hash, which is the only mutable state in this object.
  def refresh!
    img = Docker::Image.all({:all => true}, connection).find { |image|
      image.id.start_with?(self.id) || self.id.start_with?(image.id)
    }
    info.merge!(self.json)
    img && info.merge!(img.info)
    self
  end

  class << self

    # Create a new Image.
    def create(opts = {}, creds = nil, conn = Docker.connection, &block)
      credentials = creds.nil? ? Docker.creds : MultiJson.dump(creds)
      headers = credentials && Docker::Util.build_auth_header(credentials) || {}
      body = ''
      conn.post(
        '/images/create',
        opts,
        :headers => headers,
        :response_block => response_block(body, &block)
        )
      # NOTE: see associated tests for why we're looking at image#end_with?
      image = opts['fromImage'] || opts[:fromImage]
      tag = opts['tag'] || opts[:tag]
      image = "#{image}:#{tag}" if tag && !image.end_with?(":#{tag}")
      get(image, {}, conn)
    end

    # Return a specific image.
    def get(id, opts = {}, conn = Docker.connection)
      image_json = conn.get("/images/#{URI.encode(id)}/json", opts)
      hash = Docker::Util.parse_json(image_json) || {}
      new(conn, hash)
    end

    # Delete a specific image
    def remove(id, opts = {}, conn = Docker.connection)
      conn.delete("/images/#{id}", opts)
    end
    alias_method :delete, :remove

    # Prune images
    def prune(conn = Docker.connection)
      conn.post("/images/prune", {})
    end


    # Save the raw binary representation or one or more Docker images
    #
    # @param names [String, Array#String] The image(s) you wish to save
    # @param filename [String] The file to export the data to.
    # @param conn [Docker::Connection] The Docker connection to use
    #
    # @return [NilClass, String] If filename is nil, return the string
    # representation of the binary data. If the filename is not nil, then
    # return nil.
    def save(names, filename = nil, conn = Docker.connection)
      if filename
        File.open(filename, 'wb') do |file|
          save_stream(names, {}, conn, &response_block_for_save(file))
        end
        nil
      else
        string = ''
        save_stream(names, {}, conn, &response_block_for_save(string))
        string
      end
    end

    # Stream the contents of Docker image(s) to a block.
    #
    # @param names [String, Array#String] The image(s) you wish to save
    # @param conn [Docker::Connection] The Docker connection to use
    # @yield chunk [String] a chunk of the Docker image(s).
    def save_stream(names, opts = {}, conn = Docker.connection, &block)
      # By using compare_by_identity we can create a Hash that has
      # the same key multiple times.
      query = {}.tap(&:compare_by_identity)
      Array(names).each { |name| query['names'.dup] = URI.encode(name) }
      conn.get(
        '/images/get',
        query,
        opts.merge(:response_block => block)
      )
      nil
    end

    # Load a tar Image
    def load(tar, opts = {}, conn = Docker.connection, creds = nil, &block)
       headers = build_headers(creds)
       io = tar.is_a?(String) ? File.open(tar, 'rb') : tar
       body = ""
       conn.post(
         '/images/load',
         opts,
         :headers => headers,
         :response_block => response_block(body, &block)
       ) { io.read(Excon.defaults[:chunk_size]).to_s }
    end

    # Check if an image exists.
    def exist?(id, opts = {}, conn = Docker.connection)
      get(id, opts, conn)
      true
    rescue Docker::Error::NotFoundError
      false
    end

    # Return every Image.
    def all(opts = {}, conn = Docker.connection)
      hashes = Docker::Util.parse_json(conn.get('/images/json', opts)) || []
      hashes.map { |hash| new(conn, hash) }
    end

    # Given a query like `{ :term => 'sshd' }`, queries the Docker Registry for
    # a corresponding Image.
    def search(query = {}, connection = Docker.connection, creds = nil)
      credentials = creds.nil? ? Docker.creds : creds.to_json
      headers = credentials && Docker::Util.build_auth_header(credentials) || {}
      body = connection.get(
        '/images/search',
        query,
        :headers => headers,
      )
      hashes = Docker::Util.parse_json(body) || []
      hashes.map { |hash| new(connection, 'id' => hash['name']) }
    end

    # Import an Image from the output of Docker::Container#export. The first
    # argument may either be a File or URI.
    def import(imp, opts = {}, conn = Docker.connection)
      open(imp) do |io|
        import_stream(opts, conn) do
          io.read(Excon.defaults[:chunk_size]).to_s
        end
      end
    rescue StandardError
      raise Docker::Error::IOError, "Could not import '#{imp}'"
    end

    def import_stream(options = {}, connection = Docker.connection, &block)
      body = connection.post(
        '/images/create',
         options.merge('fromSrc' => '-'),
         :headers => { 'Content-Type' => 'application/tar',
                       'Transfer-Encoding' => 'chunked' },
         &block
      )
      new(connection, 'id'=> Docker::Util.parse_json(body)['status'])
    end

    # Given a Dockerfile as a string, builds an Image.
    def build(commands, opts = {}, connection = Docker.connection, &block)
      body = ""
      connection.post(
        '/build', opts,
        :body => Docker::Util.create_tar('Dockerfile' => commands),
        :response_block => response_block(body, &block)
      )
      new(connection, 'id' => Docker::Util.extract_id(body))
    rescue Docker::Error::ServerError
      raise Docker::Error::UnexpectedResponseError
    end

    # Given File like object containing a tar file, builds an Image.
    #
    # If a block is passed, chunks of output produced by Docker will be passed
    # to that block.
    def build_from_tar(tar, opts = {}, connection = Docker.connection,
                       creds = nil, &block)

      headers = build_headers(creds)

      # The response_block passed to Excon will build up this body variable.
      body = ""
      connection.post(
        '/build', opts,
        :headers => headers,
        :response_block => response_block(body, &block)
      ) { tar.read(Excon.defaults[:chunk_size]).to_s }

      new(connection,
          'id' => Docker::Util.extract_id(body),
          :headers => headers)
    end

    # Given a directory that contains a Dockerfile, builds an Image.
    #
    # If a block is passed, chunks of output produced by Docker will be passed
    # to that block.
    def build_from_dir(dir, opts = {}, connection = Docker.connection,
                       creds = nil, &block)

      tar = Docker::Util.create_dir_tar(dir)
      build_from_tar tar, opts, connection, creds, &block
    ensure
      unless tar.nil?
        tar.close
        FileUtils.rm(tar.path, force: true)
      end
    end
  end

  private

  # A method to build the config header and merge it into the
  # headers sent by build_from_dir.
  def self.build_headers(creds=nil)
    credentials = creds || Docker.creds || {}
    config_header = Docker::Util.build_config_header(credentials)

    headers = { 'Content-Type'      => 'application/tar',
                'Transfer-Encoding' => 'chunked' }
    headers = headers.merge(config_header) if config_header
    headers
  end

  # Convenience method to return the path for a particular resource.
  def path_for(resource)
    "/images/#{self.id}/#{resource}"
  end


  # Convience method to get the Dockerfile for a file hash and a path to
  # output to.
  def dockerfile_for(file_hash, output_path)
    dockerfile = "from #{self.id}\n"

    file_hash.keys.each do |basename|
      dockerfile << "add #{basename} #{output_path}\n"
    end

    dockerfile
  end

  def ensure_repo_tags
    refresh! unless info.has_key?('RepoTags')
    info['RepoTags']
  end

  # Generates the block to be passed as a reponse block to Excon. The returned
  # lambda will append Docker output to the first argument, and yield output to
  # the passed block, if a block is given.
  def self.response_block(body)
    lambda do |chunk, remaining, total|
      body << chunk
      yield chunk if block_given?
    end
  end

  # Generates the block to be passed in to the save request. This lambda will
  # append the streaming data to the file provided.
  def self.response_block_for_save(file)
    lambda do |chunk, remianing, total|
      file << chunk
    end
  end
end
