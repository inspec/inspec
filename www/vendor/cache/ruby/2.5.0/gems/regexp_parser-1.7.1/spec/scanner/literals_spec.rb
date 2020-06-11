require 'spec_helper'

RSpec.describe('UTF8 scanning') do
  # ascii, single byte characters
  include_examples 'scan', 'a', 0              => [:literal,     :literal,       'a',        0, 1]

  include_examples 'scan', 'ab+', 0            => [:literal,     :literal,       'ab',       0, 2]
  include_examples 'scan', 'ab+', 1            => [:quantifier,  :one_or_more,   '+',        2, 3]

  # 2 byte wide characters, Arabic
  include_examples 'scan', 'aاbبcت', 0         => [:literal,     :literal,       'aاbبcت',   0, 9]

  include_examples 'scan', 'aاbبت?', 0         => [:literal,     :literal,       'aاbبت',    0, 8]
  include_examples 'scan', 'aاbبت?', 1         => [:quantifier,  :zero_or_one,   '?',        8, 9]

  include_examples 'scan', 'aا?bبcت+', 0       => [:literal,     :literal,       'aا',       0, 3]
  include_examples 'scan', 'aا?bبcت+', 1       => [:quantifier,  :zero_or_one,   '?',        3, 4]
  include_examples 'scan', 'aا?bبcت+', 2       => [:literal,     :literal,       'bبcت',     4, 10]
  include_examples 'scan', 'aا?bبcت+', 3       => [:quantifier,  :one_or_more,   '+',        10, 11]

  include_examples 'scan', 'a(اbب+)cت?', 0     => [:literal,     :literal,       'a',        0, 1]
  include_examples 'scan', 'a(اbب+)cت?', 1     => [:group,       :capture,       '(',        1, 2]
  include_examples 'scan', 'a(اbب+)cت?', 2     => [:literal,     :literal,       'اbب',      2, 7]
  include_examples 'scan', 'a(اbب+)cت?', 3     => [:quantifier,  :one_or_more,   '+',        7, 8]
  include_examples 'scan', 'a(اbب+)cت?', 4     => [:group,       :close,         ')',        8, 9]
  include_examples 'scan', 'a(اbب+)cت?', 5     => [:literal,     :literal,       'cت',       9, 12]
  include_examples 'scan', 'a(اbب+)cت?', 6     => [:quantifier,  :zero_or_one,   '?',        12, 13]

  # 3 byte wide characters, Japanese
  include_examples 'scan', 'ab?れます+cd', 0    => [:literal,     :literal,       'ab',       0, 2]
  include_examples 'scan', 'ab?れます+cd', 1    => [:quantifier,  :zero_or_one,   '?',        2, 3]
  include_examples 'scan', 'ab?れます+cd', 2    => [:literal,     :literal,       'れます',    3, 12]
  include_examples 'scan', 'ab?れます+cd', 3    => [:quantifier,  :one_or_more,   '+',        12, 13]
  include_examples 'scan', 'ab?れます+cd', 4    => [:literal,     :literal,       'cd',       13, 15]

  # 4 byte wide characters, Osmanya
  include_examples 'scan', '𐒀𐒁?𐒂ab+𐒃', 0      => [:literal,     :literal,       '𐒀𐒁',       0, 8]
  include_examples 'scan', '𐒀𐒁?𐒂ab+𐒃', 1      => [:quantifier,  :zero_or_one,   '?',        8, 9]
  include_examples 'scan', '𐒀𐒁?𐒂ab+𐒃', 2      => [:literal,     :literal,       '𐒂ab',      9, 15]
  include_examples 'scan', '𐒀𐒁?𐒂ab+𐒃', 3      => [:quantifier,  :one_or_more,   '+',        15, 16]
  include_examples 'scan', '𐒀𐒁?𐒂ab+𐒃', 4      => [:literal,     :literal,       '𐒃',        16, 20]

  include_examples 'scan', 'mu𝄞?si*𝄫c+', 0      => [:literal,     :literal,       'mu𝄞',       0, 6]
  include_examples 'scan', 'mu𝄞?si*𝄫c+', 1      => [:quantifier,  :zero_or_one,   '?',        6, 7]
  include_examples 'scan', 'mu𝄞?si*𝄫c+', 2      => [:literal,     :literal,       'si',       7, 9]
  include_examples 'scan', 'mu𝄞?si*𝄫c+', 3      => [:quantifier,  :zero_or_more,  '*',        9, 10]
  include_examples 'scan', 'mu𝄞?si*𝄫c+', 4      => [:literal,     :literal,       '𝄫c',       10, 15]
  include_examples 'scan', 'mu𝄞?si*𝄫c+', 5      => [:quantifier,  :one_or_more,   '+',        15, 16]
end
