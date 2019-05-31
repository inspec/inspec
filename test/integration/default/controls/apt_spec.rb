if os[:name] == 'ubuntu'

  describe apt('ppa:nginx/stable') do
    it { should exist }
    it { should be_enabled }
  end

  describe apt('nginx/stable') do
    it { should exist }
    it { should be_enabled }
  end

  describe apt('http://ppa.launchpad.net/nginx/stable/ubuntu') do
    it { should exist }
    it { should be_enabled }
  end

  describe apt('https://deb.nodesource.com/node_4.x/dists/precise/') do
    it { should_not exist }
    it { should_not be_enabled }
  end

  describe apt('https://packages.chef.io/stable-apt') do
    it { should exist }
    it { should be_enabled }
  end

elsif os[:family] == 'debian'

  describe apt('http://nginx.org/packages/debian') do
    it { should exist }
    it { should be_enabled }
  end

  describe apt('https://deb.nodesource.com/node_4.x/dists/precise/') do
    it { should_not exist }
    it { should_not be_enabled }
  end

  describe apt('https://packages.chef.io/stable-apt') do
    it { should exist }
    it { should be_enabled }
  end
end
