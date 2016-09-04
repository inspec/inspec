# encoding: utf-8

include_controls 'failures'

describe file('/tmp') do
  it { should be_directory }
end
