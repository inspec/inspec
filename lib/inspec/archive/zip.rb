# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'rubygems'
require 'zip'
require 'pathname'

module Inspec::Archive
  class ZipArchiveGenerator
    def archive(base_dir, files, archive)
      Zip::File.open(archive, Zip::File::CREATE) do |zipfile|
        files.each do |input_filename|
          zipfile.add(input_filename, Pathname.new(base_dir).join(input_filename))
        end
      end
    end
  end
end
