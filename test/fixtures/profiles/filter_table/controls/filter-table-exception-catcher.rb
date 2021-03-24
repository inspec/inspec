control 'exception_catcher_test' do
  describe dummy([{'name' => 'foo'}]) do
    its('valid?') { should eq '' }
  end
end