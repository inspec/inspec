module Git
  #
  # A class for git status
  #
  class Status
    include Enumerable

    def initialize(base)
      @base = base
      construct_status
    end

    #
    # Returns an Enumerable containing files that have changed from the
    # git base directory
    #
    # @return [Enumerable]
    def changed
      @files.select { |_k, f| f.type == 'M' }
    end

    #
    # Determines whether the given file has been changed.
    # File path starts at git base directory
    #
    # @param file [String] The name of the file.
    # @example Check if lib/git.rb has changed.
    #     changed?('lib/git.rb')
    # @return [Boolean]
    def changed?(file)
      changed.member?(file)
    end

    #
    # Returns an Enumerable containing files that have been added.
    # File path starts at git base directory
    #
    # @return [Enumerable]
    def added
      @files.select { |_k, f| f.type == 'A' }
    end

    #
    # Determines whether the given file has been added to the repository
    # File path starts at git base directory
    #
    # @param file [String] The name of the file.
    # @example Check if lib/git.rb is added.
    #     added?('lib/git.rb')
    # @return [Boolean]
    def added?(file)
      added.member?(file)
    end

    #
    # Returns an Enumerable containing files that have been deleted.
    # File path starts at git base directory
    #
    # @return [Enumerable]
    def deleted
      @files.select { |_k, f| f.type == 'D' }
    end

    #
    # Determines whether the given file has been deleted from the repository
    # File path starts at git base directory
    #
    # @param file [String] The name of the file.
    # @example Check if lib/git.rb is deleted.
    #     deleted?('lib/git.rb')
    # @return [Boolean]
    def deleted?(file)
      deleted.member?(file)
    end

    #
    # Returns an Enumerable containing files that are not tracked in git.
    # File path starts at git base directory
    #
    # @return [Enumerable]
    def untracked
      @files.select { |_k, f| f.untracked }
    end

    #
    # Determines whether the given file has is tracked by git.
    # File path starts at git base directory
    #
    # @param file [String] The name of the file.
    # @example Check if lib/git.rb is an untracked file.
    #     untracked?('lib/git.rb')
    # @return [Boolean]
    def untracked?(file)
      untracked.member?(file)
    end

    def pretty
      out = ''
      each do |file|
        out << pretty_file(file)
      end
      out << "\n"
      out
    end

    def pretty_file(file)
      <<-FILE.strip_heredoc
        #{file.path}
        \tsha(r) #{file.sha_repo} #{file.mode_repo}
        \tsha(i) #{file.sha_index} #{file.mode_index}
        \ttype   #{file.type}
        \tstage  #{file.stage}
        \tuntrac #{file.untracked}
      FILE
    end

    # enumerable method

    def [](file)
      @files[file]
    end

    def each(&block)
      @files.values.each(&block)
    end

    # subclass that does heavy lifting
    class StatusFile
      attr_accessor :path, :type, :stage, :untracked
      attr_accessor :mode_index, :mode_repo
      attr_accessor :sha_index, :sha_repo

      def initialize(base, hash)
        @base = base
        @path = hash[:path]
        @type = hash[:type]
        @stage = hash[:stage]
        @mode_index = hash[:mode_index]
        @mode_repo = hash[:mode_repo]
        @sha_index = hash[:sha_index]
        @sha_repo = hash[:sha_repo]
        @untracked = hash[:untracked]
      end

      def blob(type = :index)
        if type == :repo
          @base.object(@sha_repo)
        else
          begin
            @base.object(@sha_index)
          rescue
            @base.object(@sha_repo)
          end
        end
      end
    end

    private

    def construct_status
      @files = @base.lib.ls_files

      fetch_untracked
      fetch_modified
      fetch_added

      @files.each do |k, file_hash|
        @files[k] = StatusFile.new(@base, file_hash)
      end
    end

    def fetch_untracked
      ignore = @base.lib.ignored_files

      Dir.chdir(@base.dir.path) do
        Dir.glob('**/*', File::FNM_DOTMATCH) do |file|
          next if @files[file] || File.directory?(file) ||
                  ignore.include?(file) || file =~ %r{^.git\/.+}

          @files[file] = { path: file, untracked: true }
        end
      end
    end

    def fetch_modified
      # find modified in tree
      @base.lib.diff_files.each do |path, data|
        @files[path] ? @files[path].merge!(data) : @files[path] = data
      end
    end

    def fetch_added
      # find added but not committed - new files
      @base.lib.diff_index('HEAD').each do |path, data|
        @files[path] ? @files[path].merge!(data) : @files[path] = data
      end
    end
  end
end
