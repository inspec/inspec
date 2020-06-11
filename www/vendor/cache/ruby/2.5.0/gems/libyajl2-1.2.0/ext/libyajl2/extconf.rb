
require 'rbconfig'
require 'fileutils'

if ENV["USE_SYSTEM_LIBYAJL2"]
  File.open("Makefile", "w+") do |f|
    f.write <<EOF
# dummy Makefile when we're not really installing
all:
\ttrue

install:
\ttrue
EOF
  end
  exit(0)
end

module Libyajl2Build
  class BuildError < StandardError; end

  LIBYAJL2_VENDOR_DIR = File.expand_path("../vendor/yajl", __FILE__).freeze

  PREFIX = File.expand_path("../../../lib/libyajl2/vendored-libyajl2", __FILE__).freeze

  def self.windows?
    !!(RUBY_PLATFORM =~ /mswin|mingw|cygwin|windows/)
  end

  def self.libyajl2_vendor_dir
    LIBYAJL2_VENDOR_DIR
  end

  def self.prefix
    PREFIX
  end

  def self.deps
    require 'mkmf'
  end

  def self.setup_env
    RbConfig::MAKEFILE_CONFIG['CC'] = ENV['CC'] if ENV['CC']

    # set some sane defaults
    if RbConfig::MAKEFILE_CONFIG['CC'] =~ /gcc|clang/
      # magic flags copied from upstream yajl build system (-std=c99 is necessary for older gcc)
      $CFLAGS << " -std=c99 -pedantic -Wpointer-arith -Wno-format-y2k -Wstrict-prototypes -Wmissing-declarations -Wnested-externs -Wextra  -Wundef -Wwrite-strings -Wold-style-definition -Wredundant-decls -Wno-unused-parameter -Wno-sign-compare -Wmissing-prototypes"
      $CFLAGS << " -O2"  # match what the upstream uses for optimization

      # create the implib on windows
      if windows?
        $LDFLAGS << " -Wl,--export-all-symbols -Wl,--enable-auto-import -Wl,--out-implib=libyajldll.a -Wl,--output-def,libyajl.def"
      end
    end

    $CFLAGS << " -DNDEBUG"
  end

  def self.makemakefiles
    if RUBY_PLATFORM == "java"
      File.open("Makefile", "w+") do |f|
        f.write <<EOF
CC = gcc
TARGET = libyajl
DLLIB = $(TARGET).so
CFLAGS =  -I. -I../../../../ext/libyajl2 -fPIC -O3 -fno-fast-math -ggdb3 -Wall -Wextra -Wno-unused-parameter -Wno-parentheses -Wno-long-long -Wno-missing-field-initializers -Wunused-variable -Wpointer-arith -Wwrite-strings -Wdeclaration-after-statement -Wimplicit-function-declaration  -fPIC -std=c99 -pedantic -Wpointer-arith -Wno-format-y2k -Wstrict-prototypes -Wmissing-declarations -Wnested-externs -Wextra  -Wundef -Wwrite-strings -Wold-style-definition -Wredundant-decls -Wno-unused-parameter -Wno-sign-compare -Wmissing-prototypes -O2 -DNDEBUG
LDFLAGS = -L. -fstack-protector -rdynamic
#LIBS = -lpthread -ldl -lcrypt -lm -lc
LIBS = -lpthread -ldl -lm -lc
OBJS = yajl_alloc.o yajl_tree.o yajl_gen.o yajl_buf.o yajl.o yajl_encode.o yajl_lex.o yajl_parser.o yajl_version.o

all: $(DLLIB)

$(DLLIB): $(OBJS)
\t$(CC) -shared -o $(DLLIB) $(OBJS) $(LDFLAGS) $(LIBS)

%.o: ../../../../ext/libyajl2/%.c
\t$(COMPILE.c) $(OUTPUT_OPTION) $<

install:
\tmkdir -p #{prefix}/lib
\tcp $(DLLIB) #{prefix}/lib/$(DLLIB)
\tmkdir -p #{prefix}/include/yajl
\tcp yajl/*.h #{prefix}/include/yajl
EOF
      end
    else
      deps
      setup_env
      dir_config("libyajl")
      create_makefile("libyajl")

      # on windows the Makefile will try to export Init_libyajl which is wrong because we aren't a ruby lib.
      # i could not figure out how to tell mkmf.rb to stop being so helpful, so instead will just patch it here.
      if windows?
        makefile = IO.read("Makefile")
        makefile.gsub!(/\$\(DEFFILE\)/, '')
        File.open("Makefile", 'w+') {|f| f.write(makefile) }
      end

      system("pwd")
      # we cheat and build it right away...
      system("make >make.out 2>&1") || raise # rubinius doesn't like the output this generates
      # ...so we can hack up what install does later and copy over the include files

      File.open("Makefile", "w+") do |f|
        f.write <<EOF
TARGET = libyajl
DLLIB = $(TARGET).#{RbConfig::MAKEFILE_CONFIG['DLEXT']}
all:

EOF
        if windows?
          f.write <<EOF
install:
\tmkdir -p #{prefix}/lib
\tcp libyajl.so #{prefix}/lib/libyajl.so
\tcp libyajldll.a #{prefix}/lib/libyajldll.a
\tcp libyajl.def #{prefix}/lib/libyajl.def
\tmkdir -p #{prefix}/include/yajl
\tcp yajl/*.h #{prefix}/include/yajl
EOF
        else
          f.write <<EOF
install:
\tmkdir -p #{prefix}/lib
\tcp $(DLLIB) #{prefix}/lib/$(DLLIB)
\tmkdir -p #{prefix}/include/yajl
\tcp yajl/*.h #{prefix}/include/yajl
EOF
        end
      end
    end
  end
end

Libyajl2Build.makemakefiles
