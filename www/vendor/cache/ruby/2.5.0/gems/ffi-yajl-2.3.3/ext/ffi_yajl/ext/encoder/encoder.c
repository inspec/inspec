#include <ruby.h>
#include <yajl/yajl_gen.h>

static VALUE mFFI_Yajl, mExt, mEncoder, mEncoder2, cEncodeError;
static VALUE cDate, cTime, cDateTime, cStringIO;
static VALUE cYajl_Gen;

/* FIXME: the json gem does a whole bunch of indirection around monkeypatching...  not sure if we need to as well... */

static VALUE mEncoder_do_yajl_encode(VALUE self, VALUE obj, VALUE yajl_gen_opts, VALUE json_opts) {
  ID sym_ffi_yajl = rb_intern("ffi_yajl");
  VALUE sym_yajl_gen_beautify = ID2SYM(rb_intern("yajl_gen_beautify"));
  VALUE sym_yajl_gen_validate_utf8 = ID2SYM(rb_intern("yajl_gen_validate_utf8"));
  VALUE sym_yajl_gen_indent_string = ID2SYM(rb_intern("yajl_gen_indent_string"));
  yajl_gen yajl_gen;
  const unsigned char *buf;
  size_t len;
  VALUE state;
  VALUE ret;
  VALUE indent_string;
  VALUE rb_yajl_gen;

  yajl_gen = yajl_gen_alloc(NULL);

  if ( rb_hash_aref(yajl_gen_opts, sym_yajl_gen_beautify) == Qtrue ) {
    yajl_gen_config(yajl_gen, yajl_gen_beautify, 1);
  }
  if ( rb_hash_aref(yajl_gen_opts, sym_yajl_gen_validate_utf8) == Qtrue ) {
    yajl_gen_config(yajl_gen, yajl_gen_validate_utf8, 1);
  }

  indent_string = rb_hash_aref(yajl_gen_opts, sym_yajl_gen_indent_string);
  if (indent_string != Qnil) {
    yajl_gen_config(yajl_gen, yajl_gen_indent_string, RSTRING_PTR(indent_string));
  } else {
    yajl_gen_config(yajl_gen, yajl_gen_indent_string, " ");
  }

  state = rb_hash_new();

  rb_hash_aset(state, rb_str_new2("processing_key"), Qfalse);

  rb_hash_aset(state, rb_str_new2("json_opts"), json_opts);

  rb_yajl_gen = Data_Wrap_Struct(cYajl_Gen, NULL, NULL, yajl_gen);

  rb_funcall(obj, sym_ffi_yajl, 2, rb_yajl_gen, state);

  yajl_gen_get_buf(yajl_gen, &buf, &len);

  ret = rb_str_new2((char *)buf);

  yajl_gen_free(yajl_gen);

  return ret;
}

int rb_cHash_ffi_yajl_callback(VALUE key, VALUE val, VALUE extra) {
  ID sym_ffi_yajl = rb_intern("ffi_yajl");
  VALUE state = rb_hash_aref(extra, rb_str_new2("state"));
  VALUE rb_yajl_gen = rb_hash_aref(extra, rb_str_new2("yajl_gen"));

  rb_hash_aset(state, rb_str_new2("processing_key"), Qtrue);
  rb_funcall(key, sym_ffi_yajl, 2, rb_yajl_gen, state);
  rb_hash_aset(state, rb_str_new2("processing_key"), Qfalse);

  rb_funcall(val, sym_ffi_yajl, 2, rb_yajl_gen, state);

  return 0;
}

#define RB_FUNC0(call) rb_funcall(self, rb_intern(call), 0)

/*
 * wrappers around yajl_gen_* functions
 */

/* encode a c-string as a yajl string */
VALUE gen_cstring(VALUE rb_yajl_gen, char *cptr, int len) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);

  if ((status = yajl_gen_string(yajl_gen, (unsigned char *)cptr, len)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), rb_str_new(cptr, len));
  }

  return Qnil;
}

/* encode a ruby-sring as a yajl string */
VALUE gen_string(VALUE rb_yajl_gen, VALUE str) {
  char *cptr = RSTRING_PTR(str);
  int len = RSTRING_LEN(str);

  return gen_cstring(rb_yajl_gen, cptr, len);
}

/* calls #to_s on an object to encode it as a yajl string */
static VALUE gen_string_to_s(VALUE rb_yajl_gen, VALUE self) {
  return gen_string(rb_yajl_gen, RB_FUNC0("to_s"));
}

/* encode a ruby string as a yajl number (also used to embed already-rendered json from #to_json) */
VALUE gen_number(VALUE rb_yajl_gen, VALUE str) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);
  char *cptr = RSTRING_PTR(str);
  int len = RSTRING_LEN(str);

  if ((status = yajl_gen_number(yajl_gen, cptr, len)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), str);
  }

  return Qnil;
}

