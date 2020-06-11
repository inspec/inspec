# encoding: utf-8

require_relative "unix"

module Train
  class File
    class Remote
      class Aix < Train::File::Remote::Unix
        def link_path
          return nil unless symlink?

          @link_path ||=
            @backend.run_command("perl -e 'print readlink shift' #{@spath}").stdout.chomp
        end

        def shallow_link_path
          return nil unless symlink?

          @shallow_link_path ||=
            @backend.run_command("perl -e 'print readlink shift' #{@spath}").stdout.chomp
        end

        def mounted
          @mounted ||= @backend.run_command("lsfs -c #{@spath}")
        end
      end
    end
  end
end
