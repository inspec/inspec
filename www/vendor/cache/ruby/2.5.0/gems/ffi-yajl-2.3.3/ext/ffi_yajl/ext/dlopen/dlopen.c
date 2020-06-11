#include <ruby.h>

#if defined(HAVE_DLFCN_H)
# include <dlfcn.h>
#ifndef RTLD_LAZY
#define RTLD_LAZY 0
#endif
#ifndef RTLD_GLOBAL
#define RTLD_GLOBAL 0
#endif
#ifndef RTLD_NOW
#define RTLD_NOW 0
#endif
#else
# if defined(_WIN32)
#   include <windows.h>
#   define dlopen(name,flag) ((void*)LoadLibrary(name))
#   define dlerror() strerror(rb_w32_map_errno(GetLastError()))
#   define dlsym(handle,name) ((void*)GetProcAddress((handle),(name)))
#   define RTLD_LAZY -1
#   define RTLD_NOW  -1
#   define RTLD_GLOBAL -1
# endif
#endif

static VALUE mFFI_Yajl, mDlopen, mExt;

static VALUE mDlopen_dlopen(VALUE self, VALUE file) {
  if (dlopen(RSTRING_PTR(file), RTLD_NOW|RTLD_GLOBAL) == NULL) {
    rb_raise(rb_eArgError, "%s", dlerror());
  }
  return Qnil;
}

void Init_dlopen() {
  mFFI_Yajl = rb_define_module("FFI_Yajl");
  mExt = rb_define_module_under(mFFI_Yajl, "Ext");
  mDlopen = rb_define_module_under(mExt, "Dlopen");
  rb_define_method(mDlopen, "dlopen", mDlopen_dlopen, 1);
}
