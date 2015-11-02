# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'train/extras/stat'


# PS C:\Users\Administrator> Get-Item -Path C:\test.txt | Select-Object -Property BaseName, FullName, IsReadOnly, Exists,
# LinkType, Mode, VersionInfo, Owner, Archive, Hidden, ReadOnly, System |  ConvertTo-Json

module Train::Extras
  class WindowsFile < FileCommon
    attr_reader :path
    def initialize(backend, path)
      @backend = backend
      @path = path
      @spath = Shellwords.escape(@path)
    end

    def content
      return @content if defined?(@content)
      @content = @backend.run_command(
        "Get-Content(\"#{@spath}\") | Out-String").stdout
      return @content unless @content.empty?
      @content = nil if directory? # or size.nil? or size > 0
      @content
    end

    def exist?
      nil
    end

    def link_target
      nil
    end

    def link_path
      nil
    end

    def mounted?
      nil
    end

    def type
      :unknown
    end

    %w{
      mode owner group mtime size selinux_label
    }.each do |field|
      define_method field.to_sym do
        nil
      end
    end

    def product_version
      nil
    end

    def file_version
      nil
    end

    def stat
      nil
    end

    private

    def attributes
      return @attributes if defined?(@attributes)
      @attributes = @backend.run_command(
        "(Get-ItemProperty -Path \"#{@spath}\").attributes.ToString()").stdout.chomp.split(',')
    end

    def target_type
      if attributes.include?('Archive')
        return :file
      elsif attributes.include?('Directory')
        return :directory
      end
      :unknown
    end

  end
end
