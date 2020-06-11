# Copyright 2010 Dan Wanek <dan.wanek@gmail.com>
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

require 'logging'
require_relative 'winrm/version'
require_relative 'winrm/connection'
require_relative 'winrm/exceptions'

# Main WinRM module entry point
module WinRM
  # Enable logging if it is requested. We do this before
  # anything else so that we can setup the output before
  # any logging occurs.
  if ENV['WINRM_LOG'] && ENV['WINRM_LOG'] != ''
    begin
      Logging.logger.root.level = ENV['WINRM_LOG']
      Logging.logger.root.appenders = Logging.appenders.stderr
    rescue ArgumentError
      # This means that the logging level wasn't valid
      warn "Invalid WINRM_LOG level is set: #{ENV['WINRM_LOG']}"
      warn ''
      warn 'Please use one of the standard log levels: ' \
        'debug, info, warn, or error'
    end
  end
end
