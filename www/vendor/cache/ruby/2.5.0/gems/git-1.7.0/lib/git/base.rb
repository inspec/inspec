require 'git/base/factory'

module Git
  
  class Base

    include Git::Base::Factory

    # opens a bare Git Repository - no working directory options
    def self.bare(git_dir, opts = {})
      self.new({:repository => git_dir}.merge(opts))
    end
    
    # clones a git repository locally
    #
    #  repository - http://repo.or.cz/w/sinatra.git
    #  name - sinatra
    #
    # options:
    #   :repository
    #
    #    :bare
    #   or 
    #    :working_directory
    #    :index_file
    #
    def self.clone(repository, name, opts = {})
      # run git-clone 
      self.new(Git::Lib.new.clone(repository, name, opts))
    end
    
    # Returns (and initialize if needed) a Git::Config instance
    #
    # @return [Git::Config] the current config instance.
    def self.config
      return @@config ||= Config.new
    end

    # initializes a git repository
    #
    # options:
    #  :bare
    #  :index
    #  :repository
    #
    def self.init(working_dir, opts = {})
      opts[:working_directory] ||= working_dir 
      opts[:repository] ||= File.join(opts[:working_directory], '.git')
      
      FileUtils.mkdir_p(opts[:working_directory]) if opts[:working_directory] && !File.directory?(opts[:working_directory])
      
      init_opts = {
        :bare => opts[:bare]
      }

      opts.delete(:working_directory) if opts[:bare]
      
      # Submodules have a .git *file* not a .git folder.
      # This file's contents point to the location of
      # where the git refs are held (In the parent repo)
      if File.file?('.git')
        git_file = File.open('.git').read[8..-1].strip
        opts[:repository] = git_file
        opts[:index] = git_file + '/index'
      end

      Git::Lib.new(opts).init(init_opts)
       
      self.new(opts)
    end
    
    # opens a new Git Project from a working directory
    # you can specify non-standard git_dir and index file in the options
    def self.open(working_dir, opts={})
      self.new({:working_directory => working_dir}.merge(opts))
    end
    
    def initialize(options = {})
      if working_dir = options[:working_directory]
        options[:repository] ||= File.join(working_dir, '.git')
        options[:index] ||= File.join(working_dir, '.git', 'index')
      end
      if options[:log]
        @logger = options[:log]
        @logger.info("Starting Git")
      else
        @logger = nil
      end
     
      @working_directory = options[:working_directory] ? Git::WorkingDirectory.new(options[:working_directory]) : nil
      @repository = options[:repository] ? Git::Repository.new(options[:repository]) : nil 
      @index = options[:index] ? Git::Index.new(options[:index], false) : nil
    end
    
    # changes current working directory for a block
    # to the git working directory
    #
    # example
    #  @git.chdir do 
    #    # write files
    #    @git.add
    #    @git.commit('message')
    #  end
    def chdir # :yields: the Git::Path
      Dir.chdir(dir.path) do
        yield dir.path
      end
    end
    
    #g.config('user.name', 'Scott Chacon') # sets value
    #g.config('user.email', 'email@email.com')  # sets value
    #g.config('user.name')  # returns 'Scott Chacon'
    #g.config # returns whole config hash
    def config(name = nil, value = nil)
      if(name && value)
        # set value
        lib.config_set(name, value)
      elsif (name)
        # return value
        lib.config_get(name)
      else
        # return hash
        lib.config_list
      end
    end
  
    # returns a reference to the working directory
    #  @git.dir.path
    #  @git.dir.writeable?
    def dir
      @working_directory
    end
    
    # returns reference to the git index file
    def index
      @index
    end

    # returns reference to the git repository directory
    #  @git.dir.path
    def repo
      @repository
    end
    
    # returns the repository size in bytes
    def repo_size
      Dir.chdir(repo.path) do
        return `du -s`.chomp.split.first.to_i
      end
    end
    
    def set_index(index_file, check = true)
      @lib = nil
      @index = Git::Index.new(index_file.to_s, check)
    end
    
    def set_working(work_dir, check = true)
      @lib = nil
      @working_directory = Git::WorkingDirectory.new(work_dir.to_s, check)
    end
    
    # returns +true+ if the branch exists locally
    def is_local_branch?(branch)
      branch_names = self.branches.local.map {|b| b.name}
      branch_names.include?(branch)
    end

    # returns +true+ if the branch exists remotely
    def is_remote_branch?(branch)
      branch_names = self.branches.remote.map {|b| b.name}
      branch_names.include?(branch)
    end

    # returns +true+ if the branch exists
    def is_branch?(branch)
      branch_names = self.branches.map {|b| b.name}
      branch_names.include?(branch)
    end

    # this is a convenience method for accessing the class that wraps all the 
    # actual 'git' forked system calls.  At some point I hope to replace the Git::Lib
    # class with one that uses native methods or libgit C bindings
    def lib
      @lib ||= Git::Lib.new(self, @logger)
    end
    
    # will run a grep for 'string' on the HEAD of the git repository
    # 
    # to be more surgical in your grep, you can call grep() off a specific
    # git object.  for example:
    #
    #  @git.object("v2.3").grep('TODO')
    #
    # in any case, it returns a hash of arrays of the type:
    #  hsh[tree-ish] = [[line_no, match], [line_no, match2]]
    #  hsh[tree-ish] = [[line_no, match], [line_no, match2]]
    #
    # so you might use it like this:
    #
    #   @git.grep("TODO").each do |sha, arr|
    #     puts "in blob #{sha}:"
    #     arr.each do |match|
    #       puts "\t line #{match[0]}: '#{match[1]}'"
    #     end
    #   end
    def grep(string, path_limiter = nil, opts = {})
      self.object('HEAD').grep(string, path_limiter, opts)
    end
    
    # updates the repository index using the working directory content
    #
    #    @git.add('path/to/file')
    #    @git.add(['path/to/file1','path/to/file2'])
    #    @git.add(:all => true)
    #
    # options:
    #   :all => true
    #
    # @param [String,Array] paths files paths to be added (optional, default='.')
    # @param [Hash] options
    def add(*args)
      if args[0].instance_of?(String) || args[0].instance_of?(Array)
        self.lib.add(args[0],args[1]||{})
      else
        self.lib.add('.', args[0]||{})
      end
    end

    # removes file(s) from the git repository
    def remove(path = '.', opts = {})
      self.lib.remove(path, opts)
    end

    # resets the working directory to the provided commitish
    def reset(commitish = nil, opts = {})
      self.lib.reset(commitish, opts)
    end

    # resets the working directory to the commitish with '--hard'
    def reset_hard(commitish = nil, opts = {})
      opts = {:hard => true}.merge(opts)
      self.lib.reset(commitish, opts)
    end

    # cleans the working directory
    #
    # options:
    #  :force
    #  :d
    #
    def clean(opts = {})
      self.lib.clean(opts)
    end

    #  returns the most recent tag that is reachable from a commit
    #
    # options:
    #  :all
    #  :tags
    #  :contains
    #  :debug
    #  :exact_match
    #  :dirty
    #  :abbrev
    #  :candidates
    #  :long
    #  :always
    #  :match
    #
    def describe(committish=nil, opts={})
      self.lib.describe(committish, opts)
    end

    # reverts the working directory to the provided commitish.
    # Accepts a range, such as comittish..HEAD
    #
    # options:
    #   :no_edit
    #
    def revert(commitish = nil, opts = {})
      self.lib.revert(commitish, opts)
    end

    # commits all pending changes in the index file to the git repository
    # 
    # options:
    #   :all
    #   :allow_empty
    #   :amend
    #   :author
    #
    def commit(message, opts = {})
      self.lib.commit(message, opts)
    end
        
    # commits all pending changes in the index file to the git repository,
    # but automatically adds all modified files without having to explicitly
    # calling @git.add() on them.  
    def commit_all(message, opts = {})
      opts = {:add_all => true}.merge(opts)
      self.lib.commit(message, opts)
    end

    # checks out a branch as the new git working directory
    def checkout(branch = 'master', opts = {})
      self.lib.checkout(branch, opts)
    end
    
    # checks out an old version of a file
    def checkout_file(version, file)
      self.lib.checkout_file(version,file)
    end

    # fetches changes from a remote branch - this does not modify the working directory,
    # it just gets the changes from the remote if there are any
    def fetch(remote = 'origin', opts={})
      self.lib.fetch(remote, opts)
    end

    # pushes changes to a remote repository - easiest if this is a cloned repository,
    # otherwise you may have to run something like this first to setup the push parameters:
    #
    #  @git.config('remote.remote-name.push', 'refs/heads/master:refs/heads/master')
    #
    def push(remote = 'origin', branch = 'master', opts = {})
      # Small hack to keep backwards compatibility with the 'push(remote, branch, tags)' method signature.
      opts = {:tags => opts} if [true, false].include?(opts)

      self.lib.push(remote, branch, opts)
    end
    
    # merges one or more branches into the current working branch
    #
    # you can specify more than one branch to merge by passing an array of branches
    def merge(branch, message = 'merge')
      self.lib.merge(branch, message)
    end

    # iterates over the files which are unmerged
    def each_conflict(&block) # :yields: file, your_version, their_version
      self.lib.conflicts(&block)
    end

    # pulls the given branch from the given remote into the current branch
    #
    #  @git.pull                          # pulls from origin/master
    #  @git.pull('upstream')              # pulls from upstream/master
    #  @git.pull('upstream', 'develope')  # pulls from upstream/develop
    #
    def pull(remote='origin', branch='master')
			self.lib.pull(remote, branch)
    end
    
    # returns an array of Git:Remote objects
    def remotes
      self.lib.remotes.map { |r| Git::Remote.new(self, r) }
    end

    # adds a new remote to this repository
    # url can be a git url or a Git::Base object if it's a local reference
    # 
    #  @git.add_remote('scotts_git', 'git://repo.or.cz/rubygit.git')
    #  @git.fetch('scotts_git')
    #  @git.merge('scotts_git/master')
    #
    # Options:
    #   :fetch => true
    #   :track => <branch_name>
    def add_remote(name, url, opts = {})
      url = url.repo.path if url.is_a?(Git::Base)
      self.lib.remote_add(name, url, opts)
      Git::Remote.new(self, name)
    end

    # sets the url for a remote
    # url can be a git url or a Git::Base object if it's a local reference
    #
    #  @git.set_remote_url('scotts_git', 'git://repo.or.cz/rubygit.git')
    #
    def set_remote_url(name, url)
      url = url.repo.path if url.is_a?(Git::Base)
      self.lib.remote_set_url(name, url)
      Git::Remote.new(self, name)
    end

    # removes a remote from this repository
    #
    # @git.remove_remote('scott_git')
    def remove_remote(name)
      self.lib.remote_remove(name)
    end

    # returns an array of all Git::Tag objects for this repository
    def tags
      self.lib.tags.map { |r| tag(r) }
    end

    # Creates a new git tag (Git::Tag)
    # Usage:
    #     repo.add_tag('tag_name', object_reference)
    #     repo.add_tag('tag_name', object_reference, {:options => 'here'})
    #     repo.add_tag('tag_name', {:options => 'here'})
    #
    # Options:
    #   :a | :annotate -> true
    #   :d             -> true
    #   :f             -> true
    #   :m | :message  -> String
    #   :s             -> true
    #   
    def add_tag(name, *opts)
      self.lib.tag(name, *opts)
      self.tag(name)
    end
 
    # deletes a tag 
    def delete_tag(name) 
      self.lib.tag(name, {:d => true})
    end
    
    # creates an archive file of the given tree-ish
    def archive(treeish, file = nil, opts = {})
      self.object(treeish).archive(file, opts)
    end
    
    # repacks the repository
    def repack
      self.lib.repack
    end
    
    def gc
      self.lib.gc
    end
    
    def apply(file)
      if File.exist?(file)
        self.lib.apply(file)
      end
    end
    
    def apply_mail(file)
      self.lib.apply_mail(file) if File.exist?(file)
    end

    # Shows objects
    #
    # @param [String|NilClass] objectish the target object reference (nil == HEAD)
    # @param [String|NilClass] path the path of the file to be shown
    # @return [String] the object information
    def show(objectish=nil, path=nil)
      self.lib.show(objectish, path)
    end
    
    ## LOWER LEVEL INDEX OPERATIONS ##
    
    def with_index(new_index) # :yields: new_index
      old_index = @index
      set_index(new_index, false)
      return_value = yield @index
      set_index(old_index)
      return_value
    end
    
    def with_temp_index &blk
      # Workaround for JRUBY, since they handle the TempFile path different.
      # MUST be improved to be safer and OS independent. 
      if RUBY_PLATFORM == 'java'
        temp_path = "/tmp/temp-index-#{(0...15).map{ ('a'..'z').to_a[rand(26)] }.join}"
      else
        tempfile = Tempfile.new('temp-index')
        temp_path = tempfile.path
        tempfile.close
        tempfile.unlink
      end

      with_index(temp_path, &blk)
    end
    
    def checkout_index(opts = {})
      self.lib.checkout_index(opts)
    end
    
    def read_tree(treeish, opts = {})
      self.lib.read_tree(treeish, opts)
    end
    
    def write_tree
      self.lib.write_tree
    end
    
    def write_and_commit_tree(opts = {})
      tree = write_tree
      commit_tree(tree, opts)
    end
      
    def update_ref(branch, commit)
      branch(branch).update_ref(commit)
    end
    
    
    def ls_files(location=nil)
      self.lib.ls_files(location)
    end

    def with_working(work_dir) # :yields: the Git::WorkingDirectory
      return_value = false
      old_working = @working_directory
      set_working(work_dir) 
      Dir.chdir work_dir do
        return_value = yield @working_directory
      end
      set_working(old_working)
      return_value
    end
    
    def with_temp_working &blk
      tempfile = Tempfile.new("temp-workdir")
      temp_dir = tempfile.path
      tempfile.close
      tempfile.unlink
      Dir.mkdir(temp_dir, 0700)
      with_working(temp_dir, &blk)
    end
    
    
    # runs git rev-parse to convert the objectish to a full sha
    #
    #   @git.revparse("HEAD^^")
    #   @git.revparse('v2.4^{tree}')
    #   @git.revparse('v2.4:/doc/index.html')
    #
    def revparse(objectish)
      self.lib.revparse(objectish)
    end
    
    def ls_tree(objectish)
      self.lib.ls_tree(objectish)
    end
    
    def cat_file(objectish)
      self.lib.object_contents(objectish)
    end

    # returns the name of the branch the working directory is currently on
    def current_branch
      self.lib.branch_current
    end
    
  end
  
end
