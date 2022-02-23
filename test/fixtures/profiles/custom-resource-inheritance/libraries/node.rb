require "inspec/resources/json"

class NodeAttributes < JsonConfig
  name 'node'

  def initialize
    super('./test/fixtures/files/node.json')
  end

  def to_s
    "Node Json"
  end
end
