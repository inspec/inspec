unless Time.method_defined?(:floor)
  class Time
    def floor(ndigits = 0)
      self - subsec.modulo(10**-ndigits)
    end
  end
end
