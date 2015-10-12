# encoding: utf-8
require_relative 'docker_run'
tests = ARGV

def test_container(container, tests)
  puts "--> run test on docker #{container.id}"
  pid = Process.fork do
    ENV['CONTAINER'] = container.id
    require_relative 'docker_test_container.rb'
    Process.exit
  end

  _, status = Process.waitpid2(pid)
  status.exitstatus == 0
end

results = DockerRunner.new.run_all do |name, container|
  status = test_container(container, tests)
  status ? nil : "Failed to run tests on #{name}"
end

failures = results.compact
failures.each { |f| puts "\033[31;1m#{f}\033[0m\n\n" }
failures.empty? or fail 'Test failures'
