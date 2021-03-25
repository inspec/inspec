control 'exception_catcher_test' do
  describe shadow.users('root') do
    its(:passwords) { should_not include('*') }
  end
end