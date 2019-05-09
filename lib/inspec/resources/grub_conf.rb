
require 'inspec/utils/simpleconfig'
require 'inspec/utils/file_reader'

class GrubConfig < Inspec.resource(1)
  name 'grub_conf'
  supports platform: 'unix'
  desc 'Use the grub_conf InSpec audit resource to test the boot config of Linux systems that use Grub.'
  example <<~EXAMPLE
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
  EXAMPLE

  include FileReader

  class UnknownGrubConfig < StandardError; end

  def initialize(path = nil, kernel = nil)
    config_for_platform(path)
    @content = read_file(@conf_path)
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
      @grubenv_path = '/boot/grub2/grubenv'
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
      @conf_path = path || '/boot/grub2/grub.cfg'
      @defaults_path = '/etc/default/grub'
      @grubenv_path = '/boot/grub2/grubenv'
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
    menu_entries = extract_menu_entries(content)

    if @kernel == 'default'
      default_menu_entry(menu_entries, conf['GRUB_DEFAULT'])
    else
      menu_entries.find { |entry| entry['name'] == @kernel }
    end
  end

  def extract_menu_entries(content)
    menu_entries = []

    lines = content.split("\n")
    lines.each_with_index do |line, index|
      next unless line =~ /^menuentry\s+.*/
      entry = {}
      entry['insmod'] = []

      # Extract name from menuentry line
      capture_data = line.match(/(?:^|\s+).*menuentry\s*['|"](.*)['|"]\s*--/)
      if capture_data.nil? || capture_data.captures[0].nil?
        raise Inspec::Exceptions::ResourceFailed "Failed to extract menuentry name from #{line}"
      end

      entry['name'] = capture_data.captures[0]

      # Begin processing from index forward until a `}` line is met
      lines.drop(index+1).each do |mline|
        break if mline =~ /^\s*}\s*$/
        case mline
        when /(?:^|\s*)initrd.*/
          entry['initrd'] = mline.split(' ')[1]
        when /(?:^|\s*)linux.*/
          entry['kernel'] = mline.split
        when /(?:^|\s*)set root=.*/
          entry['root'] = mline.split('=')[1].tr('\'', '')
        when /(?:^|\s*)insmod.*/
          entry['insmod'] << mline.split(' ')[1]
        end
      end

      menu_entries << entry
    end

    menu_entries
  end

  def default_menu_entry(menu_entries, default)
    # If the default entry isn't `saved` then a number is used as an index.
    # By default this is `0`, which would be the first item in the list.
    return menu_entries[default.to_i] unless default == 'saved'

    grubenv_contents = inspec.file(@grubenv_path).content

    # The location of the grubenv file is not guaranteed. In the case that
    # the file does not exist this will return the 0th entry. This will also
    # return the 0th entry if InSpec lacks permission to read the file. Both
    # of these reflect the default Grub2 behavior.
    return menu_entries[0] if grubenv_contents.nil?

    default_name = SimpleConfig.new(grubenv_contents).params['saved_entry']
    default_entry = menu_entries.select { |k| k['name'] == default_name }[0]
    return default_entry unless default_entry.nil?

    # It is possible for the saved entry to not be valid . For example, grubenv
    # not being up to date. If so, the 0th entry is the default.
    menu_entries[0]
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
    read_file_content(config_file)
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
