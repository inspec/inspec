# encoding: utf-8
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

begin
  require 'github_changelog_generator/task'
  require 'mixlib/install'

  namespace :changelog do
    GitHubChangelogGenerator::RakeTask.new :update do |config|
      # Get the version from the "to" environment variable first (as used in the
      # bump_version Rake task). If it doesn't exist, use Inspec::VERSION. We can't rely
      # on Inspec::VERSION because we may have already "require'd" Inspec by the time
      # we've gotten here and the version has been bumped with bump_version.
      config.future_release = ENV.fetch('to', "v#{Inspec::VERSION}")

      # only generate changelog records for pull requests merged since v1.20.0
      # which is the version we started tagging PRs for.
      config.since_tag = 'v1.20.0'

      # do not include any issues
      config.max_issues = 0
      config.add_issues_wo_labels = false

      # Group PRs by section accordingly
      config.enhancement_labels = ['enhancement', 'feature request', 'new feature']
      config.bug_labels = ['bug']
      config.exclude_labels = ['docs', 'duplicate', 'invalid', 'question', 'wontfix', 'www', 'Exclude From Changelog']
    end
  end

  task changelog: 'changelog:update'
rescue LoadError
  puts 'github_changelog_generator is not available.'
end
