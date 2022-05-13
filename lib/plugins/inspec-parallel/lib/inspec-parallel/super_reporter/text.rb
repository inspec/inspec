module InspecPlugins::Parallelism
  class SuperReporter
    class Text < InspecPlugins::Parallelism::SuperReporter::Base
      def child_spawned(pid, _inv)
        puts "[#{Time.now.iso8601}] Spawned child PID #{pid}"
      end

      def child_forked(pid, _inv)
        puts "[#{Time.now.iso8601}] Forked child PID #{pid}"
      end

      def child_exited(pid)
        puts "[#{Time.now.iso8601}] Exited child PID #{pid} status #{$?}"
      end

      def child_status_update_line(pid, update_line)
        control_serial, _status, control_count, _title = update_line.split("/")
        percent = 100.0 * control_serial.to_i / control_count.to_i.to_f
        puts "[#{Time.now.iso8601}] #{pid} " + format("%.1f%%", percent)
      end
    end
  end
end
