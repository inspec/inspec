unless Complex.method_defined?(:<=>)
  class Complex
    def <=>(other)
      return nil unless imaginary.zero?

      if other.is_a?(Complex)
        other.imaginary.zero? ? real <=> other.real : nil
      else
        real <=> other
      end
    end
  end
end
