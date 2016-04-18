# encoding: utf-8
# author: Christoph Hartmann
# author: Dominik Richter

require 'helper'
require 'inspec/resource'

describe Inspec::Resources::Cmd do
  it 'runs regular commands' do
    x = rand.to_s
    load_resource('command', x).method(:wrap_cmd).call
      .must_equal x
  end

  it 'runs sh commands' do
    x = rand.to_s
    load_resource('command', '$("'+x+'")', {shell: 'sh'})
    .method(:wrap_cmd).call
    .must_equal "sh -c \\$\\(\\\"#{x}\\\"\\)"
  end

  it 'runs bash commands' do
    x = rand.to_s
    load_resource('command', '$("'+x+'")', {shell: 'bash'})
      .method(:wrap_cmd).call
      .must_equal "bash -c \\$\\(\\\"#{x}\\\"\\)"
  end

  it 'runs zsh commands' do
    x = rand.to_s
    load_resource('command', '$("'+x+'")', {shell: 'zsh'})
      .method(:wrap_cmd).call
      .must_equal "zsh -c \\$\\(\\\"#{x}\\\"\\)"
  end
end
