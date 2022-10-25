require "inspec/resources/opa"

module Inspec::Resources
  class OpaApi < Opa
    name "opa_api"
    supports platform: "unix"
    supports platform: "windows"

    example <<~EXAMPLE
      describe opa_api(url: "localhost:8181/v1/data/example/violation", data: "input.json") do
        its(["result"]) { should eq 'value' }
      end
    EXAMPLE

    def initialize(opts = {})
      @url = opts[:url] || nil
      @data = opts[:data] || nil
      fail_resource "OPA url and data are mandatory." if @url.nil? || @url.empty? || @data.nil? || @data.empty?
      @content = load_result
      super(@content)
    end

    def allow
      @content["result"]
    end

    def resource_id
      @url || "opa_api"
    end

    def to_s
      "OPA api"
    end

    private

    def load_result
      raise Inspec::Exceptions::ResourceFailed, "#{resource_exception_message}" if resource_failed?

      result = inspec.command("curl -X POST #{@url} -d @#{@data} -H 'Content-Type: application/json'")
      if result.exit_status == 0
        result.stdout.gsub("\n", "")
      else
        error = result.stdout + "\n" + result.stderr
        raise Inspec::Exceptions::ResourceFailed, "Error while executing OPA query: #{error}"
      end
    end
  end
end
