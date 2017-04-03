# encoding: utf-8
# author: Doc Walker

require 'openssl'

class DhParams < Inspec.resource(1)
  name 'dh_params'

  desc '
    Use the `dh_params` InSpec audit resource to test Diffie-Hellman (DH)
    parameters.
  '

  example "
    describe dh_params('/path/to/file.dh_pem') do
      it { should be_dh_params }
      it { should be_valid }
      its('generator') { should eq 2 }
      its('modulus') { should eq '00:91:a0:15:89:e5:bc:38:93:12:02:fc:...' }
      its('prime_length') { should eq 2048 }
      its('pem') { should eq '-----BEGIN DH PARAMETERS...' }
      its('text') { should eq 'PKCS#3 DH Parameters: (2048 bit)...' }
    end
  "

  def initialize(filename)
    @dh_params_path = filename
    file = inspec.file(@dh_params_path)
    return skip_resource 'Unable to find DH parameters file ' \
      "#{@dh_params_path}" unless file.exist?

    begin
      @dh_params = OpenSSL::PKey::DH.new file.content
    rescue
      @dh_params = nil
      return skip_resource "Unable to load DH parameters #{@dh_params_path}"
    end
  end

  # it { should be_dh_params }
  def dh_params?
    !@dh_params.nil?
  end

  # its('generator') { should eq 2 }
  def generator
    return if @dh_params.nil?
    @dh_params.g.to_i
  end

  # its('modulus') { should eq '00:91:a0:15:89:e5:bc:38:93:12:02:fc:...' }
  def modulus
    return if @dh_params.nil?
    '00:' + @dh_params.p.to_s(16).downcase.scan(/.{2}/).join(':')
  end

  # its('pem') { should eq '-----BEGIN DH PARAMETERS...' }
  def pem
    return if @dh_params.nil?
    @dh_params.to_pem
  end

  # its('prime_length') { should be 2048 }
  def prime_length
    return if @dh_params.nil?
    @dh_params.p.num_bits
  end

  # its('text') { should eq 'human-readable-text' }
  def text
    return if @dh_params.nil?
    @dh_params.to_text
  end

  # it { should be_valid }
  def valid?
    return if @dh_params.nil?
    @dh_params.params_ok?
  end

  def to_s
    "dh_params #{@dh_params_path}"
  end
end
