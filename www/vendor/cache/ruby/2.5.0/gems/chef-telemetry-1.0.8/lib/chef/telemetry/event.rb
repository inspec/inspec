class Chef
  class Telemetry
    class Event

      SKELETON = {
        instance_id: "00000000-0000-0000-0000-000000000000",
        message_version: 1.0,
        payload_version: 1.0,
        license_id: "00000000-0000-0000-0000-000000000000",
        type: "track",
      }.freeze

      attr_reader :session, :product, :origin,
        :product_version, :install_context
      def initialize(product, session, origin = "command-line",
                     install_context = "omnibus", product_version = "0.0.0")
        @product = product
        @session = session
        @origin = origin
        @product_version = product_version
        @install_context = install_context
      end

      def prepare(event)
        time = timestamp
        event[:properties][:timestamp] = time
        body = SKELETON.dup
        body.tap do |b|
          b[:session_id] = session.id
          b[:origin] = origin
          b[:product] = product
          b[:product_version] = product_version
          b[:install_context] = install_context
          b[:timestamp] = time
          b[:payload] = event
        end
      end

      def timestamp
        Time.now.utc.strftime("%FT%TZ")
      end
    end
  end
end
