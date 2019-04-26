---
title: About the nginx_conf Resource
platform: linux
---

# nginx_conf

Use the `nginx_conf` Chef InSpec resource to test configuration data for the NGINX server located at `/etc/nginx/nginx.conf` on Linux and Unix platforms.

**Stability: Experimental**

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.37.6 of InSpec.

## Syntax

An `nginx_conf` resource block declares the client NGINX configuration data to be tested:

    describe nginx_conf.params['pid'] do
      it { should cmp 'logs/nginx.pid' }
    end

where

* `nginx_conf` is the resource to reference your NGINX configuration
* `params` accesses all its parameters
* `params['pid']` selects the `pid` entry from the global NGINX configuration
* `{ should cmp 'logs/nginx.pid' }` tests if the PID is set to `logs/nginx.pid` (via `cmp` matcher)

<br>

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Find a specific server

    servers = nginx_conf.servers
    domain2 = servers.find { |s| s.params['server_name'].flatten.include? 'domain2.com' }
    describe 'No server serves domain2' do
      subject { domain2 }
      it { should be_nil }
    end

### Test a raw parameter

    describe nginx_conf.params['worker_processes'].flatten do
      it { should cmp 5 }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).

### http

Retrieves all `http` entries in the configuration file.

    nginx_conf.http
    => nginx_conf /etc/nginx/nginx.conf, http entries

It provides further access to all individual entries, servers, and locations.

    nginx_conf.http.entries
    => [nginx_conf /etc/nginx/nginx.conf, http entry ...]

    nginx_conf.http.servers
    => [nginx_conf /etc/nginx/nginx.conf, server entry ...]

    nginx_conf.http.locations
    => [nginx_conf /etc/nginx/nginx.conf, location entry ...]

You can access each of these from the array and inspect it further (see below).

### servers

Retrieve all `servers` entries in the configuration:

    # all servers across all configs aggregated:
    nginx_conf.servers
    => [nginx_conf /etc/nginx/nginx.conf, server entry ...]

    # servers that belong to a specific http entry:
    nginx_conf.http.entries[0].servers
    => [nginx_conf /etc/nginx/nginx.conf, server entry ...]

Servers provide access to all their locations, parent http entry, and raw parameters:

    server = nginx_conf.servers[0]

    server.locations
    => [nginx_conf /etc/nginx/nginx.conf, location entry ...]

    server.parent
    => nginx_conf /etc/nginx/nginx.conf, http entry

    server.params
    => {"listen"=>[["85"]],
       "server_name"=>[["domain1.com", "www.domain1.com"]],
       "root"=>[["html"]],
       "location"=>[{"_"=>["~", "\\.php$"], "fastcgi_pass"=>[["127.0.0.1:1025"]]}]}

### locations

Retrieve all `location` entries in the configuration:

    # all locations across all configs aggregated:
    nginx_conf.locations
    => [nginx_conf /etc/nginx/nginx.conf, location entry ...]

    # locations of a http entry aggregated:
    nginx_conf.http.entries[0].locations
    => [nginx_conf /etc/nginx/nginx.conf, location entry ...]

    # locations of a specific server:
    nginx_conf.servers[0].locations
    => [nginx_conf /etc/nginx/nginx.conf, location entry ...]

Locations provide access to their parent server entry and raw parameters:

    location = nginx_conf.locations[0]

    location.parent
    => nginx_conf /etc/nginx/nginx.conf, server entry

    location.params
    => {"_"=>["~", "\\.php$"], "fastcgi_pass"=>[["127.0.0.1:1025"]]}

### configuration file path

If the NGINX configuration file is not located at the default path, `/etc/nginx/nginx.conf`, the path can specified as the first parameter of the describe block:

    describe nginx_conf('/opt/nginx/nginx.conf').params['pid'] do
      it { should cmp 'logs/nginx.pid' }
    end


