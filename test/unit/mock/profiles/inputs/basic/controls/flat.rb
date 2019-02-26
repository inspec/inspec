expecteds = {
  an_integer: 1,
  a_quoted_string: 'Should not have quotes',
  an_unquoted_string: 'Should not have quotes',
  lowercase_true: true,
  titlecase_true: true,
  titlecase_false: false,
}
tests = expecteds.keys.map do |test_name|
  {
    name: test_name,
    expected: expecteds[test_name],
    input_via_string: attribute(test_name.to_s, value: "#{test_name}_default"),
    input_via_symbol: attribute(test_name, value: "#{test_name}_default"),
  }
end

control 'flat' do
  tests.each do |details|
    describe "#{details[:name]} using string key" do
      subject { details[:input_via_string] }
      it { should eq details[:expected] }
    end
  end
end