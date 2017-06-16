# encoding: utf-8
# Copyright 2017 Chef Software
# author: Dominik Richter
# author: Christoph Hartmann

module Inspec
  class RuntimeProfile
    attr_reader :files

    def initialize(profile)
      @src = profile.source_reader
      @files = @src.data_files.keys.map do |k|
        k.sub('files' + File::SEPARATOR, '')
      end
    end

    # Retrieve a profile file's contents
    #
    # @param name [String] the name of the file
    # @return [String] contents of the file of RuntimeError if missing
    def file(name)
      @src.data_files[File.join('files', name)] ||
        raise("Cannot find file #{name} in profile.")
    end
  end
end
