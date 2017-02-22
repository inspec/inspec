# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module PasswdParser
  # Parse /etc/passwd files.
  #
  # @param [String] content the raw content of /etc/passwd
  # @return [Array] Collection of passwd entries
  def parse_passwd(content)
    content.to_s.split("\n").map do |line|
      next if line[0] == '#'
      parse_passwd_line(line)
    end.compact
  end

  # Parse a line of /etc/passwd
  #
  # @param [String] line a line of /etc/passwd
  # @return [Hash] Map of entries in this line
  def parse_passwd_line(line)
    x = line.split(':')
    {
      'user' => x.at(0),
      'password' => x.at(1),
      'uid' => x.at(2),
      'gid' => x.at(3),
      'desc' => x.at(4),
      'home' => x.at(5),
      'shell' => x.at(6),
    }
  end
end

module CommentParser
  # Parse a line with a command. For example: `a = b   # comment`.
  # Retrieves the actual content.
  #
  # @param [String] raw the content lines you want to be parsed
  # @param [Hash] opts optional configuration
  # @return [Array] contains the actual line and the position of the line end
  def parse_comment_line(raw, opts)
    idx_nl = raw.index("\n")
    idx_comment = raw.index(opts[:comment_char])
    idx_nl = raw.length if idx_nl.nil?
    idx_comment = idx_nl + 1 if idx_comment.nil?
    line = ''

    # is a comment inside this line
    if idx_comment < idx_nl && idx_comment != 0
      line = raw[0..(idx_comment - 1)]
      # in case we don't allow comments at the end
      # of an assignment/statement, ignore it and fall
      # back to treating this as a regular line
      if opts[:standalone_comments] && !is_empty_line(line)
        line = raw[0..(idx_nl - 1)]
      end
    # if there is no comment in this line
    elsif idx_comment > idx_nl && idx_nl != 0
      line = raw[0..(idx_nl - 1)]
    end
    [line, idx_nl]
  end
end

module LinuxMountParser
  # this parses the output of mount command (only tested on linux)
  # this method expects only one line of the mount output
  def parse_mount_options(mount_line, compatibility = false)
    mount = mount_line.scan(/\S+/)

    # parse device and type
    mount_options    = { device: mount[0], type: mount[4] }

    if compatibility == false
      # parse options as array
      mount_options[:options] = mount[5].gsub(/\(|\)/, '').split(',')
    else
      # parse options as serverspec uses it, tbis is deprecated
      mount_options[:options] = {}
      mount[5].gsub(/\(|\)/, '').split(',').each do |option|
        name, val = option.split('=')
        if val.nil?
          val = true
        elsif val =~ /^\d+$/
          # parse numbers
          val = val.to_i
        end
        mount_options[:options][name.to_sym] = val
      end
    end

    mount_options
  end
end

module BsdMountParser
  # this parses the output of mount command (only tested on freebsd)
  # this method expects only one line of the mount output
  def parse_mount_options(mount_line, _compatibility = false)
    return {} if mount_line.nil? || mount_line.empty?

    mount = mount_line.chomp.split(' ', 4)
    options = mount[3].tr('()', '').split(', ')

    # parse device and type
    { device: mount[0], type: options.shift, options: options }
  end
end

module SolarisNetstatParser
  # takes this as a input and parses the values
  # UDP: IPv4
  #    Local Address        Remote Address      State
  # -------------------- -------------------- ----------
  #       *.*                                 Unbound
  def parse_netstat(content) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity, Metrics/AbcSize
    return [] if content.nil? || content.empty?

    protocol = nil
    column_widths = nil
    ports = []
    cache_name_line = nil

    content.each_line { |line|
      # find header, its delimiter
      if line =~ /TCP:|UDP:|SCTP:/
        # get protocol
        protocol = line.split(':')[0].chomp.strip.downcase

        # determine version tcp, tcp6, udp, udp6
        proto_version = line.split(':')[1].chomp.strip
        protocol += '6' if proto_version == 'IPv6'

        # reset names cache
        column_widths = nil
        cache_name_line = nil
        names = nil
      # calulate width of a column based on the horizontal line
      elsif line =~ /^[- ]+$/
        column_widths = columns(line)
      # parse header values from line
      elsif column_widths.nil? && !line.nil?
        # we do not know the width at this point of time, therefore we need to cache
        cache_name_line = line
      # content line
      elsif !column_widths.nil? && !line.nil? && !line.chomp.empty?
        # default row
        port = split_columns(column_widths, line).to_a.map { |v| v.chomp.strip }

        # parse the header names
        # TODO: names should be optional
        names = split_columns(column_widths, cache_name_line).to_a.map { |v| v.chomp.strip.downcase.tr(' ', '-').gsub(/[^\w-]/, '_') }
        info = {
          'protocol' => protocol.downcase,
        }

        # generate hash for each line and use the names as keys
        names.each_index { |i|
          info[names[i]] = port[i] if i != 0
        }

        ports.push(info)
      end
    }
    ports
  end

  private

  # takes a line like "-------------------- -------------------- ----------"
  # as input and calculates the length of each column
  def columns(line)
    # find all columns
    m = line.scan(/-+/)
    # calculate the length each column
    m.map { |x| x.length } # rubocop:disable Style/SymbolProc
  end

  # takes a line and the width of the columns to extract the values
  def split_columns(columns, line)
    # generate regex based on columns
    sep = '\\s'
    length = columns.length
    arr = columns.map.with_index { |x, i|
      reg = "(.{#{x}})#{sep}" # add seperator between columns
      reg = "(.{,#{x}})#{sep}" if i == length - 2 # make the pre-last one optional
      reg = "(.{,#{x}})" if i == length - 1 # use , to say max value
      reg
    }
    # extracts the columns
    line.match(Regexp.new(arr.join))
  end
end

# This parser for xinetd (extended Internet daemon) configuration files
module XinetdParser
  def xinetd_include_dir(dir)
    return [] if dir.nil?

    unless inspec.file(dir).directory?
      return skip_resource "Cannot read folder in #{dir}"
    end

    files = inspec.command("find #{dir} -type f").stdout.split("\n")
    files.map { |file| parse_xinetd(read_content(file)) }
  end

  def parse_xinetd(raw) # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
    return {} if raw.nil?
    res = {}
    cur_group = nil
    simple_conf = []
    rest = raw
    until rest.empty?
      # extract content line
      nl = rest.index("\n") || (rest.length-1)
      comment = rest.index('#') || (rest.length-1)
      dst_idx = (comment < nl) ? comment : nl
      inner_line = (dst_idx == 0) ? '' : rest[0..dst_idx-1].strip
      # update unparsed content
      rest = rest[nl+1..-1]
      next if inner_line.empty?

      if inner_line == '}'
        if cur_group == 'defaults'
          res[cur_group] = SimpleConfig.new(simple_conf.join("\n"))
        else
          res[cur_group] ||= []
          res[cur_group].push(SimpleConfig.new(simple_conf.join("\n")))
        end
        cur_group = nil
      elsif rest.lstrip[0] == '{'
        cur_group = inner_line
        simple_conf = []
        rest = rest[rest.index("\n")+1..-1]
      elsif cur_group.nil?
        # parse all included files
        others = xinetd_include_dir(inner_line[/includedir (.+)/, 1])

        # complex merging of included configurations, as multiple services
        # may be defined with the same name but different configuration
        others.each { |ores|
          ores.each { |k, v|
            res[k] ||= []
            res[k].concat(v)
          }
        }
      else
        simple_conf.push(inner_line)
      end
    end

    res
  end
end
