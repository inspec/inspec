# encoding: utf-8

module Train
  class File
    class Remote
      class Windows < Train::File::Remote
        attr_reader :path
        # Ensures we do not use invalid characters for file names
        # @see https://msdn.microsoft.com/en-us/library/windows/desktop/aa365247(v=vs.85).aspx#naming_conventions
        def sanitize_filename(path)
          return if path.nil?

          # we do not filter :, backslash and forward slash, since they are part of the path
          @spath = path.gsub(/[<>"|?*]/, "")
        end

        def basename(suffix = nil, sep = '\\')
          super(suffix, sep)
        end

        def content
          return @content if defined?(@content)

          @content = @backend.run_command("Get-Content(\"#{@spath}\") | Out-String").stdout
          return @content unless @content.empty?

          @content = nil if directory? # or size.nil? or size > 0
          @content
        end

        def exist?
          return @exist if defined?(@exist)

          @exist = @backend.run_command(
            "(Test-Path -Path \"#{@spath}\").ToString()"
          ).stdout.chomp == "True"
        end

        def owner
          owner = @backend.run_command(
            "Get-Acl \"#{@spath}\" | select -expand Owner"
          ).stdout.strip
          return if owner.empty?

          owner
        end

        def type
          if attributes.include?("Archive") && !attributes.include?("Directory")
            return :file
          elsif attributes.include?("ReparsePoint")
            return :symlink
          elsif attributes.include?("Directory")
            return :directory
          end

          :unknown
        end

        def size
          if file?
            @backend.run_command("((Get-Item '#{@spath}').Length)").stdout.strip.to_i
          end
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

        %w{
          mode group uid gid mtime selinux_label
        }.each do |field|
          define_method field.to_sym do
            nil
          end
        end

        def link_path
          nil
        end

        def shallow_link_path
          nil
        end

        def mounted
          nil
        end

        private

        def attributes
          return @attributes if defined?(@attributes)

          @attributes = @backend.run_command(
            "(Get-ItemProperty -Path \"#{@spath}\").attributes.ToString()"
          ).stdout.chomp.split(/\s*,\s*/)
        end
      end
    end
  end
end
