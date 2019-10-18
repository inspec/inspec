if ENV['DOCKER'] && os.linux?
  describe virtualization do
    its('system') { should eq 'docker' }
    its('role') { should eq 'guest' }
  end
end
