# Copyright:: Copyright (c) 2015 Chef Software, Inc.
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
#

module Log
  def self.section(msg)
    puts "\n\033[36;1m====> #{msg}\033[0m"
  end

  def self.info(msg)
    puts "\033[32;1m----> #{msg}\033[0m"
  end
end

module Verify
  def self.file(path)
    return print("\033[32m.\033[0m") if File.file?(path)

    raise "Failed to build this step. Looking for file in #{path} but it doesn't exist."
  end

  def self.ok
    puts "\n\033[32mAll build checks passed.\033[0m"
  end
end
