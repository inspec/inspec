+++
title = "rabbitmq_config resource"
draft = false
gh_repo = "inspec"
platform = "linux"

[menu]
  [menu.inspec]
    title = "rabbitmq_config"
    identifier = "inspec/resources/os/rabbitmq_config.md rabbitmq_config resource"
    parent = "inspec/resources/os"
+++

Use the `rabbitmq_config` Chef InSpec audit resource to test configuration data for the RabbitMQ daemon located at `/etc/rabbitmq/rabbitmq.config` on Linux and Unix platforms.

## Availability

### Installation

This resource is distributed along with Chef InSpec itself. You can use it automatically.

### Version

This resource first became available in v1.20.0 of InSpec.

## Syntax

A `rabbitmq_config` resource block declares the RabbitMQ configuration data to be tested:

    describe rabbitmq_config.params('rabbit', 'ssl_listeners') do
      it { should cmp 5671 }
    end

where

- `params` is the list of parameters configured in the RabbitMQ config file
- `{ should cmp 5671 }` tests the value of `rabbit.ssl_listeners` as read from `rabbitmq.config` versus the value declared in the test

## Examples

The following examples show how to use this Chef InSpec audit resource.

### Test the list of TCP listeners

    describe rabbitmq_config.params('rabbit', 'tcp_listeners') do
      it { should eq [5672] }
    end

## Matchers

For a full list of available matchers, please visit our [matchers page](/inspec/matchers/).
