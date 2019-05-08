
module EnumerableDelegation
  include Enumerable

  def each(&block)
    @params.each(&block)
  end
end
