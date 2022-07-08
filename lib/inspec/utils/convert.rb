module Converter
  # convert the value to an integer if we have numbers only
  # otherwise we return the string
  def convert_to_i(val)
    val = val.to_i if val =~ /^\d+$/
    val
  end

  def self.to_boolean(value)
    if ["true", "True", "TRUE", true].include? value
      true
    elsif ["false", "False", "FALSE", false].include? value
      false
    end
  end
end
