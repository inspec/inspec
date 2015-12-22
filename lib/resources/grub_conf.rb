# encoding: utf-8
# author: Thomas Cate
# license: All rights reserved

require 'utils/simpleconfig'

class GrubConfig < Inspec.resource(1)
  name 'grub_conf'
  desc 'Use the grub_conf InSpec audit resource to test the boot config of Linux systems that use Grub.'
  example "
    describe grub_conf('/etc/grub.conf') do
      its('kernel') { should include '/vmlinuz-2.6.32-573.7.1.el6.x86_64' }
      its('initrd') { should include '/initramfs-2.6.32-573.el6.x86_64.img=1' }
      its('default') { should_not eq '1' }
      its('timeout') { should eq '5' }
    end
  "

  def initialize(path = nil)
    family = inspec.os[:family]
    case family
    when 'redhat', 'fedora', 'centos'
      @conf_path = path || '/etc/grub.conf'
      supported = true
    end
    return skip_resource 'The `grub_config` resource is not supported on your OS yet.' if supported.nil?
  end

  def method_missing(name)
    read_params[name.to_s]
  end

  def to_s
    'Grub Config'
  end

  private

  def parse_kernel_lines(content)
    # Find all "title" lines and then parse them into arrays
    lines = content.split("\n")
    kernel_opts = {}
    lines.each_with_index do |file_line, index|
      next unless file_line =~ /^title.*/
      lines.drop(index+1).each do |kernel_line|
        if kernel_line =~ /^\s.*/
          option_type = kernel_line.split(' ')[0]
          line_options = kernel_line.split(' ').drop(1)
          if kernel_opts[option_type].is_a?(Array)
            kernel_opts[option_type].push(*line_options)
          else
            kernel_opts[option_type] = line_options
          end
        else
          break
        end
      end
    end
    kernel_opts
  end

  def read_params
    return @params if defined?(@params)

    # read the file
    file = inspec.file(@conf_path)
    if !file.file? && !file.symlink?
      skip_resource "Can't find file '#{@conf_path}'"
      return @params = {}
    end

    content = file.content
    if content.empty? && file.size > 0
      skip_resource "Can't read file '#{@conf_path}'"
      return @params = {}
    end

    # parse the file
    conf = SimpleConfig.new(
      content,
      multiple_values: true,
    ).params

    # convert single entry arrays into strings
    conf.each do |key, value|
      if value.size == 1
        conf[key] = conf[key][0].to_s
      end
    end

    kernel_opts = parse_kernel_lines(content)

    @params = conf.merge(kernel_opts)
  end
end
