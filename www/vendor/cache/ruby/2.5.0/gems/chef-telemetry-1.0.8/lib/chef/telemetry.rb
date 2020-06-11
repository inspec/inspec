require_relative "telemetry/client"
require_relative "telemetry/decision"
require_relative "telemetry/event"
require_relative "telemetry/session"
require_relative "telemetry/version"

class Chef
  class Telemetry
    attr_accessor :product, :origin, :product_version, :install_context
    def initialize(product: nil, origin: "command-line",
                   product_version: "0.0.0",
                   install_context: "omnibus")
      # Reference: https://github.com/chef/es-telemetry-pipeline/blob/0730c1e2605624a50d34bab6d036b73c31e0ab0e/schema/event.schema.json#L77
      @product = product
      @origin = origin
      @product_version = product_version
      @install_context = install_context # Valid: habitat, omnibus
    end

    def deliver(data = {})
      unless opt_out?
        payload = event.prepare(data)
        client.await.fire(payload)
      end
    end

    def event
      @event ||= Event.new(product, session, origin,
                           install_context, product_version)
    end

    def session
      @session ||= Session.new
    end

    def opt_out?
      @opt_out ||= Decision.opt_out?
    end

    def client
      endpoint = ENV.fetch("CHEF_TELEMETRY_ENDPOINT", Client::TELEMETRY_ENDPOINT)
      @client ||= Client.new(endpoint)
    end
  end
end # Chef
