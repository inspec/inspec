# encoding: utf-8
# copyright:
# author: Matthew Dromazos

require 'utils/parser'

module Inspec::Resources
  class EtcFstab < Inspec.resource(1)
    name 'etc_fstab'
    desc 'Use the etc_fstab InSpec audit resource to check the configuration of the etc/fstab file.'
    example "
      nfs_systems = etc_fstab.nfs_file_systems.entries
      nfs_systems.each do |file_system|
        describe file_system do
          its ('mount_options') { should include 'nosuid' }
          its ('mount_options') { should include 'noexec' }
          its ('mount_options') { should include 'sec=krb5:krb5i:krb5p }
        end
      end

      describe etc_fstab do
        its ('home_mount_options') { should include 'nosuid' }
      end
    "

    attr_reader :params

    include CommentParser

    def initialize(fstab_path = nil)
      return skip_resource 'The `etc_fstab` resource is not supported on your OS.' unless inspec.os.linux?
      @conf_path      = fstab_path || '/etc/fstab'
      @files_contents = {}
      @content        = nil
      @params         = nil
      read_content
    end

    filter = FilterTable.create
    filter.add_accessor(:where)
          .add_accessor(:entries)
          .add(:device_name,           field: 'device_name')
          .add(:mount_point,           field: 'mount_point')
          .add(:file_system_type,      field: 'file_system_type')
          .add(:mount_options,         field: 'mount_options')
          .add(:dump_options,          field: 'dump_options')
          .add(:file_system_options,   field: 'file_system_options')
          .add(:configured?) { |x| x.entries.any? }

    filter.connect(self, :params)

    def nfs_file_systems
      where { file_system_type.match(/nfs/) }
    end

    def home_mount_options
      return nil unless where { mount_point == '/home' }.configured?
      where { mount_point == '/home' }.entries[0].mount_options
    end

    private

    def read_content
      @content = ''
      @params  = {}
      @content = read_file(@conf_path)
      @params  = parse_conf(@content)
    end

    def parse_conf(content)
      content.map do |line|
        data, = parse_comment_line(line, comment_char: '#', standalone_comments: false)
        parse_line(data) unless data == ''
      end.compact
    end

    def parse_line(line)
      attributes = line.split
      {
        'device_name'         => attributes[0],
        'mount_point'         => attributes[1],
        'file_system_type'    => attributes[2],
        'mount_options'       => attributes[3].split(','),
        'dump_options'        => attributes[4].to_i,
        'file_system_options' => attributes[5].to_i,
      }
    end

    def read_file(conf_path = @conf_path)
      file = inspec.file(conf_path)
      if !file.file?
        return skip_resource "Can't find \"#{@conf_path}\""
      end

      raw_conf = file.content
      if raw_conf.empty? && !file.empty?
        return skip_resource("File is empty or unable to read file at path:\"#{@conf_path}\"")
      end
      raw_conf.lines
    end
  end
end
