# This class is a base class for Docker Container and Image.
# It is implementing accessor methods for the models attributes.
module Docker::Base
  include Docker::Error

  attr_accessor :connection, :info
  attr_reader :id

  # The private new method accepts a connection and a hash of options that must include an id.
  def initialize(connection, hash={})
    unless connection.is_a?(Docker::Connection)
      raise ArgumentError, "Expected a Docker::Connection, got: #{connection}."
    end
    normalize_hash(hash)
    @connection, @info, @id = connection, hash, hash['id']
    raise ArgumentError, "Must have id, got: #{hash}" unless @id
  end

  # The docker-api will some time return "ID" other times it will return "Id"
  # and other times it will return "id". This method normalize it to "id"
  # The volumes endpoint returns Name instead of ID, added in the normalize function
  def normalize_hash(hash)
    hash["id"] ||= hash.delete("ID") || hash.delete("Id")
  end
end
