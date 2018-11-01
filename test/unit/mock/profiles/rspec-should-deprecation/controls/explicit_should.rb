title '`where` should reject unknown criteria'

raw_data = [
  { id: 1, name: 'Annie', shoe_size: 12},
  { id: 2, name: 'Bobby', shoe_size: 10, favorite_color: 'purple'},
]

stringy_raw_data = [
  { 'id' => 1, 'name' => 'Annie', 'shoe_size' => 12},
  { 'id' => 2, 'name' => 'Bobby', 'shoe_size' => 10, 'favorite_color' => 'purple'},
]

# control '2943_pass_raise_error_when_key_not_in_data' do
#   describe 'It should not tolerate criteria that are not keys of the raw data' do
#     it { lambda { simple_plural(raw_data).where(hat_size: 'Why are these in eighths?') }.should raise_error ArgumentError }
#   end
# end

control 'call-should-as-an-explicit-method' do
  describe 'It should work without issuing a deprecation warning' do
    it { 'a string'.should include 'ing' }
  end
end
