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
      parse_passwd_line(line)
    end
  end

  # Parse a line of /etc/passwd
  #
  # @param [String] line a line of /etc/passwd
  # @return [Hash] Map of entries in this line
  def parse_passwd_line(line)
    x = line.split(':')
    {
      'name' => x.at(0),
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

module MountParser
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
