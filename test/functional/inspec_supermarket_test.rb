# encoding: utf-8
# author: Jeremy Miller

require 'functional/helper'

# basic testing without availability of any server
describe 'inspec supermarket' do
  include FunctionalHelper

  it 'outputs help message' do
    out = inspec('supermarket help')
    out.exit_status.must_equal 0
    out.stdout.must_include 'inspec supermarket exec PROFILE'
  end

  it 'lists info on profile without supermarket uri scheme' do
    out = inspec('supermarket info hardening/os-hardening')
    out.exit_status.must_equal 0
    out.stdout.must_match %r{supermarket:.*https://supermarket.chef.io}
    out.stdout.must_match %r{name:.*os-hardening}
  end

  it 'lists info on profile with supermarket uri scheme but no host' do
    out = inspec('supermarket info supermarket://hardening/os-hardening')
    out.exit_status.must_equal 0
    out.stdout.must_match %r{supermarket:.*https://supermarket.chef.io}
    out.stdout.must_match %r{name:.*os-hardening}
  end

  it 'list info on profile with supermarket uri scheme with host' do
    out = inspec('supermarket info supermarket://supermarket.chef.io/hardening/os-hardening')
    out.exit_status.must_equal 0
    out.stdout.must_match %r{supermarket:.*https://supermarket.chef.io}
    out.stdout.must_match %r{name:.*os-hardening}
  end

  it 'doest not list info on profile when bad supermarket host specified' do
    out = inspec('supermarket info supermarket://1nyp2cl3uzxydyf4ved/hardening/os-hardening')
    out.exit_status.must_equal 1
    out.stderr.must_match %r{SocketError}
  end

  it 'lists profiles' do
    out = inspec('supermarket profiles')
    out.exit_status.must_equal 0
    out.stdout.must_match %r{supermarket:.*https://supermarket.chef.io}
    out.stdout.must_match %r{Available profiles}
  end

  it 'lists profiles when supermarket host specified' do
    out = inspec('supermarket profiles supermarket://supermarket.chef.io')
    out.exit_status.must_equal 0
    out.stdout.must_match %r{supermarket:.*https://supermarket.chef.io}
    out.stdout.must_match %r{Available profiles}
  end

  it 'does not list profiles when bad supermarket host specified' do
    out = inspec('supermarket profiles supermarket://1nyp2cl3uzxydyf4ved')
    out.exit_status.must_equal 1
    out.stderr.must_match %r{SocketError}
  end

  it 'executes profile from supermarket' do
    out = inspec('supermarket exec hardening/ssh-hardening')
    out.stdout.must_match %r{Failures:}
  end

  it 'executes profile from supermarket when supermarket uri scheme specified' do
    out = inspec('supermarket exec supermarket://hardening/ssh-hardening')
    out.stdout.must_match %r{Failures:}
  end

  it 'executes profile from supermarket when supermarket uri scheme specified with host' do
    out = inspec('supermarket exec supermarket://supermarket.chef.io/hardening/ssh-hardening')
    out.stdout.must_match %r{Failures:}
  end

  it 'does not execute profile from supermarket when supermarket uri scheme specified with bad host' do
    out = inspec('supermarket exec supermarket://1nyp2cl3uzxydyf4ved/hardening/ssh-hardening')
    out.stderr.must_match %r{SocketError}
  end

  it 'executes profile from supermarket when not using supermarket subcommand' do
    out = inspec('exec supermarket://hardening/ssh-hardening')
    out.stdout.must_match %r{Failures:}
  end

  it 'executes profile from supermarket when not using supermarket subcommand and specifying host' do
    out = inspec('exec supermarket://supermarket.chef.io/hardening/ssh-hardening')
    out.stdout.must_match %r{Failures:}
  end
end
