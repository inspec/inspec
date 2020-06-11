# frozen_string_literal: true
module JSONSchemer
  class CachedRefResolver
    def initialize(&ref_resolver)
      @ref_resolver = ref_resolver
      @cache = {}
    end

    def call(uri)
      @cache[uri] = @ref_resolver.call(uri) unless @cache.key?(uri)
      @cache[uri]
    end
  end
end
