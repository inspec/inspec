# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

module DatabaseHelper
  class SQLColumn
    def initialize(row, name)
      @row = row
      @name = name
    end

    def value
      @row[@name.downcase]
    end

    def to_s
      'SQL Column'
    end
  end

  class SQLRow
    def initialize(query, row)
      @query = query
      @row = row
    end

    def column(column)
      SQLColumn.new(@row, column)
    end

    def to_s
      'SQL Row'
    end
  end

  class SQLQueryResult
    attr_reader :error
    def initialize(cmd, results)
      @cmd = cmd
      @results = results
    end

    def empty?
      @results.empty?
    end

    def successful?
      @cmd.exit_status == 0 && @error.nil?
    end

    def row(id)
      SQLRow.new(self, @results[id])
    end

    def size
      @results.size
    end

    def stdout
      warn '[DEPRECATION] The `stdout` method is deprecated. Use `row` instead.'
      @cmd.stdout
    end

    def stderr
      warn '[DEPRECATION] The `stderr` method is deprecated. Use `successful?` instead.'
      @cmd.stderr
    end

    def inspect
      to_s
    end

    def to_s
      'SQL ResultSet'
    end
  end
end
