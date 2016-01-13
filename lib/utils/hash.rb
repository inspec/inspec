# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

class ::Hash
  # Inspired by: http://stackoverflow.com/a/9381776
  def deep_merge(second)
    merger = proc { |_key, v1, v2|
      v1.is_a?(Hash) && v2.is_a?(Hash) ? v1.merge(v2, &merger) : v2
    }
    merge(second, &merger)
  end

  # converts a deep hash into a flat hash
  # hash = {
  #   'a' => 1,
  #   'b' => {'c' => 2},
  # }
  # hash.smash # => {"a"=>1, "b-c"=>2}
  def smash(prefix = nil)
    inject({}) do |acc, (key, value)|
      index = prefix.to_s + key.to_s
      if value.is_a?(Hash)
        acc.merge(value.smash(index + '-'))
      else
        acc.merge(index => value)
      end
    end
  end

  # deep check if all values are contained
  def contains(contains)
    hash = smash
    contains = contains.smash

    contains.each do |key, val|
      return false if hash[key] != val
    end
    true
  end
end
