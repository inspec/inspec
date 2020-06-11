# Copyright 2015, Google Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
#
#     * Redistributions of source code must retain the above copyright
# notice, this list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above
# copyright notice, this list of conditions and the following disclaimer
# in the documentation and/or other materials provided with the
# distribution.
#     * Neither the name of Google Inc. nor the names of its
# contributors may be used to endorse or promote products derived from
# this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

spec_dir = __dir__
root_dir = File.expand_path File.join(spec_dir, "..")
lib_dir = File.expand_path File.join(root_dir, "lib")

$LOAD_PATH.unshift spec_dir
$LOAD_PATH.unshift lib_dir
$LOAD_PATH.uniq!

# set up coverage
require "simplecov"
require "coveralls"

SimpleCov.formatters = [
  Coveralls::SimpleCov::Formatter,
  SimpleCov::Formatter::HTMLFormatter
]
SimpleCov.start

require "faraday"
require "rspec"
require "logging"
require "rspec/logging_helper"
require "webmock/rspec"
require "multi_json"

# Preload adapter to work around Rubinius error with FakeFS
MultiJson.use :json_gem

# Allow Faraday to support test stubs
Faraday::Adapter.load_middleware :test

# Configure RSpec to capture log messages for each test. The output from the
# logs will be stored in the @log_output variable. It is a StringIO instance.
RSpec.configure do |config|
  include RSpec::LoggingHelper
  config.capture_log_messages
  config.include WebMock::API
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true
end

module TestHelpers
  include WebMock::API
  include WebMock::Matchers
end

class DummyTokenStore
  def initialize
    @tokens = {}
  end

  def load id
    @tokens[id]
  end

  def store id, token
    @tokens[id] = token
  end

  def delete id
    @tokens.delete id
  end
end
