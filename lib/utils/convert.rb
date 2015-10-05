# encoding: utf-8

module Converter
  # convert the value to an integer if we have numbers only
  # otherwise we return the string
  def convert_to_i(val)
    val = val.to_i if val.match(/^\d+$/)
    val
  end
end
