module InspecPlugins::Parallelism
  class SuperReporter

    def self.make(type, job_count, invocations)
      Object.const_get("InspecPlugins::Parallelism::SuperReporter::" + (type[0].upcase + type[1..-1])).new(job_count, invocations)
    end

    class Base
      def initialize(job_count, invocations); end

      def child_spawned(pid, invocation); end

      def child_forked(pid, invocation); end

      def child_exited(pid); end

      def child_status_update_line(pid, update_line); end
    end

    require_relative "text"
    require_relative "status"
    require_relative "silent"
  end
end
