require 'tins/thread_local'

module Tins
  module HashSymbolizeKeysRecursive
    extend Tins::ThreadLocal

    thread_local :seen

    def symbolize_keys_recursive(circular: nil)
      self.seen = {}
      _symbolize_keys_recursive(self, circular: circular)
    ensure
      self.seen = nil
    end

    def symbolize_keys_recursive!(circular: nil)
      replace symbolize_keys_recursive(circular: circular)
    end

    private

    def _symbolize_keys_recursive(object, circular: nil)
      case
      when seen[object.__id__]
        object = circular
      when Hash === object
        seen[object.__id__] = true
        new_object = object.class.new
        seen[new_object.__id__] = true
        object.each do |k, v|
          new_object[k.to_s.to_sym] = _symbolize_keys_recursive(v, circular: circular)
        end
        object = new_object
      when Array === object
        seen[object.__id__] = true
        new_object = object.class.new(object.size)
        seen[new_object.__id__] = true
        object.each_with_index do |v, i|
          new_object[i] = _symbolize_keys_recursive(v, circular: circular)
        end
        object = new_object
      end
      object
    end
  end
end

require 'tins/alias'
