+++
title = "elasticsearch resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "elasticsearch"
    identifier = "inspec/resources/os/elasticsearch.md elasticsearch resource"
    parent = "inspec/resources/os"
+++

Use the `elasticsearch` resource to test the status of a node against a running
Elasticsearch cluster. Chef InSpec retrieves the node list from the cluster node URL
provided (defaults to `http://localhost:9200`) and provides the ability to query
a variety of settings and statuses.

## Availability

### Installation

{{% inspec/inspec_installation %}}

### Version

This resource first became available in v1.43.5 of InSpec.

## Syntax

    describe elasticsearch do
      its('property') { should cmp 'value' }
    end

## Supported Resource Parameters

The `elasticsearch` resource accepts several optional resource parameters:

`url`
: the top-level URL of an Elasticsearch node in the cluster. If your Elasticsearch installation is not served out of the top-level directory at the host, be sure to specify the full URL; for example: `http://my-load-balancer/elasticsearch`. Default: `http://localhost:9200`

`username`
: a username to use to log in with HTTP-Basic authentication. If `username` is provided, a `password` must also be provided.

`password`
: a password to use to log in with HTTP-Basic authentication. If `password` is provided, a `username` must also be provided.

`ssl_verify`
: if `false`, SSL certificate validation will be disabled. Default: `true`

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

## Properties

The following are the different properties of the resource:

Since the `elasticsearch` resource is meant for use on a cluster, each property will return an array of the values for each node that matches any provided search criteria. Using InSpec's `cmp` matcher helps avoid issues when comparing values when there is only a single match (i.e. when the cluster only contains a single node or the `where` filter criteria provided only returns a single node).

### build_hash

The `build hash` property returns the build hash for each of the nodes.

    its('build_hash') { should cmp 'b2f0c09' }

### cluster_name

The `cluster_name` property returns the cluster names of each of the nodes.

    its('cluster_name') { should cmp 'my_cluster' }

### host

The `host` property returns the hostname of each of the nodes. This may return an IP address if the node is improperly performing DNS resolution or has no hostname set.

    its('host') { should cmp 'my.hostname.mycompany.biz' }

### http

The `http` property returns a hash of HTTP-related settings for each of the nodes. In this example, the `first` method is used to grab only the first node's HTTP-related info and is a way of removing the item from the Array if only one node is being queried.

    its('http.first.max_content_length_in_bytes') { should cmp 123456 }

### ingest

The `ingest` property returns ingest-related settings and capabilities, such as available processors.

    its('ingest.first.processors.count') { should be >= 1 }

### ip

The `ip` property returns the IP address of each of the nodes.

    its('ip') { should cmp '192.168.1.100' }

### jvm

The `jvm` property returns Java Virtual Machine related parameters for each of the nodes.

    its('jvm.first.version') { should cmp '1.8.0_141' }

### module_list

The `module_list` property returns a list of enabled modules for each node in the cluster.

    its('module_list.first') { should include 'my_module' }

### modules

The `modules` property returns detailed information about each enabled module for each node in the cluster.

    its('modules.first') { should include 'lang-groovy' }

### node_name

The `node_name` property returns the node name for each node in the cluster.

    its('node_name') { should cmp 'node1' }

### node_id

The `node_id` property returns the node IDs of each of the nodes in the cluster.

    its('node_id') { should include 'my_node_id' }

### os

The `os` property returns OS-related information about each node in the cluster.

    its('os.first.arch') { should cmp 'amd64' }

### plugin_list

The `plugin_list` property returns a list of enabled plugins for each node in the cluster. For more additional information about each plugin, use the `plugins` property.

    its('plugin_list.first') { should include 'my_plugin' }

### plugins

The `plugins` property returns detailed information about each enabled plugin for each node in the cluster.

    its('plugins.first') { should include 'my_plugin' }

### process

The `process` property returns process information for each node in the cluster, such as the process ID.

    its('process.first.mlockall') { should cmp true }

### roles

The `roles` property returns the role for each of the nodes in the cluster.

    its('roles') { should include 'master' }

### settings

The `settings` property returns all the configuration settings for each node in the cluster. These settings usually include those set in the elasticsearch.yml as well as those set via `-Des.` or `-E` flags at startup. Use the `inspec shell` to explore the various setting keys that are available.

    its('settings.first.path.home') { should cmp '/usr/share/elasticsearch' }

### total_indexing_buffer

The `total_indexing_buffer` property returns the total indexing buffer for each node in the cluster.

    its('total_indexing_buffer') { should cmp 123456 }

### transport

The `transport` property returns transport-related settings for each node in the cluster, such as the bound and published addresses.

    its('transport.first.bound_address') { should cmp '1.2.3.4:9200' }

### transport_address

The `transport_address` property returns the bound transport address for each node in the cluster.

    its('transport_address') { should cmp '1.2.3.4:9200' }

### version

The `version` property returns the version of Elasticsearch running on each node of the cluster.

    its('version') { should cmp '5.5.2' }

## Examples

### Test to verify the specific module. Uses additional Ruby to find a specific module and assert a value. For a succinct list of the names of each of the modules enabled, use the `module_list` property.

    modules = elasticsearch.modules.first
    lang_groovy_module = modules.find { |mod| mod.name == 'lang-groovy' }

    describe 'lang-groovy module version' do
      subject { lang_groovy_module }
      its('version') { should cmp '5.5.2' }
    end

### Tests to verify the specific plugin. Uses additional Ruby to find a specific plugin and assert a value. For a succinct list of the names of each of the plugins enabled, use the `plugin_list` property.

    plugins = elasticsearch.plugins.first
    my_plugin = plugins.find { |plugin| plugin.name == 'my_plugin' }

    describe 'my_plugin plugin version' do
      subject { my_plugin }
      its('version') { should cmp '1.2.3' }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
