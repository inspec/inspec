# encoding: utf-8
require 'zip'

module Vulcano::Targets
  class ZipHelper

    def content input
      content = {}
      ::Zip::InputStream.open(input) do |io|
        while (entry = io.get_next_entry)
          content[entry.name] = io.read
        end
      end
      return content
    end

    def structure input
      files = Array.new
      ::Zip::InputStream.open(input) do |io|
        while (entry = io.get_next_entry)
           files.push(entry.name)
        end
      end
      return files
    end

  end
end
