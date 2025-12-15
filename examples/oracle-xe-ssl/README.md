# Oracle XE SSL/TCPS Example InSpec Profile

This example demonstrates how to use the enhanced `oracledb_session` resource to connect to Oracle Database using SSL/TCPS encryption with TNS aliases and environment variables.

## Overview

This profile showcases the new features added in CHEF-28019:
- **TNS Alias Support**: Connect using entries from `tnsnames.ora` instead of hardcoded host/port
- **Environment Variables**: Configure `TNS_ADMIN`, `LD_LIBRARY_PATH`, `ORACLE_HOME`, etc.
- **SSL/TCPS Connectivity**: Secure connections using Oracle wallets
- **Debug Mode**: Troubleshoot connection issues with masked command output
- **Cross-Platform**: Works on Intel Macs, ARM Macs (via Rosetta 2), Linux, and Windows

## Prerequisites

### 1. Oracle Database Server

You need an Oracle Database instance with SSL/TCPS configured. See the Docker setup guide for a quick start:

```bash
# Using Docker Desktop (works on ARM/Intel Macs)
docker run -d --name oracle-xe \
  --platform linux/amd64 \
  -p 1521:1521 \
  -p 5500:5500 \
  -e ORACLE_PASSWORD=YourPassword123 \
  gvenzl/oracle-xe:21-slim-faststart
```

For full SSL/TCPS setup with wallets, refer to:
- `ORACLE_SSL_SETUP_GUIDE.md` - Complete SSL configuration
- `HOW_DOCKER_WORKS_ON_ARM.md` - ARM Mac compatibility explained
- `CLIENT_WALLET_SETUP.md` - Client-side wallet configuration

### 2. Oracle Instant Client

Install Oracle Instant Client on your test machine:

**macOS (using Homebrew):**
```bash
# Intel Mac
brew install instantclient-sqlplus

# ARM Mac (requires Rosetta 2)
# Note: Oracle Instant Client is x86_64 only
arch -x86_64 brew install instantclient-sqlplus
```

**Linux:**
```bash
# Download from Oracle and extract
wget https://download.oracle.com/otn_software/linux/instantclient/...
unzip instantclient-basic-linux.x64-*.zip
unzip instantclient-sqlplus-linux.x64-*.zip
```

**Windows:**
Download and install from Oracle's website.

### 3. TNS Configuration

Create a `tnsnames.ora` file with your connection entries:

```bash
# Example: /path/to/tnsnames/tnsnames.ora
XEPDB1_TCP =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCP)(HOST = localhost)(PORT = 1521))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XEPDB1)
    )
  )

XEPDB1_TCPS =
  (DESCRIPTION =
    (ADDRESS = (PROTOCOL = TCPS)(HOST = localhost)(PORT = 2484))
    (CONNECT_DATA =
      (SERVER = DEDICATED)
      (SERVICE_NAME = XEPDB1)
    )
    (SECURITY =
      (SSL_SERVER_CERT_DN = "CN=oracle-server,O=MyCompany,C=US")
      (MY_WALLET_DIRECTORY = /path/to/client/wallet)
    )
  )
```

### 4. Oracle Wallet (for SSL/TCPS only)

If using TCPS connections, configure the client wallet:

```bash
# Create wallet directory
mkdir -p /path/to/client/wallet

# Copy wallet files from server
# - cwallet.sso (auto-login wallet)
# - ewallet.p12 (encrypted wallet, optional)

# Create sqlnet.ora
cat > /path/to/tnsnames/sqlnet.ora << 'EOF'
WALLET_LOCATION =
  (SOURCE =
    (METHOD = FILE)
    (METHOD_DATA =
      (DIRECTORY = /path/to/client/wallet)
    )
  )

SQLNET.AUTHENTICATION_SERVICES = (TCPS,NTS,BEQ)
SSL_CLIENT_AUTHENTICATION = FALSE
EOF
```

## Profile Structure

```
examples/oracle-xe-ssl/
├── README.md                    # This file
├── inspec.yml                   # Profile metadata
├── inputs.yml.example           # Example input values
├── controls/
│   ├── 01_basic_tcp.rb          # TCP connection examples
│   ├── 02_tns_alias.rb          # TNS alias examples
│   ├── 03_ssl_tcps.rb           # SSL/TCPS examples
│   └── 04_advanced.rb           # Advanced usage examples
└── libraries/
    └── oracle_helpers.rb        # Helper functions
```

## Quick Start

### 1. Configure Inputs

Copy the example inputs file and customize:

```bash
cp inputs.yml.example inputs.yml
# Edit inputs.yml with your credentials and paths
```

### 2. Run the Profile

```bash
# Run all controls
inspec exec examples/oracle-xe-ssl --input-file examples/oracle-xe-ssl/inputs.yml

# Run specific control
inspec exec examples/oracle-xe-ssl --input-file examples/oracle-xe-ssl/inputs.yml \
  --controls tns-alias-connection

# Enable debug mode
inspec exec examples/oracle-xe-ssl --input-file examples/oracle-xe-ssl/inputs.yml \
  --input debug_mode=true
```

## Usage Examples

### Example 1: Traditional TCP Connection

