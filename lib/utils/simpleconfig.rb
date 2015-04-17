# encoding: utf-8
# copyright: 2015, Dominik Richter
# license: All rights reserved

class SimpleConfig
  attr_reader :params
  def initialize( raw_data, opts = {} )
    parse(raw_data, opts)
  end

  # Parse some data
  # quotes: quoting characters, which are parsed, so everything inside
  # it will be part of a string
  # multiline: allow quoted text to span multiple lines
  # comment_char: char which identifies comments
  # standalone_comments: comments must appear alone in a line; if set to true,
  # no comments can be added to the end of an assignment/statement line
  def parse( raw_data, opts = {} )
    @params = {}
    options = default_options.merge(opts)
    rest = raw_data
    rest = parse_rest(rest, options) while rest.length > 0
  end

  private

  def parse_rest( rest, opts )
    idx_nl = rest.index("\n")
    idx_comment = rest.index('#')
    idx_nl = rest.length if idx_nl.nil?
    idx_comment = idx_nl+1 if idx_comment.nil?
    # is a comment inside this line
    if idx_comment < idx_nl
      if idx_comment == 0
        line = ''
      else
        line = rest[0..(idx_comment-1)]
        # in case we don't allow comments at the end
        # of an assignment/statement, ignore it and fall
        # back to treating this as a regular line
        if opts[:standalone_comments] && !is_empty_line(line)
          line = rest[0..(idx_nl-1)]
        end
      end
    # if there is no comment in this line
    else
      if idx_nl == 0
        line = ''
      else
        line = rest[0..(idx_nl-1)]
      end
    end
    # now line contains what we are interested in parsing
    # check if it is an assignment
    m = opts[:assignment_re].match(line)
    if !m.nil?
      if opts[:multiple_values]
        @params[m[1]] ||= []
        @params[m[1]].push(m[2])
      else
        @params[m[1]] = m[2]
      end
    elsif !is_empty_line(line)
      if opts[:multiple_values]
        @params[line.strip] ||= []
      else
        @params[line.strip] = ''
      end
    end

    # return whatever is left
    return rest[(idx_nl+1)..-1] || ''
  end

  def is_empty_line l
    l =~ /^\s*$/
  end

  def default_options
    {
      quotes: '',
      multiline: false,
      comment_char: '#',
      assignment_re: /^\s*([^=]*?)\s*=\s*(.*?)\s*$/,
      standalone_comments: false,
      multiple_values: true
    }
  end

end