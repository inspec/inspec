control 'exception_catcher_test' do
  describe shadow('/tmp/no-file').users('root') do
    its(:passwords) { should_not include('*') }
  end
end