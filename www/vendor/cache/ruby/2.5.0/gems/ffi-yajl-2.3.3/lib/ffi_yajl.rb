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

#
# Precedence:
#
# - The FORCE_FFI_YAJL env var takes precedence over everything else, the user
#   theoretically knows best
# - Java always gets ffi because jruby only supports ffi
# - There is a conflict between loading libyajl 1.x and 2.x in the same VM
#   process (on a fundamental basis, simply guru medidate about how the
#   c-symbols work if you load both libs).  For some reason the ffi interface
#   seems to work fine sometimes (i'm not sure how) so we fall back to that--
#   this is much more likely to be converted into a raise than to have the warn
#   dropped, so don't bother asking for that.
# - Then we try the c-ext and rescue into ffi that fails
#
if ENV["FORCE_FFI_YAJL"] == "ext"
  require_relative "ffi_yajl/ext"
elsif ENV["FORCE_FFI_YAJL"] == "ffi"
  require_relative "ffi_yajl/ffi"
elsif RUBY_PLATFORM == "java"
  require_relative "ffi_yajl/ffi"
else
  begin
    require_relative "ffi_yajl/ext"
  rescue LoadError
    warn "failed to load the ffi-yajl c-extension, falling back to ffi interface"
    require_relative "ffi_yajl/ffi"
  end
end
