module Git
 
 class Path
    
    attr_accessor :path
    
    def initialize(path, check_path=true)
      path = File.expand_path(path)
      
      if check_path && !File.exist?(path)
        raise ArgumentError, 'path does not exist', [path]
      end
      
      @path = path
    end
    
    def readable?
      File.readable?(@path)
    end

    def writable?
      File.writable?(@path)
    end
    
    def to_s
      @path
    end
    
 end

end
