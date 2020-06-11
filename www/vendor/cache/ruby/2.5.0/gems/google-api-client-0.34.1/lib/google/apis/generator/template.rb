# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'active_support/inflector'
require 'erb'
require 'ostruct'

module Google
  module Apis
    # @private
    class Generator
      # Directory containing ERB templates
      TEMPLATE_DIR = File.expand_path('../templates', __FILE__)

      # Helpers used in ERB templates
      module TemplateHelpers
        # Get the include path for a ruby module/class
        #
        # @param [String] module_name
        #  Fully qualified module/class name
        # @return [String]
        #  Path to file
        def to_path(module_name)
          ActiveSupport::Inflector.underscore(module_name)
        end

        # Render a block comment
        #
        # @param [String] str
        #  Comment string
        # @param [Fixnum] spaces_before
        #  Number of spaces to indent the comment hash
        # @param [Fixnum] spaces_after
        #  Number of spaces to indent after the comment hash for subsequent lines
        # @return [String] formatted comment
        def block_comment(str, spaces_before = 0, spaces_after = 0)
          return '' if str.nil?
          pre = ' ' * spaces_before
          post = ' ' * spaces_after
          lines = str.gsub(/([{}])/, '`').scan(/.{1,78}(?:\W|$)/).map(&:strip)
          lines.join("\n" + pre + '#' + post)
        end

        # Indent a block of text
        #
        # @param [String] str
        #  Content to indent
        # @param [Fixnum] spaces
        #  Number of spaces to indent
        # @return [String] formatted content
        def indent(str, spaces)
          pre = ' ' * spaces
          str = pre + str.split(/\n/).join("\n" + pre) + "\n"
          return str unless str.strip.empty?
          nil
        end

        # Include a partial inside a template.
        #
        # @private
        # @param [String] partial
        #  Name of the template
        # @param [Hash] context
        #  Context used to render
        # @return [String] rendered content
        def include(partial, context)
          template = Template.new(sprintf('_%s.tmpl', partial))
          template.render(context)
        end
      end

      # Holds local vars/helpers for template rendering
      class Context < OpenStruct
        include TemplateHelpers

        # Get the context for ERB evaluation
        # @return [Binding]
        def to_binding
          binding
        end
      end

      # ERB template for the code generator
      class Template
        # Loads a template from the template dir. Automatically
        # appends the .tmpl suffix
        #
        # @param [String] template_name
        #  Name of the template file
        def self.load(template_name)
          Template.new(sprintf('%s.tmpl', template_name))
        end

        # @param [String] template_name
        #  Name of the template file
        def initialize(template_name)
          file = File.join(TEMPLATE_DIR, template_name)
          @erb = ERB.new(File.read(file), nil, '-')
        end

        # Render the template
        #
        # @param [Hash] context
        #  Variables to set when rendering the template
        # @return [String] rendered template
        def render(context)
          ctx = Context.new(context)
          @erb.result(ctx.to_binding)
        end
      end
    end
  end
end
