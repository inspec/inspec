---
title: About the Elasticsearch Resource
platform: linux
---

# elasticsearch

Use the  `elasticsearch` resource to test the status of a node against a running
Elasticsearch cluster. Chef InSpec retrieves the node list from the cluster node URL
provided (defaults to `http://localhost:9200`) and provides the ability to query
a variety of settings and statuses.

<br>

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.43.5 of InSpec.

## Syntax

    describe elasticsearch do
      its('property') { should cmp 'value' }
    end

<br>

## Supported Resource parameters

The `elasticsearch` resource accepts a number of optional resource parameters:

 * `url`: the top-level URL of an Elasticsearch node in the cluster. If your Elasticsearch installation is not served out of the top-level directory at the host, be sure to specific the full URL; for example: `http://my-load-balancer/elasticsearch`. Default: `http://localhost:9200`
 * `username`: a username to use to log in with HTTP-Basic authentication. If `username` is provided, a `password` must also be provided.
 * `password`: a password to use to log in with HTTP-Basic authentication. If `password` is provided, a `username` must also be provided.
 * `ssl_verify`: if `false`, SSL certificate validation will be disabled. Default: `true`

In addition, the `elasticsearch` resource allows for filtering the nodes returned by property before executing the tests:

    describe elasticsearch.where { node_name == 'one-off-node' } do
      its('version') { should eq '1.2.3' }
    end

    describe elasticsearch.where { process.mlockall == false } do
      its('count') { should cmp 0 }
    end

To simply check if nodes exist that match the criteria, use the `exist` matcher:

    describe elasticsearch.where { cluster_name == 'my_cluster' } do
      it { should exist }
    end

<br>

## Properties

The following properties are provided:

* build\_hash cluster\_name, host, http, ingest, ip, jvm, module\_list, modules, node\_name, node\_id, os, plugin\_list, plugins, process, roles, settings, total\_indexing\_buffer, transport, transport\_address, version

Since the `elasticsearch` resource is meant for use on a cluster, each property will return an array of the values for each node that matches any provided search criteria. Using InSpec's `cmp` matcher helps avoid issues when comparing values when there is only a single match (i.e. when the cluster only contains a single node, or the `where` filter criteria provided only returns a single node).

<br>

## Property Examples

### build_hash

Returns the build hash for each of the nodes.

    describe elasticsearch do
      its('build_hash') { should cmp 'b2f0c09' }
    end

### cluster_name

Returns the cluster names of each of the nodes.

    describe elasticsearch do
      its('cluster_name') { should cmp 'my_cluster' }
    end

### host

Returns the hostname of each of the nodes. This may return an IP address, if the node is improperly performing DNS resolution or has no hostname set.

    describe elasticsearch do
      its('host') { should cmp 'my.hostname.mycompany.biz' }
    end

### http

Returns a hash of HTTP-related settings for each of the nodes. In this example, the `first` method is used to grab only the first node's HTTP-related info and is a way of removing the item from the Array if only one node is being queried.

    describe elasticsearch do
      its('http.first.max_content_length_in_bytes') { should cmp 123456 }
    end

### ingest

Returns ingest-related settings and capabilities, such as available processors.

    describe elasticsearch do
      its('ingest.first.processors.count') { should be >= 1 }
    end

### ip

Returns the IP address of each of the nodes.

    describe elasticsearch do
      its('ip') { should cmp '192.168.1.100' }
    end

### jvm

Returns Java Virtual Machine related parameters for each of the nodes.

    describe elasticsearch do
      its('jvm.first.version') { should cmp '1.8.0_141' }
    end

### module_list

Returns a list of enabled modules for each node in the cluster. For more additional information about each module, use the `modules` property.

    describe elasticsearch do
      its('module_list.first') { should include 'my_module' }
    end

### modules

Returns detailed information about each enabled module for each node in the cluster. For a succinct list of the names of each of the modules enabled, use the `module_list` property. This example uses additional Ruby to find a specific module and assert a value.

    modules = elasticsearch.modules.first
    lang_groovy_module = modules.find { |mod| mod.name == 'lang-groovy' }

    describe 'lang-groovy module version' do
      subject { lang_groovy_module }
      its('version') { should cmp '5.5.2' }
    end

### node_name

Returns the node name for each node in the cluster.

    describe elasticsearch do
      its('node_name') { should cmp 'node1' }
    end

### node_id

Returns the node IDs of each of the nodes in the cluster.

    describe elasticsearch do
      its('node_id') { should include 'my_node_id' }
    end

### os

Returns OS-related information about each node in the cluster.

    describe elasticsearch do
      its('os.first.arch') { should cmp 'amd64' }
    end

### plugin_list

Returns a list of enabled plugins for each node in the cluster. For more additional information about each plugin, use the `plugins` property.

    describe elasticsearch do
      its('plugin_list.first') { should include 'my_plugin' }
    end

### plugins

Returns detailed information about each enabled plugin for each node in the cluster. For a succinct list of the names of each of the plugins enabled, use the `plugin_list` property. This example uses additional Ruby to find a specific plugin and assert a value.

    plugins = elasticsearch.plugins.first
    my_plugin = plugins.find { |plugin| plugin.name == 'my_plugin' }

    describe 'my_plugin plugin version' do
      subject { my_plugin }
      its('version') { should cmp '1.2.3' }
    end

### process

Returns process information for each node in the cluster, such as the process ID.

    describe elasticsearch do
      its('process.first.mlockall') { should cmp true }
    end

### roles

Returns the role for each of the nodes in the cluster.

    describe elasticsearch.where { node_name == 'my_master_node' } do
      it { should include 'master' }
    end

### settings

Returns all the configuration settings for each node in the cluster. These settings usually include those set in the elasticsearch.yml as well as those set via `-Des.` or `-E` flags at startup. Use the `inspec shell` to explore the various setting keys that are available.

    describe elasticsearch do
      its('settings.first.path.home') { should cmp '/usr/share/elasticsearch' }
    end

### total_indexing_buffer

Returns the total indexing buffer for each node in the cluster.

    describe elasticsearch do
      its('total_indexing_buffer') { should cmp 123456 }
    end

### transport

Returns transport-related settings for each node in the cluster, such as the bound and published addresses.

    describe elasticsearch do
      its('transport.first.bound_address') { should cmp '1.2.3.4:9200' }
    end

### transport_address

Returns the bound transport address for each node in the cluster.

    describe elasticsearch do
      its('transport_address') { should cmp '1.2.3.4:9200' }
    end

### version

Returns the version of Elasticsearch running on each node of the cluster.

    describe elasticsearch do
      its('version') { should cmp '5.5.2' }
    end

<br>

## Matchers

For a full list of available matchers, please visit our [matchers page](https://www.inspec.io/docs/reference/matchers/).
