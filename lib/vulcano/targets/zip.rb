# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'zip'
require 'vulcano/targets/dir'

module Vulcano::Targets
  class ZipHelper
    def content(input, _filter)
      content = []
      ::Zip::InputStream.open(input) do |io|
        while (entry = io.get_next_entry)
          h = {
            content: io.read,
            ref: File.join(input, entry.name),
          }
          content.push(h)
        end
      end
      content
    end

    def structure(input)
      files = []
      ::Zip::InputStream.open(input) do |io|
        while (entry = io.get_next_entry)
          files.push(entry.name)
        end
      end
      files
    end

    def resolve(path)
      files = structure(path)
      helper = DirsHelper.get_handler(files)
      if helper.nil?
        fail "Don't know how to handle folder #{path}"
      end
      # get all file contents
      # @TODO
      _file_handler = Vulcano::Targets.modules['file']
      test_files = helper.get_filenames(files)
      content(path, test_files)
    end
  end
end
