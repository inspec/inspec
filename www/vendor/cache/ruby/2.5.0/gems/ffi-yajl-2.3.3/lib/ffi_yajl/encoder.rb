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
  class EncodeError < StandardError; end
  class Encoder
    attr_accessor :opts

    def encode(obj)
      # initialization that we can do in pure ruby
      yajl_gen_opts = {}

      yajl_gen_opts[:yajl_gen_validate_utf8] = @opts[:validate_utf8] == false ? false : true
      yajl_gen_opts[:yajl_gen_beautify] = false
      yajl_gen_opts[:yajl_gen_indent_string] = " "

      if opts[:pretty]
        yajl_gen_opts[:yajl_gen_beautify] = true
        yajl_gen_opts[:yajl_gen_indent_string] = opts[:indent] ? opts[:indent] : "  "
      end

      # call either the ext or ffi hook
      str = do_yajl_encode(obj, yajl_gen_opts, opts)
      # we can skip cleaning the whole string for utf-8 issues if we have yajl validate as we go

      str.force_encoding("UTF-8")
      unless yajl_gen_opts[:yajl_gen_validate_utf8]
        if str.respond_to?(:scrub)
          str.scrub!
        else
          str.encode!("UTF-16le", undef: :replace, invalid: :replace).encode!("UTF-8")
        end
      end
      str
    end

    def self.encode(obj, *args)
      new(*args).encode(obj)
    end

    def initialize(opts = {})
      @opts = opts
      @opts ||= {}
    end

    def self.raise_error_for_status(status, token = nil)
      # scrub token to valid utf-8 since we may be issuing an exception on an invalid utf-8 token
      token = token.to_s.force_encoding("UTF-8")
      if token.respond_to?(:scrub)
        token.scrub!
      else
        token.encode!("UTF-16le", undef: :replace, invalid: :replace).encode!("UTF-8")
      end
      case status
      when 1 # yajl_gen_keys_must_be_strings
        raise FFI_Yajl::EncodeError, "YAJL internal error: attempted use of non-string object as key"
      when 2 # yajl_max_depth_exceeded
        raise FFI_Yajl::EncodeError, "Max nesting depth exceeded"
      when 3 # yajl_gen_in_error_state
        raise FFI_Yajl::EncodeError, "YAJL internal error: a generator function (yajl_gen_XXX) was called while in an error state"
      when 4 # yajl_gen_generation_complete
        raise FFI_Yajl::EncodeError, "YAJL internal error: attempted to encode to an already-complete document"
      when 5 # yajl_gen_invalid_number
        raise FFI_Yajl::EncodeError, "Invalid number: cannot encode Infinity, -Infinity, or NaN"
      when 6 # yajl_gen_no_buf
        raise FFI_Yajl::EncodeError, "YAJL internal error: yajl_gen_get_buf was called, but a print callback was specified, so no internal buffer is available"
      when 7 # yajl_gen_invalid_string
        raise FFI_Yajl::EncodeError, "Invalid UTF-8 string '#{token}': cannot encode to UTF-8"
      else
        raise FFI_Yajl::EncodeError, "Unknown YAJL Error (#{status}), please report this as a bug"
      end
    end
  end
end
