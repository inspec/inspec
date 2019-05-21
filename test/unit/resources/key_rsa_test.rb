
require 'helper'

describe 'Inspec::Resources::RsaKey' do
  let (:resource_key) { load_resource('key_rsa', 'test_certificate.rsa.key.pem')}

  it 'parses the public key' do
    _(resource_key.send('public_key')).must_match "-----BEGIN PUBLIC KEY-----\nMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAxi1Tp4dPQ+GU+RipsguU\nWT50a6fsBCpe+QT0YdW/7GG6kynRzR+fzQ0q1LDxpgqAH+eDIWEAFYoTPc8haAjZ\nvAYn7JlXUQpeoK7fc2BPgYA0lr33Ee0H9nqeZlnytQ+/EVUqqDx61cgeW3ARAK1I\nODwhuziuTi7XNu+HTx3feH4ohq/FppB26PYfJo1jCmt7YxHxl6AGrYrEX5zubQR0\nAtPAJzg0/aqDH5GJHJETjloIxh/KLnGlbG3DJylFU+vPxvns1TKM0dezg8UefXer\nRtxDAwSix7sNctXwa0xToc6O+e/StNPR0eLvILS8iR89fuML57Z4AGFWMNdqTYoj\nqwIDAQAB\n-----END PUBLIC KEY-----\n"
  end

  it 'decodes the key length' do
    _(resource_key.send('key_length')).must_equal 2048
  end
end
