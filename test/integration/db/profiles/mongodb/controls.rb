host = input("mongodb_host_ip", value: nil)
describe mongodb_session(user: "inspecuser", password: "secretPassword", database: "my_db", host: host).query(usersInfo: "inspecuser").params["users"].first["roles"].first do
  its(["role"]) { should eq "readWrite" }
end

describe mongodb_session(user: "inspecuser", password: "secretPassword", database: "my_db", host: host).query(buildInfo: 1).params do
  its(["version"]) { should eq "4.4.18" }
end