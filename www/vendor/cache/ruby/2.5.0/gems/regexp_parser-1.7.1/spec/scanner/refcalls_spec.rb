require 'spec_helper'

RSpec.describe('RefCall scanning') do
  # Traditional numerical group back-reference
  include_examples 'scan', '(abc)\1' ,          3 => [:backref, :number,                  '\1',         5, 7]

  # Group back-references, named, numbered, and relative
  include_examples 'scan', '(?<X>abc)\k<X>',    3 => [:backref, :name_ref_ab,             '\k<X>',      9, 14]
  include_examples 'scan', "(?<X>abc)\\k'X'",   3 => [:backref, :name_ref_sq,             "\\k'X'",     9, 14]

  include_examples 'scan', '(abc)\k<1>',        3 => [:backref, :number_ref_ab,           '\k<1>',      5, 10]
  include_examples 'scan', "(abc)\\k'1'",       3 => [:backref, :number_ref_sq,           "\\k'1'",     5, 10]

  include_examples 'scan', '(abc)\k<-1>',       3 => [:backref, :number_rel_ref_ab,       '\k<-1>',     5, 11]
  include_examples 'scan', "(abc)\\k'-1'",      3 => [:backref, :number_rel_ref_sq,       "\\k'-1'",    5, 11]

  # Sub-expression invocation, named, numbered, and relative
  include_examples 'scan', '(?<X>abc)\g<X>',    3 => [:backref, :name_call_ab,            '\g<X>',      9, 14]
  include_examples 'scan', "(?<X>abc)\\g'X'",   3 => [:backref, :name_call_sq,            "\\g'X'",     9, 14]

  include_examples 'scan', '(abc)\g<1>',        3 => [:backref, :number_call_ab,          '\g<1>',      5, 10]
  include_examples 'scan', "(abc)\\g'1'",       3 => [:backref, :number_call_sq,          "\\g'1'",     5, 10]

  include_examples 'scan', '(abc)\g<-1>',       3 => [:backref, :number_rel_call_ab,      '\g<-1>',     5, 11]
  include_examples 'scan', "(abc)\\g'-1'",      3 => [:backref, :number_rel_call_sq,      "\\g'-1'",    5, 11]

  include_examples 'scan', '\g<+1>(abc)',       0 => [:backref, :number_rel_call_ab,      '\g<+1>',     0, 6]
  include_examples 'scan', "\\g'+1'(abc)",      0 => [:backref, :number_rel_call_sq,      "\\g'+1'",    0, 6]

  # Group back-references, with recursion level
  include_examples 'scan', '(?<X>abc)\k<X-0>',  3 => [:backref, :name_recursion_ref_ab,   '\k<X-0>',    9, 16]
  include_examples 'scan', "(?<X>abc)\\k'X-0'", 3 => [:backref, :name_recursion_ref_sq,   "\\k'X-0'",   9, 16]

  include_examples 'scan', '(abc)\k<1-0>',      3 => [:backref, :number_recursion_ref_ab, '\k<1-0>',    5, 12]
  include_examples 'scan', "(abc)\\k'1-0'",     3 => [:backref, :number_recursion_ref_sq, "\\k'1-0'",   5, 12]
end
