require 'git/path'

module Git

  class Branch < Path
    
    attr_accessor :full, :remote, :name
    
    def initialize(base, name)
      @full = name
      @base = base
      @gcommit = nil
      @stashes = nil
      @remote, @name = parse_name(name)
    end
    
    def gcommit
      @gcommit ||= @base.gcommit(@full)
      @gcommit
    end
    
    def stashes
      @stashes ||= Git::Stashes.new(@base)
    end
    
    def checkout
      check_if_create
      @base.checkout(@full)
    end
    
    def archive(file, opts = {})
      @base.lib.archive(@full, file, opts)
    end
    
    # g.branch('new_branch').in_branch do
    #   # create new file
    #   # do other stuff
    #   return true # auto commits and switches back
    # end
    def in_branch(message = 'in branch work')
      old_current = @base.lib.branch_current
      checkout
      if yield
        @base.commit_all(message)
      else
        @base.reset_hard
      end
      @base.checkout(old_current)
    end
    
    def create
      check_if_create
    end
    
    def delete
      @base.lib.branch_delete(@name)
    end
    
    def current
      determine_current
    end
    
    def contains?(commit)
      !@base.lib.branch_contains(commit, self.name).empty?
    end
    
    def merge(branch = nil, message = nil)
      if branch
        in_branch do 
          @base.merge(branch, message)
          false
        end
        # merge a branch into this one
      else
        # merge this branch into the current one
        @base.merge(@name)
      end
    end
    
    def update_ref(commit)
      @base.lib.update_ref(@full, commit)
    end
    
    def to_a
      [@full]
    end
    
    def to_s
      @full
    end
    
    private 

      def check_if_create
        @base.lib.branch_new(@name) rescue nil
      end
      
      def determine_current
        @base.lib.branch_current == @name
      end
    
      # Given a full branch name return an Array containing the remote and branch names.
      #
      # Removes 'remotes' from the beggining of the name (if present).
      # Takes the second part (splittign by '/') as the remote name.
      # Takes the rest as the repo name (can also hold one or more '/').
      #
      # Example:
      #   parse_name('master') #=> [nil, 'master']
      #   parse_name('origin/master') #=> ['origin', 'master']
      #   parse_name('remotes/origin/master') #=> ['origin', 'master']
      #   parse_name('origin/master/v2') #=> ['origin', 'master/v2'] 
      #
      # param [String] name branch full name.
      # return [<Git::Remote,NilClass,String>] an Array containing the remote and branch names. 
      def parse_name(name)
        if name.match(/^(?:remotes)?\/([^\/]+)\/(.+)/)
          return [Git::Remote.new(@base, $1), $2]
        end

        return [nil, name]
      end
    
  end
  
end
