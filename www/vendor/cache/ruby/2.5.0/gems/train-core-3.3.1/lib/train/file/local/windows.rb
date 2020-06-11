# encoding: utf-8

module Train
  class File
    class Local
      class Windows < Train::File::Local
        # Ensures we do not use invalid characters for file names
        # @see https://msdn.microsoft.com/en-us/library/windows/desktop/aa365247(v=vs.85).aspx#naming_conventions
        def sanitize_filename(path)
          return if path.nil?

          # we do not filter :, backslash and forward slash, since they are part of the path
          @spath = path.gsub(/[<>"|?*]/, "")
        end

        def product_version
          @product_version ||= @backend.run_command(
            "[System.Diagnostics.FileVersionInfo]::GetVersionInfo(\"#{@spath}\").ProductVersion"
          ).stdout.chomp
        end

        def file_version
          @file_version ||= @backend.run_command(
            "[System.Diagnostics.FileVersionInfo]::GetVersionInfo(\"#{@spath}\").FileVersion"
          ).stdout.chomp
        end

        def owner
          owner = @backend.run_command(
            "Get-Acl \"#{@spath}\" | select -expand Owner"
          ).stdout.strip
          return if owner.empty?

          owner
        end

        def stat
          return @stat if defined?(@stat)

          begin
            file_stat =
              if @follow_symlink
                ::File.stat(@path)
              else
                ::File.lstat(@path)
              end
          rescue StandardError => _err
            return @stat = {}
          end

          @stat = {
            type: type,
            mode: file_stat.mode,
            mtime: file_stat.mtime.to_i,
            size: file_stat.size,
            owner: owner,
            uid: file_stat.uid,
            group: nil,
            gid: file_stat.gid,
            selinux_label: nil,
          }

          @stat
        end
      end
    end
  end
end
