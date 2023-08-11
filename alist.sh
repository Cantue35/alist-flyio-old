#!/bin/bash

# Create data directory
mkdir -p /opt/alist/data/

# Set the correct permissions for the data directory
chmod +rx /opt/alist/data

# Create configuration file
cat >/opt/alist/data/config.json <<EOF
{
  "address": "0.0.0.0",
  "port": 2233,
  "assets": "local",
  "database": {
    "type": "$DATABASE",
    "user": "$SQLUSER",
    "password": "$SQLPASSWORD",
    "host": "$SQLHOST",
    "port": $SQLPORT,
    "name": "$SQLNAME",
    "table_prefix": "x_",
    "db_file": "data.db"
  },
  "scheme": {
    "https": false,
    "cert_file": "",
    "key_file": ""
  },
  "cache": {
    "expiration": 60,
    "cleanup_interval": 120
  }
}
EOF

# Run AList
cd /opt/alist
./alist -conf data/config.json