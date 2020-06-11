# Windows Remote Management (WinRM) for Ruby
[![Build Status](https://travis-ci.org/WinRb/WinRM.svg?branch=master)](https://travis-ci.org/WinRb/WinRM)
[![Gem Version](https://badge.fury.io/rb/winrm.svg)](http://badge.fury.io/rb/winrm)
[![Build status](https://ci.appveyor.com/api/projects/status/ods9tvos78k5c15h?svg=true)](https://ci.appveyor.com/project/winrb/winrm)

This is a SOAP library that uses the functionality in Windows Remote
Management(WinRM) to call native object in Windows.  This includes, but is
not limited to, running batch scripts, powershell scripts and fetching WMI
variables.  For more information on WinRM, please visit [Microsoft's WinRM
site](http://msdn.microsoft.com/en-us/library/aa384426.aspx).

As of version 2.0, this gem retains the WinRM name but all powershell calls use the more modern [Powershell Remoting Protocol (PSRP)](https://msdn.microsoft.com/en-us/library/dd357801.aspx) for initializing runspace pools as well as creating and processing powershell pipelines.

## Supported Ruby Versions
Ruby 2.0 or higher is required. If you need to use an older version of Ruby you'll need to use a 1.x version of this gem.

## Supported WinRM Versions
WinRM 1.1 is supported, however 2.0 and higher is recommended. [See MSDN](http://technet.microsoft.com/en-us/library/ff520073.aspx) for information about WinRM versions and supported operating systems.

## Install
`gem install -r winrm` then on the server `Enable-PSRemoting -Force` (already enabled on server operating systems 2012 and above) as admin

## Example
```ruby
require 'winrm'
opts = { 
  endpoint: 'http://myhost:5985/wsman',
  user: 'administrator',
  password: 'Pass@word1'
}
conn = WinRM::Connection.new(opts)
conn.shell(:powershell) do |shell|
  output = shell.run('$PSVersionTable') do |stdout, stderr|
    STDOUT.print stdout
    STDERR.print stderr
  end
  puts "The script exited with exit code #{output.exitcode}"
end
```

## Connection Options
There are various connection options you can specify upon initializing a WinRM connection object:

* `:transport` - The type of underlying connection transport to use (more on this below). Defaults to `:negotiate`
* `:locale` - The locale requested for response text formatting. This is the value sent in the `DataLocale` and `Locale` header values and defaults to `en-us`
* `:max_envelope_size` - mazimum number of bytes expected for WinRM responses. This defaults to 153600
* `:operation_timeout` - The maximum amount of time to wait for a response from the endpoint. This defaults to 60 seconds. Note that this will not "timeout" commands that exceed this amount of time to process, it just requires the endpoint to report the status of the command before the given amount of time passes.
* `:receive_timeout` - The amount of time given to the underlying HTTP connection to respond before timing out. The defaults to 10 seconds longer than the `:operation_timeout`.
* `:retry_limit` - the maximum number of times to retry opening a shell after failure. This defaults to 3.
* `:retry_delay` - the amount of time to wait between retries and defaults to 10 seconds
* `:user` - username used to authenticate over the `:transport`
* `:password` - password used to authenticate over the `:transport`

There are other options that may apply depending on the type of `:transport` used and are discussed below.

## Transports

The transport used governs the authentication method used and the encryption level used for the underlying HTTP communication with the endpoint. The WinRM gem supports the following transport types:

### `:negotiate`
```ruby
WinRM::Connection.new( 
  endpoint: 'http://myhost:5985/wsman',
  transport: :negotiate,
  user: 'administrator',
  password: 'Pass@word1'
)
```

The `:negotiate` transport uses the [rubyntlm gem](https://github.com/WinRb/rubyntlm) to authenticate with the endpoint using the NTLM protocol. This uses an HTTP based connection but the SOAP message payloads are encrypted. If using HTTP (as opposed to HTTPS) this is the recommended transport. This is also the default transport used if none is specified in the connection options.

### `:ssl`
```ruby
WinRM::Connection.new( 
  endpoint: 'https://myhost:5986/wsman',
  transport: :ssl,
  user: 'administrator',
  password: 'Pass@word1'
)
```

The `:ssl` transport establishes a connection to the winrm endpoint over a secure sockets layer transport encrypting the entire message. Here are some additional connecion options available to `:ssl` connections:

* `:client_cert` - Either a string path to a certificate `.pem` file or a `X509::Certificate` object. This along with an accompanying `:client_key` can be used in lieu of a `:user` and `:password`.
* `:client_key` - the path to the private key file accompanying the above mentioned `:client_cert` or an `PKey::Pkey` object.
* `:key_pass` - the optional password if necessary to access the `:client_cert`
* `:no_ssl_peer_verification` - when set to `true` ssl certificate validation is not performed. With a self signed cert, its a match made in heaven!
* `:ssl_peer_fingerprint` - when this is provided, normal certificate validation is skipped and instead the given fingerprint is matched against the certificate of the endpoint for verification.
* `:ca_trust_path` - the path to a certificate `.pem` file to trust. Its similar to the `:ssl_peer_fingerprint` but contains the entire certificate to trust.

### `:kerberos`
```ruby
WinRM::Connection.new( 
  endpoint: 'http://myhost:5985/wsman',
  transport: :kerberos,
  realm: 'kerberos_realm'
)
```

Uses `:kerberos` to authenticate with the endpoint. These additional connection options may be used:

* `:service` - kerberos service used to authenticate with the endpoint. Defaults to `HTTP`.
* `:realm` - Kerberos realm to authenticate against.

### `:plaintext`
Note: It is strongly recommended that you use `:negotiate` instead of `:plaintext`. As the name infers, the `:plaintext` transport includes authentication credentials in plain text.
```ruby
WinRM::Connection.new( 
  endpoint: 'http://myhost:5985/wsman',
  transport: :plaintext,
  user: 'administrator',
  password: 'Pass@word1',
  basic_auth_only: true
)
```

Additional supported connection options:

* `:basic_auth_only` - Force basic authentication
* `:disable_sspi` - Disable SSPI Negotiation authentication

## Shells

As of the WinRM gem version 2, one creates a shell for executing commands by calling the `shell` method of a WinRM connection. There are two types of shells available:

* `:cmd` - initiates a traditional cmd.exe shell via the WinRM protocol
* `:powershell` - initiates a powershell runspace via the PSRP protocol

Both shells support the same public methods: `:open`, `:close`, and `run`. Note that when given a shell, it is opened automatically upon executing the first command via `:run`. Further, `close` is called automatically when a `shell` is garbage collected or when using a shell from a block. However, it is always a good idea to proactively `close` a shell.

### Shell options supported by the `:cmd` shell

```
shell_opts = {
  env_vars: { 'FOO' => 'BAR' }
}
conn = WinRM::Connection.new(opts)
shell = conn.shell(:cmd, shell_opts)
```

The `:cmd` shell supports a number of shell options that you can specify for the shell. There are safe defaults for all shell options and chances are that you will not need to override any of them. The available options are listed below.

* `:shell_uri` - WSMAN Resource URI. Defaults to `http://schemas.microsoft.com/wbem/wsman/1/windows/shell/cmd` and you should not change this unless you hold the keys to the portal of eternity.
* `:i_stream` - A simple token list of all input streams the client will be using during execution. The only supported stream and the default is `stdin`.
* `:o_stream` - A simple token list of all output streams expected by the client. The supported streams and the defaults are `stdout` and `stderr`.
* `:codepage` - The `WINRS_CODEPAGE` which is the client's console output code page. The default is 65001 (UTF-8).
* `:noprofile` - The `WINRS_NOPROFILE` if set to `TRUE`, this option specifies that the user profile does not exist on the remote system and that the default profile should be used. By default, the value is `FALSE`.
* `:working_directory` - the starting directory that the Shell is to use for initialization.
* `:idle_timeout` - The remote winrm service will close and terminate the shell instance if it is idle for this many seconds. If the Shell is reused within this time limit, the countdown timer is reset once the command sequence is completed.
* `:env_vars` - a hash of EnvironmentVariable key/values, the starting set of environment variables that the Shell will use.

### `:codepage` and working with legacy Windows versions

When using the `:cmd` shell, the default codepage used is `65001`. This works best accross locales on "modern" versions of Windows (Windows 7/Server 2008 R2 and later). Older versions may exhibit undesirable behavior under the 65001 codepage. The most common symptom is that commands invoking executables will return immediately with no output or errors.

When using these older versions of Windows, its best to use the native code page of the server's locale. For example, en-US servers will have a codepage of `437`. The `chcp` command can be used to determine the value of the native codepage.

## Executing a WQL Query
```ruby
opts = { 
  endpoint: 'http://myhost:5985/wsman',
  user: 'administrator',
  password: 'Pass@word1'
}
conn = WinRM::Connection.new(opts)

conn.run_wql('select * from Win32_Process') do |type, item|
  puts "***#{type}:"
  item.each { |k,v| puts "#{k}: #{v}" }
end
```

This will output data for each process:

```
***win32_process:
caption: svchost.exe
command_line: C:\Windows\System32\svchost.exe -k termsvcs
...
```

`run_wql` takes an optional second parameter in case you need to use a custom namespace. `root/cimv2/*` is the default.

## Create a self signed cert for WinRM
You may want to create a self signed certificate for servicing https WinRM connections. You can use the following PowerShell script to create a cert and enable the WinRM HTTPS listener. Unless you are running windows server 2012 R2 or later, you must install makecert.exe from the Windows SDK, otherwise use `New-SelfSignedCertificate`.

```powershell
$hostname = $Env:ComputerName
 
C:\"Program Files"\"Microsoft SDKs"\Windows\v7.1\Bin\makecert.exe -r -pe -n "CN=$hostname,O=vagrant" -eku 1.3.6.1.5.5.7.3.1 -ss my -sr localMachine -sky exchange -sp "Microsoft RSA SChannel Cryptographic Provider" -sy 12 "$hostname.cer"
 
$thumbprint = (& ls cert:LocalMachine/my).Thumbprint

# Windows 2012R2 and above can use New-SelfSignedCertificate
$thumbprint = (New-SelfSignedCertificate -DnsName $hostname -CertStoreLocation cert:\LocalMachine\my).Thumbprint

$cmd = "winrm create winrm/config/Listener?Address=*+Transport=HTTPS '@{Hostname=`"$hostname`";CertificateThumbprint=`"$thumbprint`"}'"
iex $cmd
```

## Setting up Certificate based authentication
Perform the following steps to authenticate with a certificate instead of a username and password:

1. Generate a certificate with an Extended Key Usage of Client Authentication and a Subject Alternative Name with the UPN of the user. See this [powershell function](https://github.com/WinRb/WinRM/blob/master/WinrmAppveyor.psm1#L1) as an example of using `openssl` to create a self signed user certificate in `.pem` and `.pfx` formats along with the private key file.

2. Import the pfx file into the `TrustedPeople` directory of the `LocalMachine` certificate store on the windows endpoint.

3. Import the issuing certificate authority certificate in the endpoint's `Root` certificates. If your client certificate is self signed, this will be the client certificate.

4. Enable certificate authentication on the endpoint: `Set-Item -Path WSMan:\localhost\Service\Auth\Certificate -Value $true`

5. Add a winrm user mapping for the issuing certificate: `New-Item -Path WSMan:\localhost\ClientCertificate -Subject <user UPN> -URI * -Issuer <issuing certificate thumbprint> -Credential (Get-Credential) -Force`

See [this post](http://www.hurryupandwait.io/blog/certificate-password-less-based-authentication-in-winrm) for more details on certificate authentication.

## Logging
The `WinRM::Connection` exposes a `logger` attribute and uses the [logging](https://rubygems.org/gems/logging) gem to manage logging behavior. By default this appends to `STDOUT` and has a level of `:warn`, but one can adjust the level or add additional appenders.
```ruby
conn = WinRM::Connection.new(opts)

# suppress warnings
conn.logger.level = :error

# Log to a file
conn.logger.add_appenders(Logging.appenders.file('error.log'))
```

If a consuming application uses its own logger that complies to the logging API, you can simply swap it in:
```ruby
conn.logger = my_logger
```

## Troubleshooting
You may have some errors like ```WinRM::WinRMAuthorizationError```. See [this post](http://www.hurryupandwait.io/blog/understanding-and-troubleshooting-winrm-connection-and-authentication-a-thrill-seekers-guide-to-adventure) for tips and troubleshooting steps related to winrm connection and authentication issues.

## Contributing

1. Fork it.
2. Create a branch (git checkout -b my_feature_branch)
3. Run the unit and integration tests (bundle exec rake integration)
4. Commit your changes (git commit -am "Added a sweet feature")
5. Push to the branch (git push origin my_feature_branch)
6. Create a pull requst from your branch into master (Please be sure to provide enough detail for us to cipher what this change is doing)

### Running the tests

We use Bundler to manage dependencies during development.

```
$ bundle install
```

Once you have the dependencies, you can run the unit tests with `rake`:

```
$ bundle exec rake spec
```

To run the integration tests you will need a Windows box with the WinRM service properly configured. Its easiest to use a Vagrant Windows box (mwrock/Windows2012R2 is public on [atlas](https://atlas.hashicorp.com/mwrock/boxes/Windows2012R2) with an evaluation version of Windows 2012 R2). You can also use `mwrock/WindowsNano` provided in this repo's `Vagrantfile`.

1. Create a Windows VM with WinRM configured (see above).
2. Copy the config-example.yml to config.yml - edit this file with your WinRM connection details.
3. Run `bundle exec rake integration`

## WinRM Author
* Twitter: [@zentourist](https://twitter.com/zentourist)
* BLOG:  [http://distributed-frostbite.blogspot.com/](http://distributed-frostbite.blogspot.com/)
* Add me in LinkedIn:  [http://www.linkedin.com/in/danwanek](http://www.linkedin.com/in/danwanek)
* Find me on irc.freenode.net in #ruby-lang (zenChild)

## Maintainers
* Paul Morton (https://github.com/pmorton)
* Shawn Neal (https://github.com/sneal)
* Matt Wrock (https://github.com/mwrock)

[Contributors](https://github.com/WinRb/WinRM/graphs/contributors)
