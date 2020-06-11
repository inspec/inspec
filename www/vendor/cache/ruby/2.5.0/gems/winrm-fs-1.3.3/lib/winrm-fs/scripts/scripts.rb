# frozen_string_literal: true

#
# Copyright 2015 Shawn Neal <sneal@sneal.net>
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

require 'erubi'

module WinRM
  module FS
    # PS1 scripts
    module Scripts
      # rubocop:disable Metrics/MethodLength
      def self.render(template, context)
        # rubocop:enable Metrics/MethodLength
        template_path = File.expand_path(
          "#{File.dirname(__FILE__)}/#{template}.ps1.erb"
        )
        template = File.read(template_path)
        case context
        when Hash
          b = binding
          locals = context.collect { |k, _| "#{k} = context[#{k.inspect}]; " }
          b.eval(locals.join)
        when Binding
          b = context
        when NilClass
          b = binding
        else
          raise ArgumentError
        end
        b.eval(Erubi::Engine.new(template).src)
      end
    end
  end
end
