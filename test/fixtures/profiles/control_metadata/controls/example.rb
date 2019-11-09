control 'tmp-1.0' do
  impact 0.7
  title 'Create /tmp directory'
  description 'Default description'
  description rational: 'Rational for the metadata test control'
  description 'something else': 'Even more metadata for the test control'

  describe 'a thing' do
    it { should cmp 'a thing' }
  end
end