/* encode hash open */
VALUE gen_map_open(VALUE rb_yajl_gen) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);

  if ((status = yajl_gen_map_open(yajl_gen)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), rb_str_new2("{"));
  }

  return Qnil;
}

/* encode a hash close */
VALUE gen_map_close(VALUE rb_yajl_gen) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);

  if ((status = yajl_gen_map_close(yajl_gen)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), rb_str_new2("}"));
  }

  return Qnil;
}

/* encode an array open */
VALUE gen_array_open(VALUE rb_yajl_gen) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);

  if ((status = yajl_gen_array_open(yajl_gen)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), rb_str_new2("["));
  }

  return Qnil;
}

/* encode an array close */
VALUE gen_array_close(VALUE rb_yajl_gen) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);

  if ((status = yajl_gen_array_close(yajl_gen)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), rb_str_new2("]"));
  }

  return Qnil;
}

/* encode a json null */
VALUE gen_null(VALUE rb_yajl_gen) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);

  if ((status = yajl_gen_null(yajl_gen)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), rb_str_new2("null"));
  }

  return Qnil;
}

/* encode a true value */
VALUE gen_true(VALUE rb_yajl_gen) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);

  if ((status = yajl_gen_bool(yajl_gen, 1)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), rb_str_new2("true"));
  }

  return Qnil;
}

/* encode a false value */
VALUE gen_false(VALUE rb_yajl_gen) {
  yajl_gen_status status;
  struct yajl_gen_t *yajl_gen;
  Data_Get_Struct(rb_yajl_gen, struct yajl_gen_t, yajl_gen);

  if ((status = yajl_gen_bool(yajl_gen, 0)) != yajl_gen_status_ok) {
    rb_funcall(mEncoder2, rb_intern("raise_error_for_status"), 2, INT2FIX(status), rb_str_new2("false"));
  }

  return Qnil;
}

/*
 * <Object>#to_ffi_yajl() method calls
 */

static VALUE rb_cHash_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  if ( rb_hash_aref(state, rb_str_new2("processing_key")) == Qtrue ) {
    gen_string(rb_yajl_gen, rb_funcall(self, rb_intern("to_s"), 0));
  } else {

    /* FIXME: i think this got refactored from something else and it is now pointless --
       should just pass rb_yajl_gen directly instead of this 'extra' hash -- i don't
       *think* this indirection is doing anything useful to mark memory against the GC */

    VALUE extra = rb_hash_new();

    rb_hash_aset(extra, rb_str_new2("yajl_gen"), rb_yajl_gen);

    rb_hash_aset(extra, rb_str_new2("state"), state);

    gen_map_open(rb_yajl_gen);

    rb_hash_foreach(self, rb_cHash_ffi_yajl_callback, extra);

    gen_map_close(rb_yajl_gen);
  }

  return Qnil;
}

static VALUE rb_cArray_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  if ( rb_hash_aref(state, rb_str_new2("processing_key")) == Qtrue ) {
    gen_string(rb_yajl_gen, rb_funcall(self, rb_intern("to_s"), 0));
  } else {
    VALUE val;
    long i;
    ID sym_ffi_yajl = rb_intern("ffi_yajl");

    gen_array_open(rb_yajl_gen);

    for(i=0; i<RARRAY_LEN(self); i++) {
      val = rb_ary_entry(self, i);
      rb_funcall(val, sym_ffi_yajl, 2, rb_yajl_gen, state);
    }

    gen_array_close(rb_yajl_gen);
  }

  return Qnil;
}

static VALUE rb_cNilClass_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  if ( rb_hash_aref(state, rb_str_new2("processing_key")) == Qtrue ) {
    gen_cstring(rb_yajl_gen, "", sizeof("")-1);
  } else {
    gen_null(rb_yajl_gen);
  }

  return Qnil;
}

static VALUE rb_cTrueClass_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  if ( rb_hash_aref(state, rb_str_new2("processing_key")) == Qtrue ) {
    gen_cstring(rb_yajl_gen, "true", sizeof("true")-1);
  } else {
    gen_true(rb_yajl_gen);
  }

  return Qnil;
}

static VALUE rb_cFalseClass_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  if ( rb_hash_aref(state, rb_str_new2("processing_key")) == Qtrue ) {
    gen_cstring(rb_yajl_gen, "false", sizeof("false")-1);
  } else {
    gen_false(rb_yajl_gen);
  }

  return Qnil;
}

static VALUE rb_cFixnum_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  VALUE str = rb_funcall(self, rb_intern("to_s"), 0);
  char *cptr = RSTRING_PTR(str);

  if (memcmp(cptr, "NaN", sizeof("NaN")) == 0 || memcmp(cptr, "Infinity", sizeof("Infinity")) == 0 || memcmp(cptr, "-Infinity", sizeof("-Infinity")) == 0) {
    rb_raise(cEncodeError, "'%s' is an invalid number", cptr);
  }

  if ( rb_hash_aref(state, rb_str_new2("processing_key")) == Qtrue ) {
    gen_string(rb_yajl_gen, str);
  } else {
    gen_number(rb_yajl_gen, str);
  }

  return Qnil;
}

