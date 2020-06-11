#include <ruby.h>
#include <yajl/yajl_parse.h>

#ifdef HAVE_RUBY_ENCODING_H
#include <ruby/encoding.h>
static rb_encoding *utf8Encoding;
#endif

static VALUE mFFI_Yajl, mExt, mParser, cParseError;

typedef struct {
  VALUE self;
  int symbolizeKeys;
  int uniqueKeyChecking;
} CTX;

void set_value(CTX *ctx, VALUE val) {
  VALUE stack = rb_ivar_get(ctx->self, rb_intern("stack"));
  VALUE key = rb_ivar_get(ctx->self, rb_intern("key"));
  long len = RARRAY_LEN(stack);
  VALUE last = rb_ary_entry(stack, len-1);
  switch (TYPE(last)) {
    case T_ARRAY:
      rb_ary_push(last, val);
      break;
    case T_HASH:
      if ( ctx->uniqueKeyChecking ) {
        ID sym_has_key = rb_intern("has_key?");
        if ( rb_funcall(last, sym_has_key, 1, key) == Qtrue ) {
          rb_raise(cParseError, "repeated key: %s", RSTRING_PTR(key));
        }
      }
      rb_hash_aset(last, key, val);
      break;
    default:
      rb_ary_push(stack, val);
      break;
  }
}

void set_key(CTX *ctx, VALUE key) {
  rb_ivar_set(ctx->self, rb_intern("key"), key);
}

void start_object(CTX *ctx, VALUE obj) {
  VALUE key_stack = rb_ivar_get(ctx->self, rb_intern("key_stack"));
  VALUE key       = rb_ivar_get(ctx->self, rb_intern("key"));
  VALUE stack     = rb_ivar_get(ctx->self, rb_intern("stack"));

  rb_ary_push(key_stack, key);
  rb_ary_push(stack, obj);
}

void end_object(CTX *ctx) {
  VALUE key_stack = rb_ivar_get(ctx->self, rb_intern("key_stack"));
  VALUE stack = rb_ivar_get(ctx->self, rb_intern("stack"));
  rb_ivar_set(ctx->self, rb_intern("key"), rb_ary_pop(key_stack));
  if ( RARRAY_LEN(stack) > 1 ) {
    set_value(ctx, rb_ary_pop(stack));
  }
}

int null_callback(void *ctx) {
  set_value(ctx, Qnil);
  return 1;
}

int boolean_callback(void *ctx, int boolean) {
  set_value(ctx, boolean ? Qtrue : Qfalse);
  return 1;
}

int integer_callback(void *ctx, long long intVal) {
  set_value(ctx, LONG2NUM(intVal));
  return 1;
}

int double_callback(void *ctx, double doubleVal) {
  set_value(ctx, rb_float_new(doubleVal));
  return 1;
}

int number_callback(void *ctx, const char *numberVal, size_t numberLen) {
  char *buf = (char *)malloc(numberLen+1);
  buf[numberLen] = 0;
  memcpy(buf, numberVal, numberLen);
  if (memchr(buf, '.', numberLen) ||
    memchr(buf, 'e', numberLen) ||
    memchr(buf, 'E', numberLen)) {
    set_value(ctx, rb_float_new(strtod(buf, NULL)));
  } else {
    set_value(ctx, rb_cstr2inum(buf, 10));
  }
  free(buf);
  return 1;
}

int string_callback(void *ctx, const unsigned char *stringVal, size_t stringLen) {
  VALUE str = rb_str_new((const char *)stringVal, stringLen);
#ifdef HAVE_RUBY_ENCODING_H
  rb_encoding *default_internal_enc = rb_default_internal_encoding();
  rb_enc_associate(str, utf8Encoding);
  if (default_internal_enc) {
    str = rb_str_export_to_enc(str, default_internal_enc);
  }
#endif
  set_value(ctx,str);
  return 1;
}

int start_map_callback(void *ctx) {
  start_object(ctx,rb_hash_new());
  return 1;
}

int map_key_callback(void *ctx, const unsigned char *stringVal, size_t stringLen) {
  VALUE key;
#ifdef HAVE_RUBY_ENCODING_H
  rb_encoding *default_internal_enc;
#endif

  if ( ((CTX *)ctx)->symbolizeKeys ) {
#ifdef HAVE_RUBY_ENCODING_H
    ID id = rb_intern3((const char *)stringVal, stringLen, utf8Encoding);
    key = ID2SYM(id);
#else
    VALUE str = rb_str_new((const char *)stringVal, stringLen);
    key = rb_str_intern(str);
#endif
  } else {
    key = rb_str_new((const char *)stringVal, stringLen);
#ifdef HAVE_RUBY_ENCODING_H
    default_internal_enc = rb_default_internal_encoding();
    rb_enc_associate(key, utf8Encoding);
    if (default_internal_enc) {
      key = rb_str_export_to_enc(key, default_internal_enc);
    }
#endif
  }
  set_key(ctx, key);
  return 1;
}

