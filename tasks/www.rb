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

require_relative 'shared.rb'

namespace :www do
  desc 'Builds the tutorial contents'
  task :tutorial do
    Log.section 'Build the online tutorial in www/tutorial/'
    sh('cd www/tutorial/ && npm install')
    sh('cd www/tutorial/ && gulp build')
    Verify.file('www/tutorial/dist/index.html')
    Verify.file('www/tutorial/dist/css/inspec_tutorial.css')
    Verify.file('www/tutorial/dist/scripts/inspec_tutorial.js')
    Verify.file('www/tutorial/dist/dist/inspec_tutorial.js')
  end

  desc 'Builds the middleman site'
  task :site do
    Log.section 'Build middleman project in www/'
    Bundler.with_clean_env {
      sh('cd www/ && bundle install && bundle exec middleman build')
    }
    Verify.file('www/build/index.html')
    Verify.file('www/build/javascripts/all.js')
    Verify.file('www/build/stylesheets/site.css')
  end

  desc 'Assemble the website site from middleman and the tutorial'
  task :assemble do
    Log.section 'Copy only tutorial into middleman build directory'
    sh('rsync -a --exclude=index.html www/tutorial/dist/* www/build/')
    sh('cp www/tutorial/dist/index.html www/build/tutorial.html')
  end

  desc 'Builds the full site locally'
  task build: ['www:tutorial', 'www:site', 'www:assemble']

  task :clean do
    dst = 'www/build'
    FileUtils.rm_rf(dst) if File.directory?(dst)
  end

  desc 'Releases the site to gh-pages'
  task :release do
    # This folder contains the built files
    dst = 'www/build'
    unless File.directory?(dst) && File.file?(File.join(dst, 'index.html'))
      puts 'It looks like you have not built the site yet. Calling rake www:build'
      Rake::Task['www:build'].invoke
    end

    unless File.directory?(dst) && File.file?(File.join(dst, 'index.html'))
      raise 'It looks like the site was not build. Aborting.'
    end

    # check if git exists
    sh('command -v git >/dev/null 2>&1') ||
      raise("It looks like `git` isn't installed. It is required to run this build task.")

    unless sh('git diff-index --quiet HEAD --')
      raise 'Please make sure you have no uncommitted changes in this repository.'
    end

    File.write('www/build/CNAME', 'inspec.io')
    file_count = Dir['www/build/*'].length
    file_size = `du -hs www/build`.sub(/\s+.*$/m, '')

    if system('git rev-parse --verify gh-pages')
      Log.info 'Remove local gh-pages branch'
      sh('git branch -D gh-pages')
    end

    current_branch = `git rev-parse --abbrev-ref HEAD`.strip
    if current_branch.empty?
      raise 'Cannot determine current branch to go back to! Aborting.'
    end

    Log.info 'Create empty gh-pages branch'
    sh('git checkout --orphan gh-pages')

    Log.info 'Clear out all local git files!'
    sh('git rm -rf .')

    Log.info "Add the built files in #{dst}"
    sh("git add #{dst}")

    Log.info 'Remove all other files in this empty branch'
    sh('git clean -df')

    Log.info 'Move the site to the root directory'
    sh("git mv #{File.join(dst, '*')} .")

    Log.info 'Commit to gh-pages'
    sh("git commit -m 'website update'")

    require 'inquirer'
    if Ask.confirm("Ready to go, I have #{file_count} files at #{file_size}. "\
                   'Do you want to push this live?', default: false)
      Log.info 'push to origin, this may take a moment'
      sh('git push -u origin --force-with-lease gh-pages')
    else
      puts 'Aborted.'
    end

    sh("git checkout #{current_branch}")
  end
end

task :www do
  Rake::Task['www:clean'].invoke
  Rake::Task['docs'].invoke
  Rake::Task['www:build'].invoke
  Rake::Task['www:release'].invoke
end
