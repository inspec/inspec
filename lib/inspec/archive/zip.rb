require "rubygems" unless defined?(Gem)
require "zip" unless defined?(Zip)
require "pathname" unless defined?(Pathname)

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
