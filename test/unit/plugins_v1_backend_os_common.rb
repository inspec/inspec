# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'

describe 'Vulcano::Plugins::Backend::OSCommon' do
  let(:osc) {
    cls = Vulcano::Plugins::Backend::OSCommon
    mock = Vulcano::Backend.registry['mock']
    cls.new(mock.new)
  }

  def set_platform(os, x)
    pf = { family: x }
    os.instance_variable_set(:@platform, pf)
  end

  describe 'with platform set to redhat' do
    before { set_platform(osc, 'redhat') }
    it { osc.redhat?.must_equal(true) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to oracle' do
    before { set_platform(osc, 'oracle') }
    it { osc.redhat?.must_equal(true) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to centos' do
    before { set_platform(osc, 'centos') }
    it { osc.redhat?.must_equal(true) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to fedora' do
    before { set_platform(osc, 'fedora') }
    it { osc.redhat?.must_equal(true) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to debian' do
    before { set_platform(osc, 'debian') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(true) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to ubuntu' do
    before { set_platform(osc, 'ubuntu') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(true) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to linuxmint' do
    before { set_platform(osc, 'linuxmint') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(true) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to raspbian' do
    before { set_platform(osc, 'raspbian') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(true) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to suse' do
    before { set_platform(osc, 'suse') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(true) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to opensuse' do
    before { set_platform(osc, 'opensuse') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(true) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to alpine' do
    before { set_platform(osc, 'alpine') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to arch' do
    before { set_platform(osc, 'arch') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to coreos' do
    before { set_platform(osc, 'coreos') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to exherbo' do
    before { set_platform(osc, 'exherbo') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to gentoo' do
    before { set_platform(osc, 'gentoo') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to slackware' do
    before { set_platform(osc, 'slackware') }
    it { osc.redhat?.must_equal(false) }
    it { osc.debian?.must_equal(false) }
    it { osc.suse?.must_equal(false) }
    it { osc.linux?.must_equal(true) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to freebsd' do
    before { set_platform(osc, 'freebsd') }
    it { osc.bsd?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to netbsd' do
    before { set_platform(osc, 'netbsd') }
    it { osc.bsd?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to openbsd' do
    before { set_platform(osc, 'openbsd') }
    it { osc.bsd?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to darwin' do
    before { set_platform(osc, 'darwin') }
    it { osc.bsd?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to solaris' do
    before { set_platform(osc, 'solaris') }
    it { osc.solaris?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to smartos' do
    before { set_platform(osc, 'smartos') }
    it { osc.solaris?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to openindiana' do
    before { set_platform(osc, 'openindiana') }
    it { osc.solaris?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to opensolaris' do
    before { set_platform(osc, 'opensolaris') }
    it { osc.solaris?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to solaris2' do
    before { set_platform(osc, 'solaris2') }
    it { osc.solaris?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to nexentacore' do
    before { set_platform(osc, 'nexentacore') }
    it { osc.solaris?.must_equal(true) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(true) }
  end

  describe 'with platform set to windows' do
    before { set_platform(osc, 'windows') }
    it { osc.solaris?.must_equal(false) }
    it { osc.bsd?.must_equal(false) }
    it { osc.linux?.must_equal(false) }
    it { osc.unix?.must_equal(false) }
  end

end
