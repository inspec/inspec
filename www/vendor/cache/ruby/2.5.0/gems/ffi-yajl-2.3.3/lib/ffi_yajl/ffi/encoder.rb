# Copyright (c) 2015 Lamont Granquist
# Copyright (c) 2015-2017, Chef Software Inc.
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

require "date"
require "stringio"

module FFI_Yajl
  module FFI
    module Encoder
      def do_yajl_encode(obj, yajl_gen_opts, opts)
        yajl_gen = FFI_Yajl.yajl_gen_alloc(nil)

        # configure the yajl encoder
        if yajl_gen_opts[:yajl_gen_beautify]
          FFI_Yajl.yajl_gen_config(yajl_gen, :yajl_gen_beautify, :int, 1)
        end
        if yajl_gen_opts[:yajl_gen_validate_utf8]
          FFI_Yajl.yajl_gen_config(yajl_gen, :yajl_gen_validate_utf8, :int, 1)
        end
        indent = yajl_gen_opts[:yajl_gen_indent_string] || " "
        FFI_Yajl.yajl_gen_config(yajl_gen, :yajl_gen_indent_string, :string, indent)

        # setup our own state
        state = {
          json_opts: opts,
          processing_key: false,
        }

        # do the encoding
        obj.ffi_yajl(yajl_gen, state)

        # get back our encoded JSON
        string_ptr = ::FFI::MemoryPointer.new(:string)
        length_ptr = ::FFI::MemoryPointer.new(:int)
        if ( status = FFI_Yajl.yajl_gen_get_buf(yajl_gen, string_ptr, length_ptr) ) != 0
          FFI_Yajl::Encoder.raise_error_for_status(status)
        end
        string = string_ptr.get_pointer(0).read_string

        FFI_Yajl.yajl_gen_free(yajl_gen)

        string
      end
    end
  end
end

class Hash
  def ffi_yajl(yajl_gen, state)
    if state[:processing_key]
      str = to_s
      if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    else
      if ( status = FFI_Yajl.yajl_gen_map_open(yajl_gen) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, "{")
      end
      each do |key, value|
        # Perf Fix: mutate state hash rather than creating new copy
        state[:processing_key] = true
        key.ffi_yajl(yajl_gen, state)
        state[:processing_key] = false
        value.ffi_yajl(yajl_gen, state)
      end
      if ( status = FFI_Yajl.yajl_gen_map_close(yajl_gen) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, "}")
      end
    end
  end
end

class Array
  def ffi_yajl(yajl_gen, state)
    if state[:processing_key]
      str = to_s
      if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    else
      if ( status = FFI_Yajl.yajl_gen_array_open(yajl_gen) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, "[")
      end
      each do |value|
        value.ffi_yajl(yajl_gen, state)
      end
      if ( status = FFI_Yajl.yajl_gen_array_close(yajl_gen) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, "]")
      end
    end
  end
end

class NilClass
  def ffi_yajl(yajl_gen, state)
    str = to_s
    if state[:processing_key]
      if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    else
      if ( status = FFI_Yajl.yajl_gen_null(yajl_gen) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    end
  end
end

class TrueClass
  def ffi_yajl(yajl_gen, state)
    str = to_s
    if state[:processing_key]
      if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    else
      if ( status = FFI_Yajl.yajl_gen_bool(yajl_gen, 1) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    end
  end
end

class FalseClass
  def ffi_yajl(yajl_gen, state)
    str = to_s
    if state[:processing_key]
      if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    else
      if ( status = FFI_Yajl.yajl_gen_bool(yajl_gen, 0) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    end
  end
end

class Integer
  def ffi_yajl(yajl_gen, state)
    str = to_s
    if str == "NaN" || str == "Infinity" || str == "-Infinity"
      raise ::FFI_Yajl::EncodeError, "'#{str}' is an invalid number"
    end

    if state[:processing_key]
      if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    else
      if ( status = FFI_Yajl.yajl_gen_number(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    end
  end
end

class Float
  def ffi_yajl(yajl_gen, state)
    str = to_s
    if str == "NaN" || str == "Infinity" || str == "-Infinity"
      raise ::FFI_Yajl::EncodeError, "'#{str}' is an invalid number"
    end

    if state[:processing_key]
      if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    else
      if ( status = FFI_Yajl.yajl_gen_number(yajl_gen, str, str.bytesize) ) != 0
        FFI_Yajl::Encoder.raise_error_for_status(status, str)
      end
    end
  end
end

class Symbol
  def ffi_yajl(yajl_gen, state)
    str = to_s
    if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
      FFI_Yajl::Encoder.raise_error_for_status(status, str)
    end
  end
end

class String
  def ffi_yajl(yajl_gen, state)
    if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, self, bytesize) ) != 0
      FFI_Yajl::Encoder.raise_error_for_status(status, self)
    end
  end
end

class StringIO
  def ffi_yajl(yajl_gen, state)
    str = read
    if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
      FFI_Yajl::Encoder.raise_error_for_status(status, str)
    end
  end
end

class Date
  def ffi_yajl(yajl_gen, state)
    str = to_s
    if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
      FFI_Yajl::Encoder.raise_error_for_status(status, str)
    end
  end
end

class Time
  def ffi_yajl(yajl_gen, state)
    str = strftime "%Y-%m-%d %H:%M:%S %z"
    if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
      FFI_Yajl::Encoder.raise_error_for_status(status, str)
    end
  end
end

class DateTime
  def ffi_yajl(yajl_gen, state)
    str = to_s
    if ( status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize) ) != 0
      FFI_Yajl::Encoder.raise_error_for_status(status, str)
    end
  end
end

# I feel dirty
class Object
  def ffi_yajl(yajl_gen, state)
    if !state[:processing_key] && respond_to?(:to_json)
      str = to_json(state[:json_opts])
      # #yajl_gen_number outputs a string without quotes around it
      status = FFI_Yajl.yajl_gen_number(yajl_gen, str, str.bytesize)
    else
      str = to_s
      status = FFI_Yajl.yajl_gen_string(yajl_gen, str, str.bytesize)
    end
    FFI_Yajl::Encoder.raise_error_for_status(status, str) if ( status ) != 0
  end
end
