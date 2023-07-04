require "highline"

module InspecPlugins::Parallelism
  class SuperReporter
    class Status < InspecPlugins::Parallelism::SuperReporter::Base

      attr_reader :status_by_pid, :slots

      def initialize(job_count, invocations)
        @status_by_pid = {}
        @slots = Array.new(job_count)
        paint_header(job_count, invocations)
        paint
      end

      # --------
      # SuperReporter API
      # --------
      def child_spawned(pid, invocation)
        new_child("spawned", pid, invocation)
      end

      def child_forked(pid, invocation)
        new_child("forked", pid, invocation)
      end

      def child_exited(pid)
        slots[status_by_pid[pid][:slot]] = "exited"

        status_by_pid[pid][:pct] = 100.0
        status_by_pid[pid][:slot] = nil
        status_by_pid[pid][:exit] = $?

        # TODO: consider holding slot in 100 status for UI grace

        paint
      end

      def child_status_update_line(pid, update_line)
        control_serial, status, control_count, title = update_line.split("/")
        percent = 100.0 * control_serial.to_i / control_count.to_i.to_f

        status_by_pid[pid][:pct] = percent
        status_by_pid[pid][:last_control] = title
        status_by_pid[pid][:last_status] = status

        paint
      end

      # --------
      # Utilities
      # --------
      private

      def new_child(how, pid, invocation)
        # Update status by PID with new info
        status_by_pid[pid] = {
          pct: 0.0,
          inv: invocation,
          how: how,
        }

        # Assign first empty slot
        slots.each_index do |idx|
          next unless slots[idx].nil? || slots[idx] == "exited"

          slots[idx] = pid
          status_by_pid[pid][:slot] = idx
          break
        end

        # TODO: consider printing log message
        paint
      end

      def terminal_width
        return @terminal_width if @terminal_width

        @highline ||= HighLine.new
        width = @highline.output_cols.to_i
        width = 80 if width < 1
        @terminal_width = width
      end

      def paint
        # Determine the width of a slot
        slot_width = terminal_width / slots.length
        line = ""
        # Loop over slots
        slots.each_index do |idx|
          if slots[idx].nil?
            # line += "idle".center(slot_width)
            # Need to improve UI
          elsif slots[idx] == "exited"
            line += "Done".center(slot_width)
          else
            pid = slots[idx]
            with_pid = format("%s: %0.1f%%", pid, status_by_pid[pid][:pct])
            if with_pid.length <= slot_width - 2
              line += with_pid.center(slot_width)
            else
              line += format("%0.1f%%", status_by_pid[pid][:pct]).center(slot_width)
            end
          end
        end

        print "\r" + (" " * terminal_width) + "\r"
        print line
      end

      def paint_header(jobs, invocations)
        puts "InSpec Parallel".center(terminal_width)
        puts "Running #{invocations.length} invocations in #{jobs} slots".center(terminal_width)
        puts "-" * terminal_width
        slot_width = terminal_width / slots.length
        slots.each_index do |idx|
          print "Slot #{idx + 1}".center(slot_width)
        end
        puts
        puts "-" * terminal_width
      end
    end
  end
end
