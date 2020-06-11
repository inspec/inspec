unless Hash.method_defined? :to_proc
  class Hash
    def to_proc
      h = self
      proc {|*args| h[*args]}
    end
  end
end
