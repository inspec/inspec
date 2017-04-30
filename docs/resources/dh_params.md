---
title: The dh_params Resource
---

# dh_params

Use the `dh_params` InSpec audit resource to test Diffie-Hellman (DH) parameters.


## Syntax

A `dh_params` resource block declares a parameter file to be tested.

    describe dh_params('/path/to/file.dh_pem') do
      it { should be_dh_params }
      it { should be_valid }
      its('generator') { should eq 2 }
      its('modulus') { should eq '00:91:a0:15:89:e5:bc:38:93:12:02:fc:...' }
      its('prime_length') { should eq 2048 }
      its('pem') { should eq '-----BEGIN DH PARAMETERS...' }
      its('text') { should eq 'PKCS#3 DH Parameters: (2048 bit)...' }
    end


## Supported Properties

### dh_params?

Verify whether file contains DH parameters:

    describe dh_params('/path/to/file.dh_pem') do
      it { should be_dh_params }
    end

### valid?

Verify whether DH parameters are valid:

    describe dh_params('/path/to/file.dh_pem') do
      it { should be_valid }
    end

### generator (Integer)

Verify generator used for the Diffie-Hellman operation:

    describe dh_params('/path/to/file.dh_pem') do
      its('generator') { should eq 2 }
    end

### modulus (String)

Verify prime modulus used for the Diffie-Hellman operation:

    describe dh_params('/path/to/file.dh_pem') do
      its('modulus') { should eq '00:91:a0:15:89:e5:bc:38:93:12:02:fc:...' }
    end

Example using multi-line string:

    describe dh_params('/path/to/file.dh_pem') do
      its('modulus') do
        # regex removes all whitespace
        should eq <<-EOF.gsub(/[[:space:]]+/, '')
          00:91:a0:15:89:e5:bc:38:93:12:02:fc:91:a2:85:
          f7:f7:29:63:2e:d3:4e:7a:86:f7:ee:84:fe:42:d0:
          48:bc:9c:91:d5:54:f8:78:1d:c0:41:78:a2:c4:ac:
          1a:24:8b:9d:88:55:98:0b:ac:a7:23:eb:c2:aa:2b:
          2e:a9:f9:af:d4:8e:4e:11:bc:7f:35:a2:ac:da:3a:
          ef:f0:25:6c:9a:a4:fd:00:28:76:86:2c:57:87:67:
          30:5d:b1:d6:5b:22:8f:72:a1:ea:de:8b:ef:9e:33:
          1a:40:92:68:85:02:54:02:09:fa:c0:60:c1:3c:4e:
          28:26:db:ed:25:8e:38:21:56:40:dc:c0:c0:66:1f:
          2b:32:c3:b4:78:a9:26:94:ea:f7:41:28:b2:f5:5b:
          01:38:0c:46:09:85:26:4d:69:12:8d:95:0f:35:e2:
          e6:4e:47:3a:86:dd:8a:b2:fe:45:15:27:d8:59:c2:
          3c:f4:62:ff:5f:74:e9:77:92:50:47:36:2b:05:57:
          60:ee:7b:a1:60:cc:1c:7a:2b:77:18:8a:37:f7:c7:
          31:3e:15:cb:15:7f:7b:66:96:fb:c6:be:7d:d6:03:
          5e:0d:60:75:2b:5b:62:2a:a3:37:b6:34:f9:fe:96:
          4c:f6:c5:e3:a1:52:af:01:c1:4f:c7:42:a0:be:ed:
          cd:13
        EOF
      end
    end

### prime_length (Integer)

Verify length of prime modulus used for the Diffie-Hellman operation:

    describe dh_params('/path/to/file.dh_pem') do
      its('prime_length') { should eq 2048 }
    end

### pem (String)

Verify `pem` output of DH parameters:

    describe dh_params('/path/to/file.dh_pem') do
      its('pem') { should eq '-----BEGIN DH PARAMETERS...' }
    end

Example using multi-line string:

    its('pem') do
      # regex removes all leading spaces
      should eq <<-EOF.gsub(/^[[:blank:]]+/, '')
        -----BEGIN DH PARAMETERS-----
        MIIBCAKCAQEAkaAVieW8OJMSAvyRooX39yljLtNOeob37oT+QtBIvJyR1VT4eB3A
        QXiixKwaJIudiFWYC6ynI+vCqisuqfmv1I5OEbx/NaKs2jrv8CVsmqT9ACh2hixX
        h2cwXbHWWyKPcqHq3ovvnjMaQJJohQJUAgn6wGDBPE4oJtvtJY44IVZA3MDAZh8r
        MsO0eKkmlOr3QSiy9VsBOAxGCYUmTWkSjZUPNeLmTkc6ht2Ksv5FFSfYWcI89GL/
        X3Tpd5JQRzYrBVdg7nuhYMwceit3GIo398cxPhXLFX97Zpb7xr591gNeDWB1K1ti
        KqM3tjT5/pZM9sXjoVKvAcFPx0Kgvu3NEwIBAg==
        -----END DH PARAMETERS-----
      EOF
    end

