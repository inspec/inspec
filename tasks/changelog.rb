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
    # Fetch the latest version from mixlib-install
    latest_stable_version = Mixlib::Install.available_versions('inspec', 'stable').last

    # Run this to just update the changelog for the current release. This will
    # take what is in HISTORY and generate a changelog of PRs between the most
    # recent stable version and HEAD.
    GitHubChangelogGenerator::RakeTask.new :update do |config|
      # Get the version from the "to" environment variable first (as used in the
      # bump_version Rake task). If it doesn't exist, use Inspec::VERSION. We can't rely
      # on Inspec::VERSION because we may have already "require'd" Inspec by the time
      # we've gotten here and the version has been bumped with bump_version.
      config.future_release = ENV.fetch('to', "v#{Inspec::VERSION}")

      # only generate changelog records for pull requests merged since the last stable
      # release.
      config.since_tag = "v#{latest_stable_version}"

      # there's a bug that's preventing the compare link to use the last tag instead
      # of a REALLY old tag, so we have to disable it for now. I'll re-enable it once
      # I get that fixed
      config.compare_link = false

      # do not include any issues
      config.max_issues = 0
      config.add_issues_wo_labels = false

      # Group PRs by section accordingly
      config.enhancement_labels = ['enhancement', 'feature request', 'new feature']
      config.bug_labels = ['bug']
      config.exclude_labels = ['docs', 'duplicate', 'invalid', 'question', 'wontfix', 'www', 'Exclude From Changelog']
    end
  end

  task :changelog do
    # Move the existing changelog to a history file that will get picked up by
    # the github-changelog-generator. This will allow us to generate a changelog
    # that only includes items since the last stable tag, and then we'll append
    # it to the current changelog. This will avoid any massive changes to the
    # existing changelog and preserve its history without having an "old" and
    # "current" changelog file.
    current_changelog = File.read('CHANGELOG.md').chomp.split("\n")
    File.open('HISTORY.md', 'w+') { |f| f.write(current_changelog[2..-4].join("\n")) }

    # generate the Changelog
    Rake::Task['changelog:update'].invoke

    # delete the HISTORY.md file
    File.delete('HISTORY.md')
  end
rescue LoadError
  puts 'github_changelog_generator is not available.'
end
