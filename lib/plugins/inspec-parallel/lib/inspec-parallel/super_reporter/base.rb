module InspecPlugins::Parallelism
  class SuperReporter

    def self.make(type, invocations)
      Object.const_get("InspecPlugins::Parallelism::SuperReporter::" + (type[0].upcase + type[1..-1])).new(invocations)
    end

    class Base
      def initialize(invocations); end

      def child_spawned(pid, invocation); end

      def child_forked(pid, invocation); end

      def child_exited(pid); end

      def child_status_update_line(pid, update_line); end
    end

    require_relative "text"
    require_relative "status"
  end
end
