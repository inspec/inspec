require 'rchardet'
require 'tempfile'

module Git

  class GitExecuteError < StandardError
  end

  class Lib

    @@semaphore = Mutex.new

    def initialize(base = nil, logger = nil)
      @git_dir = nil
      @git_index_file = nil
      @git_work_dir = nil
      @path = nil

      if base.is_a?(Git::Base)
        @git_dir = base.repo.path
        @git_index_file = base.index.path if base.index
        @git_work_dir = base.dir.path if base.dir
      elsif base.is_a?(Hash)
        @git_dir = base[:repository]
        @git_index_file = base[:index]
        @git_work_dir = base[:working_directory]
      end
      @logger = logger
    end

    # creates or reinitializes the repository
    #
    # options:
    #   :bare
    #   :working_directory
    #
    def init(opts={})
      arr_opts = []
      arr_opts << '--bare' if opts[:bare]

      command('init', arr_opts, false)
    end

    # tries to clone the given repo
    #
    # returns {:repository} (if bare)
    #         {:working_directory} otherwise
    #
    # accepts options:
    #  :bare::      no working directory
    #  :branch::    name of branch to track (rather than 'master')
    #  :depth::     the number of commits back to pull
    #  :origin::    name of remote (same as remote)
    #  :path::      directory where the repo will be cloned
    #  :remote::    name of remote (rather than 'origin')
    #  :recursive:: after the clone is created, initialize all submodules within, using their default settings.
    #
    # TODO - make this work with SSH password or auth_key
    #
    def clone(repository, name, opts = {})
      @path = opts[:path] || '.'
      clone_dir = opts[:path] ? File.join(@path, name) : name

      arr_opts = []
      arr_opts << '--bare' if opts[:bare]
      arr_opts << '--branch' << opts[:branch] if opts[:branch]
      arr_opts << '--depth' << opts[:depth].to_i if opts[:depth] && opts[:depth].to_i > 0
      arr_opts << '--config' << opts[:config] if opts[:config]
      arr_opts << '--origin' << opts[:remote] || opts[:origin] if opts[:remote] || opts[:origin]
      arr_opts << '--recursive' if opts[:recursive]
      arr_opts << "--mirror" if opts[:mirror]

      arr_opts << '--'

      arr_opts << repository
      arr_opts << clone_dir

      command('clone', arr_opts)

      (opts[:bare] or opts[:mirror]) ? {:repository => clone_dir} : {:working_directory => clone_dir}
    end


    ## READ COMMANDS ##

    #
    # Returns most recent tag that is reachable from a commit
    #
    # accepts options:
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
    #  :math
    #
    #  @param [String|NilClass] committish target commit sha or object name
    #  @param [{Symbol=>Object}] opts the given options
    #  @return [String] the tag name
    #
    def describe(committish=nil, opts={})
      arr_opts = []

      arr_opts << '--all' if opts[:all]
      arr_opts << '--tags' if opts[:tags]
      arr_opts << '--contains' if opts[:contains]
      arr_opts << '--debug' if opts[:debug]
      arr_opts << '--long' if opts[:long]
      arr_opts << '--always' if opts[:always]
      arr_opts << '--exact-match' if opts[:exact_match] || opts[:"exact-match"]

      arr_opts << '--dirty' if opts[:dirty] == true
      arr_opts << "--dirty=#{opts[:dirty]}" if opts[:dirty].is_a?(String)

      arr_opts << "--abbrev=#{opts[:abbrev]}" if opts[:abbrev]
      arr_opts << "--candidates=#{opts[:candidates]}" if opts[:candidates]
      arr_opts << "--match=#{opts[:match]}" if opts[:match]

      arr_opts << committish if committish

      return command('describe', arr_opts)
    end

    def log_commits(opts={})
      arr_opts = log_common_options(opts)

      arr_opts << '--pretty=oneline'

      arr_opts += log_path_options(opts)

      command_lines('log', arr_opts, true).map { |l| l.split.first }
    end

    def full_log_commits(opts={})
      arr_opts = log_common_options(opts)

      arr_opts << '--pretty=raw'
      arr_opts << "--skip=#{opts[:skip]}" if opts[:skip]

      arr_opts += log_path_options(opts)

      full_log = command_lines('log', arr_opts, true)

      process_commit_log_data(full_log)
    end

    def revparse(string)
      return string if string =~ /^[A-Fa-f0-9]{40}$/  # passing in a sha - just no-op it
      rev = ['head', 'remotes', 'tags'].map do |d|
        File.join(@git_dir, 'refs', d, string)
      end.find do |path|
        File.file?(path)
      end
      return File.read(rev).chomp if rev
      command('rev-parse', string)
    end

    def namerev(string)
      command('name-rev', string).split[1]
    end

    def object_type(sha)
      command('cat-file', ['-t', sha])
    end

    def object_size(sha)
      command('cat-file', ['-s', sha]).to_i
    end

    # returns useful array of raw commit object data
    def commit_data(sha)
      sha = sha.to_s
      cdata = command_lines('cat-file', ['commit', sha])
      process_commit_data(cdata, sha, 0)
    end

    def process_commit_data(data, sha = nil, indent = 4)
      hsh = {
        'sha'     => sha,
        'message' => '',
        'parent'  => []
      }

      loop do
        key, *value = data.shift.split

        break if key.nil?

        if key == 'parent'
          hsh['parent'] << value.join(' ')
        else
          hsh[key] = value.join(' ')
        end
      end

      hsh['message'] = data.collect {|line| line[indent..-1]}.join("\n") + "\n"

      return hsh
    end

    def tag_data(name)
      sha = sha.to_s
      tdata = command_lines('cat-file', ['tag', name])
      process_tag_data(tdata, name, 0)
    end

    def process_tag_data(data, name, indent=4)
      hsh = {
        'name'    => name,
        'message' => ''
      }

      loop do
        key, *value = data.shift.split

        break if key.nil?

        hsh[key] = value.join(' ')
      end

      hsh['message'] = data.collect {|line| line[indent..-1]}.join("\n") + "\n"

      return hsh
    end

    def process_commit_log_data(data)
      in_message = false

      hsh_array = []

      hsh = nil

      data.each do |line|
        line = line.chomp

        if line[0].nil?
          in_message = !in_message
          next
        end

        if in_message
          hsh['message'] << "#{line[4..-1]}\n"
          next
        end

        key, *value = line.split
        value = value.join(' ')

        case key
          when 'commit'
            hsh_array << hsh if hsh
            hsh = {'sha' => value, 'message' => '', 'parent' => []}
          when 'parent'
            hsh['parent'] << value
          else
            hsh[key] = value
        end
      end

      hsh_array << hsh if hsh

      return hsh_array
    end

    def object_contents(sha, &block)
      command('cat-file', ['-p', sha], &block)
    end

    def ls_tree(sha)
      data = {'blob' => {}, 'tree' => {}}

      command_lines('ls-tree', sha).each do |line|
        (info, filenm) = line.split("\t")
        (mode, type, sha) = info.split
        data[type][filenm] = {:mode => mode, :sha => sha}
      end

      data
    end

    def mv(file1, file2)
      command_lines('mv', ['--', file1, file2])
    end

    def full_tree(sha)
      command_lines('ls-tree', ['-r', sha])
    end

    def tree_depth(sha)
      full_tree(sha).size
    end

    def change_head_branch(branch_name)
      command('symbolic-ref', ['HEAD', "refs/heads/#{branch_name}"])
    end

    def branches_all
      arr = []
      command_lines('branch', '-a').each do |b|
        current = (b[0, 2] == '* ')
        arr << [b.gsub('* ', '').strip, current]
      end
      arr
    end

    def list_files(ref_dir)
      dir = File.join(@git_dir, 'refs', ref_dir)
      files = []
      Dir.chdir(dir) { files = Dir.glob('**/*').select { |f| File.file?(f) } } rescue nil
      files
    end

    def branch_current
      branches_all.select { |b| b[1] }.first[0] rescue nil
    end

    def branch_contains(commit, branch_name="")
      command("branch",  [branch_name, "--contains", commit])
    end

    # returns hash
    # [tree-ish] = [[line_no, match], [line_no, match2]]
    # [tree-ish] = [[line_no, match], [line_no, match2]]
    def grep(string, opts = {})
      opts[:object] ||= 'HEAD'

      grep_opts = ['-n']
      grep_opts << '-i' if opts[:ignore_case]
      grep_opts << '-v' if opts[:invert_match]
      grep_opts << '-e'
      grep_opts << string
      grep_opts << opts[:object] if opts[:object].is_a?(String)
      grep_opts << '--' << opts[:path_limiter] if opts[:path_limiter].is_a? String

      hsh = {}
      command_lines('grep', grep_opts).each do |line|
        if m = /(.*)\:(\d+)\:(.*)/.match(line)
          hsh[m[1]] ||= []
          hsh[m[1]] << [m[2].to_i, m[3]]
        end
      end
      hsh
    end

    def diff_full(obj1 = 'HEAD', obj2 = nil, opts = {})
      diff_opts = ['-p']
      diff_opts << obj1
      diff_opts << obj2 if obj2.is_a?(String)
      diff_opts << '--' << opts[:path_limiter] if opts[:path_limiter].is_a? String

      command('diff', diff_opts)
    end

    def diff_stats(obj1 = 'HEAD', obj2 = nil, opts = {})
      diff_opts = ['--numstat']
      diff_opts << obj1
      diff_opts << obj2 if obj2.is_a?(String)
      diff_opts << '--' << opts[:path_limiter] if opts[:path_limiter].is_a? String

      hsh = {:total => {:insertions => 0, :deletions => 0, :lines => 0, :files => 0}, :files => {}}

      command_lines('diff', diff_opts).each do |file|
        (insertions, deletions, filename) = file.split("\t")
        hsh[:total][:insertions] += insertions.to_i
        hsh[:total][:deletions] += deletions.to_i
        hsh[:total][:lines] = (hsh[:total][:deletions] + hsh[:total][:insertions])
        hsh[:total][:files] += 1
        hsh[:files][filename] = {:insertions => insertions.to_i, :deletions => deletions.to_i}
      end

      hsh
    end

    def diff_name_status(reference1 = nil, reference2 = nil, opts = {})
      opts_arr = ['--name-status']
      opts_arr << reference1 if reference1
      opts_arr << reference2 if reference2

      opts_arr << '--' << opts[:path] if opts[:path]

      command_lines('diff', opts_arr).inject({}) do |memo, line|
        status, path = line.split("\t")
        memo[path] = status
        memo
      end
    end

    # compares the index and the working directory
    def diff_files
      diff_as_hash('diff-files')
    end

    # compares the index and the repository
    def diff_index(treeish)
      diff_as_hash('diff-index', treeish)
    end

    def ls_files(location=nil)
      location ||= '.'
      hsh = {}
      command_lines('ls-files', ['--stage', location]).each do |line|
        (info, file) = line.split("\t")
        (mode, sha, stage) = info.split
        file = eval(file) if file =~ /^\".*\"$/ # This takes care of quoted strings returned from git
        hsh[file] = {:path => file, :mode_index => mode, :sha_index => sha, :stage => stage}
      end
      hsh
    end

    def ls_remote(location=nil)
      location ||= '.'
      Hash.new{ |h,k| h[k] = {} }.tap do |hsh|
        command_lines('ls-remote', [location], false).each do |line|
          (sha, info) = line.split("\t")
          (ref, type, name) = info.split('/', 3)
          type ||= 'head'
          type = 'branches' if type == 'heads'
          value = {:ref => ref, :sha => sha}
          hsh[type].update( name.nil? ? value : { name => value })
        end
      end
    end

    def ignored_files
      command_lines('ls-files', ['--others', '-i', '--exclude-standard'])
    end


    def config_remote(name)
      hsh = {}
      config_list.each do |key, value|
        if /remote.#{name}/.match(key)
          hsh[key.gsub("remote.#{name}.", '')] = value
        end
      end
      hsh
    end

    def config_get(name)
      do_get = lambda do |path|
        command('config', ['--get', name])
      end

      if @git_dir
        Dir.chdir(@git_dir, &do_get)
      else
        do_get.call
      end
    end

    def global_config_get(name)
      command('config', ['--global', '--get', name], false)
    end

    def config_list
      build_list = lambda do |path|
        parse_config_list command_lines('config', ['--list'])
      end

      if @git_dir
        Dir.chdir(@git_dir, &build_list)
      else
        build_list.call
      end
    end

    def global_config_list
      parse_config_list command_lines('config', ['--global', '--list'], false)
    end

    def parse_config_list(lines)
      hsh = {}
      lines.each do |line|
        (key, *values) = line.split('=')
        hsh[key] = values.join('=')
      end
      hsh
    end

    def parse_config(file)
      parse_config_list command_lines('config', ['--list', '--file', file], false)
    end

    # Shows objects
    #
    # @param [String|NilClass] objectish the target object reference (nil == HEAD)
    # @param [String|NilClass] path the path of the file to be shown
    # @return [String] the object information
    def show(objectish=nil, path=nil)
      arr_opts = []

      arr_opts << (path ? "#{objectish}:#{path}" : objectish)

      command('show', arr_opts.compact)
    end

    ## WRITE COMMANDS ##

    def config_set(name, value)
      command('config', [name, value])
    end

    def global_config_set(name, value)
      command('config', ['--global', name, value], false)
    end

    # updates the repository index using the working directory content
    #
    #    lib.add('path/to/file')
    #    lib.add(['path/to/file1','path/to/file2'])
    #    lib.add(:all => true)
    #
    # options:
    #   :all => true
    #   :force => true
    #
    # @param [String,Array] paths files paths to be added to the repository
    # @param [Hash] options
    def add(paths='.',options={})
      arr_opts = []

      arr_opts << '--all' if options[:all]
      arr_opts << '--force' if options[:force]

      arr_opts << '--'

      arr_opts << paths

      arr_opts.flatten!

      command('add', arr_opts)
    end

    def remove(path = '.', opts = {})
      arr_opts = ['-f']  # overrides the up-to-date check by default
      arr_opts << ['-r'] if opts[:recursive]
      arr_opts << ['--cached'] if opts[:cached]
      arr_opts << '--'
      if path.is_a?(Array)
        arr_opts += path
      else
        arr_opts << path
      end

      command('rm', arr_opts)
    end

    # Takes the commit message with the options and executes the commit command
    #
    # accepts options:
    #  :amend
    #  :all
    #  :allow_empty
    #  :author
    #  :date
    #  :no_verify
    #
    # @param [String] message the commit message to be used
    # @param [Array] opts the commit options to be used
    def commit(message, opts = {})
      arr_opts = []
      arr_opts << "--message=#{message}" if message
      arr_opts << '--amend' << '--no-edit' if opts[:amend]
      arr_opts << '--all' if opts[:add_all] || opts[:all]
      arr_opts << '--allow-empty' if opts[:allow_empty]
      arr_opts << "--author=#{opts[:author]}" if opts[:author]
      arr_opts << "--date=#{opts[:date]}" if opts[:date].is_a? String
      arr_opts << '--no-verify' if opts[:no_verify]

      command('commit', arr_opts)
    end

    def reset(commit, opts = {})
      arr_opts = []
      arr_opts << '--hard' if opts[:hard]
      arr_opts << commit if commit
      command('reset', arr_opts)
    end

    def clean(opts = {})
      arr_opts = []
      arr_opts << '--force' if opts[:force]
      arr_opts << '-d' if opts[:d]
      arr_opts << '-x' if opts[:x]

      command('clean', arr_opts)
    end

    def revert(commitish, opts = {})
      # Forcing --no-edit as default since it's not an interactive session.
      opts = {:no_edit => true}.merge(opts)

      arr_opts = []
      arr_opts << '--no-edit' if opts[:no_edit]
      arr_opts << commitish

      command('revert', arr_opts)
    end

    def apply(patch_file)
      arr_opts = []
      arr_opts << '--' << patch_file if patch_file
      command('apply', arr_opts)
    end

    def apply_mail(patch_file)
      arr_opts = []
      arr_opts << '--' << patch_file if patch_file
      command('am', arr_opts)
    end

    def stashes_all
      arr = []
      filename = File.join(@git_dir, 'logs/refs/stash')
      if File.exist?(filename)
        File.open(filename) do |f|
          f.each_with_index do |line, i|
            m = line.match(/:(.*)$/)
            arr << [i, m[1].strip]
          end
        end
      end
      arr
    end

    def stash_save(message)
      output = command('stash save', [message])
      output =~ /HEAD is now at/
    end

    def stash_apply(id = nil)
      if id
        command('stash apply', [id])
      else
        command('stash apply')
      end
    end

    def stash_clear
      command('stash clear')
    end

    def stash_list
      command('stash list')
    end

    def branch_new(branch)
      command('branch', branch)
    end

    def branch_delete(branch)
      command('branch', ['-D', branch])
    end

    def checkout(branch, opts = {})
      arr_opts = []
      arr_opts << '-b' if opts[:new_branch] || opts[:b]
      arr_opts << '--force' if opts[:force] || opts[:f]
      arr_opts << branch

      command('checkout', arr_opts)
    end

    def checkout_file(version, file)
      arr_opts = []
      arr_opts << version
      arr_opts << file
      command('checkout', arr_opts)
    end

    def merge(branch, message = nil)
      arr_opts = []
      arr_opts << '-m' << message if message
      arr_opts += [branch]
      command('merge', arr_opts)
    end

    def merge_base(*args)
      opts = args.last.is_a?(Hash) ? args.pop : {}

      arg_opts = []

      arg_opts << '--octopus' if opts[:octopus]
      arg_opts << '--independent' if opts[:independent]
      arg_opts << '--fork-point' if opts[:fork_point]
      arg_opts << '--all' if opts[:all]

      arg_opts += args

      command('merge-base', arg_opts).lines.map(&:strip)
    end

    def unmerged
      unmerged = []
      command_lines('diff', ["--cached"]).each do |line|
        unmerged << $1 if line =~ /^\* Unmerged path (.*)/
      end
      unmerged
    end

    def conflicts # :yields: file, your, their
      self.unmerged.each do |f|
        your = Tempfile.new("YOUR-#{File.basename(f)}").path
        command('show', ":2:#{f}", true, "> #{escape your}")

        their = Tempfile.new("THEIR-#{File.basename(f)}").path
        command('show', ":3:#{f}", true, "> #{escape their}")
        yield(f, your, their)
      end
    end

    def remote_add(name, url, opts = {})
      arr_opts = ['add']
      arr_opts << '-f' if opts[:with_fetch] || opts[:fetch]
      arr_opts << '-t' << opts[:track] if opts[:track]
      arr_opts << '--'
      arr_opts << name
      arr_opts << url

      command('remote', arr_opts)
    end

    def remote_set_url(name, url)
      arr_opts = ['set-url']
      arr_opts << name
      arr_opts << url

      command('remote', arr_opts)
    end

    def remote_remove(name)
      command('remote', ['rm', name])
    end

    def remotes
      command_lines('remote')
    end

    def tags
      command_lines('tag')
    end

    def tag(name, *opts)
      target = opts[0].instance_of?(String) ? opts[0] : nil

      opts = opts.last.instance_of?(Hash) ? opts.last : {}

      if (opts[:a] || opts[:annotate]) && !(opts[:m] || opts[:message])
        raise  "Can not create an [:a|:annotate] tag without the precense of [:m|:message]."
      end

      arr_opts = []

      arr_opts << '-f' if opts[:force] || opts[:f]
      arr_opts << '-a' if opts[:a] || opts[:annotate]
      arr_opts << '-s' if opts[:s] || opts[:sign]
      arr_opts << '-d' if opts[:d] || opts[:delete]
      arr_opts << name
      arr_opts << target if target

      if opts[:m] || opts[:message]
        arr_opts << '-m' << (opts[:m] || opts[:message])
      end

      command('tag', arr_opts)
    end


    def fetch(remote, opts)
      arr_opts = [remote]
      arr_opts << opts[:ref] if opts[:ref]
      arr_opts << '--tags' if opts[:t] || opts[:tags]
      arr_opts << '--prune' if opts[:p] || opts[:prune]
      arr_opts << '--unshallow' if opts[:unshallow]

      command('fetch', arr_opts)
    end

    def push(remote, branch = 'master', opts = {})
      # Small hack to keep backwards compatibility with the 'push(remote, branch, tags)' method signature.
      opts = {:tags => opts} if [true, false].include?(opts)

      arr_opts = []
      arr_opts << '--mirror'  if opts[:mirror]
      arr_opts << '--delete'  if opts[:delete]
      arr_opts << '--force'  if opts[:force] || opts[:f]
      arr_opts << remote

      if opts[:mirror]
          command('push', arr_opts)
      else
          command('push', arr_opts + [branch])
          command('push', ['--tags'] + arr_opts) if opts[:tags]
      end
    end

    def pull(remote='origin', branch='master')
      command('pull', [remote, branch])
    end

    def tag_sha(tag_name)
      head = File.join(@git_dir, 'refs', 'tags', tag_name)
      return File.read(head).chomp if File.exist?(head)

      command('show-ref',  ['--tags', '-s', tag_name])
    end

    def repack
      command('repack', ['-a', '-d'])
    end

    def gc
      command('gc', ['--prune', '--aggressive', '--auto'])
    end

    # reads a tree into the current index file
    def read_tree(treeish, opts = {})
      arr_opts = []
      arr_opts << "--prefix=#{opts[:prefix]}" if opts[:prefix]
      arr_opts += [treeish]
      command('read-tree', arr_opts)
    end

    def write_tree
      command('write-tree')
    end

    def commit_tree(tree, opts = {})
      opts[:message] ||= "commit tree #{tree}"
      t = Tempfile.new('commit-message')
      t.write(opts[:message])
      t.close

      arr_opts = []
      arr_opts << tree
      arr_opts << '-p' << opts[:parent] if opts[:parent]
      arr_opts += [opts[:parents]].map { |p| ['-p', p] }.flatten if opts[:parents]
      command('commit-tree', arr_opts, true, "< #{escape t.path}")
    end

    def update_ref(branch, commit)
      command('update-ref', [branch, commit])
    end

    def checkout_index(opts = {})
      arr_opts = []
      arr_opts << "--prefix=#{opts[:prefix]}" if opts[:prefix]
      arr_opts << "--force" if opts[:force]
      arr_opts << "--all" if opts[:all]
      arr_opts << '--' << opts[:path_limiter] if opts[:path_limiter].is_a? String

      command('checkout-index', arr_opts)
    end

    # creates an archive file
    #
    # options
    #  :format  (zip, tar)
    #  :prefix
    #  :remote
    #  :path
    def archive(sha, file = nil, opts = {})
      opts[:format] ||= 'zip'

      if opts[:format] == 'tgz'
        opts[:format] = 'tar'
        opts[:add_gzip] = true
      end

      if !file
        tempfile = Tempfile.new('archive')
        file = tempfile.path
        # delete it now, before we write to it, so that Ruby doesn't delete it
        # when it finalizes the Tempfile.
        tempfile.close!
      end

      arr_opts = []
      arr_opts << "--format=#{opts[:format]}" if opts[:format]
      arr_opts << "--prefix=#{opts[:prefix]}" if opts[:prefix]
      arr_opts << "--remote=#{opts[:remote]}" if opts[:remote]
      arr_opts << sha
      arr_opts << '--' << opts[:path] if opts[:path]
      command('archive', arr_opts, true, (opts[:add_gzip] ? '| gzip' : '') + " > #{escape file}")
      return file
    end

    # returns the current version of git, as an Array of Fixnums.
    def current_command_version
      output = command('version', [], false)
      version = output[/\d+\.\d+(\.\d+)+/]
      version.split('.').collect {|i| i.to_i}
    end

    def required_command_version
      [1, 6]
    end

    def meets_required_version?
      (self.current_command_version <=>  self.required_command_version) >= 0
    end


    private

    # Systen ENV variables involved in the git commands.
    #
    # @return [<String>] the names of the EVN variables involved in the git commands
    ENV_VARIABLE_NAMES = ['GIT_DIR', 'GIT_WORK_TREE', 'GIT_INDEX_FILE', 'GIT_SSH']

    def command_lines(cmd, opts = [], chdir = true, redirect = '')
      command(cmd, opts, chdir).lines.map(&:chomp)
    end

    # Takes the current git's system ENV variables and store them.
    def store_git_system_env_variables
      @git_system_env_variables = {}
      ENV_VARIABLE_NAMES.each do |env_variable_name|
        @git_system_env_variables[env_variable_name] = ENV[env_variable_name]
      end
    end

    # Takes the previously stored git's ENV variables and set them again on ENV.
    def restore_git_system_env_variables
      ENV_VARIABLE_NAMES.each do |env_variable_name|
        ENV[env_variable_name] = @git_system_env_variables[env_variable_name]
      end
    end

    # Sets git's ENV variables to the custom values for the current instance.
    def set_custom_git_env_variables
      ENV['GIT_DIR'] = @git_dir
      ENV['GIT_WORK_TREE'] = @git_work_dir
      ENV['GIT_INDEX_FILE'] = @git_index_file
      ENV['GIT_SSH'] = Git::Base.config.git_ssh
    end

    # Runs a block inside an environment with customized ENV variables.
    # It restores the ENV after execution.
    #
    # @param [Proc] block block to be executed within the customized environment
    def with_custom_env_variables(&block)
      @@semaphore.synchronize do
        store_git_system_env_variables()
        set_custom_git_env_variables()
        return block.call()
      end
    ensure
      restore_git_system_env_variables()
    end

    def command(cmd, opts = [], chdir = true, redirect = '', &block)
      global_opts = []
      global_opts << "--git-dir=#{@git_dir}" if !@git_dir.nil?
      global_opts << "--work-tree=#{@git_work_dir}" if !@git_work_dir.nil?
      global_opts << ["-c", "color.ui=false"]

      opts = [opts].flatten.map {|s| escape(s) }.join(' ')

      global_opts = global_opts.flatten.map {|s| escape(s) }.join(' ')

      git_cmd = "#{Git::Base.config.binary_path} #{global_opts} #{cmd} #{opts} #{redirect} 2>&1"

      output = nil

      command_thread = nil;

      exitstatus = nil

      with_custom_env_variables do
        command_thread = Thread.new do
          output = run_command(git_cmd, &block)
          exitstatus = $?.exitstatus
        end
        command_thread.join
      end

      if @logger
        @logger.info(git_cmd)
        @logger.debug(output)
      end

      if exitstatus > 1 || (exitstatus == 1 && output != '')
        raise Git::GitExecuteError.new(git_cmd + ':' + output.to_s)
      end

      return output
    end

    # Takes the diff command line output (as Array) and parse it into a Hash
    #
    # @param [String] diff_command the diff commadn to be used
    # @param [Array] opts the diff options to be used
    # @return [Hash] the diff as Hash
    def diff_as_hash(diff_command, opts=[])
      command_lines(diff_command, opts).inject({}) do |memo, line|
        info, file = line.split("\t")
        mode_src, mode_dest, sha_src, sha_dest, type = info.split

        memo[file] = {
          :mode_index => mode_dest,
          :mode_repo => mode_src.to_s[1, 7],
          :path => file,
          :sha_repo => sha_src,
          :sha_index => sha_dest,
          :type => type
        }

        memo
      end
    end

    # Returns an array holding the common options for the log commands
    #
    # @param [Hash] opts the given options
    # @return [Array] the set of common options that the log command will use
    def log_common_options(opts)
      arr_opts = []

      arr_opts << "-#{opts[:count]}" if opts[:count]
      arr_opts << "--no-color"
      arr_opts << "--since=#{opts[:since]}" if opts[:since].is_a? String
      arr_opts << "--until=#{opts[:until]}" if opts[:until].is_a? String
      arr_opts << "--grep=#{opts[:grep]}" if opts[:grep].is_a? String
      arr_opts << "--author=#{opts[:author]}" if opts[:author].is_a? String
      arr_opts << "#{opts[:between][0].to_s}..#{opts[:between][1].to_s}" if (opts[:between] && opts[:between].size == 2)

      arr_opts
    end

    # Retrurns an array holding path options for the log commands
    #
    # @param [Hash] opts the given options
    # @return [Array] the set of path options that the log command will use
    def log_path_options(opts)
      arr_opts = []

      arr_opts << opts[:object] if opts[:object].is_a? String
      arr_opts << '--' << opts[:path_limiter] if opts[:path_limiter]
      arr_opts
    end

    def default_encoding
      __ENCODING__.name
    end

    def best_guess_encoding
      # Encoding::ASCII_8BIT.name
      Encoding::UTF_8.name
    end

    def detected_encoding(str)
      CharDet.detect(str)['encoding'] || best_guess_encoding
    end

    def encoding_options
      { invalid: :replace, undef: :replace }
    end

    def normalize_encoding(str)
      return str if str.valid_encoding? && str.encoding.name == default_encoding

      return str.encode(default_encoding, str.encoding, **encoding_options) if str.valid_encoding?

      str.encode(default_encoding, detected_encoding(str), **encoding_options)
    end

    def run_command(git_cmd, &block)
      return IO.popen(git_cmd, &block) if block_given?

      `#{git_cmd}`.chomp.lines.map { |l| normalize_encoding(l) }.join
    end

    def escape(s)
      return "'#{s && s.to_s.gsub('\'','\'"\'"\'')}'" if RUBY_PLATFORM !~ /mingw|mswin/

      # Keeping the old escape format for windows users
      escaped = s.to_s.gsub('\'', '\'\\\'\'')
      return %Q{"#{escaped}"}
    end

  end
end
