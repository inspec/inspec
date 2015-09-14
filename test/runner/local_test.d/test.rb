require 'minitest/autorun'
require 'minitest/spec'
require 'vulcano/backend'

conf = Vulcano::Backend.target_config({})
backend_class = Vulcano::Backend.registry['local']
backend = backend_class.new(conf)

describe 'run_command' do
  let(:backend_conf) { Vulcano::Backend.target_config({}) }
  let(:backend_class) { Vulcano::Backend.registry['local'] }
  let(:backend) { backend_class.new(backend_conf) }

  it 'can echo commands' do
    res = backend.run_command('echo hello world')
    res.stdout.must_equal("hello world\n")
    res.stderr.must_equal('')
    res.exit_status.must_equal(0)
  end

end
