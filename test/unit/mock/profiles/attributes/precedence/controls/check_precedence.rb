
# See test/functional/attributes_test.rb for a map of these values
attribute('test_01', value: 'value from precedence inline')
attribute('test_02')
attribute('test_03', value: 'value from precedence inline')
#attribute('test_04') # TODO: uncommenting this aborts the run!
attribute('test_05', value: 'value from precedence inline')
attribute('test_06')
attribute('test_07', value: 'value from precedence inline')
attribute('test_10', default: 'value from precedence inline')
attribute('test_11', default: 'value from precedence inline')
attribute('test_12', value: 'value from precedence inline')
attribute('test_13', default: 'value from precedence inline')
attribute('test_19')
attribute('test_20', value: 'value from precedence inline')
attribute('test_21', value: 'value from precedence inline')

# The actual tests

skip_for_now = [
  'test_04', # "Profile 'precedence' does not have an attribute with name ..."
  'test_05', # "Profile 'precedence' does not have an attribute with name ..."
  'test_08', # "Profile 'precedence' does not have an attribute with name 'test_04'"
]

{
  'test_01' => 'value from precedence inline',
  'test_02' => 'value from precedence metadata',
  'test_03' => 'value from precedence metadata',
  'test_04' => 'value from precedence attrfile',
  'test_05' => 'value from precedence attrfile',
  'test_06' => 'value from precedence attrfile',
  'test_07' => 'value from precedence attrfile',
  'test_08' => 'value from precedence attrfile',
  'test_09' => 'value from precedence attrfile',
  'test_10' => 'value from precedence inline',
  'test_11' => 'value from precedence metadata',
  'test_12' => 'value from precedence metadata',
  'test_13' => 'value from precedence metadata',
  'test_14' => 'value from precedence-wrappee inline',
  'test_15' => 'value from precedence-wrappee metadata',
  'test_16' => 'value from precedence-wrappee metadata',
  'test_17' => 'value from precedence attrfile',
  'test_18' => 'value from precedence metadata',
  'test_19' => 'value from precedence-wrappee metadata',
  'test_20' => 'value from precedence-wrappee metadata',
  'test_21' => 'value from precedence inline',
  'test_22' => 'value from precedence metadata',
  'test_23' => 'value from precedence attrfile',
}.each do |attr_name, expected|
  control attr_name do
    describe attr_name do
      skip if skip_for_now.include? attr_name
      subject { attribute(attr_name) }
      it { should cmp expected }
    end
  end
end
