require 'minitest/autorun'
require 'minitest/spec'
require 'vulcano/backend'

backends = {
  :local => proc {
    backend_conf = Vulcano::Backend.target_config({})
    backend_class = Vulcano::Backend.registry['local']
    backend_class.new(backend_conf)
  },
  :specinfra_local => proc {
    backend_conf = Vulcano::Backend.target_config({
      'backend' => 'exec',
    })
    backend_class = Vulcano::Backend.registry['specinfra']
    backend_class.new(backend_conf)
  },
}

backends.each do |type, get_backend|
  puts "run on backend #{type.to_s}"

  describe 'run_command' do
    let(:backend) { get_backend.call() }

    it 'can echo commands' do
      res = backend.run_command('echo hello world')
      res.stdout.must_equal("hello world\n")
      res.stderr.must_equal('')
      res.exit_status.must_equal(0)
    end

    it 'can echo commands to stderr' do
      res = backend.run_command('>&2 echo hello world')
      res.stdout.must_equal('')
      res.stderr.must_equal("hello world\n")
      res.exit_status.must_equal(0)
    end

    it 'prints a correct exit status' do
      res = backend.run_command('exit 123')
      res.stdout.must_equal('')
      res.stderr.must_equal('')
      res.exit_status.must_equal(123)
    end
  end
end
