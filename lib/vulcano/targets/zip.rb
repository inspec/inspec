# encoding: utf-8
require 'zip'
require 'vulcano/targets/dir'

module Vulcano::Targets
  class ZipHelper

    def content(input, filter)
      content = []
      ::Zip::InputStream.open(input) do |io|
        while (entry = io.get_next_entry)
          content.push({
            content: io.read,
            ref: File::join(input, entry.name),
          })
        end
      end
      content
    end

    def structure(input)
      files = Array.new
      ::Zip::InputStream.open(input) do |io|
        while (entry = io.get_next_entry)
           files.push(entry.name)
        end
      end
      files
    end

    def resolve(path)
      files = structure(path)
      helper = DirsHelper.getHandler(files)
      if helper.nil?
        raise "Don't know how to handle folder #{path}"
      end
      # get all file contents
      file_handler = Vulcano::Targets.modules['file']
      test_files = helper.get_filenames(files)
      content(path, test_files)
    end

  end
end