Verify via `openssl dhparam` command:

    $ openssl dhparam -in /path/to/file.dh_pem
    -----BEGIN DH PARAMETERS-----
    MIIBCAKCAQEAkaAVieW8OJMSAvyRooX39yljLtNOeob37oT+QtBIvJyR1VT4eB3A
    QXiixKwaJIudiFWYC6ynI+vCqisuqfmv1I5OEbx/NaKs2jrv8CVsmqT9ACh2hixX
    h2cwXbHWWyKPcqHq3ovvnjMaQJJohQJUAgn6wGDBPE4oJtvtJY44IVZA3MDAZh8r
    MsO0eKkmlOr3QSiy9VsBOAxGCYUmTWkSjZUPNeLmTkc6ht2Ksv5FFSfYWcI89GL/
    X3Tpd5JQRzYrBVdg7nuhYMwceit3GIo398cxPhXLFX97Zpb7xr591gNeDWB1K1ti
    KqM3tjT5/pZM9sXjoVKvAcFPx0Kgvu3NEwIBAg==
    -----END DH PARAMETERS-----

### text (String)

Verify human-readable text output of DH parameters:

    describe dh_params('/path/to/file.dh_pem') do
      its('text') { should eq 'PKCS#3 DH Parameters: (2048 bit)...' }
    end

Example using multi-line string:

    its('text') do
      # regex removes 2 leading spaces
      should eq <<-EOF.gsub(/^[[:blank:]]{2}/, '')
        PKCS#3 DH Parameters: (2048 bit)
            prime:
                00:91:a0:15:89:e5:bc:38:93:12:02:fc:91:a2:85:
                f7:f7:29:63:2e:d3:4e:7a:86:f7:ee:84:fe:42:d0:
                48:bc:9c:91:d5:54:f8:78:1d:c0:41:78:a2:c4:ac:
                1a:24:8b:9d:88:55:98:0b:ac:a7:23:eb:c2:aa:2b:
                2e:a9:f9:af:d4:8e:4e:11:bc:7f:35:a2:ac:da:3a:
                ef:f0:25:6c:9a:a4:fd:00:28:76:86:2c:57:87:67:
                30:5d:b1:d6:5b:22:8f:72:a1:ea:de:8b:ef:9e:33:
                1a:40:92:68:85:02:54:02:09:fa:c0:60:c1:3c:4e:
                28:26:db:ed:25:8e:38:21:56:40:dc:c0:c0:66:1f:
                2b:32:c3:b4:78:a9:26:94:ea:f7:41:28:b2:f5:5b:
                01:38:0c:46:09:85:26:4d:69:12:8d:95:0f:35:e2:
                e6:4e:47:3a:86:dd:8a:b2:fe:45:15:27:d8:59:c2:
                3c:f4:62:ff:5f:74:e9:77:92:50:47:36:2b:05:57:
                60:ee:7b:a1:60:cc:1c:7a:2b:77:18:8a:37:f7:c7:
                31:3e:15:cb:15:7f:7b:66:96:fb:c6:be:7d:d6:03:
                5e:0d:60:75:2b:5b:62:2a:a3:37:b6:34:f9:fe:96:
                4c:f6:c5:e3:a1:52:af:01:c1:4f:c7:42:a0:be:ed:
                cd:13
            generator: 2 (0x2)
        EOF
    end

Verify via `openssl dhparam` command:

    $ openssl dhparam -in /path/to/file.dh_pem -noout -text
    PKCS#3 DH Parameters: (2048 bit)
        prime:
            00:91:a0:15:89:e5:bc:38:93:12:02:fc:91:a2:85:
            f7:f7:29:63:2e:d3:4e:7a:86:f7:ee:84:fe:42:d0:
            48:bc:9c:91:d5:54:f8:78:1d:c0:41:78:a2:c4:ac:
            1a:24:8b:9d:88:55:98:0b:ac:a7:23:eb:c2:aa:2b:
            2e:a9:f9:af:d4:8e:4e:11:bc:7f:35:a2:ac:da:3a:
            ef:f0:25:6c:9a:a4:fd:00:28:76:86:2c:57:87:67:
            30:5d:b1:d6:5b:22:8f:72:a1:ea:de:8b:ef:9e:33:
            1a:40:92:68:85:02:54:02:09:fa:c0:60:c1:3c:4e:
            28:26:db:ed:25:8e:38:21:56:40:dc:c0:c0:66:1f:
            2b:32:c3:b4:78:a9:26:94:ea:f7:41:28:b2:f5:5b:
            01:38:0c:46:09:85:26:4d:69:12:8d:95:0f:35:e2:
            e6:4e:47:3a:86:dd:8a:b2:fe:45:15:27:d8:59:c2:
            3c:f4:62:ff:5f:74:e9:77:92:50:47:36:2b:05:57:
            60:ee:7b:a1:60:cc:1c:7a:2b:77:18:8a:37:f7:c7:
            31:3e:15:cb:15:7f:7b:66:96:fb:c6:be:7d:d6:03:
            5e:0d:60:75:2b:5b:62:2a:a3:37:b6:34:f9:fe:96:
            4c:f6:c5:e3:a1:52:af:01:c1:4f:c7:42:a0:be:ed:
            cd:13
        generator: 2 (0x2)
