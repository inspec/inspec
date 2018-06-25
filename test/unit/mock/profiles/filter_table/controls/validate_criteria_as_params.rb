title '`where` should reject unknown criteria'

raw_data = [
  { id: 1, name: 'Annie', shoe_size: 12},
  { id: 2, name: 'Bobby', shoe_size: 10, favorite_color: 'purple'},
]

control '2943_pass_undeclared_field_in_hash' do
  title 'It should tolerate criteria that are keys of the raw data but are not declared as fields'
  # simple_plural only has one declared field, 'id'
  describe simple_plural(raw_data).where(name: 'Annie') do
    it { should exist }
  end
end

control '2943_pass_irregular_row_key' do
  title 'It should tolerate criteria that are keys of one row but not the first'
  describe simple_plural(raw_data).where(favorite_color: 'purple') do
    it { should exist }
  end
end

control '2943_pass_raise_error_when_key_not_in_data' do
  describe 'It should not tolerate criteria that are not keys of the raw data' do
    it { lambda { simple_plural(raw_data).where(hat_size: 'Why are these in eighths?') }.should raise_error ArgumentError }
  end
end

control '2943_pass_no_error_when_no_data' do
  describe simple_plural([]).where(arbitrary_key: 'any_value') do
    it { should_not exist }
  end
end


# This should fail but not abort the run
# It is treated as a control source code failure
control '2943_fail_derail_check' do
  describe simple_plural(raw_data).where(monocle_size: 'poppable') do
    it { should exist }
  end
end