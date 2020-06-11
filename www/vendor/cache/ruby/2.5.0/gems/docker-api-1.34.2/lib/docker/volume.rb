# class represents a Docker Volume
class Docker::Volume
  include Docker::Base

  # /volumes/volume_name doesnt return anything
  def remove(opts = {}, conn = Docker.connection)
    conn.delete("/volumes/#{id}")
  end

  def normalize_hash(hash)
    hash['id'] ||= hash['Name']
  end

  class << self

    # get details for a single volume
    def get(name, conn = Docker.connection)
      resp = conn.get("/volumes/#{name}")
      hash = Docker::Util.parse_json(resp) || {}
      new(conn, hash)
    end

    # /volumes endpoint returns an array of hashes incapsulated in an Volumes tag
    def all(opts = {}, conn = Docker.connection)
      resp = conn.get('/volumes')
      json = Docker::Util.parse_json(resp) || {}
      hashes = json['Volumes'] || []
      hashes.map { |hash| new(conn, hash) }
    end

    # creates a volume with an arbitrary name
    def create(name, opts = {}, conn = Docker.connection)
      opts['Name'] = name
      resp = conn.post('/volumes/create', {}, body: MultiJson.dump(opts))
      hash = Docker::Util.parse_json(resp) || {}
      new(conn, hash)
    end

    def prune(conn = Docker.connection)
      conn.post("/volumes/prune")
    end

  end
end
