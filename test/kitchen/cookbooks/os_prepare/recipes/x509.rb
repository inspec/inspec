if node["platform_family"] != "windows"

  openssl_x509_certificate "/tmp/mycert.pem" do
    common_name "www.f00bar.com"
    org "Foo Bar"
    org_unit "Lab"
    country "US"
    expire 360
  end

  openssl_rsa_private_key "/tmp/server.key" do
    key_length 2048
  end

end
