require 'minitest/autorun'
require 'minitest/spec'
require 'vulcano/backend'

backends = {}

backends[:local] = proc {
  backend_conf = Vulcano::Backend.target_config({})
  backend_class = Vulcano::Backend.registry['local']
  backend_class.new(backend_conf)
}

backends[:specinfra_local] = proc {
  backend_conf = Vulcano::Backend.target_config({
    'backend' => 'exec',
  })
  backend_class = Vulcano::Backend.registry['specinfra']
  backend_class.new(backend_conf)
}

tests = ARGV

backends.each do |type, get_backend|
  puts "run on backend #{type.to_s}"
  tests.each do |test|
    instance_eval(File.read(test))
  end
end
