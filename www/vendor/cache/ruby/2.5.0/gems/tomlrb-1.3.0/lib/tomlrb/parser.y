class Tomlrb::GeneratedParser
token IDENTIFIER STRING_MULTI STRING_BASIC STRING_LITERAL_MULTI STRING_LITERAL DATETIME INTEGER FLOAT FLOAT_INF FLOAT_NAN TRUE FALSE
rule
  expressions
    | expressions expression
    ;
  expression
    : table
    | assignment
    | inline_table
    ;
  table
    : table_start table_continued
    ;
  table_start
    : '[' '[' { @handler.start_(:array_of_tables) }
    | '[' { @handler.start_(:table) }
    ;
  table_continued
    : ']' ']' { array = @handler.end_(:array_of_tables); @handler.set_context(array, is_array_of_tables: true) }
    | ']' { array = @handler.end_(:table); @handler.set_context(array) }
    | table_identifier table_next
    ;
  table_next
    : ']' ']' { array = @handler.end_(:array_of_tables); @handler.set_context(array, is_array_of_tables: true) }
    | ']' { array = @handler.end_(:table); @handler.set_context(array) }
    | '.' table_continued
    ;
  table_identifier
    : IDENTIFIER { @handler.push(val[0]) }
    | STRING_BASIC { @handler.push(val[0]) }
    | STRING_LITERAL { @handler.push(val[0]) }
    | INTEGER { @handler.push(val[0]) }
    | TRUE { @handler.push(val[0]) }
    | FALSE { @handler.push(val[0]) }
    ;
  inline_table
    : inline_table_start inline_continued
    ;
  inline_table_start
    : '{' { @handler.start_(:inline) }
    ;
  inline_continued
    : '}' { array = @handler.end_(:inline); @handler.push(Hash[*array]) }
    | inline_assignment_key inline_assignment_value inline_next
    ;
  inline_next
    : '}' {
      array = @handler.end_(:inline)
      array.map!.with_index{ |n,i| i.even? ? n.to_sym : n } if @handler.symbolize_keys
      @handler.push(Hash[*array])
    }
    | ',' inline_continued
    ;
  inline_assignment_key
    : IDENTIFIER { @handler.push(val[0]) }
    ;
  inline_assignment_value
    : '=' value
    ;
  assignment
    : IDENTIFIER '=' value { @handler.assign(val[0]) }
    | STRING_BASIC '=' value { @handler.assign(val[0]) }
    | STRING_LITERAL '=' value { @handler.assign(val[0]) }
    | INTEGER '=' value { @handler.assign(val[0]) }
    | TRUE '=' value { @handler.assign(val[0]) }
    | FALSE '=' value { @handler.assign(val[0]) }
    ;
  array
    : start_array array_continued
    ;
  array_continued
    : ']' { array = @handler.end_(:array); @handler.push(array) }
    | value array_next
    ;
  array_next
    : ']' { array = @handler.end_(:array); @handler.push(array) }
    | ',' array_continued
    ;
  start_array
    : '[' { @handler.start_(:array) }
    ;
  value
    : scalar { @handler.push(val[0]) }
    | array
    | inline_table
    ;
  scalar
    : string
    | literal
    ;
  literal
    | FLOAT { result = val[0].to_f }
    | FLOAT_INF { result = (val[0][0] == '-' ? -1 : 1) * Float::INFINITY }
    | FLOAT_NAN { result = Float::NAN }
    | INTEGER { result = val[0].to_i }
    | TRUE   { result = true }
    | FALSE  { result = false }
    | DATETIME { result = Time.new(*val[0])}
    ;
  string
    : STRING_MULTI { result = StringUtils.replace_escaped_chars(StringUtils.multiline_replacements(val[0])) }
    | STRING_BASIC { result = StringUtils.replace_escaped_chars(val[0]) }
    | STRING_LITERAL_MULTI { result = StringUtils.strip_spaces(val[0]) }
    | STRING_LITERAL { result = val[0] }
    ;
