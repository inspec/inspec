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

require "rubygems"

require "libyajl2"
begin
  require "ffi"
rescue LoadError
  $stderr.puts "FATAL: to use the ffi extension instead of the compiled C extension, the ffi gem must be installed"
  $stderr.puts "       (it is optional, so you must include it in your bundle manually)"
  exit 1
end

require_relative "map_library_name"

module FFI_Yajl
  extend ::FFI::Library

  extend FFI_Yajl::MapLibraryName

  ffi_open_yajl_library

  class YajlCallbacks < ::FFI::Struct
    layout :yajl_null, :pointer,
      :yajl_boolean, :pointer,
      :yajl_integer, :pointer,
      :yajl_double, :pointer,
      :yajl_number, :pointer,
      :yajl_string, :pointer,
      :yajl_start_map, :pointer,
      :yajl_map_key, :pointer,
      :yajl_end_map, :pointer,
      :yajl_start_array, :pointer,
      :yajl_end_array, :pointer
  end

  enum :yajl_status, %i{
    yajl_status_ok
    yajl_status_client_canceled
    yajl_status_insufficient_data
    yajl_status_error
  }

  # FFI::Enums are slow, should remove the rest
  #  enum :yajl_gen_status, [
  #    :yajl_gen_status_ok,
  #    :yajl_gen_keys_must_be_strings,
  #    :yajl_max_depth_exceeded,
  #    :yajl_gen_in_error_state,
  #    :yajl_gen_generation_complete,
  #    :yajl_gen_invalid_number,
  #    :yajl_gen_no_buf,
  #  ]

  enum :yajl_option, [
    :yajl_allow_comments, 0x01,
    :yajl_dont_validate_strings, 0x02,
    :yajl_allow_trailing_garbage, 0x04,
    :yajl_allow_multiple_values, 0x08,
    :yajl_allow_partial_values, 0x10
  ]

  enum :yajl_gen_option, [
    :yajl_gen_beautify, 0x01,
    :yajl_gen_indent_string, 0x02,
    :yajl_gen_print_callback, 0x04,
    :yajl_gen_validate_utf8, 0x08
  ]

  typedef :pointer, :yajl_handle
  typedef :pointer, :yajl_gen

  # yajl uses unsinged char *'s consistently
  typedef :pointer, :ustring_pointer
  typedef :string, :ustring

  # const char *yajl_status_to_string (yajl_status code)
  attach_function :yajl_status_to_string, [ :yajl_status ], :string
  # yajl_handle yajl_alloc(const yajl_callbacks * callbacks, yajl_alloc_funcs * afs, void * ctx)
  attach_function :yajl_alloc, %i{pointer pointer pointer}, :yajl_handle
  # void yajl_free (yajl_handle handle)
  attach_function :yajl_free, [:yajl_handle], :void
  # yajl_status yajl_parse (yajl_handle hand, const unsigned char *jsonText, unsigned int jsonTextLength)
  attach_function :yajl_parse, %i{yajl_handle ustring uint}, :yajl_status
  # yajl_status yajl_parse_complete (yajl_handle hand)
  attach_function :yajl_complete_parse, [:yajl_handle], :yajl_status
  # unsigned char *yajl_get_error (yajl_handle hand, int verbose, const unsigned char *jsonText, unsigned int jsonTextLength)
  attach_function :yajl_get_error, %i{yajl_handle int ustring int}, :ustring
  # void yajl_free_error (yajl_handle hand, unsigned char *str)
  attach_function :yajl_free_error, %i{yajl_handle ustring}, :void

  #
  attach_function :yajl_config, %i{yajl_handle yajl_option varargs}, :int

  attach_function :yajl_gen_config, %i{yajl_gen yajl_gen_option varargs}, :int

  # yajl_gen yajl_gen_alloc (const yajl_alloc_funcs *allocFuncs)
  attach_function :yajl_gen_alloc, [:pointer], :yajl_gen
  # yajl_gen yajl_gen_alloc2 (const yajl_print_t callback, const yajl_gen_config *config, const yajl_alloc_funcs *allocFuncs, void *ctx)
  # attach_function :yajl_gen_alloc2, [:pointer, :pointer, :pointer, :pointer], :yajl_gen
  # void  yajl_gen_free (yajl_gen handle)
  attach_function :yajl_gen_free, [:yajl_gen], :void

  attach_function :yajl_gen_integer, %i{yajl_gen long_long}, :int
  attach_function :yajl_gen_double, %i{yajl_gen double}, :int
  attach_function :yajl_gen_number, %i{yajl_gen ustring int}, :int
  attach_function :yajl_gen_string, %i{yajl_gen ustring int}, :int
  attach_function :yajl_gen_null, [:yajl_gen], :int
  attach_function :yajl_gen_bool, %i{yajl_gen int}, :int
  attach_function :yajl_gen_map_open, [:yajl_gen], :int
  attach_function :yajl_gen_map_close, [:yajl_gen], :int
  attach_function :yajl_gen_array_open, [:yajl_gen], :int
  attach_function :yajl_gen_array_close, [:yajl_gen], :int
  # yajl_gen_status yajl_gen_get_buf (yajl_gen hand, const unsigned char **buf, unsigned int *len)
  attach_function :yajl_gen_get_buf, %i{yajl_gen pointer pointer}, :int
  # void yajl_gen_clear (yajl_gen hand)
  attach_function :yajl_gen_clear, [:yajl_gen], :void
end

require_relative "encoder"
require_relative "parser"

module FFI_Yajl
  class Parser
    require_relative "ffi/parser"
    include FFI_Yajl::FFI::Parser
  end

  class Encoder
    require_relative "ffi/encoder"
    include FFI_Yajl::FFI::Encoder
  end
end
