# encoding: utf-8
# author: Dominik Richter
# author: Christoph Hartmann

require 'helper'
require 'train/extras'

describe 'os common plugin' do
  let(:cls) {
    Class.new(Train::Extras::OSCommon) do
      def detect_family; end
    end
  }

  def mock_platform(x)
    cls.new(nil, { family: x })
  end

  it 'provides a method to access platform data' do
    family = rand
    os = mock_platform(family)
    os[:family].must_equal family
  end

  it 'provides an accessor for the full hash' do
    x = rand.to_s
    os = mock_platform(x)
    os.to_hash.must_equal({ family: x })
  end

  describe 'with platform set to redhat' do
    let(:os) { mock_platform('redhat') }
    it { os.redhat?.must_equal(true) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to oracle' do
    let(:os) { mock_platform('oracle') }
    it { os.redhat?.must_equal(true) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to centos' do
    let(:os) { mock_platform('centos') }
    it { os.redhat?.must_equal(true) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to fedora' do
    let(:os) { mock_platform('fedora') }
    it { os.redhat?.must_equal(true) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to debian' do
    let(:os) { mock_platform('debian') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(true) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to ubuntu' do
    let(:os) { mock_platform('ubuntu') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(true) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to linuxmint' do
    let(:os) { mock_platform('linuxmint') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(true) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to raspbian' do
    let(:os) { mock_platform('raspbian') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(true) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to suse' do
    let(:os) { mock_platform('suse') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(true) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to opensuse' do
    let(:os) { mock_platform('opensuse') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(true) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to alpine' do
    let(:os) { mock_platform('alpine') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to arch' do
    let(:os) { mock_platform('arch') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to coreos' do
    let(:os) { mock_platform('coreos') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to exherbo' do
    let(:os) { mock_platform('exherbo') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to gentoo' do
    let(:os) { mock_platform('gentoo') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to slackware' do
    let(:os) { mock_platform('slackware') }
    it { os.redhat?.must_equal(false) }
    it { os.debian?.must_equal(false) }
    it { os.suse?.must_equal(false) }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to linux' do
    let(:os) { mock_platform('linux') }
    it { os.linux?.must_equal(true) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to freebsd' do
    let(:os) { mock_platform('freebsd') }
    it { os.bsd?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to netbsd' do
    let(:os) { mock_platform('netbsd') }
    it { os.bsd?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to openbsd' do
    let(:os) { mock_platform('openbsd') }
    it { os.bsd?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to darwin' do
    let(:os) { mock_platform('darwin') }
    it { os.bsd?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to solaris' do
    let(:os) { mock_platform('solaris') }
    it { os.solaris?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to smartos' do
    let(:os) { mock_platform('smartos') }
    it { os.solaris?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to openindiana' do
    let(:os) { mock_platform('openindiana') }
    it { os.solaris?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to opensolaris' do
    let(:os) { mock_platform('opensolaris') }
    it { os.solaris?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to solaris2' do
    let(:os) { mock_platform('solaris2') }
    it { os.solaris?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to nexentacore' do
    let(:os) { mock_platform('nexentacore') }
    it { os.solaris?.must_equal(true) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(true) }
  end

  describe 'with platform set to windows' do
    let(:os) { mock_platform('windows') }
    it { os.solaris?.must_equal(false) }
    it { os.bsd?.must_equal(false) }
    it { os.linux?.must_equal(false) }
    it { os.unix?.must_equal(false) }
  end
end