static VALUE rb_cBignum_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  return rb_cFixnum_ffi_yajl(self, rb_yajl_gen, state);
}

static VALUE rb_cFloat_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  return rb_cFixnum_ffi_yajl(self, rb_yajl_gen, state);
}

static VALUE rb_cString_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  return gen_string(rb_yajl_gen, self);
}

static VALUE rb_cSymbol_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  return gen_string_to_s(rb_yajl_gen, self);
}

static VALUE rb_cDate_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  return gen_string_to_s(rb_yajl_gen, self);
}

static VALUE rb_cTime_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  ID sym_strftime = rb_intern("strftime");
  VALUE str = rb_funcall(self, sym_strftime, 1, rb_str_new2("%Y-%m-%d %H:%M:%S %z"));

  return gen_string(rb_yajl_gen, str);
}

static VALUE rb_cStringIO_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  return gen_string(rb_yajl_gen, RB_FUNC0("read"));
}

static VALUE rb_cDateTime_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  return gen_string_to_s(rb_yajl_gen, self);
}

static VALUE rb_cObject_ffi_yajl(VALUE self, VALUE rb_yajl_gen, VALUE state) {
  ID sym_to_json = rb_intern("to_json");
  if ( rb_hash_aref(state, rb_str_new2("processing_key")) != Qtrue && rb_respond_to(self, sym_to_json) ) {
    VALUE json_opts = rb_hash_aref(state, rb_str_new2("json_opts"));
    VALUE str = rb_funcall(self, sym_to_json, 1, json_opts);

    gen_number(rb_yajl_gen, str);
  } else {
    gen_string_to_s(rb_yajl_gen, self);
  }

  return Qnil;
}

void Init_encoder() {
  mFFI_Yajl = rb_define_module("FFI_Yajl");
  mEncoder2 = rb_define_class_under(mFFI_Yajl, "Encoder", rb_cObject);
  cEncodeError = rb_define_class_under(mFFI_Yajl, "EncodeError", rb_eStandardError);
  mExt = rb_define_module_under(mFFI_Yajl, "Ext");
  mEncoder = rb_define_module_under(mExt, "Encoder");
  cYajl_Gen = rb_define_class_under(mEncoder, "YajlGen", rb_cObject);
  rb_define_method(mEncoder, "do_yajl_encode", mEncoder_do_yajl_encode, 3);

  /* use rb_const_get instead of rb_define_class so that we don't get superclass mismatches */
  ID sym_Date = rb_intern("Date");
  cDate = rb_const_get(rb_cObject, sym_Date);
  ID sym_Time = rb_intern("Time");
  cTime = rb_const_get(rb_cObject, sym_Time);
  ID sym_DateTime = rb_intern("DateTime");
  cDateTime = rb_const_get(rb_cObject, sym_DateTime);
  ID sym_StringIO = rb_intern("StringIO");
  cStringIO = rb_const_get(rb_cObject, sym_StringIO);

  rb_define_method(rb_cHash, "ffi_yajl", rb_cHash_ffi_yajl, 2);
  rb_define_method(rb_cArray, "ffi_yajl", rb_cArray_ffi_yajl, 2);
  rb_define_method(rb_cNilClass, "ffi_yajl", rb_cNilClass_ffi_yajl, 2);
  rb_define_method(rb_cTrueClass, "ffi_yajl", rb_cTrueClass_ffi_yajl, 2);
  rb_define_method(rb_cFalseClass, "ffi_yajl", rb_cFalseClass_ffi_yajl, 2);
#ifdef rb_cFixnum /* ruby < 2.4 */
  rb_define_method(rb_cFixnum, "ffi_yajl", rb_cFixnum_ffi_yajl, 2);
  rb_define_method(rb_cBignum, "ffi_yajl", rb_cBignum_ffi_yajl, 2);
#else
  rb_define_method(rb_cInteger, "ffi_yajl", rb_cFixnum_ffi_yajl, 2);
#endif
  rb_define_method(rb_cFloat, "ffi_yajl", rb_cFloat_ffi_yajl, 2);
  rb_define_method(rb_cString, "ffi_yajl", rb_cString_ffi_yajl, 2);
  rb_define_method(rb_cSymbol, "ffi_yajl", rb_cSymbol_ffi_yajl, 2);
  rb_define_method(cDate, "ffi_yajl", rb_cDate_ffi_yajl, 2);
  rb_define_method(cTime, "ffi_yajl", rb_cTime_ffi_yajl, 2);
  rb_define_method(cDateTime, "ffi_yajl", rb_cDateTime_ffi_yajl, 2);
  rb_define_method(cStringIO, "ffi_yajl", rb_cStringIO_ffi_yajl, 2);
  rb_define_method(rb_cObject, "ffi_yajl", rb_cObject_ffi_yajl, 2);
}
