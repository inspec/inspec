# encoding: utf-8

module EnumerableDelegation
  include Enumerable

  def each(&block)
    @params.each(&block)
  end
end
