unless Time.method_defined?(:ceil)
  class Time
    def ceil(ndigits = 0)
      # Imitate value.ceil(ndigits) which does not exist in Ruby < 2.4
      sceil = (subsec * 10**ndigits).ceil.to_r / 10**ndigits
      change = sceil - subsec
      self + change
    end
  end
end
