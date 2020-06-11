docker-api
==========
[![Gem Version](https://badge.fury.io/rb/docker-api.svg)](https://badge.fury.io/rb/docker-api) [![travis-ci](https://travis-ci.org/swipely/docker-api.svg?branch=master)](https://travis-ci.org/swipely/docker-api) [![Code Climate](https://codeclimate.com/github/swipely/docker-api.svg)](https://codeclimate.com/github/swipely/docker-api) [![Dependency Status](https://gemnasium.com/swipely/docker-api.svg)](https://gemnasium.com/swipely/docker-api)

This gem provides an object-oriented interface to the [Docker Remote API](https://docs.docker.com/reference/api/docker_remote_api/). Every method listed there is implemented. At the time of this writing, docker-api is meant to interface with Docker version 1.3.*

If you're interested in using Docker to package your apps, we recommend the [dockly](https://github.com/swipely/dockly) gem. Dockly provides a simple DSL for describing Docker containers that install as Debian packages and are controlled by upstart scripts.

Installation
------------

Add this line to your application's Gemfile:

```ruby
gem 'docker-api'
```

And then run:

```shell
$ bundle install
```

Alternatively, if you wish to just use the gem in a script, you can run:

```shell
$ gem install docker-api
```

Finally, just add `require 'docker'` to the top of the file using this gem.

Usage
-----

docker-api is designed to be very lightweight. Almost no state is cached (aside from id's which are immutable) to ensure that each method call's information is up to date. As such, just about every external method represents an API call.

## Starting up

Follow the [installation instructions](https://docs.docker.com/installation/#installation), and then run:

```shell
$ sudo docker -d
```

This will daemonize Docker so that it can be used for the remote API calls.

### Host

If you're running Docker locally as a socket, there is no setup to do in Ruby. If you're not using a socket or have changed the path of the socket, you'll have to point the gem to your socket or local/remote port. For example:

```ruby
Docker.url = 'tcp://example.com:5422'
```

Two things to note here. The first is that this gem uses [excon](http://www.github.com/geemus/excon), so any of the options that are valid for `Excon.new` are also valid for `Docker.options`. Second, by default Docker runs on a socket. The gem will assume you want to connect to the socket unless you specify otherwise.

Also, you may set the above variables via `ENV` variables. For example:

```shell
$ DOCKER_URL=unix:///var/docker.sock irb
irb(main):001:0> require 'docker'
=> true
irb(main):002:0> Docker.url
=> "unix:///var/docker.sock"
irb(main):003:0> Docker.options
=> {}
```

```shell
$ DOCKER_URL=tcp://example.com:1000 irb
irb(main):001:0> require 'docker'
=> true
irb(main):003:0> Docker.url
=> "tcp://example.com:1000"
irb(main):004:0> Docker.options
=> {}
```

Before doing anything else, ensure you have the correct version of the Docker API. To do this, run `Docker.validate_version!`. If your installed version is not supported, a `Docker::Error::VersionError` is raised.

### SSL

When running docker using SSL, setting the DOCKER_CERT_PATH will configure docker-api to use SSL.
The cert path is a folder that contains the cert, key and cacert files.
docker-api is expecting the files to be named: cert.pem, key.pem, and ca.pem.
If your files are named different, you'll want to set your options explicity:

```
Docker.options = {
    client_cert: File.join(cert_path, 'cert.pem'),
    client_key: File.join(cert_path, 'key.pem'),
    ssl_ca_file: File.join(cert_path, 'ca.pem'),
    scheme: 'https'
}
```

If you want to load the cert files from a variable, e.g. you want to load them from ENV as needed on Heroku:

```
cert_store = OpenSSL::X509::Store.new
certificate = OpenSSL::X509::Certificate.new ENV["DOCKER_CA"]
cert_store.add_cert certificate

Docker.options = {
  client_cert_data: ENV["DOCKER_CERT"],
  client_key_data: ENV["DOCKER_KEY"],
  ssl_cert_store: cert_store,
  scheme: 'https'
}
```

If you need to disable SSL verification, set the DOCKER_SSL_VERIFY variable to 'false'.

## Global calls

All of the following examples require a connection to a Docker server. See the <a href="#starting-up">Starting up</a> section above for more information.

```ruby
require 'docker'
# => true

# docker command for reference: docker version
Docker.version
# => { 'Version' => '0.5.2', 'GoVersion' => 'go1.1' }

# docker command for reference: docker info
Docker.info
# => { "Debug" => false, "Containers" => 187, "Images" => 196, "NFd" => 10, "NGoroutines" => 9, "MemoryLimit" => true }

# docker command for reference: docker login
Docker.authenticate!('username' => 'docker-fan-boi', 'password' => 'i<3docker', 'email' => 'dockerboy22@aol.com')
# => true

# docker command for reference: docker login registry.gitlab.com
Docker.authenticate!('username' => 'docker-fan-boi', 'password' => 'i<3docker', 'email' => 'dockerboy22@aol.com', 'serveraddress' => 'https://registry.gitlab.com/v1/')
# => true
```

## Images

Just about every method here has a one-to-one mapping with the [Images](https://docs.docker.com/engine/reference/api/docker_remote_api_v1.14/#2-2-images) section of the API. If an API call accepts query parameters, these can be passed as an Hash to it's corresponding method. Also, note that `Docker::Image.new` is a private method, so you must use `.create`, `.build`, `.build_from_dir`, `build_from_tar`, or `.import` to make an instance.

```ruby
require 'docker'
# => true

# Pull an Image.
# docker command for reference: docker pull ubuntu:14.04
image = Docker::Image.create('fromImage' => 'ubuntu:14.04')
# => Docker::Image { :id => ae7ffbcd1, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Insert a local file into an Image.
image.insert_local('localPath' => 'Gemfile', 'outputPath' => '/')
# => Docker::Image { :id => 682ea192f, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Insert multiple local files into an Image.
image.insert_local('localPath' => [ 'Gemfile', 'Rakefile' ], 'outputPath' => '/')
# => Docker::Image { :id => eb693ec80, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Add a repo name to Image.
# docker command for reference: docker tag <IMAGE.ID> base2
image.tag('repo' => 'base2', 'force' => true)
# => ["base2"]

# Add a repo name and tag an Image.
# docker command for reference: docker tag <IMAGE.ID> base2:latest
image.tag('repo' => 'base2', 'tag' => 'latest', force: true)
# => ["base2:latest"]

# Get more information about the Image.
# docker command for reference: docker inspect <IMAGE.ID>
image.json
# => {"id"=>"67859327bf22ef8b5b9b4a6781f72b2015acd894fa03ce07e0db7af170ba468c", "comment"=>"Imported from -", "created"=>"2013-06-19T18:42:58.287944526-04:00", "container_config"=>{"Hostname"=>"", "User"=>"", "Memory"=>0, "MemorySwap"=>0, "CpuShares"=>0, "AttachStdin"=>false, "AttachStdout"=>false, "AttachStderr"=>false, "PortSpecs"=>nil, "Tty"=>false, "OpenStdin"=>false, "StdinOnce"=>false, "Env"=>nil, "Cmd"=>nil, "Dns"=>nil, "Image"=>"", "Volumes"=>nil, "VolumesFrom"=>""}, "docker_version"=>"0.4.0", "architecture"=>"x86_64"}

# View the history of the Image.
image.history
# => [{"Id"=>"67859327bf22", "Created"=>1371681778}]

# Push the Image to the Docker registry. Note that you have to login using
# `Docker.authenticate!` and tag the Image first.
# docker command for reference: docker push <IMAGE.ID>
image.push
# => Docker::Image { @connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} }, @info = { "id" => eb693ec80, "RepoTags" => ["base2", "base2/latest"]} }

# Push individual tag to the Docker registry.
image.push(nil, tag: "tag_name")
image.push(nil, repo_tag: 'registry/repo_name:tag_name')

# Given a command, create a new Container to run that command in the Image.
# docker command for reference: docker run -ti <IMAGE.ID> ls -l
image.run('ls -l')
# => Docker::Container { id => aaef712eda, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Remove the Image from the server.
# docker command for reference: docker rmi -f <IMAGE.ID>
image.remove(:force => true)
# => true

# Export a single Docker Image to a file
# docker command for reference: docker save <IMAGE.ID> my_export.tar
image.save('my_export.tar')
# => Docker::Image { :id => 66b712aef, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Return the raw image binary data
image.save
# => "abiglongbinarystring"

# Stream the contents of the image to a block:
image.save_stream { |chunk| puts chunk }
# => nil

# Given a Container's export, creates a new Image.
# docker command for reference: docker import some-export.tar
Docker::Image.import('some-export.tar')
# => Docker::Image { :id => 66b712aef, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# `Docker::Image.import` can also import from a URI
Docker::Image.import('http://some-site.net/my-image.tar')
# => Docker::Image { :id => 6b462b2d2, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# For a lower-level interface for importing tars, `Docker::Image.import_stream` may be used.
# It accepts a block, and will call that block until it returns an empty `String`.
File.open('my-export.tar') do |file|
  Docker::Image.import_stream { file.read(1000).to_s }
end

# Create an Image from a Dockerfile as a String.
Docker::Image.build("from base\nrun touch /test")
# => Docker::Image { :id => b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Create an Image from a Dockerfile.
# docker command for reference: docker build .
Docker::Image.build_from_dir('.')
# => Docker::Image { :id => 1266dc19e, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Create an Image from a file other than Dockerfile.
# docker command for reference: docker build -f Dockerfile.Centos .
Docker::Image.build_from_dir('.', { 'dockerfile' => 'Dockerfile.Centos' })
# => Docker::Image { :id => 1266dc19e, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Create an Image from a Dockerfile and stream the logs
Docker::Image.build_from_dir('.') do |v|
  if (log = JSON.parse(v)) && log.has_key?("stream")
    $stdout.puts log["stream"]
  end
end

# Create an Image from a tar file.
# docker command for reference: docker build - < docker_image.tar
Docker::Image.build_from_tar(File.open('docker_image.tar', 'r'))
# => Docker::Image { :id => 1266dc19e, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Load all Images on your Docker server.
# docker command for reference: docker images
Docker::Image.all
# => [Docker::Image { :id => b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => 8dbd9e392a964056420e5d58ca5cc376ef18e2de93b5cc90e868a1bbc8318c1c, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }]

# Get Image from the server, with id
# docker command for reference: docker images <IMAGE.ID>
Docker::Image.get('df4f1bdecf40')
# => Docker::Image { :id => eb693ec80, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Check if an image with a given id exists on the server.
Docker::Image.exist?('ef723dcdac09')
# => true

# Load an image from the file system
Docker::Image.load('./my-image.tar')
# => ""

# An IO object may also be specified for loading
File.open('./my-image.tar', 'rb') do |file|
  Docker::Image.load(file)
end
# => ""

# Export multiple images to a single tarball
# docker command for reference: docker save my_image1 my_image2:not_latest > my_export.tar
names = %w( my_image1 my_image2:not_latest )
Docker::Image.save(names, 'my_export.tar')
# => nil

# Return the raw image binary data
names = %w( my_image1 my_image2:not_latest )
Docker::Image.save(names)
# => "abiglongbinarystring"

# Stream the raw binary data
names = %w( my_image1 my_image2:not_latest )
Docker::Image.save_stream(names) { |chunk| puts chunk }
# => nil

# Search the Docker registry.
# docker command for reference: docker search sshd
Docker::Image.search('term' => 'sshd')
# => [Docker::Image { :id => cespare/sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => johnfuller/sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => dhrp/mongodb-sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => rayang2004/sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => dhrp/sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => toorop/daemontools-sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => toorop/daemontools-sshd-nginx, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => toorop/daemontools-sshd-nginx-php-fpm, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => mbkan/lamp, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => toorop/golang, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => wma55/u1210sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => jdswinbank/sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }, Docker::Image { :id => vgauthier/sshd, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }]
```

## Containers

Much like the Images, this object also has a one-to-one mapping with the [Containers](https://docs.docker.com/engine/reference/api/docker_remote_api_v1.14/#2-1-containers) section of the API. Also like Images, `.new` is a private method, so you must use `.create` to make an instance.

```ruby
require 'docker'

# Create a Container.
container = Docker::Container.create('Cmd' => ['ls'], 'Image' => 'base')
# => Docker::Container { :id => 492510dd38e4, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Get more information about the Container.
container.json
# => {"ID"=>"492510dd38e4da7703f36dfccd013de672b8250f57f59d1555ced647766b5e82", "Created"=>"2013-06-20T10:46:02.897548-04:00", "Path"=>"ls", "Args"=>[], "Config"=>{"Hostname"=>"492510dd38e4", "User"=>"", "Memory"=>0, "MemorySwap"=>0, "CpuShares"=>0, "AttachStdin"=>false, "AttachStdout"=>false, "AttachStderr"=>false, "PortSpecs"=>nil, "Tty"=>false, "OpenStdin"=>false, "StdinOnce"=>false, "Env"=>nil, "Cmd"=>["ls"], "Dns"=>nil, "Image"=>"base", "Volumes"=>nil, "VolumesFrom"=>""}, "State"=>{"Running"=>false, "Pid"=>0, "ExitCode"=>0, "StartedAt"=>"0001-01-01T00:00:00Z", "Ghost"=>false}, "Image"=>"b750fe79269d2ec9a3c593ef05b4332b1d1a02a62b4accb2c21d589ff2f5f2dc", "NetworkSettings"=>{"IpAddress"=>"", "IpPrefixLen"=>0, "Gateway"=>"", "Bridge"=>"", "PortMapping"=>nil}, "SysInitPath"=>"/usr/bin/docker", "ResolvConfPath"=>"/etc/resolv.conf", "Volumes"=>nil}

# Start running the Container.
container.start
# => Docker::Container { :id => 492510dd38e4, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Stop running the Container.
container.stop
# => Docker::Container { :id => 492510dd38e4, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Restart the Container.
container.restart
# => Docker::Container { :id => 492510dd38e4, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Pause the running Container processes.
container.pause
# => Docker::Container { :id => 492510dd38e4, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Unpause the running Container processes.
container.unpause
# => Docker::Container { :id => 492510dd38e4, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Kill the command running in the Container.
container.kill
# => Docker::Container { :id => 492510dd38e4, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Kill the Container specifying the kill signal.
container.kill(:signal => "SIGHUP")
# => Docker::Container { :id => 492510dd38e4, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Return the currently executing processes in a Container.
container.top
# => [{"PID"=>"4851", "TTY"=>"pts/0", "TIME"=>"00:00:00", "CMD"=>"lxc-start"}]

# Same as above, but uses the original format
container.top(format: :hash)
# => {
#      "Titles" => ["PID", "TTY", "TIME", "CMD"],
#      "Processes" => [["4851", "pts/0", "00:00:00", "lxc-start"]]
#    }

# To expose 1234 to bridge
# In Dockerfile: EXPOSE 1234/tcp
# docker run resulting-image-name
Docker::Container.create(
  'Image' => 'image-name',
  'HostConfig' => {
    'PortBindings' => {
      '1234/tcp' => [{}]
    }
  }
)

# To expose 1234 to host with any port
# docker run -p 1234 image-name
Docker::Container.create(
  'Image' => 'image-name',
  'ExposedPorts' => { '1234/tcp' => {} },
  'HostConfig' => {
    'PortBindings' => {
      '1234/tcp' => [{}]
    }
  }
)

# To expose 1234 to host with a specified host port
# docker run -p 1234:1234 image-name
Docker::Container.create(
  'Image' => 'image-name',
  'ExposedPorts' => { '1234/tcp' => {} },
  'HostConfig' => {
    'PortBindings' => {
      '1234/tcp' => [{ 'HostPort' => '1234' }]
    }
  }
)

# To expose 1234 to host with a specified host port and host IP
# docker run -p 192.168.99.100:1234:1234 image-name
Docker::Container.create(
  'Image' => 'image-name',
  'ExposedPorts' => { '1234/tcp' => {} },
  'HostConfig' => {
    'PortBindings' => {
      '1234/tcp' => [{ 'HostPort' => '1234', 'HostIp' => '192.168.99.100' }]
    }
  }
)

# To set container name pass `name` key to options
Docker::Container.create(
  'name' => 'my-new-container',
  'Image' => 'image-name'
)

# Stores a file with the given content in the container
container.store_file("/test", "Hello world")

# Reads a file from the container
container.read_file("/test")
# => "Hello world"

# Export a Container. Since an export is typically at least 300M, chunks of the
# export are yielded instead of just returning the whole thing.
File.open('export.tar', 'w') do |file|
  container.export { |chunk| file.write(chunk) }
end
# => nil

# Inspect a Container's changes to the file system.
container.changes
# => [{'Path'=>'/dev', 'Kind'=>0}, {'Path'=>'/dev/kmsg', 'Kind'=>1}]

# Copy files/directories from the Container. Note that these are exported as tars.
container.copy('/etc/hosts') { |chunk| puts chunk }

hosts0000644000000000000000000000023412100405636007023 0ustar
127.0.0.1       localhost
::1             localhost ip6-localhost ip6-loopback
fe00::0         ip6-localnet
ff00::0         ip6-mcastprefix
ff02::1         ip6-allnodes
ff02::2         ip6-allrouters
# => Docker::Container { :id => a1759f3e2873, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Wait for the current command to finish executing. If an argument is given,
# will timeout after that number of seconds. The default is one minute.
container.wait(15)
# => {'StatusCode'=>0}

# Attach to the Container. Currently, the below options are the only valid ones.
# By default, :stream, :stdout, and :stderr are set.
container.attach(:stream => true, :stdin => nil, :stdout => true, :stderr => true, :logs => true, :tty => false)
# => [["bin\nboot\ndev\netc\nhome\nlib\nlib64\nmedia\nmnt\nopt\nproc\nroot\nrun\nsbin\nselinux\nsrv\nsys\ntmp\nusr\nvar", []]

# If you wish to stream the attach method, a block may be supplied.
container = Docker::Container.create('Image' => 'base', 'Cmd' => ['find / -name *'])
container.tap(&:start).attach { |stream, chunk| puts "#{stream}: #{chunk}" }
stderr: 2013/10/30 17:16:24 Unable to locate find / -name *
# => [[], ["2013/10/30 17:16:24 Unable to locate find / -name *\n"]]

# If you want to attach to stdin of the container, supply an IO-like object:
container = Docker::Container.create('Image' => 'base', 'Cmd' => ['cat'], 'OpenStdin' => true, 'StdinOnce' => true)
container.tap(&:start).attach(stdin: StringIO.new("foo\nbar\n"))
# => [["foo\nbar\n"], []]

# Similar to the stdout/stderr attach method, there is logs and streaming_logs

# logs will only return after the container has exited. The output will be the raw output from the logs stream.
# streaming_logs will collect the messages out of the multiplexed form and also execute a block on each line that comes in (block takes a stream and a chunk as arguments)

# Raw logs from a TTY-enabled container after exit
container.logs(stdout: true)
# => "\e]0;root@8866c76564e8: /\aroot@8866c76564e8:/# echo 'i\b \bdocker-api'\r\ndocker-api\r\n\e]0;root@8866c76564e8: /\aroot@8866c76564e8:/# exit\r\n"

# Logs from a non-TTY container with multiplex prefix
container.logs(stdout: true)
# => "\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00021\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00022\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00023\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00024\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00025\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00026\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00027\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00028\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u00029\n\u0001\u0000\u0000\u0000\u0000\u0000\u0000\u000310\n"

# Streaming logs from non-TTY container removing multiplex prefix with a block printing out each line (block not possible with Container#logs)
container.streaming_logs(stdout: true) { |stream, chunk| puts "#{stream}: #{chunk}" }
stdout: 1
stdout: 2
stdout: 3
stdout: 4
stdout: 5
stdout: 6
stdout: 7
stdout: 8
stdout: 9
stdout: 10
# => "1\n\n2\n\n3\n\n4\n\n5\n\n6\n\n7\n\n8\n\n9\n\n10\n"

# If the container has TTY enabled, set `tty => true` to get the raw stream:
command = ["bash", "-c", "if [ -t 1 ]; then echo -n \"I'm a TTY!\"; fi"]
container = Docker::Container.create('Image' => 'ubuntu', 'Cmd' => command, 'Tty' => true)
container.tap(&:start).attach(:tty => true)
# => [["I'm a TTY!"], []]

# Obtaining the current statistics of a container
container.stats
# => {"read"=>"2016-02-29T20:47:05.221608695Z", "precpu_stats"=>{"cpu_usage"=> ... }

# Create an Image from a Container's changes.
container.commit
# => Docker::Image { :id => eaeb8d00efdf, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Commit the Container and run a new command. The second argument is the number
# of seconds the Container should wait before stopping its current command.
container.run('pwd', 10)
# => Docker::Image { :id => 4427be4199ac, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Run an Exec instance inside the container and capture its output and exit status
container.exec(['date'])
# => [["Wed Nov 26 11:10:30 CST 2014\n"], [], 0]

# Launch an Exec instance without capturing its output or status
container.exec(['./my_service'], detach: true)
# => Docker::Exec { :id => be4eaeb8d28a, :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Parse the output of an Exec instance
container.exec(['find', '/', '-name *']) { |stream, chunk| puts "#{stream}: #{chunk}" }
stderr: 2013/10/30 17:16:24 Unable to locate find / -name *
# => [[], ["2013/10/30 17:16:24 Unable to locate find / -name *\n"], 1]

# Run an Exec instance by grab only the STDOUT output
container.exec(['date'], stderr: false)
# => [["Wed Nov 26 11:10:30 CST 2014\n"], [], 0]

# Pass input to an Exec instance command via Stdin
container.exec(['cat'], stdin: StringIO.new("foo\nbar\n"))
# => [["foo\nbar\n"], [], 0]

# Get the raw stream of data from an Exec instance
command = ["bash", "-c", "if [ -t 1 ]; then echo -n \"I'm a TTY!\"; fi"]
container.exec(command, tty: true)
# => [["I'm a TTY!"], [], 0]

# Wait for the current command to finish executing. If an argument is given,
# will timeout after that number of seconds. The default is one minute.
command = ["bash", "-c", "if [ -t 1 ]; then echo -n \"Set max seconds for exec!!\"; fi"]
container.exec(command, wait: 120)
# => [["Set max seconds for exec!"], [], 0]

# Delete a Container.
container.delete(:force => true)
# => nil

# Update the container.
container.update("CpuShares" => 50000")

# Request a Container by ID or name.
Docker::Container.get('500f53b25e6e')
# => Docker::Container { :id => , :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }

# Request all of the Containers. By default, will only return the running Containers.
Docker::Container.all(:all => true)
# => [Docker::Container { :id => , :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }]
```

## JSON encoded values

For JSON encoded values, nothing is done implicitly, meaning you need to explicitly call `to_json` on your parameter before the call. For example, to request all of the Containers using a filter:

```ruby
require 'docker'

# Request all of the Containers, filtering by status exited.
Docker::Container.all(all: true, filters: { status: ["exited"] }.to_json)
# => [Docker::Container { :id => , :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }]

# Request all of the Container, filtering by label_name.
Docker::Container.all(all: true, filters: { label: [ "label_name"  ]  }.to_json)
# => [Docker::Container { :id => , :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }]

# Request all of the Container, filtering by label label_name that have the value label_value_.
Docker::Container.all(all: true, filters: { label: [ "label_name=label_value"  ]  }.to_json)
# => [Docker::Container { :id => , :connection => Docker::Connection { :url => tcp://localhost, :options => {:port=>2375} } }]
```

This applies for all parameters that are requested to be JSON encoded by the docker api.

## Events

```ruby
require 'docker'

# Action on a stream of events as they come in
Docker::Event.stream { |event| puts event; break }
Docker::Event { :status => create, :id => aeb8b55726df63bdd69d41e1b2650131d7ce32ca0d2fa5cbc75f24d0df34c7b0, :from => base:latest, :time => 1416958554 }
# => nil

# Action on all events after a given time (will execute the block for all events up till the current time, and wait to execute on any new events after)
Docker::Event.since(1416958763) { |event| puts event; puts Time.now.to_i; break }
Docker::Event { :status => die, :id => 663005cdeb56f50177c395a817dbc8bdcfbdfbdaef329043b409ecb97fb68d7e, :from => base:latest, :time => 1416958764 }
1416959041
# => nil
```

These methods are prone to read timeouts.  `Docker.options[:read_timeout]` will need to be made higher than 60 seconds if expecting a long time between events.

## Connecting to Multiple Servers

By default, each object connects to the connection specified by `Docker.connection`. If you need to connect to multiple servers, you can do so by specifying the connection on `#new` or in the utilizing class method. For example:

```ruby
require 'docker'

Docker::Container.all({}, Docker::Connection.new('tcp://example.com:2375', {}))
```

## Rake Task

To create images through `rake`, a DSL task is provided. For example:


```ruby
require 'rake'
require 'docker'

image 'repo:tag' do
  image = Docker::Image.create('fromImage' => 'repo', 'tag' => 'old_tag')
  image = Docker::Image.run('rm -rf /etc').commit
  image.tag('repo' => 'repo', 'tag' => 'tag')
end

image 'repo:new_tag' => 'repo:tag' do
  image = Docker::Image.create('fromImage' => 'repo', 'tag' => 'tag')
  image = image.insert_local('localPath' => 'some-file.tar.gz', 'outputPath' => '/')
  image.tag('repo' => 'repo', 'tag' => 'new_tag')
end
```

## Not supported (yet)

*   Generating a tarball of images and metadata for a repository specified by a name: https://docs.docker.com/engine/reference/api/docker_remote_api_v1.14/#get-a-tarball-containing-all-images-and-tags-in-a-repository
*   Load a tarball generated from docker that contains all the images and metadata of a repository: https://docs.docker.com/engine/reference/api/docker_remote_api_v1.14/#load-a-tarball-with-a-set-of-images-and-tags-into-docker

License
-----

This program is licensed under the MIT license. See LICENSE for details.
