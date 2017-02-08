# encoding: utf-8
# author: Thomas Cate
# license: All rights reserved

require 'utils/simpleconfig'

class GrubConfig < Inspec.resource(1) # rubocop:disable Metrics/ClassLength
  name 'grub_conf'
  desc 'Use the grub_conf InSpec audit resource to test the boot config of Linux systems that use Grub.'
  example "
    describe grub_conf('/etc/grub.conf',  'default') do
      its('kernel') { should include '/vmlinuz-2.6.32-573.7.1.el6.x86_64' }
      its('initrd') { should include '/initramfs-2.6.32-573.el6.x86_64.img=1' }
      its('default') { should_not eq '1' }
      its('timeout') { should eq '5' }
    end

    also check specific kernels
    describe grub_conf('/etc/grub.conf',  'CentOS (2.6.32-573.12.1.el6.x86_64)') do
      its('kernel') { should include 'audit=1' }
    end
  "

  class UnknownGrubConfig < StandardError; end

  def initialize(path = nil, kernel = nil)
    config_for_platform(path)
    @kernel = kernel || 'default'
  rescue UnknownGrubConfig
    return skip_resource 'The `grub_config` resource is not supported on your OS yet.'
  end

  def config_for_platform(path)
    os = inspec.os
    if os.redhat? || os[:name] == 'fedora'
      config_for_redhatish(path)
    elsif os.debian?
      @conf_path = path || '/boot/grub/grub.cfg'
      @defaults_path = '/etc/default/grub'
      @version = 'grub2'
    elsif os[:name] == 'amazon'
      @conf_path = path || '/etc/grub.conf'
      @version = 'legacy'
    else
      raise UnknownGrubConfig
    end
  end

  def config_for_redhatish(path)
    if inspec.os[:release].to_f < 7
      @conf_path = path || '/etc/grub.conf'
      @version = 'legacy'
    else
      @conf_path = path || '/boot/grub/grub.cfg'
      @defaults_path = '/etc/default/grub'
      @version = 'grub2'
    end
  end

  def method_missing(name)
    read_params[name.to_s]
  end

  def to_s
    'Grub Config'
  end

  private

  ######################################################################
  # Grub2 This is used by all supported versions of Ubuntu and Rhel 7+ #
  ######################################################################

  def grub2_parse_kernel_lines(content, conf)
    # Find all "menuentry" lines and then parse them into arrays
    menu_entry = 0
    lines = content.split("\n")
    kernel_opts = {}
    kernel_opts['insmod'] = []
    lines.each_with_index do |file_line, index|
      next unless file_line =~ /(^|\s)menuentry\s.*/
      lines.drop(index+1).each do |kernel_line|
        next if kernel_line =~ /(^|\s)(menu|}).*/
        if menu_entry == conf['GRUB_DEFAULT'].to_i && @kernel == 'default'
          if kernel_line =~ /(^|\s)initrd.*/
            kernel_opts['initrd'] = kernel_line.split(' ')[1]
          end
          if kernel_line =~ /(^|\s)linux.*/
            kernel_opts['kernel'] = kernel_line.split
          end
          if kernel_line =~ /(^|\s)set root=.*/
            kernel_opts['root'] = kernel_line.split('=')[1].tr('\'', '')
          end
          if kernel_line =~ /(^|\s)insmod.*/
            kernel_opts['insmod'].push(kernel_line.split(' ')[1])
          end
        else
          menu_entry += 1
          break
        end
      end
    end
    kernel_opts
  end

  ###################################################################
  # Grub1 aka legacy-grub config. Primarily used by Centos/Rhel 6.x #
  ###################################################################

  def parse_kernel_lines(content, conf)
    # Find all "title" lines and then parse them into arrays
    menu_entry = 0
    lines = content.split("\n")
    kernel_opts = {}
    lines.each_with_index do |file_line, index|
      next unless file_line =~ /^title.*/
      current_kernel = file_line.split(' ', 2)[1]
      lines.drop(index+1).each do |kernel_line|
        if kernel_line =~ /^\s.*/
          option_type = kernel_line.split(' ')[0]
          line_options = kernel_line.split(' ').drop(1)
          if (menu_entry == conf['default'].to_i && @kernel == 'default') || current_kernel == @kernel
            if option_type == 'kernel'
              kernel_opts['kernel'] = line_options
            else
              kernel_opts[option_type] = line_options[0]
            end
          end
        else
          menu_entry += 1
          break
        end
      end
    end
    kernel_opts
  end

  def read_file(config_file)
    file = inspec.file(config_file)

    if !file.file? && !file.symlink?
      skip_resource "Can't find file '#{@conf_path}'"
      return @params = {}
    end

    content = file.content

    if content.empty? && !file.empty?
      skip_resource "Can't read file '#{@conf_path}'"
      return @params = {}
    end

    content
  end

  def read_params
    return @params if defined?(@params)

    content = read_file(@conf_path)

    if @version == 'legacy'
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
      kernel_opts = parse_kernel_lines(content, conf)
      @params = conf.merge(kernel_opts)
    end

    if @version == 'grub2'
      # read defaults
      defaults = read_file(@defaults_path)

      conf = SimpleConfig.new(
        defaults,
        multiple_values: true,
      ).params

      # convert single entry arrays into strings
      conf.each do |key, value|
        if value.size == 1
          conf[key] = conf[key][0].to_s
        end
      end

      kernel_opts = grub2_parse_kernel_lines(content, conf)
      @params = conf.merge(kernel_opts)
    end
    @params
  end
end
