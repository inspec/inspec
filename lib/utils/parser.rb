# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module ContentParser
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
