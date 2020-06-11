require 'spec_helper'

require 'ffi'

module LibyajlTestFFI
  extend ::FFI::Library

  libname = ::FFI.map_library_name("yajl")
  libpath = File.expand_path(File.join(Libyajl2.opt_path, libname))

  ffi_lib libpath

  attach_function :yajl_gen_alloc, [:pointer], :pointer
end

describe "when loading the library with FFI" do
  it "we can get back an FFI::Pointer from yajl_gen_alloc" do
    expect(LibyajlTestFFI.yajl_gen_alloc(nil)).to be_an_instance_of(FFI::Pointer)
  end
end
