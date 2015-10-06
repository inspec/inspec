# encoding: utf-8

describe command('echo hello') do
  its(:stdout) { should eq "hello\n" }
  its(:stderr) { should eq '' }
  its(:exit_status) { should eq 0 }
end

describe command('>&2 echo error') do
  its(:stdout) { should eq '' }
  its(:stderr) { should eq "error\n" }
  its(:exit_status) { should eq 0 }
end

describe command('exit 123') do
  its(:stdout) { should eq '' }
  its(:stderr) { should eq '' }
  its(:exit_status) { should eq 123 }
end

describe command('/bin/sh').exist? do
  it { should eq true }
end

describe command('sh').exist? do
  it { should eq true }
end

describe command('this is not existing').exist? do
  it { should eq false }
end
