# copyright: 2018, The Authors

title "Docker Section"

control "Docker" do                        # A unique ID for this control
  impact 0.7                                # The criticality, if this control fails.
  desc "A Docker description..."

  describe docker_container('web') do
    it { should exist }
    it { should be_running }
    its('id') { should_not eq '7e4f96d08c3kwjefbqge' }
    its('image') { should eq 'nginx:latest' }
    its('repo') { should eq 'nginx' }
    its('tag') { should eq 'latest' }
    its('ports') { should eq [80] }
  end

  describe docker_container(id: '7e4f96d08c3e') do
    it { should exist }
    it { should be_running }
  end

  describe docker_image('nginx:latest') do
    it { should exist }
    its('id') { should_not eq '781d902f1e04' }
    its('image') { should eq 'nginx:latest' }
    its('repo') { should eq 'nginx' }
    its('tag') { should eq 'latest' }
  end

  describe docker_plugin('nginx:latest') do
    it { should exist }
  end

  describe docker_service('nginx') do
    it { should exist }
    its('id') { should_not eq '' }
    its('image') { should eq 'nginx:latest' }
    its('repo') { should eq 'nginx' }
    its('tag') { should eq 'latest' }
  end

  describe docker_service(id: 'nginx') do
    it { should exist }
  end
end
