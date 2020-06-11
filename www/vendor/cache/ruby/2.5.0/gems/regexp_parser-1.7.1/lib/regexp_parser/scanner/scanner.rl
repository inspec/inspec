%%{
  machine re_scanner;
  include re_char_type "char_type.rl";
  include re_property  "property.rl";

  dot                   = '.';
  backslash             = '\\';
  alternation           = '|';
  beginning_of_line     = '^';
  end_of_line           = '$';

  range_open            = '{';
  range_close           = '}';
  curlies               = range_open | range_close;

  group_open            = '(';
  group_close           = ')';
  parantheses           = group_open | group_close;

  set_open              = '[';
  set_close             = ']';
  brackets              = set_open | set_close;

  comment               = ('#' . [^\n]* . '\n');

  class_name_posix      = 'alnum' | 'alpha' | 'blank' |
                          'cntrl' | 'digit' | 'graph' |
                          'lower' | 'print' | 'punct' |
                          'space' | 'upper' | 'xdigit' |
                          'word'  | 'ascii';

  class_posix           = ('[:' . '^'? . class_name_posix . ':]');


  # these are not supported in ruby, and need verification
  collating_sequence    = '[.' . (alpha | [\-])+ . '.]';
  character_equivalent  = '[=' . alpha . '=]';

  line_anchor           = beginning_of_line | end_of_line;
  anchor_char           = [AbBzZG];

  escaped_ascii         = [abefnrtv];
  octal_sequence        = [0-7]{1,3};

  hex_sequence          = 'x' . xdigit{1,2};
  hex_sequence_err      = 'x' . [^0-9a-fA-F{];

  codepoint_single      = 'u' . xdigit{4};
  codepoint_list        = 'u{' . xdigit{1,6} . (space . xdigit{1,6})* . '}';
  codepoint_sequence    = codepoint_single | codepoint_list;

  control_sequence      = ('c' | 'C-') . (backslash . 'M-')? . backslash? . any;

  meta_sequence         = 'M-' . (backslash . ('c' | 'C-'))? . backslash? . any;

  zero_or_one           = '?' | '??' | '?+';
  zero_or_more          = '*' | '*?' | '*+';
  one_or_more           = '+' | '+?' | '++';

  quantifier_greedy     = '?'  | '*'  | '+';
  quantifier_reluctant  = '??' | '*?' | '+?';
  quantifier_possessive = '?+' | '*+' | '++';
  quantifier_mode       = '?'  | '+';

  quantity_exact        = (digit+);
  quantity_minimum      = (digit+) . ',';
  quantity_maximum      = ',' . (digit+);
  quantity_range        = (digit+) . ',' . (digit+);
  quantifier_interval   = range_open . ( quantity_exact | quantity_minimum |
                          quantity_maximum | quantity_range ) . range_close .
                          quantifier_mode?;

  quantifiers           = quantifier_greedy | quantifier_reluctant |
                          quantifier_possessive | quantifier_interval;

  conditional           = '(?(';

  group_comment         = '?#' . [^)]* . group_close;

  group_atomic          = '?>';
  group_passive         = '?:';
  group_absence         = '?~';

  assertion_lookahead   = '?=';
  assertion_nlookahead  = '?!';
  assertion_lookbehind  = '?<=';
  assertion_nlookbehind = '?<!';

  # try to treat every other group head as options group, like Ruby
  group_options         = '?' . ( [^!#'():<=>~]+ . ':'? ) ?;

  group_ref             = [gk];
  group_name_char       = (alnum | '_');
  group_name_id         = (group_name_char . (group_name_char+)?)?;
  group_number          = '-'? . [1-9] . ([0-9]+)?;
  group_level           = [+\-] . [0-9]+;

  group_name            = ('<' . group_name_id . '>') | ("'" . group_name_id . "'");
  group_lookup          = group_name | group_number;

  group_named           = ('?' . group_name );

  group_name_ref        = group_ref . (('<' . group_name_id . group_level? '>') |
                                       ("'" . group_name_id . group_level? "'"));

  group_number_ref      = group_ref . (('<' . group_number . group_level? '>') |
                                       ("'" . group_number . group_level? "'"));

  group_type            = group_atomic | group_passive | group_absence | group_named;

  keep_mark             = 'K';

  assertion_type        = assertion_lookahead  | assertion_nlookahead |
                          assertion_lookbehind | assertion_nlookbehind;

  # characters that 'break' a literal
  meta_char             = dot | backslash | alternation |
                          curlies | parantheses | brackets |
                          line_anchor | quantifier_greedy;

  literal_delimiters    = ']' | '}';

  ascii_print           = ((0x20..0x7e) - meta_char);
  ascii_nonprint        = (0x01..0x1f | 0x7f);

  utf8_2_byte           = (0xc2..0xdf 0x80..0xbf);
  utf8_3_byte           = (0xe0..0xef 0x80..0xbf 0x80..0xbf);
  utf8_4_byte           = (0xf0..0xf4 0x80..0xbf 0x80..0xbf 0x80..0xbf);

  non_literal_escape    = char_type_char | anchor_char | escaped_ascii |
                          group_ref | keep_mark | [xucCM];

  non_set_escape        = (anchor_char - 'b') | group_ref | keep_mark |
                          multi_codepoint_char_type | [0-9cCM];

  # EOF error, used where it can be detected
  action premature_end_error {
    text = ts ? copy(data, ts-1..-1) : data.pack('c*')
    raise PrematureEndError.new( text )
  }

  # Invalid sequence error, used from sequences, like escapes and sets
  action invalid_sequence_error {
    text = ts ? copy(data, ts-1..-1) : data.pack('c*')
    validation_error(:sequence, 'sequence', text)
  }

  # group (nesting) and set open/close actions
  action group_opened { self.group_depth = group_depth + 1 }
  action group_closed { self.group_depth = group_depth - 1 }
  action set_opened   { self.set_depth   = set_depth   + 1 }
  action set_closed   { self.set_depth   = set_depth   - 1 }

  # Character set scanner, continues consuming characters until it meets the
  # closing bracket of the set.
  # --------------------------------------------------------------------------
  character_set := |*
    set_close > (set_meta, 2) @set_closed {
      emit(:set, :close, *text(data, ts, te))
      if in_set?
        fret;
      else
        fgoto main;
      end
    };

    '-]' @set_closed { # special case, emits two tokens
      emit(:literal, :literal, copy(data, ts..te-2), ts, te - 1)
      emit(:set, :close, copy(data, ts+1..te-1), ts + 1, te)
      if in_set?
        fret;
      else
        fgoto main;
      end
    };

    '-&&' { # special case, emits two tokens
      emit(:literal, :literal, '-', ts, te)
      emit(:set, :intersection, '&&', ts, te)
    };

    '^' {
      text = text(data, ts, te).first
      if tokens.last[1] == :open
        emit(:set, :negate, text, ts, te)
      else
        emit(:literal, :literal, text, ts, te)
      end
    };

    '-' {
      text = text(data, ts, te).first
      # ranges cant start with a subset or intersection/negation/range operator
      if tokens.last[0] == :set
        emit(:literal, :literal, text, ts, te)
      else
        emit(:set, :range, text, ts, te)
      end
    };

    # Unlike ranges, intersections can start or end at set boundaries, whereupon
    # they match nothing: r = /[a&&]/; [r =~ ?a, r =~ ?&] # => [nil, nil]
    '&&' {
      emit(:set, :intersection, *text(data, ts, te))
    };

    backslash {
      fcall set_escape_sequence;
    };

    set_open >(open_bracket, 1) >set_opened {
      emit(:set, :open, *text(data, ts, te))
      fcall character_set;
    };

    class_posix >(open_bracket, 1) @set_closed @eof(premature_end_error)  {
      text = text(data, ts, te).first

      type = :posixclass
      class_name = text[2..-3]
      if class_name[0].chr == '^'
        class_name = class_name[1..-1]
        type = :nonposixclass
      end

      emit(type, class_name.to_sym, text, ts, te)
    };

    collating_sequence >(open_bracket, 1) @set_closed @eof(premature_end_error)  {
      emit(:set, :collation, *text(data, ts, te))
    };

    character_equivalent >(open_bracket, 1) @set_closed @eof(premature_end_error)  {
      emit(:set, :equivalent, *text(data, ts, te))
    };

    meta_char > (set_meta, 1) {
      emit(:literal, :literal, *text(data, ts, te))
    };

    any            |
    ascii_nonprint |
    utf8_2_byte    |
    utf8_3_byte    |
    utf8_4_byte    {
      char, *rest = *text(data, ts, te)
      char.force_encoding('utf-8') if char.respond_to?(:force_encoding)
      emit(:literal, :literal, char, *rest)
    };
  *|;

  # set escapes scanner
  # --------------------------------------------------------------------------
  set_escape_sequence := |*
    non_set_escape > (escaped_set_alpha, 2) {
      emit(:escape, :literal, *text(data, ts, te, 1))
      fret;
    };

    any > (escaped_set_alpha, 1) {
      fhold;
      fnext character_set;
      fcall escape_sequence;
    };
  *|;


  # escape sequence scanner
  # --------------------------------------------------------------------------
  escape_sequence := |*
    [1-9] {
      text = text(data, ts, te, 1).first
      emit(:backref, :number, text, ts-1, te)
      fret;
    };

    octal_sequence {
      emit(:escape, :octal, *text(data, ts, te, 1))
      fret;
    };

    meta_char {
      case text = text(data, ts, te, 1).first
      when '\.';  emit(:escape, :dot,               text, ts-1, te)
      when '\|';  emit(:escape, :alternation,       text, ts-1, te)
      when '\^';  emit(:escape, :bol,               text, ts-1, te)
      when '\$';  emit(:escape, :eol,               text, ts-1, te)
      when '\?';  emit(:escape, :zero_or_one,       text, ts-1, te)
      when '\*';  emit(:escape, :zero_or_more,      text, ts-1, te)
      when '\+';  emit(:escape, :one_or_more,       text, ts-1, te)
      when '\(';  emit(:escape, :group_open,        text, ts-1, te)
      when '\)';  emit(:escape, :group_close,       text, ts-1, te)
      when '\{';  emit(:escape, :interval_open,     text, ts-1, te)
      when '\}';  emit(:escape, :interval_close,    text, ts-1, te)
      when '\[';  emit(:escape, :set_open,          text, ts-1, te)
      when '\]';  emit(:escape, :set_close,         text, ts-1, te)
      when "\\\\";
        emit(:escape, :backslash, text, ts-1, te)
      end
      fret;
    };

    escaped_ascii > (escaped_alpha, 7) {
      # \b is emitted as backspace only when inside a character set, otherwise
      # it is a word boundary anchor. A syntax might "normalize" it if needed.
      case text = text(data, ts, te, 1).first
      when '\a'; emit(:escape, :bell,           text, ts-1, te)
      when '\b'; emit(:escape, :backspace,      text, ts-1, te)
      when '\e'; emit(:escape, :escape,         text, ts-1, te)
      when '\f'; emit(:escape, :form_feed,      text, ts-1, te)
      when '\n'; emit(:escape, :newline,        text, ts-1, te)
      when '\r'; emit(:escape, :carriage,       text, ts-1, te)
      when '\t'; emit(:escape, :tab,            text, ts-1, te)
      when '\v'; emit(:escape, :vertical_tab,   text, ts-1, te)
      end
      fret;
    };

    codepoint_sequence > (escaped_alpha, 6) $eof(premature_end_error) {
      text = text(data, ts, te, 1).first
      if text[2].chr == '{'
        emit(:escape, :codepoint_list, text, ts-1, te)
      else
        emit(:escape, :codepoint,      text, ts-1, te)
      end
      fret;
    };

    hex_sequence > (escaped_alpha, 5) $eof(premature_end_error) {
      emit(:escape, :hex, *text(data, ts, te, 1))
      fret;
    };

    hex_sequence_err @invalid_sequence_error {
      fret;
    };

    control_sequence >(escaped_alpha, 4) $eof(premature_end_error) {
      emit_meta_control_sequence(data, ts, te, :control)
      fret;
    };

    meta_sequence >(backslashed, 3) $eof(premature_end_error) {
      emit_meta_control_sequence(data, ts, te, :meta_sequence)
      fret;
    };

    char_type_char > (escaped_alpha, 2) {
      fhold;
      fnext *(in_set? ? fentry(character_set) : fentry(main));
      fcall char_type;
    };

    property_char > (escaped_alpha, 2) {
      fhold;
      fnext *(in_set? ? fentry(character_set) : fentry(main));
      fcall unicode_property;
    };

    (any -- non_literal_escape) > (escaped_alpha, 1)  {
      emit(:escape, :literal, *text(data, ts, te, 1))
      fret;
    };
  *|;


  # conditional expressions scanner
  # --------------------------------------------------------------------------
  conditional_expression := |*
    group_lookup . ')' {
      text = text(data, ts, te-1).first
      emit(:conditional, :condition, text, ts, te-1)
      emit(:conditional, :condition_close, ')', te-1, te)
    };

    any {
      fhold;
      fcall main;
    };
  *|;


  # Main scanner
  # --------------------------------------------------------------------------
  main := |*

    # Meta characters
    # ------------------------------------------------------------------------
    dot {
      emit(:meta, :dot, *text(data, ts, te))
    };

    alternation {
      if conditional_stack.last == group_depth
        emit(:conditional, :separator, *text(data, ts, te))
      else
        emit(:meta, :alternation, *text(data, ts, te))
      end
    };

    # Anchors
    # ------------------------------------------------------------------------
    beginning_of_line {
      emit(:anchor, :bol, *text(data, ts, te))
    };

    end_of_line {
      emit(:anchor, :eol, *text(data, ts, te))
    };

    backslash . keep_mark > (backslashed, 4) {
      emit(:keep, :mark, *text(data, ts, te))
    };

    backslash . anchor_char > (backslashed, 3) {
      case text = text(data, ts, te).first
      when '\\A'; emit(:anchor, :bos,                text, ts, te)
      when '\\z'; emit(:anchor, :eos,                text, ts, te)
      when '\\Z'; emit(:anchor, :eos_ob_eol,         text, ts, te)
      when '\\b'; emit(:anchor, :word_boundary,      text, ts, te)
      when '\\B'; emit(:anchor, :nonword_boundary,   text, ts, te)
      when '\\G'; emit(:anchor, :match_start,        text, ts, te)
      end
    };

    literal_delimiters {
      append_literal(data, ts, te)
    };

    # Character sets
    # ------------------------------------------------------------------------
    set_open >set_opened {
      emit(:set, :open, *text(data, ts, te))
      fcall character_set;
    };


    # Conditional expression
    #   (?(condition)Y|N)   conditional expression
    # ------------------------------------------------------------------------
    conditional {
      text = text(data, ts, te).first

      conditional_stack << group_depth

      emit(:conditional, :open, text[0..-2], ts, te-1)
      emit(:conditional, :condition_open, '(', te-1, te)
      fcall conditional_expression;
    };


    # (?#...) comments: parsed as a single expression, without introducing a
    # new nesting level. Comments may not include parentheses, escaped or not.
    # special case for close, action performed on all transitions to get the
    # correct closing count.
    # ------------------------------------------------------------------------
    group_open . group_comment $group_closed {
      emit(:group, :comment, *text(data, ts, te))
    };

    # Expression options:
    #   (?imxdau-imx)         option on/off
    #                         i: ignore case
    #                         m: multi-line (dot(.) match newline)
    #                         x: extended form
    #                         d: default class rules (1.9 compatible)
    #                         a: ASCII class rules (\s, \w, etc.)
    #                         u: Unicode class rules (\s, \w, etc.)
    #
    #   (?imxdau-imx:subexp)  option on/off for subexp
    # ------------------------------------------------------------------------
    group_open . group_options >group_opened {
      text = text(data, ts, te).first
      if text[2..-1] =~ /([^\-mixdau:]|^$)|-.*([dau])/
        raise InvalidGroupOption.new($1 || "-#{$2}", text)
      end
      emit_options(text, ts, te)
    };

    # Assertions
    #   (?=subexp)          look-ahead
    #   (?!subexp)          negative look-ahead
    #   (?<=subexp)         look-behind
    #   (?<!subexp)         negative look-behind
    # ------------------------------------------------------------------------
    group_open . assertion_type >group_opened {
      case text = text(data, ts, te).first
      when '(?=';  emit(:assertion, :lookahead,    text, ts, te)
      when '(?!';  emit(:assertion, :nlookahead,   text, ts, te)
      when '(?<='; emit(:assertion, :lookbehind,   text, ts, te)
      when '(?<!'; emit(:assertion, :nlookbehind,  text, ts, te)
      end
    };

    # Groups
    #   (?:subexp)          passive (non-captured) group
    #   (?>subexp)          atomic group, don't backtrack in subexp.
    #   (?~subexp)          absence group, matches anything that is not subexp
    #   (?<name>subexp)     named group
    #   (?'name'subexp)     named group (single quoted version)
    #   (subexp)            captured group
    # ------------------------------------------------------------------------
    group_open . group_type >group_opened {
      case text = text(data, ts, te).first
      when '(?:';  emit(:group, :passive,      text, ts, te)
      when '(?>';  emit(:group, :atomic,       text, ts, te)
      when '(?~';  emit(:group, :absence,      text, ts, te)

      when /^\(\?(?:<>|'')/
        validation_error(:group, 'named group', 'name is empty')

      when /^\(\?<\w*>/
        emit(:group, :named_ab,  text, ts, te)

      when /^\(\?'\w*'/
        emit(:group, :named_sq,  text, ts, te)

      end
    };

    group_open @group_opened {
      text = text(data, ts, te).first
      emit(:group, :capture, text, ts, te)
    };

    group_close @group_closed {
      if conditional_stack.last == group_depth + 1
        conditional_stack.pop
        emit(:conditional, :close, *text(data, ts, te))
      else
        if spacing_stack.length > 1 &&
           spacing_stack.last[:depth] == group_depth + 1
          spacing_stack.pop
          self.free_spacing = spacing_stack.last[:free_spacing]
        end

        emit(:group, :close, *text(data, ts, te))
      end
    };


    # Group backreference, named and numbered
    # ------------------------------------------------------------------------
    backslash . (group_name_ref | group_number_ref) > (backslashed, 4) {
      case text = text(data, ts, te).first
      when /^\\([gk])(<>|'')/ # angle brackets
        validation_error(:backref, 'ref/call', 'ref ID is empty')

      when /^\\([gk])<[^\d+-]\w*>/ # angle-brackets
        if $1 == 'k'
          emit(:backref, :name_ref_ab, text, ts, te)
        else
          emit(:backref, :name_call_ab, text, ts, te)
        end

      when /^\\([gk])'[^\d+-]\w*'/ #single quotes
        if $1 == 'k'
          emit(:backref, :name_ref_sq, text, ts, te)
        else
          emit(:backref, :name_call_sq, text, ts, te)
        end

      when /^\\([gk])<\d+>/ # angle-brackets
        if $1 == 'k'
          emit(:backref, :number_ref_ab, text, ts, te)
        else
          emit(:backref, :number_call_ab, text, ts, te)
        end

      when /^\\([gk])'\d+'/ # single quotes
        if $1 == 'k'
          emit(:backref, :number_ref_sq, text, ts, te)
        else
          emit(:backref, :number_call_sq, text, ts, te)
        end

      when /^\\(?:g<\+|g<-|(k)<-)\d+>/ # angle-brackets
        if $1 == 'k'
          emit(:backref, :number_rel_ref_ab, text, ts, te)
        else
          emit(:backref, :number_rel_call_ab, text, ts, te)
        end

      when /^\\(?:g'\+|g'-|(k)'-)\d+'/ # single quotes
        if $1 == 'k'
          emit(:backref, :number_rel_ref_sq, text, ts, te)
        else
          emit(:backref, :number_rel_call_sq, text, ts, te)
        end

      when /^\\k<[^\d+\-]\w*[+\-]\d+>/ # angle-brackets
        emit(:backref, :name_recursion_ref_ab, text, ts, te)

      when /^\\k'[^\d+\-]\w*[+\-]\d+'/ # single-quotes
        emit(:backref, :name_recursion_ref_sq, text, ts, te)

      when /^\\([gk])<[+\-]?\d+[+\-]\d+>/ # angle-brackets
        emit(:backref, :number_recursion_ref_ab, text, ts, te)

      when /^\\([gk])'[+\-]?\d+[+\-]\d+'/ # single-quotes
        emit(:backref, :number_recursion_ref_sq, text, ts, te)

      end
    };


    # Quantifiers
    # ------------------------------------------------------------------------
    zero_or_one {
      case text = text(data, ts, te).first
      when '?' ;  emit(:quantifier, :zero_or_one,            text, ts, te)
      when '??';  emit(:quantifier, :zero_or_one_reluctant,  text, ts, te)
      when '?+';  emit(:quantifier, :zero_or_one_possessive, text, ts, te)
      end
    };

    zero_or_more {
      case text = text(data, ts, te).first
      when '*' ;  emit(:quantifier, :zero_or_more,            text, ts, te)
      when '*?';  emit(:quantifier, :zero_or_more_reluctant,  text, ts, te)
      when '*+';  emit(:quantifier, :zero_or_more_possessive, text, ts, te)
      end
    };

    one_or_more {
      case text = text(data, ts, te).first
      when '+' ;  emit(:quantifier, :one_or_more,            text, ts, te)
      when '+?';  emit(:quantifier, :one_or_more_reluctant,  text, ts, te)
      when '++';  emit(:quantifier, :one_or_more_possessive, text, ts, te)
      end
    };

    quantifier_interval  {
      emit(:quantifier, :interval, *text(data, ts, te))
    };

    # Catch unmatched curly braces as literals
    range_open {
      append_literal(data, ts, te)
    };

    # Escaped sequences
    # ------------------------------------------------------------------------
    backslash > (backslashed, 1) {
      fcall escape_sequence;
    };

    comment {
      if free_spacing
        emit(:free_space, :comment, *text(data, ts, te))
      else
        append_literal(data, ts, te)
      end
    };

    space+ {
      if free_spacing
        emit(:free_space, :whitespace, *text(data, ts, te))
      else
        append_literal(data, ts, te)
      end
    };

    # Literal: any run of ASCII (pritable or non-printable), and/or UTF-8,
    # except meta characters.
    # ------------------------------------------------------------------------
    (ascii_print -- space)+    |
    ascii_nonprint+ |
    utf8_2_byte+    |
    utf8_3_byte+    |
    utf8_4_byte+    {
      append_literal(data, ts, te)
    };

  *|;
}%%

# THIS IS A GENERATED FILE, DO NOT EDIT DIRECTLY
# This file was generated from lib/regexp_parser/scanner/scanner.rl

class Regexp::Scanner
  # General scanner error (catch all)
  class ScannerError < StandardError; end

  # Base for all scanner validation errors
  class ValidationError < StandardError
    def initialize(reason)
      super reason
    end
  end

  # Unexpected end of pattern
  class PrematureEndError < ScannerError
    def initialize(where = '')
      super "Premature end of pattern at #{where}"
    end
  end

  # Invalid sequence format. Used for escape sequences, mainly.
  class InvalidSequenceError < ValidationError
    def initialize(what = 'sequence', where = '')
      super "Invalid #{what} at #{where}"
    end
  end

  # Invalid group. Used for named groups.
  class InvalidGroupError < ValidationError
    def initialize(what, reason)
      super "Invalid #{what}, #{reason}."
    end
  end

  # Invalid groupOption. Used for inline options.
  class InvalidGroupOption < ValidationError
    def initialize(option, text)
      super "Invalid group option #{option} in #{text}"
    end
  end

  # Invalid back reference. Used for name a number refs/calls.
  class InvalidBackrefError < ValidationError
    def initialize(what, reason)
      super "Invalid back reference #{what}, #{reason}"
    end
  end

  # The property name was not recognized by the scanner.
  class UnknownUnicodePropertyError < ValidationError
    def initialize(name)
      super "Unknown unicode character property name #{name}"
    end
  end

  # Scans the given regular expression text, or Regexp object and collects the
  # emitted token into an array that gets returned at the end. If a block is
  # given, it gets called for each emitted token.
  #
  # This method may raise errors if a syntax error is encountered.
  # --------------------------------------------------------------------------
  def self.scan(input_object, &block)
    new.scan(input_object, &block)
  end

  def scan(input_object, &block)
    self.literal = nil
    stack = []

    if input_object.is_a?(Regexp)
      input = input_object.source
      self.free_spacing = (input_object.options & Regexp::EXTENDED != 0)
    else
      input = input_object
      self.free_spacing = false
    end
    self.spacing_stack = [{:free_spacing => free_spacing, :depth => 0}]

    data  = input.unpack("c*") if input.is_a?(String)
    eof   = data.length

    self.tokens = []
    self.block  = block_given? ? block : nil

    self.set_depth = 0
    self.group_depth = 0
    self.conditional_stack = []

    %% write data;
    %% write init;
    %% write exec;

    # to avoid "warning: assigned but unused variable - testEof"
    testEof = testEof

    if cs == re_scanner_error
      text = ts ? copy(data, ts-1..-1) : data.pack('c*')
      raise ScannerError.new("Scan error at '#{text}'")
    end

    raise PrematureEndError.new("(missing group closing paranthesis) "+
          "[#{group_depth}]") if in_group?
    raise PrematureEndError.new("(missing set closing bracket) "+
          "[#{set_depth}]") if in_set?

    # when the entire expression is a literal run
    emit_literal if literal

    tokens
  end

  # lazy-load property maps when first needed
  require 'yaml'
  PROP_MAPS_DIR = File.expand_path('../scanner/properties', __FILE__)

  def self.short_prop_map
    @short_prop_map ||= YAML.load_file("#{PROP_MAPS_DIR}/short.yml")
  end

  def self.long_prop_map
    @long_prop_map ||= YAML.load_file("#{PROP_MAPS_DIR}/long.yml")
  end

  # Emits an array with the details of the scanned pattern
  def emit(type, token, text, ts, te)
    #puts "EMIT: type: #{type}, token: #{token}, text: #{text}, ts: #{ts}, te: #{te}"

    emit_literal if literal

    if block
      block.call type, token, text, ts, te
    end

    tokens << [type, token, text, ts, te]
  end

  private

  attr_accessor :tokens, :literal, :block, :free_spacing, :spacing_stack,
                :group_depth, :set_depth, :conditional_stack

  def in_group?
    group_depth > 0
  end

  def in_set?
    set_depth > 0
  end

  # Copy from ts to te from data as text
  def copy(data, range)
    data[range].pack('c*')
  end

  # Copy from ts to te from data as text, returning an array with the text
  #  and the offsets used to copy it.
  def text(data, ts, te, soff = 0)
    [copy(data, ts-soff..te-1), ts-soff, te]
  end

  # Appends one or more characters to the literal buffer, to be emitted later
  # by a call to emit_literal. Contents can be a mix of ASCII and UTF-8.
  def append_literal(data, ts, te)
    self.literal = literal || []
    literal << text(data, ts, te)
  end

  # Emits the literal run collected by calls to the append_literal method,
  # using the total start (ts) and end (te) offsets of the run.
  def emit_literal
    ts, te = literal.first[1], literal.last[2]
    text = literal.map {|t| t[0]}.join

    text.force_encoding('utf-8') if text.respond_to?(:force_encoding)

    self.literal = nil
    emit(:literal, :literal, text, ts, te)
  end

  def emit_options(text, ts, te)
    token = nil

    # Ruby allows things like '(?-xxxx)' or '(?xx-xx--xx-:abc)'.
    text =~ /\(\?([mixdau]*)(-(?:[mix]*))*(:)?/
    positive, negative, group_local = $1, $2, $3

    if positive.include?('x')
      self.free_spacing = true
    end

    # If the x appears in both, treat it like ruby does, the second cancels
    # the first.
    if negative && negative.include?('x')
      self.free_spacing = false
    end

    if group_local
      spacing_stack << {:free_spacing => free_spacing, :depth => group_depth}
      token = :options
    else
      # switch for parent group level
      spacing_stack.last[:free_spacing] = free_spacing
      token = :options_switch
    end

    emit(:group, token, text, ts, te)
  end

  def emit_meta_control_sequence(data, ts, te, token)
    if data.last < 0x00 || data.last > 0x7F
      validation_error(:sequence, 'escape', token.to_s)
    end
    emit(:escape, token, *text(data, ts, te, 1))
  end

  # Centralizes and unifies the handling of validation related
  # errors.
  def validation_error(type, what, reason)
    case type
    when :group
      error = InvalidGroupError.new(what, reason)
    when :backref
      error = InvalidBackrefError.new(what, reason)
    when :sequence
      error = InvalidSequenceError.new(what, reason)
    end

    raise error # unless @@config.validation_ignore
  end
end # module Regexp::Scanner
