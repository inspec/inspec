#! /bin/bash
sudo apt-get update -y
sudo apt-get install gnupg -y
wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list
sudo apt-get update -y
sudo apt-get install -y mongodb-org=4.4.18 mongodb-org-server=4.4.18 mongodb-org-shell=4.4.18 mongodb-org-mongos=4.4.18 mongodb-org-tools=4.4.18

sudo systemctl start mongod
sudo systemctl status mongod

sleep 10s

mongo admin --port 27017 <<EOF
  use my_db

  db.createUser({
      user: 'inspecuser',
      pwd: 'secretPassword',
      roles: [{ role: 'readWrite', db:'my_db'}]
  })

EOF

sudo cp /tmp/mongod.conf /etc/mongod.conf

sudo systemctl restart mongod