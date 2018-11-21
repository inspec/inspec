# encoding: utf-8
# copyright: 2018, The Authors

control 'non-utf-8' do
  impact 0.7
  title 'Example control to make this a valid profile'
  describe 1 do
    it { should eq 1 }
  end
end
