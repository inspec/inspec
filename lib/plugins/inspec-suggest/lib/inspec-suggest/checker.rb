module InspecPlugins::Suggest
  class Checker

    @@checks = []

    def initialize(_opts)
    end

    def each_check(&block)
      @@checks.each do |check|
        yield(check)
      end
    end
  end
end
