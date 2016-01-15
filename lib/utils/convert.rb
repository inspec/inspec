# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

module Converter
  # convert the value to an integer if we have numbers only
  # otherwise we return the string
  def convert_to_i(val)
    val = val.to_i if val =~ /^\d+$/
    val
  end
end
