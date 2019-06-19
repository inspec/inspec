if node["platform_family"] != "windows"

  openssl_dhparam "/tmp/example.dh_pem" do
    key_length 2048
    generator 2
  end

end
