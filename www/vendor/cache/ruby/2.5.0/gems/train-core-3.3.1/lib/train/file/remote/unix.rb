require "shellwords"

module Train
  class File
    class Remote
      class Unix < Train::File::Remote
        def sanitize_filename(path)
          @spath = Shellwords.escape(path) || @path
        end

        def content
          @content ||=
            if !exist? || directory?
              nil
            elsif size.nil? || size == 0
              ""
            else
              @backend.run_command("cat #{@spath}").stdout || ""
            end
        end

        def exist?
          @exist ||= begin
            f = @follow_symlink ? "" : " || test -L #{@spath}"
            if @backend.platform.solaris?
              # Solaris does not support `-e` flag in default `test`,
              # so we specify by running /usr/bin/test:
              # https://github.com/inspec/train/issues/587
              @backend.run_command("/usr/bin/test -e #{@spath}" + f)
            else
              @backend.run_command("test -e #{@spath}" + f)
            end.exit_status == 0
          end
        end

        def mounted
          @mounted ||=
            @backend.run_command("mount | grep -- ' on #{@path} '")
        end

        %w{
          type mode owner group uid gid mtime size selinux_label
        }.each do |field|
          define_method field.to_sym do
            stat[field.to_sym]
          end
        end

        def mode?(sth)
          mode == sth
        end

        def grouped_into?(sth)
          group == sth
        end

        def linked_to?(dst)
          link_path == dst
        end

        def link_path
          symlink? ? path : nil
        end

        def shallow_link_path
          return nil unless symlink?

          @shallow_link_path ||=
            @backend.run_command("readlink #{@spath}").stdout.chomp
        end

        def unix_mode_mask(owner, type)
          o = UNIX_MODE_OWNERS[owner.to_sym]
          return nil if o.nil?

          t = UNIX_MODE_TYPES[type.to_sym]
          return nil if t.nil?

          t & o
        end

        def path
          return @path unless @follow_symlink && symlink?

          @link_path ||= read_target_path
        end

        private

        # Returns full path of a symlink target(real dest) or '' on symlink loop
        def read_target_path
          full_path = @backend.run_command("readlink -n #{@spath} -f").stdout
          # Needed for some OSes like OSX that returns relative path
          # when the link and target are in the same directory
          if !full_path.start_with?("/") && full_path != ""
            full_path = ::File.expand_path("../#{full_path}", @spath)
          end
          full_path
        end

        UNIX_MODE_OWNERS = {
          all: 00777,
          owner: 00700,
          group: 00070,
          other: 00007,
        }.freeze

        UNIX_MODE_TYPES = {
          r: 00444,
          w: 00222,
          x: 00111,
        }.freeze
      end
    end
  end
end
