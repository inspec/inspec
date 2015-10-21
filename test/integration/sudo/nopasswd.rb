# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require_relative 'run_as'

describe 'run_command' do
  it 'is running as non-root without sudo' do
    run_as('whoami').stdout.wont_match /root/i
  end

  it 'is running nopasswd sudo' do
    run_as('whoami', { sudo: true })
      .stdout.must_match /root/i
  end
end
