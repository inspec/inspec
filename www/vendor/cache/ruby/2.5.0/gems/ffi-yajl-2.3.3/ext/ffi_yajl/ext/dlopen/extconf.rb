# rubocop:disable Style/GlobalVars
require "mkmf"
require "rubygems"

RbConfig::MAKEFILE_CONFIG["CC"] = ENV["CC"] if ENV["CC"]

puts $CFLAGS
puts $LDFLAGS

have_header("dlfcn.h")

have_library("dl", "dlopen")

dir_config "dlopen"

create_makefile "ffi_yajl/ext/dlopen"
