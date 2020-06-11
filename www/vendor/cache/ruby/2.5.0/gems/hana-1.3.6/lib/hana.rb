# frozen_string_literal: true

module Hana
  VERSION = '1.3.6'

  class Pointer
    include Enumerable

    class Exception < StandardError
    end

    class FormatError < Exception
    end

    def initialize path
      @path = Pointer.parse path
    end

    def each(&block); @path.each(&block); end

    def eval object
      Pointer.eval @path, object
    end

    ESC = {'^/' => '/', '^^' => '^', '~0' => '~', '~1' => '/'} # :nodoc:

    def self.eval list, object
      list.inject(object) { |o, part|
        return nil unless o

        if Array === o
          raise Patch::IndexError unless part =~ /\A(?:\d|[1-9]\d+)\Z/
          part = part.to_i
        end
        o[part]
      }
    end

    def self.parse path
      return [''] if path == '/'
      return []   if path == ''

      unless path.start_with? '/'
        raise FormatError, "JSON Pointer should start with a slash"
      end

      parts = path.sub(/^\//, '').split(/(?<!\^)\//).each { |part|
        part.gsub!(/\^[\/^]|~[01]/) { |m| ESC[m] }
      }

      parts.push("") if path[-1] == '/'
      parts
    end
  end

  class Patch
    class Exception < StandardError
    end

    class FailedTestException < Exception
      attr_accessor :path, :value

      def initialize path, value
        super "expected #{value} at #{path}"
        @path  = path
        @value = value
      end
    end

    class OutOfBoundsException < Exception
    end

    class ObjectOperationOnArrayException < Exception
    end

    class IndexError < Exception
    end

    class MissingTargetException < Exception
    end

    class InvalidPath < Exception
    end

    def initialize is
      @is = is
    end

    VALID = Hash[%w{ add move test replace remove copy }.map { |x| [x,x]}] # :nodoc:

    def apply doc
      @is.inject(doc) { |d, ins|
        send VALID.fetch(ins[OP].strip) { |k|
          raise Exception, "bad method `#{k}`"
        }, ins, d
      }
    end

    private

    PATH  = 'path' # :nodoc:
    FROM  = 'from' # :nodoc:
    VALUE = 'value' # :nodoc:
    OP    = 'op' # :nodoc:

    def add ins, doc
      unless ins.key?('path')
        raise Hana::Patch::InvalidPath, "missing 'path' parameter"
      end

      path = ins['path']

      unless path
        raise Hana::Patch::InvalidPath, "null is not valid value for 'path'"
      end

      list = Pointer.parse path
      key  = list.pop
      dest = Pointer.eval list, doc
      obj  = ins.fetch VALUE

      raise(MissingTargetException, ins['path']) unless dest

      if key
        add_op dest, key, obj
      else
        if doc.equal? dest
          doc = obj
        else
          dest.replace obj
        end
      end
      doc
    end

    def move ins, doc
      from     = Pointer.parse ins.fetch FROM
      to       = Pointer.parse ins[PATH]
      from_key = from.pop
      key      = to.pop
      src      = Pointer.eval from, doc
      dest     = Pointer.eval to, doc

      unless Array === src
        unless src.key? from_key
          raise Hana::Patch::MissingTargetException
        end
      end

      obj = rm_op src, from_key
      add_op dest, key, obj
      doc
    end

    def copy ins, doc
      from     = Pointer.parse ins.fetch FROM
      to       = Pointer.parse ins[PATH]
      from_key = from.pop
      key      = to.pop
      src      = Pointer.eval from, doc
      dest     = Pointer.eval to, doc

      if Array === src
        raise Patch::IndexError unless from_key =~ /\A\d+\Z/
        obj = src.fetch from_key.to_i
      else
        begin
          obj = src.fetch from_key
        rescue KeyError => e
          raise Hana::Patch::MissingTargetException, e.message
        end
      end

      add_op dest, key, obj
      doc
    end

    def test ins, doc
      expected = Pointer.new(ins[PATH]).eval doc

      unless expected == ins.fetch(VALUE)
        raise FailedTestException.new(ins[VALUE], ins[PATH])
      end
      doc
    end

    def replace ins, doc
      list = Pointer.parse ins[PATH]
      key  = list.pop
      obj  = Pointer.eval list, doc

      return ins.fetch VALUE unless key

      if Array === obj
        raise Patch::IndexError unless key =~ /\A\d+\Z/
        obj[key.to_i] = ins.fetch VALUE
      else
        raise Patch::MissingTargetException unless obj
        obj[key] = ins.fetch VALUE
      end
      doc
    end

    def remove ins, doc
      list = Pointer.parse ins[PATH]
      key  = list.pop
      obj  = Pointer.eval list, doc
      rm_op obj, key
      doc
    end

    def check_index obj, key
      return -1 if key == '-'

      raise ObjectOperationOnArrayException unless key =~ /\A-?\d+\Z/
      idx = key.to_i
      raise OutOfBoundsException if idx > obj.length || idx < 0
      idx
    end

    def add_op dest, key, obj
      if Array === dest
        dest.insert check_index(dest, key), obj
      else
        dest[key] = obj
      end
    end

    def rm_op obj, key
      if Array === obj
        raise Patch::IndexError unless key =~ /\A\d+\Z/
        key = key.to_i
        raise Patch::OutOfBoundsException if key >= obj.length
        obj.delete_at key
      else
        raise Patch::IndexError unless obj&.key? key
        obj.delete key
      end
    end
  end
end
