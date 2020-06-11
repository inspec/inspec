# Copyright (C) 2010 Google Inc.
#
#    Licensed under the Apache License, Version 2.0 (the "License");
#    you may not use this file except in compliance with the License.
#    You may obtain a copy of the License at
#
#        http://www.apache.org/licenses/LICENSE-2.0
#
#    Unless required by applicable law or agreed to in writing, software
#    distributed under the License is distributed on an "AS IS" BASIS,
#    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#    See the License for the specific language governing permissions and
#    limitations under the License.
require "spec_helper"
require "signet"
require "signet/oauth_1"
require "signet/oauth_1/signature_methods/rsa_sha1"

describe Signet::OAuth1::RSASHA1 do
  it "should correctly generate a signature" do
    method = "GET"
    uri = "http://term.ie/oauth/example/request_token.php"
    parameters = {
      "oauth_consumer_key"     => "key",
      "oauth_signature_method" => "RSA-SHA1",
      "oauth_timestamp"        => "1377815426",
      "oauth_nonce"            => "c3839c47cb204a20e042b11a5cc9f971",
      "oauth_version"          => "1.0"
    }
    client_credential_secret = "-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALRiMLAh9iimur8V
A7qVvdqxevEuUkW4K+2KdMXmnQbG9Aa7k7eBjK1S+0LYmVjPKlJGNXHDGuy5Fw/d
7rjVJ0BLB+ubPK8iA/Tw3hLQgXMRRGRXXCn8ikfuQfjUS1uZSatdLB81mydBETlJ
hI6GH4twrbDJCR2Bwy/XWXgqgGRzAgMBAAECgYBYWVtleUzavkbrPjy0T5FMou8H
X9u2AC2ry8vD/l7cqedtwMPp9k7TubgNFo+NGvKsl2ynyprOZR1xjQ7WgrgVB+mm
uScOM/5HVceFuGRDhYTCObE+y1kxRloNYXnx3ei1zbeYLPCHdhxRYW7T0qcynNmw
rn05/KO2RLjgQNalsQJBANeA3Q4Nugqy4QBUCEC09SqylT2K9FrrItqL2QKc9v0Z
zO2uwllCbg0dwpVuYPYXYvikNHHg+aCWF+VXsb9rpPsCQQDWR9TT4ORdzoj+Nccn
qkMsDmzt0EfNaAOwHOmVJ2RVBspPcxt5iN4HI7HNeG6U5YsFBb+/GZbgfBT3kpNG
WPTpAkBI+gFhjfJvRw38n3g/+UeAkwMI2TJQS4n8+hid0uus3/zOjDySH3XHCUno
cn1xOJAyZODBo47E+67R4jV1/gzbAkEAklJaspRPXP877NssM5nAZMU0/O/NGCZ+
3jPgDUno6WbJn5cqm8MqWhW1xGkImgRk+fkDBquiq4gPiT898jusgQJAd5Zrr6Q8
AO/0isr/3aa6O6NLQxISLKcPDk2NOccAfS/xOtfOz4sJYM3+Bs4Io9+dZGSDCA54
Lw03eHTNQghS0A==
-----END PRIVATE KEY-----"
    token_credential_secret = "pfkkdhi9sl3r4s00"
    base_string = Signet::OAuth1.generate_base_string method, uri, parameters

    expect(Signet::OAuth1::RSASHA1.generate_signature(
             base_string, client_credential_secret, token_credential_secret
           )).to eq "P72T4RS8dVBneQPJSY71D3iLEjge2tiivxEasPVoaoDldDgPdwpQfhS1q0th19jB3B3+9P6tBWjpWaVPxrNZe3ssBCiwS/EmXZ/6VCJGU3YoDHMtz+0jCd36NjHj5I6TpLVQ8/rtfy6+EzpdUMz7ydnhKXYqJFPOWnNv8HM1W7I="
  end
end

describe Signet::OAuth1::RSASHA1 do
  it "should correctly generate a signature" do
    method = "GET"
    uri = "http://photos.example.net/photos"
    parameters = {
      "oauth_consumer_key"     => "dpf43f3p2l4k3l03",
      "oauth_signature_method" => "RSA-SHA1",
      "oauth_timestamp"        => "1196666512",
      "oauth_nonce"            => "13917289812797014437",
      "oauth_version"          => "1.0",
      "file"                   => "vacaction.jpg",
      "size"                   => "original"
    }
    client_credential_secret = "-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALRiMLAh9iimur8V
