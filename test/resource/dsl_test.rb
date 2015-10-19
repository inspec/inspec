# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

describe command('echo hello') do
  its(:stdout) { should eq "hello\n" }
end

describe 'describe + it + expect' do
  it 'should echo something' do
	  out = rand.to_s
		expect(command("echo -n #{out}").stdout).to eq(out)
  end
end

describe 'describe and expect without it' do
  it 'will raise an error' do
    expect(proc{
      describe rand.to_s do
  	    expect(true).to eq(true)
      end
    }).to raise_error StandardError
  end
end

rule 'rule + describe' do
  out = rand.to_s
  describe command("echo -n #{out}") do
    its('stdout') { should eq out }
  end
end

rule 'rule + describe + it + expect' do
  out = rand.to_s
  describe 'a rule' do
    it 'must echo something' do
      expect(command("echo -n #{out}").stdout).to eq(out)
    end
  end
end

rule 'rule + expect only' do
  out = rand.to_s
  expect(command("echo -n #{out}").stdout).to eq(out)
end
