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

require "libyajl2"

# Mixin for use in finding the right yajl library on the system.  The 'caller'
# needs to also mixin either the FFI module or the DLopen module.  Those are
# deliberately not mixed in to avoid loading the dlopen module in the ffi
# codepath (which fails on jruby which does not have that C extension).

module FFI_Yajl
  module MapLibraryName
    private

    # Stub for tests to override the host_os
    #
    # @api private
    # @return [Array<String>] lower case ruby host_os string
    def host_os
      RbConfig::CONFIG["host_os"].downcase
    end

    # Array of yajl library names on the platform.  Some platforms like Windows
    # and Mac may have different names/extensions.
    #
    # @api private
    # @return [Array<String>] Array of yajl library names for platform
    def library_names
      case host_os
      when /mingw|mswin/
        [ "libyajl.so", "yajl.dll" ]
      when /cygwin/
        [ "libyajl.so", "cygyajl.dll" ]
      when /darwin/
        [ "libyajl.bundle", "libyajl.dylib" ]
      else
        [ "libyajl.so" ]
      end
    end

    # Array of yajl library names prepended with the libyajl2 path to use to
    # load those directly and bypass the system libyajl by default.  Since
    # these are full paths, this API checks to ensure that the file exists on
    # the filesystem.  May return an empty array.
    #
    # @api private
    # @return [Array<String>] Array of full paths to libyajl2 gem libraries
    def expanded_library_names
      library_names.map do |libname|
        pathname = File.expand_path(File.join(Libyajl2.opt_path, libname))
        pathname if File.file?(pathname)
      end.compact
    end

    # Iterate across the expanded library names in the libyajl2-gem and then
    # attempt to load the system libraries.  Uses the native dlopen extension
    # that ships in this gem.
    #
    # @api private
    def dlopen_yajl_library
      found = false
      ( expanded_library_names + library_names ).each do |libname|
        begin
          dlopen(libname)
          found = true
          break
        rescue ArgumentError
        end
      end
      raise "cannot find yajl library for platform" unless found
    end

    # Iterate across the expanded library names in the libyajl2-gem and attempt
    # to load them.  If they are missing just use `ffi_lib 'yajl'` to accept
    # the FFI default algorithm to find the library.
    #
    # @api private
    def ffi_open_yajl_library
      found = false
      expanded_library_names.each do |libname|
        begin
          ffi_lib libname
          found = true
        rescue LoadError
        end
      end
      ffi_lib "yajl" unless found
    end
  end
end
