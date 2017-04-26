# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved
# author: Dominik Richter
# author: Christoph Hartmann

require 'utils/parser'

class SimpleConfig
  include CommentParser

  attr_reader :params, :groups
  def initialize(raw_data, opts = {})
    parse(raw_data, opts)
  end

  # Parse some data
  # quotes: quoting characters, which are parsed, so everything inside
  # it will be part of a string
  # multiline: allow quoted text to span multiple lines
  # comment_char: char which identifies comments
  # standalone_comments: comments must appear alone in a line; if set to true,
  # no comments can be added to the end of an assignment/statement line
  def parse(raw_data, opts = nil)
    @params = {}
    @groups = []
    @vals = @params
    options = default_options.merge(opts || {})
    return if raw_data.nil?

    # prepare raw data if required
    if !options[:line_separator].nil?
      raw_data = raw_data.tr(options[:line_separator], "\n")
    end
    rest = raw_data
    rest = parse_rest(rest, options) until rest.empty?
  end

  private

  def parse_values(match, values)
    start_idx = 2
    i = 0
    count = values - 1
    return match[start_idx] if values == 1

    # iterate over expected parameters
    values = []
    loop do
      values.push(match[start_idx + i])
      i += 1
      break if i > count
    end
    values
  end

  def parse_params_line(line, opts)
    # Deprecation handling
    if opts.key?(:assignment_re)
      warn '[DEPRECATION] `:assignment_re` is deprecated in favor of `:assignment_regex` '\
           'and will be removed in the next major version. See: https://github.com/chef/inspec/issues/1709'
      opts[:assignment_regex] = opts[:assignment_re]
    end
    if opts.key?(:key_vals)
      warn '[DEPRECATION] `:key_vals` is deprecated in favor of `:key_values` '\
           'and will be removed in the next major version. See: https://github.com/chef/inspec/issues/1709'
      opts[:key_values] = opts[:key_vals]
    end

    # now line contains what we are interested in parsing
    # check if it is an assignment
    m = opts[:assignment_regex].match(line)
    return nil if m.nil?

    if opts[:multiple_values]
      @vals[m[1]] ||= []
      @vals[m[1]].push(parse_values(m, opts[:key_values]))
    else
      @vals[m[1]] = parse_values(m, opts[:key_values])
    end
  end

  def parse_group_line(line, opts)
    return nil if opts[:group_re].nil?
    m = opts[:group_re].match(line)
    return nil if m.nil?
    @groups.push(m[1])

    # We use a Hashie::Mash to provide method syntax for retrieving
    # values. For configs that have keys whose values may be hashes
    # (such as a mysql config that has [sections]), providing
    # a hash whose values are accessible via methods provide
    # a better user experience with `its` blocks.
    @vals = @params[m[1]] = Hashie::Mash.new
  end

  def parse_implicit_assignment_line(line, opts)
    return nil if is_empty_line(line)
    if opts[:multiple_values]
      @vals[line.strip] ||= []
    else
      @vals[line.strip] = ''
    end
  end

  def parse_rest(rest, opts)
    line, idx_nl = parse_comment_line(rest, opts)
    parse_params_line(line, opts) or
      parse_group_line(line, opts) or
      parse_implicit_assignment_line(line, opts)

    # return whatever is left
    rest[(idx_nl + 1)..-1] || ''
  end

  def is_empty_line(l)
    l =~ /^\s*$/
  end

  def default_options
    {
      quotes: '',
      multiline: false,
      comment_char: '#',
      line_separator: nil, # uses this char to seperate lines before parsing
      assignment_regex: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
      group_re: /\[([^\]]+)\]\s*$/,
      key_values: 1, # default for key=value, may require for 'key val1 val2 val3'
      standalone_comments: false,
      multiple_values: false,
    }
  end
end
