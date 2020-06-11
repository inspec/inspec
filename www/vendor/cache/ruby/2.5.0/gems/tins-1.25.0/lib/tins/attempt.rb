module Tins
  module Attempt
    # Attempts code in block *attempts* times, sleeping according to *sleep*
    # between attempts and catching the exception(s) in *exception_class*.
    #
    # *sleep* is either a Proc returning a floating point number for duration
    # as seconds or a Numeric >= 0 or < 0. In the former case this is the
    # duration directly, in the latter case -*sleep* is the total number of
    # seconds that is slept before giving up, and every attempt is retried
    # after a exponentially increasing duration of seconds.
    #
    # Iff *reraise* is true the caught exception is reraised after running out
    # of attempts.
    def attempt(opts = {}, &block)
      sleep           = nil
      exception_class = StandardError
      if Numeric === opts
        attempts = opts
      else
        attempts        = opts[:attempts] || 1
        attempts >= 1 or raise ArgumentError, 'at least one attempt is required'
        exception_class = opts[:exception_class] if opts.key?(:exception_class)
        sleep           = interpret_sleep(opts[:sleep], attempts)
        reraise         = opts[:reraise]
      end
      return if attempts <= 0
      count = 0
      if exception_class.nil?
        begin
          count += 1
          if block.call(count)
            return true
          elsif count < attempts
            sleep_duration(sleep, count)
          end
        end until count == attempts
        false
      else
        begin
          count += 1
          block.call(count)
          true
        rescue *exception_class
          if count < attempts
            sleep_duration(sleep, count)
            retry
          end
          reraise ? raise : false
        end
      end
    end

    private

    def sleep_duration(duration, count)
      case duration
      when Numeric
        sleep duration
      when Proc
        sleep duration.call(count)
      end
    end

    def compute_duration_base(sleep, attempts)
      x1, x2  = 1, sleep
      attempts <= sleep or raise ArgumentError,
        "need less or equal number of attempts than sleep duration #{sleep}"
      x1 >= x2 and raise ArgumentError, "invalid sleep argument: #{sleep.inspect}"
      function = -> x { (0...attempts).inject { |s, i| s + x ** i } - sleep }
      f, fmid = function[x1], function[x2]
      f * fmid >= 0 and raise ArgumentError, "invalid sleep argument: #{sleep.inspect}"
      n       = 1 << 16
      epsilon = 1E-16
      root = if f < 0
               dx = x2 - x1
               x1
             else
               dx = x1 - x2
               x2
             end
      n.times do
        fmid = function[xmid = root + (dx *= 0.5)]
        fmid < 0 and root = xmid
        dx.abs < epsilon or fmid == 0 and return root
      end
      raise ArgumentError, "too many iterations (#{n})"
      result
    end

    def interpret_sleep(sleep, attempts)
      case sleep
      when nil
      when Numeric
        if sleep < 0
          if attempts > 2
            sleep = -sleep
            duration_base = compute_duration_base sleep, attempts
            sleep = lambda { |i| duration_base ** i }
          else
            raise ArgumentError, "require > 2 attempts for negative sleep value"
          end
        end
        sleep
      when Proc
        sleep
      else
        raise TypeError, "require Proc or Numeric sleep argument"
      end
    end
  end
end