A7qVvdqxevEuUkW4K+2KdMXmnQbG9Aa7k7eBjK1S+0LYmVjPKlJGNXHDGuy5Fw/d
7rjVJ0BLB+ubPK8iA/Tw3hLQgXMRRGRXXCn8ikfuQfjUS1uZSatdLB81mydBETlJ
hI6GH4twrbDJCR2Bwy/XWXgqgGRzAgMBAAECgYBYWVtleUzavkbrPjy0T5FMou8H
X9u2AC2ry8vD/l7cqedtwMPp9k7TubgNFo+NGvKsl2ynyprOZR1xjQ7WgrgVB+mm
uScOM/5HVceFuGRDhYTCObE+y1kxRloNYXnx3ei1zbeYLPCHdhxRYW7T0qcynNmw
rn05/KO2RLjgQNalsQJBANeA3Q4Nugqy4QBUCEC09SqylT2K9FrrItqL2QKc9v0Z
zO2uwllCbg0dwpVuYPYXYvikNHHg+aCWF+VXsb9rpPsCQQDWR9TT4ORdzoj+Nccn
qkMsDmzt0EfNaAOwHOmVJ2RVBspPcxt5iN4HI7HNeG6U5YsFBb+/GZbgfBT3kpNG
WPTpAkBI+gFhjfJvRw38n3g/+UeAkwMI2TJQS4n8+hid0uus3/zOjDySH3XHCUno
cn1xOJAyZODBo47E+67R4jV1/gzbAkEAklJaspRPXP877NssM5nAZMU0/O/NGCZ+
3jPgDUno6WbJn5cqm8MqWhW1xGkImgRk+fkDBquiq4gPiT898jusgQJAd5Zrr6Q8
AO/0isr/3aa6O6NLQxISLKcPDk2NOccAfS/xOtfOz4sJYM3+Bs4Io9+dZGSDCA54
Lw03eHTNQghS0A==
-----END PRIVATE KEY-----"
    token_credential_secret = "pfkkdhi9sl3r4s00"
    base_string = Signet::OAuth1.generate_base_string method, uri, parameters

    expect(Signet::OAuth1::RSASHA1.generate_signature(
             base_string, client_credential_secret, token_credential_secret
           )).to eq "jvTp/wX1TYtByB1m+Pbyo0lnCOLIsyGCH7wke8AUs3BpnwZJtAuEJkvQL2/9n4s5wUmUl4aCI4BwpraNx4RtEXMe5qg5T1LVTGliMRpKasKsW//e+RinhejgCuzoH26dyF8iY2ZZ/5D1ilgeijhV/vBka5twt399mXwaYdCwFYE="
  end


  it "should correctly generate a signature" do
    method = "GET"
    uri = "http://term.ie/oauth/example/access_token.php"
    parameters = {
      "oauth_consumer_key"     => "key",
      "oauth_token"            => "requestkey",
      "oauth_signature_method" => "RSA-SHA1",
      "oauth_timestamp"        => "1377815426",
      "oauth_nonce"            => "8ae9ac8192dd3cd7372e0324bf879602",
      "oauth_version"          => "1.0"
    }
    client_credential_secret = "-----BEGIN PRIVATE KEY-----
MIICdgIBADANBgkqhkiG9w0BAQEFAASCAmAwggJcAgEAAoGBALRiMLAh9iimur8V
A7qVvdqxevEuUkW4K+2KdMXmnQbG9Aa7k7eBjK1S+0LYmVjPKlJGNXHDGuy5Fw/d
7rjVJ0BLB+ubPK8iA/Tw3hLQgXMRRGRXXCn8ikfuQfjUS1uZSatdLB81mydBETlJ
hI6GH4twrbDJCR2Bwy/XWXgqgGRzAgMBAAECgYBYWVtleUzavkbrPjy0T5FMou8H
X9u2AC2ry8vD/l7cqedtwMPp9k7TubgNFo+NGvKsl2ynyprOZR1xjQ7WgrgVB+mm
uScOM/5HVceFuGRDhYTCObE+y1kxRloNYXnx3ei1zbeYLPCHdhxRYW7T0qcynNmw
rn05/KO2RLjgQNalsQJBANeA3Q4Nugqy4QBUCEC09SqylT2K9FrrItqL2QKc9v0Z
zO2uwllCbg0dwpVuYPYXYvikNHHg+aCWF+VXsb9rpPsCQQDWR9TT4ORdzoj+Nccn
qkMsDmzt0EfNaAOwHOmVJ2RVBspPcxt5iN4HI7HNeG6U5YsFBb+/GZbgfBT3kpNG
WPTpAkBI+gFhjfJvRw38n3g/+UeAkwMI2TJQS4n8+hid0uus3/zOjDySH3XHCUno
cn1xOJAyZODBo47E+67R4jV1/gzbAkEAklJaspRPXP877NssM5nAZMU0/O/NGCZ+
3jPgDUno6WbJn5cqm8MqWhW1xGkImgRk+fkDBquiq4gPiT898jusgQJAd5Zrr6Q8
AO/0isr/3aa6O6NLQxISLKcPDk2NOccAfS/xOtfOz4sJYM3+Bs4Io9+dZGSDCA54
Lw03eHTNQghS0A==
-----END PRIVATE KEY-----"
    token_credential_secret = "QllSuL9eQ5FXFO1Z/HcgL4ON"
    base_string = Signet::OAuth1.generate_base_string method, uri, parameters
    expect(Signet::OAuth1::RSASHA1.generate_signature(
             base_string, client_credential_secret, token_credential_secret
           )).to eq "Q1O7Ovi0jdacl/OTJoH3MAyOO/9H/tTXmoJzP/YqiKEJ+/wfShXo1RXX0xmlcjDR1XYxB1RMgHkFWQYYwz1qGCUhkXlH1c/to2qxPksptfPHRe7PJTxRClrdqLFOlhN7w2kO7tHVCeEp8IJIKON9q7cdXroTP7ctPPS+Q883SS0="
  end
end
