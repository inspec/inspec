#
# Copyright:: Copyright (c) 2018 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require_relative "logging"

module Mixlib
  module Log
    class Child
      include Mixlib::Log::Logging

      attr_reader :parent
      attr_accessor :metadata
      def initialize(parent, metadata = {})
        @parent = parent
        @metadata = metadata
      end

      def level
        parent.level
      end

      # Define the methods to interrogate the logger for the current log level.
      # Note that we *only* query the default logger (@logger) and not any other
      # loggers that may have been added, even though it is possible to configure
      # two (or more) loggers at different log levels.
      %i{trace? debug? info? warn? error? fatal?}.each do |method_name|
        define_method(method_name) do
          parent.send(method_name)
        end
      end

      def add(severity, message = nil, progname = nil, data: {}, &block)
        data = metadata.merge(data) if data.is_a?(Hash)
        parent.send(:pass, severity, message, progname, data: data, &block)
      end

      def with_child(metadata = {})
        child = Child.new(self, metadata)
        if block_given?
          yield child
        else
          child
        end
      end

    end
  end
end
