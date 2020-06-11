require 'spec_helper'

RSpec.describe('Escape scanning') do
  include_examples 'scan', /c\at/,            1 => [:escape,  :bell,             '\a',             1,  3]

  # not an escape outside a character set
  include_examples 'scan', /c\bt/,            1 => [:anchor,  :word_boundary,    '\b',             1, 3]

  include_examples 'scan', /c\ft/,            1 => [:escape,  :form_feed,        '\f',             1,  3]
  include_examples 'scan', /c\nt/,            1 => [:escape,  :newline,          '\n',             1,  3]
  include_examples 'scan', /c\tt/,            1 => [:escape,  :tab,              '\t',             1,  3]
  include_examples 'scan', /c\vt/,            1 => [:escape,  :vertical_tab,     '\v',             1,  3]

  include_examples 'scan', 'c\qt',            1 => [:escape,  :literal,          '\q',             1,  3]

  include_examples 'scan', 'a\012c',          1 => [:escape,  :octal,            '\012',           1,  5]
  include_examples 'scan', 'a\0124',          1 => [:escape,  :octal,            '\012',           1,  5]
  include_examples 'scan', '\712+7',          0 => [:escape,  :octal,            '\712',           0,  4]

  include_examples 'scan', 'a\x24c',          1 => [:escape,  :hex,              '\x24',           1,  5]
  include_examples 'scan', 'a\x0640c',        1 => [:escape,  :hex,              '\x06',           1,  5]

  include_examples 'scan', 'a\u0640c',        1 => [:escape,  :codepoint,        '\u0640',         1,  7]
  include_examples 'scan', 'a\u{640 0641}c',  1 => [:escape,  :codepoint_list,   '\u{640 0641}',   1,  13]
  include_examples 'scan', 'a\u{10FFFF}c',    1 => [:escape,  :codepoint_list,   '\u{10FFFF}',     1,  11]

  include_examples 'scan', /a\cBc/,           1 => [:escape,  :control,          '\cB',            1,  4]
  include_examples 'scan', /a\c^c/,           1 => [:escape,  :control,          '\c^',            1,  4]
  include_examples 'scan', /a\c\n/,           1 => [:escape,  :control,          '\c\n',           1,  5]
  include_examples 'scan', /a\c\\b/,          1 => [:escape,  :control,          '\c\\\\',         1,  5]
  include_examples 'scan', /a\C-bc/,          1 => [:escape,  :control,          '\C-b',           1,  5]
  include_examples 'scan', /a\C-^b/,          1 => [:escape,  :control,          '\C-^',           1,  5]
  include_examples 'scan', /a\C-\nb/,         1 => [:escape,  :control,          '\C-\n',          1,  6]
  include_examples 'scan', /a\C-\\b/,         1 => [:escape,  :control,          '\C-\\\\',        1,  6]
  include_examples 'scan', /a\c\M-Bc/n,       1 => [:escape,  :control,          '\c\M-B',         1,  7]
  include_examples 'scan', /a\C-\M-Bc/n,      1 => [:escape,  :control,          '\C-\M-B',        1,  8]

  include_examples 'scan', /a\M-Bc/n,         1 => [:escape,  :meta_sequence,    '\M-B',           1,  5]
  include_examples 'scan', /a\M-\cBc/n,       1 => [:escape,  :meta_sequence,    '\M-\cB',         1,  7]
  include_examples 'scan', /a\M-\c^/n,        1 => [:escape,  :meta_sequence,    '\M-\c^',         1,  7]
  include_examples 'scan', /a\M-\c\n/n,       1 => [:escape,  :meta_sequence,    '\M-\c\n',        1,  8]
  include_examples 'scan', /a\M-\c\\/n,       1 => [:escape,  :meta_sequence,    '\M-\c\\\\',      1,  8]
  include_examples 'scan', /a\M-\C-Bc/n,      1 => [:escape,  :meta_sequence,    '\M-\C-B',        1,  8]
  include_examples 'scan', /a\M-\C-\\/n,      1 => [:escape,  :meta_sequence,    '\M-\C-\\\\',     1,  9]

  include_examples 'scan', 'ab\\\xcd',        1 => [:escape,  :backslash,        '\\\\',           2,  4]
  include_examples 'scan', 'ab\\\0cd',        1 => [:escape,  :backslash,        '\\\\',           2,  4]
  include_examples 'scan', 'ab\\\Kcd',        1 => [:escape,  :backslash,        '\\\\',           2,  4]

  include_examples 'scan', 'ab\^cd',          1 => [:escape,  :bol,              '\^',             2,  4]
  include_examples 'scan', 'ab\$cd',          1 => [:escape,  :eol,              '\$',             2,  4]
  include_examples 'scan', 'ab\[cd',          1 => [:escape,  :set_open,         '\[',             2,  4]
end
