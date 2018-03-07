class MyFile < ::InSpec::Resource::JsonConfig
  name 'my_file'
  def initialize
    super('/tmp/node.json')
  end
end
