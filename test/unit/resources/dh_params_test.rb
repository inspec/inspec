
require 'helper'

describe 'Inspec::Resources::DhParams' do
  let (:resource_dh_params) { load_resource('dh_params', 'dh_params.dh_pem')}

  let (:modulus) do
    # regex removes all whitespace
    <<-EOF.gsub(/[[:space:]]+/, '')
      00:8c:bd:f0:27:91:00:30:7e:92:c6:04:96:ad:21:
      c8:b4:39:a3:1e:d5:c5:0b:fc:fd:b0:6e:32:b4:39:
      06:da:23:bd:50:f9:1c:63:cd:b7:d6:a2:4d:37:42:
      56:ec:1f:3c:26:d4:1f:79:75:41:69:21:92:1d:cd:
      03:99:b9:21:ad:3e:a1:2b:ba:11:fa:fe:2c:a3:a7:
      d5:9c:33:54:60:e9:c0:b7:26:a4:2e:50:92:bc:90:
      b7:86:ac:39:3a:65:8b:be:0f:df:92:0d:f9:c5:b4:
      3d:ce:0d:5b:aa:f7:1d:cd:e5:85:08:6c:7b:b2:6d:
      d7:06:a7:1f:9f:27:4d:b6:f6:51:1a:2d:e2:1a:6c:
      10:97:47:6b:6f:da:34:97:9d:08:13:bb:ec:77:ee:
      2e:93:6d:4b:9f:52:e6:a4:fd:fd:76:98:a6:40:25:
      65:47:11:2b:69:6c:f0:68:77:cc:c0:70:f5:75:6e:
      9c:d7:93:ec:f7:a6:c4:36:14:73:a7:1e:c0:e8:90:
      e5:c1:29:c0:41:3b:b4:51:ce:e7:25:b8:59:b3:e7:
      4c:44:24:76:a2:59:ea:e6:41:45:eb:52:6f:d3:77:
      f6:55:d3:8c:0f:16:25:1e:4a:1a:bb:23:84:52:53:
      d5:05:f8:4d:1e:99:10:2e:41:a1:fb:e5:4b:19:a2:
      0d:93
    EOF
  end

  let (:output_as_pem) do
    # regex removes all leading spaces
    <<-EOF.gsub(/^[[:blank:]]+/, '')
      -----BEGIN DH PARAMETERS-----
      MIIBCAKCAQEAjL3wJ5EAMH6SxgSWrSHItDmjHtXFC/z9sG4ytDkG2iO9UPkcY823
      1qJNN0JW7B88JtQfeXVBaSGSHc0DmbkhrT6hK7oR+v4so6fVnDNUYOnAtyakLlCS
      vJC3hqw5OmWLvg/fkg35xbQ9zg1bqvcdzeWFCGx7sm3XBqcfnydNtvZRGi3iGmwQ
      l0drb9o0l50IE7vsd+4uk21Ln1LmpP39dpimQCVlRxEraWzwaHfMwHD1dW6c15Ps
      96bENhRzpx7A6JDlwSnAQTu0Uc7nJbhZs+dMRCR2olnq5kFF61Jv03f2VdOMDxYl
      HkoauyOEUlPVBfhNHpkQLkGh++VLGaINkwIBAg==
      -----END DH PARAMETERS-----
    EOF
  end

  let (:output_as_text) do
    # note: mock file loader munges first line of output w/ASCII-8BIT line
    # regex removes 2 leading spaces
    <<-EOF.gsub(/^[[:blank:]]{2}/, '')
      PKCS#3 DH Parameters: (2048 bit)
          prime:
              00:8c:bd:f0:27:91:00:30:7e:92:c6:04:96:ad:21:
              c8:b4:39:a3:1e:d5:c5:0b:fc:fd:b0:6e:32:b4:39:
              06:da:23:bd:50:f9:1c:63:cd:b7:d6:a2:4d:37:42:
              56:ec:1f:3c:26:d4:1f:79:75:41:69:21:92:1d:cd:
              03:99:b9:21:ad:3e:a1:2b:ba:11:fa:fe:2c:a3:a7:
              d5:9c:33:54:60:e9:c0:b7:26:a4:2e:50:92:bc:90:
              b7:86:ac:39:3a:65:8b:be:0f:df:92:0d:f9:c5:b4:
              3d:ce:0d:5b:aa:f7:1d:cd:e5:85:08:6c:7b:b2:6d:
              d7:06:a7:1f:9f:27:4d:b6:f6:51:1a:2d:e2:1a:6c:
              10:97:47:6b:6f:da:34:97:9d:08:13:bb:ec:77:ee:
              2e:93:6d:4b:9f:52:e6:a4:fd:fd:76:98:a6:40:25:
              65:47:11:2b:69:6c:f0:68:77:cc:c0:70:f5:75:6e:
              9c:d7:93:ec:f7:a6:c4:36:14:73:a7:1e:c0:e8:90:
              e5:c1:29:c0:41:3b:b4:51:ce:e7:25:b8:59:b3:e7:
              4c:44:24:76:a2:59:ea:e6:41:45:eb:52:6f:d3:77:
              f6:55:d3:8c:0f:16:25:1e:4a:1a:bb:23:84:52:53:
              d5:05:f8:4d:1e:99:10:2e:41:a1:fb:e5:4b:19:a2:
              0d:93
          generator: 2 (0x2)
      EOF
  end

  it 'parses the generator used for the Diffie-Hellman operation' do
    _(resource_dh_params.send('generator')).must_equal 2
  end

  it 'parses the modulus used for the Diffie-Hellman operation' do
    _(resource_dh_params.send('modulus')).must_equal modulus
  end

  it 'determines the prime length' do
    _(resource_dh_params.send('prime_length')).must_equal 2048
  end

  it 'verifies PEM output' do
    _(resource_dh_params.send('pem')).must_equal output_as_pem
  end

  it 'verifies text output' do
    _(resource_dh_params.send('text'))
      .must_match 'DH Parameters: (2048 bit)'
  end
end
