require 'thread'

module Tins
  class Limited
    # Create a Limited instance, that runs _maximum_ threads at most.
    def initialize(maximum)
      @mutex =  Mutex.new
      @continue = ConditionVariable.new
      @maximum = Integer(maximum)
      raise ArgumentError, "maximum < 1" if @maximum < 1
      @count = 0
      @tg = ThreadGroup.new
    end

    # The maximum number of worker threads.
    attr_reader :maximum

    # Execute _maximum_ number of threads in parallel.
    def execute
      @mutex.synchronize do
        loop do
          if @count < @maximum
            @count += 1
            Thread.new do
              @tg.add Thread.current
              yield
              @mutex.synchronize { @count -= 1 }
              @continue.signal
            end
            return
          else
            @continue.wait(@mutex)
          end
        end
      end
    end

    def wait
      @tg.list.each(&:join)
    end
  end
end

require 'tins/alias'
