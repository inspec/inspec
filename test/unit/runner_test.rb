# copyright: 2017, Chef Software Inc.

require "helper"
require "inspec/secrets"
require "inspec/runner"
require "inspec/fetcher/mock"
require "inspec/utils/licensing_config"

describe Inspec::Runner do
  let(:runner) { Inspec::Runner.new({ command_runner: :generic, reporter: [] }) }

  it "bug #4524" do
    file = <<-RUBY
      describe "a thing" do
        before(:all) { os }
        it("should pass") {}
      end
    RUBY
    runner.add_target("bug4524.rb" => file)
    runner.load

    result = RSpec::Core::Runner.new(nil).run_specs(runner.test_collector.tests)

    _(result).must_equal 0
  end

  it "bug #4587" do
    file = <<-RUBY
      describe "a thing" do
        subject! { os }
        its("family") { should_not eq 42 }
      end
    RUBY
    runner.add_target("bug4587.rb" => file)
    runner.load

    result = RSpec::Core::Runner.new(nil).run_specs(runner.test_collector.tests)

    _(result).must_equal 0
  end

  # =============================================================== #
  #                         Reporter Options
  # =============================================================== #

  describe "confirm reporter defaults to cli" do
    it "defaults to cli when format and reporter not set" do
      opts = { command_runner: :generic, backend_cache: true }
      runner = Inspec::Runner.new(opts)
      config = runner.instance_variable_get(:"@conf")
      expected = { "cli" => { "stdout" => true } }
      _(config["reporter"]).must_equal expected
    end

    it "does not default when format is set" do
      opts = { command_runner: :generic, backend_cache: true, "reporter" => ["json"] }
      runner = Inspec::Runner.new(opts)
      config = runner.instance_variable_get(:"@conf")
      expected = { "json" => { "stdout" => true } }
      _(config["reporter"]).must_equal expected
    end

    it "deletes format if set to a rspec format" do
      opts = { command_runner: :generic, backend_cache: true, "reporter" => ["progress"] }
      runner = Inspec::Runner.new(opts)
      config = runner.instance_variable_get(:"@conf")
      _(config["reporter"]).must_equal({})
    end
  end

  # =============================================================== #
  #                      Exit Codes
  # =============================================================== #

  describe "testing runner.run exit codes" do
    it "returns proper exit code when no profile is added" do
      WebMock.allow_net_connect!
      _(runner.run).must_equal 0
    end
  end

  # =============================================================== #
  #                       Backend Caching
  # =============================================================== #

  describe "when backend caching is enabled" do
    it "returns a backend with caching" do
      opts = { command_runner: :generic, backend_cache: true }
      runner = Inspec::Runner.new(opts)
      backend = runner.instance_variable_get(:@backend)
      _(backend.backend.cache_enabled?(:command)).must_equal true
    end
  end

  describe "when backend caching is disabled" do
    it "returns a backend without caching" do
      opts = { command_runner: :generic, backend_cache: false }
      runner = Inspec::Runner.new(opts)
      backend = runner.instance_variable_get(:@backend)
      _(backend.backend.cache_enabled?(:command)).must_equal false
    end

    it "returns a backend without caching as default" do
      backend = runner.instance_variable_get(:@backend)
      _(backend.backend.cache_enabled?(:command)).must_equal false
    end
  end
end
