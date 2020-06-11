require "securerandom"
require "chef-config/path_helper"

class Chef
  class Telemetry
    class Session
      def initialize
        @id = if live_session?
                File.read(session_file).chomp
              else
                new_session
              end
      end

      def id
        FileUtils.touch(session_file)
        @id
      end

      private

      def live_session?
        expiry = Time.now - 600
        File.file?(session_file) && File.stat(session_file).mtime > expiry
      end

      def session_file
        File.join(ChefConfig::PathHelper.home(".chef"), "TELEMETRY_SESSION_ID").freeze
      end

      def new_session
        id = SecureRandom.uuid
        FileUtils.mkdir_p(File.dirname(session_file))
        File.open(session_file, "w") { |f| f.write(id) }
        id
      end
    end
  end
end # Chef