```ruby
# Using host:port/service (backward compatible)
sql = oracledb_session(
  user: 'testuser',
  password: 'password',
  host: 'localhost',
  port: '1521',
  service: 'XEPDB1'
)

describe sql.query('SELECT 1 FROM dual') do
  its('rows.length') { should eq 1 }
end
```

### Example 2: TNS Alias Connection

```ruby
# Using TNS alias from tnsnames.ora (preferred)
sql = oracledb_session(
  user: 'testuser',
  password: 'password',
  tns_alias: 'XEPDB1_TCP',
  env: {
    'TNS_ADMIN' => '/path/to/tnsnames'
  }
)

describe sql.query('SELECT 1 FROM dual') do
  its('rows.length') { should eq 1 }
end
```

### Example 3: SSL/TCPS Connection

```ruby
# Using TCPS with wallet
sql = oracledb_session(
  user: 'testuser',
  password: 'password',
  tns_alias: 'XEPDB1_TCPS',
  env: {
    'TNS_ADMIN' => '/path/to/tnsnames',
    'LD_LIBRARY_PATH' => '/opt/oracle/instantclient',
    'ORACLE_HOME' => '/opt/oracle/client'
  },
  debug: true  # See masked command for troubleshooting
)

describe sql.query('SELECT sys_context(\'USERENV\',\'NETWORK_PROTOCOL\') FROM dual') do
  its('row(0).column("sys_context('userenv','network_protocol')").value') { should eq 'tcps' }
end
```

### Example 4: Environment Variable Expansion

```ruby
# $PATH expansion is automatic
sql = oracledb_session(
  user: 'testuser',
  password: 'password',
  tns_alias: 'MYDB',
  env: {
    'TNS_ADMIN' => '/etc/oracle',
    'LD_LIBRARY_PATH' => '/opt/oracle/lib:$PATH',  # Expands $PATH
    'PATH' => '/opt/oracle/bin:$PATH'               # Expands $PATH
  }
)
```

## ARM Mac Compatibility

This profile works on Apple Silicon (M1/M2/M3) Macs using Docker Desktop with Rosetta 2 emulation:

```bash
# Verify ARM compatibility
uname -m                              # Should show: arm64
docker exec oracle-xe uname -m        # Should show: x86_64 (emulated)

# Run profile (same command on ARM or Intel)
inspec exec examples/oracle-xe-ssl --input-file examples/oracle-xe-ssl/inputs.yml
```

For details on how this works, see `HOW_DOCKER_WORKS_ON_ARM.md`.

## Troubleshooting

### Enable Debug Mode

```ruby
sql = oracledb_session(
  user: 'testuser',
  password: 'password',
  tns_alias: 'MYDB',
  env: { 'TNS_ADMIN' => '/path/to/tnsnames' },
  debug: true  # Prints masked command to stderr
)
```

Output will show:
```
oracledb_session: debug command (password masked):
TNS_ADMIN='/path/to/tnsnames' sqlplus -s /nolog <<'INSPECSQL'
connect testuser/****@MYDB
...
```

### Common Issues

**Error: TNS:could not resolve the connect identifier**
- Check `TNS_ADMIN` points to directory containing `tnsnames.ora`
- Verify TNS alias exists in `tnsnames.ora`
- Ensure `tnsnames.ora` has correct syntax

**Error: ORA-28759: failure to open file**
- Check wallet directory path in `sqlnet.ora`
- Verify wallet files (`cwallet.sso`) exist
- Check file permissions on wallet directory

**Error: command not found: sqlplus**
- Set `LD_LIBRARY_PATH` to Instant Client directory
- Add Instant Client bin to `PATH`
- On ARM Mac, ensure Rosetta 2 is installed

**Error: TNS:protocol adapter error**
- Check Oracle listener is running
- Verify port is not blocked by firewall
- For TCPS, ensure SSL is configured on server

## Testing This Profile

```bash
# Verify profile structure
inspec check examples/oracle-xe-ssl

# Run with verbose output
inspec exec examples/oracle-xe-ssl --input-file examples/oracle-xe-ssl/inputs.yml \
  --reporter cli

# Generate JSON report
inspec exec examples/oracle-xe-ssl --input-file examples/oracle-xe-ssl/inputs.yml \
  --reporter json:oracle-results.json

# Run specific tag
inspec exec examples/oracle-xe-ssl --input-file examples/oracle-xe-ssl/inputs.yml \
  --tags ssl
```

## Documentation

- **Main Resource**: `lib/inspec/resources/oracledb_session.rb`
- **JIRA Ticket**: [CHEF-28019](https://progresssoftware.atlassian.net/browse/CHEF-28019)
- **Setup Guides**: 
  - `ORACLE_SSL_SETUP_GUIDE.md` - Complete Oracle SSL/TCPS setup
  - `CLIENT_WALLET_SETUP.md` - Client wallet configuration
  - `HOW_DOCKER_WORKS_ON_ARM.md` - ARM Mac compatibility
  - `WHY_X86_EMULATION_AND_VIRTUALBOX_FAILURE.md` - Technical deep dive

## License

Apache-2.0

## Authors

InSpec Team - Chef Software, Inc.

## Support

For issues or questions:
- File an issue in the [InSpec repository](https://github.com/inspec/inspec)
- Reference CHEF-28019 for SSL/TCPS enhancements
