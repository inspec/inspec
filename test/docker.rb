require_relative '../lib/vulcano'
docker_id = ARGV[0]
raise 'You must provide a valid docker container ID' if docker_id.nil?
tests = ARGV.drop(1)
exit 0 if tests.empty?

opts = { target: "docker://#{docker_id}" }
runner = Vulcano::Runner.new(nil, opts)
p "Create runner at #{opts}"

runner.add_tests(tests)
runner.run
