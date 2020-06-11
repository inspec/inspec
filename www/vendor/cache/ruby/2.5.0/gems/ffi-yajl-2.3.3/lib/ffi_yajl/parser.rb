# Copyright (c) 2015 Lamont Granquist
# Copyright (c) 2015 Chef Software, Inc.
#
# Permission is hereby granted, free of charge, to any person obtaining
# a copy of this software and associated documentation files (the
# "Software"), to deal in the Software without restriction, including
# without limitation the rights to use, copy, modify, merge, publish,
# distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to
# the following conditions:
#
# The above copyright notice and this permission notice shall be
# included in all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
# NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
# LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

module FFI_Yajl
  class ParseError < StandardError; end
  class Parser
    attr_writer :stack, :key_stack
    attr_accessor :key, :finished

    attr_accessor :opts

    #
    # stack used to build up our complex object
    #
    def stack
      @stack ||= []
    end

    #
    # stack to keep track of keys as we create nested hashes
    #
    def key_stack
      @key_stack ||= []
    end

    def self.parse(obj, *args)
      new(*args).parse(obj)
    end

    def initialize(opts = {})
      @opts = opts ? opts.dup : {}
      # JSON gem uses 'symbolize_names' and ruby-yajl supports this as well
      @opts[:symbolize_keys] = true if @opts[:symbolize_names]
    end

    def parse(str)
      raise FFI_Yajl::ParseError, "input must be a string or IO" unless str.is_a?(String) || str.respond_to?(:read)

      # initialization that we can do in pure ruby
      yajl_opts = {}

      if @opts[:check_utf8] == false && @opts[:dont_validate_strings] == false
        raise ArgumentError, "options check_utf8 and dont_validate_strings are both false which conflict"
      end
      if @opts[:check_utf8] == true && @opts[:dont_validate_strings] == true
        raise ArgumentError, "options check_utf8 and dont_validate_strings are both true which conflict"
      end

      yajl_opts[:yajl_allow_comments] = true

      if @opts.key?(:allow_comments)
        yajl_opts[:yajl_allow_comments] = @opts[:allow_comments]
      end

      yajl_opts[:yajl_dont_validate_strings]  = (@opts[:check_utf8] == false || @opts[:dont_validate_strings])
      yajl_opts[:yajl_allow_trailing_garbage] = @opts[:allow_trailing_garbage]
      yajl_opts[:yajl_allow_multiple_values]  = @opts[:allow_multiple_values]
      yajl_opts[:yajl_allow_partial_values]   = @opts[:allow_partial_values]

      yajl_opts[:unique_key_checking]         = @opts[:unique_key_checking]

      # XXX: bug-compat with ruby-yajl
      return nil if str == ""

      str = str.read if str.respond_to?(:read)

      # call either the ext or ffi hook
      do_yajl_parse(str, yajl_opts)
    end
  end
end
