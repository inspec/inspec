---
title: About the aws_route_tables Resource
---

# aws_route_table

Use the `aws_route_tables` InSpec audit resource to test properties of all or a group of Route Tables. A route table contains a set of rules, called routes, that are used to determine where network traffic is directed.

<br>

## Syntax

  # Ensure that there is atleast one route table
  describe aws_route_tables do
    it { should exist }
  end

## Matchers

### exist

Indicates that the Route Table provided was found.  Use should_not to test for Route Tables that should not exist.

    describe aws_route_tables do
      it { should exist }
    end

    describe aws_route_tables do
      it { should_not exist }
    end

## Properties

### vpc_ids

Lists all VPCs that are in the Route Tables.

    describe aws_route_tables do
      its('vpc_ids') { should eq '' }
    end


### route_table_ids

Lists all of the Route Table IDs.

    describe aws_route_tables do
      its('route_table_ids') { should eq [] }
    end
