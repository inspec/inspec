module Git
  
  # object that holds all the available branches
  class Branches

    include Enumerable
    
    def initialize(base)
      @branches = {}
      
      @base = base
            
      @base.lib.branches_all.each do |b|
        @branches[b[0]] = Git::Branch.new(@base, b[0])
      end
    end

    def local
      self.select { |b| !b.remote }
    end
    
    def remote
      self.select { |b| b.remote }
    end
    
    # array like methods

    def size
      @branches.size
    end    
    
    def each(&block)
      @branches.values.each(&block)
    end
    
    # Returns the target branch
    #
    # Example:
    #   Given (git branch -a):
    #    master
    #    remotes/working/master
    #
    #   g.branches['master'].full #=> 'master'
    #   g.branches['working/master'].full => 'remotes/working/master'
    #   g.branches['remotes/working/master'].full => 'remotes/working/master'
    #
    # @param [#to_s] branch_name the target branch name.
    # @return [Git::Branch] the target branch.
    def [](branch_name)
      @branches.values.inject(@branches) do |branches, branch|
        branches[branch.full] ||= branch

        # This is how Git (version 1.7.9.5) works. 
        # Lets you ignore the 'remotes' if its at the beginning of the branch full name (even if is not a real remote branch). 
        branches[branch.full.sub('remotes/', '')] ||= branch if branch.full =~ /^remotes\/.+/
        
        branches
      end[branch_name.to_s]
    end
    
    def to_s
      out = ''
      @branches.each do |k, b|
        out << (b.current ? '* ' : '  ') << b.to_s << "\n"
      end
      out
    end
    
  end

end
