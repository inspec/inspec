# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann
module ObjectTraverser
  def extract_value(keys, value)
    key = keys.shift
    return nil if key.nil? || value.nil?

    # if value is an array, iterate over each child
    if value.is_a?(Array)
      value = value.map { |i|
        extract_value([key], i)
      }
    else
      value = value[key.to_s].nil? ? nil : value[key.to_s]
    end

    # if there are no more keys, just return the value
    return value if keys.first.nil?
    # if there are more keys, extract more
    extract_value(keys.clone, value)
  end
end
