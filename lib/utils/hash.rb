# encoding: utf-8
# Inspired by: http://stackoverflow.com/a/9381776
# author: Dominik Richter
# author: Christoph Hartmann

class ::Hash
  def deep_merge(second)
    merger = proc { |_key, v1, v2|
      v1.is_a?(Hash) && v2.is_a?(Hash) ? v1.merge(v2, &merger) : v2
    }
    merge(second, &merger)
  end
end
