
if os.windows?
  $stderr.puts "\033[1;33mTODO: Not running #{__FILE__} because we are not on Linux.\033[0m"
  return
end

describe x509_certificate('/tmp/mycert.pem') do
  it { should be_certificate }
  it { should be_valid }
  its('signature_algorithm') { should eq 'sha256WithRSAEncryption' }
  its('validity_in_days') { should_not be < 100 }
  its('validity_in_days') { should be >= 100 }
  its('subject_dn') { should eq '/C=US/O=Foo Bar/OU=Lab/CN=www.f00bar.com' }
  its('subject.C') { should eq 'US' }
  its('issuer_dn') { should eq '/C=US/O=Foo Bar/OU=Lab/CN=www.f00bar.com' }
  its('key_length') { should be >= 2048 }
end

describe key_rsa('/tmp/server.key') do
  it { should be_private }
  it { should be_public }
  its('key_length') { should eq 2048 }
end