int end_map_callback(void *ctx) {
  end_object(ctx);
  return 1;
}

int start_array_callback(void *ctx) {
  start_object(ctx,rb_ary_new());
  return 1;
}

int end_array_callback(void *ctx) {
  end_object(ctx);
  return 1;
}

static yajl_callbacks callbacks = {
  null_callback,
  boolean_callback,
  integer_callback,
  double_callback,
  number_callback,
  string_callback,
  start_map_callback,
  map_key_callback,
  end_map_callback,
  start_array_callback,
  end_array_callback,
};

int get_opts_key(VALUE self, const char *key) {
  VALUE opts = rb_iv_get(self, "@opts");
  if (TYPE(opts) != T_HASH) {
    rb_raise(rb_eTypeError, "opts is not a valid hash");
  }
  return rb_hash_aref(opts, ID2SYM(rb_intern(key))) == Qtrue;
}

static VALUE mParser_do_yajl_parse(VALUE self, VALUE str, VALUE yajl_opts) {
  yajl_handle hand;
  yajl_status stat;
  unsigned char *err;
  volatile CTX ctx;

  rb_ivar_set(self, rb_intern("key"), Qnil);
  rb_ivar_set(self, rb_intern("stack"), rb_ary_new());
  rb_ivar_set(self, rb_intern("key_stack"), rb_ary_new());

  ctx.self = self;
  ctx.symbolizeKeys = get_opts_key(self, "symbolize_keys");
  ctx.uniqueKeyChecking = get_opts_key(self, "unique_key_checking");

  hand = yajl_alloc(&callbacks, NULL, (void *)&ctx);

  if (rb_hash_aref(yajl_opts, ID2SYM(rb_intern("yajl_allow_comments"))) == Qtrue) {
    yajl_config(hand, yajl_allow_comments, 1);
  }
  if (rb_hash_aref(yajl_opts, ID2SYM(rb_intern("yajl_dont_validate_strings"))) == Qtrue) {
    yajl_config(hand, yajl_dont_validate_strings, 1);
  }
  if (rb_hash_aref(yajl_opts, ID2SYM(rb_intern("yajl_allow_trailing_garbage"))) == Qtrue) {
    yajl_config(hand, yajl_allow_trailing_garbage, 1);
  }
  if (rb_hash_aref(yajl_opts, ID2SYM(rb_intern("yajl_allow_multiple_values"))) == Qtrue) {
    yajl_config(hand, yajl_allow_multiple_values, 1);
  }
  if (rb_hash_aref(yajl_opts, ID2SYM(rb_intern("yajl_allow_partial_values"))) == Qtrue) {
    yajl_config(hand, yajl_allow_partial_values, 1);
  }

  if ((stat = yajl_parse(hand, (unsigned char *)RSTRING_PTR(str), RSTRING_LEN(str))) != yajl_status_ok) {
    err = yajl_get_error(hand, 1, (unsigned char *)RSTRING_PTR(str), RSTRING_LEN(str));
    goto raise;
  }
  if ((stat = yajl_complete_parse(hand)) != yajl_status_ok) {
    err = yajl_get_error(hand, 1, (unsigned char *)RSTRING_PTR(str), RSTRING_LEN(str));
    goto raise;
  }
  yajl_free(hand);
  return rb_ary_pop(rb_ivar_get(self, rb_intern("stack")));

raise:
  if (hand) {
    yajl_free(hand);
  }
  rb_raise(cParseError, "%s", err);
}

void Init_parser() {
  mFFI_Yajl = rb_define_module("FFI_Yajl");
  cParseError = rb_define_class_under(mFFI_Yajl, "ParseError", rb_eStandardError);
  mExt = rb_define_module_under(mFFI_Yajl, "Ext");
  mParser = rb_define_module_under(mExt, "Parser");
  rb_define_method(mParser, "do_yajl_parse", mParser_do_yajl_parse, 2);
#ifdef HAVE_RUBY_ENCODING_H
  utf8Encoding = rb_utf8_encoding();
#endif
}
