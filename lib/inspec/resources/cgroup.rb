require "inspec/resources/command"
module Inspec::Resources
  class Cgroup < Inspec.resource(1)
    name "cgroup"
    # Restrict to only run on the below platform
    supports platform: "linux"
    desc "Use the cgroup InSpec audit resource to test cgroup subsytem's parameters."

    example <<~EXAMPLE
      describe cgroup("foo") do
        its("cpuset.cpus") { should eq 0 }
        its("memory.limit_in_bytes") { should eq 499712 }
        its("memory.limit_in_bytes") { should be <= 500000 }
        its("memory.numa_stat") { should match /total=0/ }
      end
    EXAMPLE

    # Resource initialization.
    def initialize(cgroup_name)
      raise Inspec::Exceptions::ResourceSkipped, "The `cgroup` resource is not supported on your OS yet." unless inspec.os.linux?

      @cgroup_name = cgroup_name
      @valid_queries, @valid_queries_split = [], []
      find_valid_queries
      # Used to track the method calls in an "its" query
      @cgroup_info_query = []
    end

    def resource_id
      @cgroup_name
    end

    def to_s
      "cgroup #{resource_id}"
    end

    def method_missing(param)
      # Add the latest param we've seen to the list and form the query with all the params we've seen so far.
      @cgroup_info_query << param.to_s
      query = @cgroup_info_query.join(".")

      # The ith level param must match with atleast one row's ith column of @valid_queries_split
      # Else there is no way, we would find any valid query in further iteration, so raise exception.
      if @valid_queries_split.map { |e| e[@cgroup_info_query.length - 1] }.include?(param.to_s)
        # If the query form so far is part of @valid_queries, we are good to trigger find_cgroup_info
        # else go for next level of param
        if @valid_queries.include?(query)
          @cgroup_info_query = []
          find_cgroup_info(query)
        else
          self
        end
      else
        @cgroup_info_query = []

        raise Inspec::Exceptions::ResourceFailed, "The query #{query} does not appear to be valid."
      end
    end

    private

    # Method to find cgget tool
    def find_cgget_or_error
      %w{/usr/sbin/cgget /sbin/cgget cgget}.each do |cmd|
        return cmd if inspec.command(cmd).exist?
      end

      raise Inspec::Exceptions::ResourceFailed, "Could not find `cgget`"
    end

    # find the cgroup info of the query which is given as input by the user
    def find_cgroup_info(query)
      bin = find_cgget_or_error
      cgget_cmd = "#{bin} -n -r #{query} #{@cgroup_name}"
      cmd = inspec.command(cgget_cmd)

      raise Inspec::Exceptions::ResourceFailed, "Executing cgget failed: #{cmd.stderr}" if cmd.exit_status.to_i != 0

      # For complex returns the user must use match /the_regex/
      param_value = cmd.stdout.split(":")
      return nil if param_value.nil? || param_value.empty?

      param_value = param_value[1].strip.split("\t").join
      param_value.match(/^\d+$/) ? param_value.to_i : param_value
    end

    # find all the information about all relevant controllers for the current cgroup
    def find_valid_queries
      bin = find_cgget_or_error
      cgget_all_cmd = "#{bin} -n -a #{@cgroup_name}"
      cmd = inspec.command(cgget_all_cmd)

      raise Inspec::Exceptions::ResourceFailed, "Executing cgget failed: #{cmd.stderr}" if cmd.exit_status.to_i != 0

      queries = cmd.stdout.to_s.gsub(/:.*/, "").gsub(/^\s+.*/, "").split("\n")
      # store the relevant controller parameters in @valid_queries and the dot splitted paramters into @valid_queries_split
      @valid_queries = queries.map { |q| q if q.length > 0 }.compact
      @valid_queries_split = @valid_queries.map { |q| q.split(".") }.compact
    end
  end
end
