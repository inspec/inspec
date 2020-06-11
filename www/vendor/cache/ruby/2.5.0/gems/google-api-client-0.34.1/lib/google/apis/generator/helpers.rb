module Google
  module Apis
    # @private
    class Generator
      # Methods for validating & normalizing symbols
      module NameHelpers
        KEYWORDS = %w(__ENCODING__ def in self __LINE__ defined? module super __FILE__ do next then BEGIN
                      else nil true END elsif not undef alias end or unless and ensure redo until begin
                      false rescue when break for retry while case if return yield class command)
        PLURAL_METHODS = %w(list search)

        # Check to see if the method name should be plauralized
        # @return [Boolean]
        def pluralize_method?(method_name)
          PLURAL_METHODS.include?(method_name)
        end

        # Check to see if the method is either a keyword or built-in method on object
        # @return [Boolean]
        def reserved?(name)
          keyword?(name) || object_method?(name)
        end

        # Check to see if the name is a ruby keyword
        # @return [Boolean]
        def keyword?(name)
          KEYWORDS.include?(name)
        end

        # Check to see if the method already exists on ruby objects
        # @return [Boolean]
        def object_method?(name)
          Object.new.respond_to?(name)
        end

        # Convert a parameter name to ruby conventions
        # @param [String] name
        # @return [String] updated param name
        def normalize_param_name(name)
          name = name.gsub(/\W/, '_')
          name = name.gsub(/IPv4/, 'Ipv4')
          name = ActiveSupport::Inflector.underscore(name)
          if reserved?(name)
            logger.warn { sprintf('Found reserved keyword \'%1$s\'', name) }
            name += '_'
            logger.warn { sprintf('Changed to \'%1$s\'', name) }
          end
          name
        end

        # Convert a property name to ruby conventions
        # @param [String] name
        # @return [String]
        def normalize_property_name(name)
          name = ActiveSupport::Inflector.underscore(name.gsub(/\W/, '_'))
          if object_method?(name)
            logger.warn { sprintf('Found reserved property \'%1$s\'', name) }
            name += '_prop'
            logger.warn { sprintf('Changed to \'%1$s\'', name) }
          end
          name
        end

        # Converts a scope string into a ruby constant
        # @param [String] url
        #   Url to convert
        # @return [String]
        def constantize_scope(url)
          scope = Addressable::URI.parse(url).path[1..-1].upcase.gsub(/\W/, '_')
          scope = 'AUTH_SCOPE' if scope.nil? || scope.empty?
          scope
        end
      end
    end
  end
end
