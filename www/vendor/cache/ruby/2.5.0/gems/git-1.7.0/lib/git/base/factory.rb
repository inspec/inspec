module Git

  class Base

    module Factory
      
      # returns a Git::Branch object for branch_name
      def branch(branch_name = 'master')
        Git::Branch.new(self, branch_name)
      end

      # returns a Git::Branches object of all the Git::Branch 
      # objects for this repo
      def branches
        Git::Branches.new(self)
      end
      
      def commit_tree(tree = nil, opts = {})
        Git::Object::Commit.new(self, self.lib.commit_tree(tree, opts))
      end

      # returns a Git::Diff object
      def diff(objectish = 'HEAD', obj2 = nil)
        Git::Diff.new(self, objectish, obj2)
      end
      
      def gblob(objectish)
        Git::Object.new(self, objectish, 'blob')
      end
      
      def gcommit(objectish)
        Git::Object.new(self, objectish, 'commit')
      end

      def gtree(objectish)
        Git::Object.new(self, objectish, 'tree')
      end
      
      # returns a Git::Log object with count commits
      def log(count = 30)
        Git::Log.new(self, count)
      end
      
      # returns a Git::Object of the appropriate type
      # you can also call @git.gtree('tree'), but that's 
      # just for readability.  If you call @git.gtree('HEAD') it will
      # still return a Git::Object::Commit object.  
      #
      # @git.object calls a factory method that will run a rev-parse 
      # on the objectish and determine the type of the object and return 
      # an appropriate object for that type 
      def object(objectish)
        Git::Object.new(self, objectish)
      end
  
      # returns a Git::Remote object
      def remote(remote_name = 'origin')
        Git::Remote.new(self, remote_name)
      end

      # returns a Git::Status object
      def status
        Git::Status.new(self)
      end
    
      # returns a Git::Tag object
      def tag(tag_name)
        Git::Object.new(self, tag_name, 'tag', true)
      end

      # Find as good common ancestors as possible for a merge
      # example: g.merge_base('master', 'some_branch', 'some_sha', octopus: true)
      # returns Array<Git::Object::Commit>
      def merge_base(*args)
        shas = self.lib.merge_base(*args)
        shas.map { |sha| gcommit(sha) }
      end

    end

  end

end
