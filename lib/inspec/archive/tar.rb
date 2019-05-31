require 'rubygems/package'

module Inspec::Archive
  class TarArchiveGenerator
    def archive(base_dir, files, archive)
      File.open(archive, 'wb') do |file|
        Zlib::GzipWriter.wrap(file) do |gz|
          Gem::Package::TarWriter.new(gz) do |tar|
            files.each do |input_filename|
              path = Pathname.new(base_dir).join(input_filename)
              stat = File.stat(path)
              if path.directory?
                tar.mkdir(input_filename, stat.mode)
              else
                tar.add_file_simple(input_filename, stat.mode, stat.size) do |io|
                  io.write(File.binread(path))
                end
              end
            end
          end
        end
      end
    end
  end
end
