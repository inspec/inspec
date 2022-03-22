require 'json'
require 'hashie'
require 'pry-byebug'
require 'ohai'

file = File.read('test.json')
hash = JSON.parse(file, object_class: OpenStruct)
json_object = Hashie::Mash.new hash

require 'pry'
binding.pry
