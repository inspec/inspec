# encoding: utf-8
if ENV['DOCKER']
  if os.linux?
    describe virtualization do
      its('system') { should eq 'docker' }
      its('role') { should eq 'guest' }
    end

    describe virtualization.systems[:docker] do
      it { should eq 'guest' }
    end
  end
end
