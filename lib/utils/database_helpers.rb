# author: Christoph Hartmann
# author: Dominik Richter

module DatabaseHelper
  class SQLColumn
    def initialize(row, name)
      @row = row
      @name = name
    end

    def value
      @row.nil? ? '' : @row[@name.downcase]
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

    def rows
      @results
    end

    def row(id)
      SQLRow.new(self, @results[id])
    end

    def column(column)
      result = []
      @results.each do |row|
        result << row[column]
      end
      result
    end

    def size
      @results.size
    end

    def inspect
      to_s
    end

    def to_s
      'SQL ResultSet'
    end
  end
end
