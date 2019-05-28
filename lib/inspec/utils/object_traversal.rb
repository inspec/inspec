# author: Dominik Richter
# author: Christoph Hartmann
module ObjectTraverser
  def extract_value(keys, value)
    return nil if value.nil?

    key = keys.shift
    return nil if key.nil?

    # if the current value is not a Hash or Array, it is undefined
    # behavior so value will be assigned nil by default.
    value = if value.is_a?(Array)
              extract_from_array(key, value)
            elsif value.is_a?(Hash)
              extract_from_hash(key, value)
            end

    # if there are no more keys, just return the value
    return value if keys.first.nil?
    # if there are more keys, extract more
    extract_value(keys.clone, value)
  end

  private

  # If the values to return from is an Array, allow returning by index.
  # Otherwise, support methods on the Array itself.
  def extract_from_array(key, value)
    if key.is_a?(Integer)
      value[key]
    elsif value.respond_to?(key.to_sym)
      value.send(key.to_sym)
    end
  end

  # for Hashes, try to return the value by the key.
  # We first try to find by the raw key before we stringify
  # if the keys themselves are symbols, for example.
  #
  # This will return nil default if we can't find the key.
  def extract_from_hash(key, value)
    if value.key?(key)
      value[key]
    elsif value.key?(key.to_s)
      value[key.to_s]
    end
  end
end
