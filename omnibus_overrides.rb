# THIS IS NOW HAND MANAGED, JUST EDIT THE THING
# .travis.yml and appveyor.yml consume this,
# try to keep it machine-parsable.
#
# NOTE: You MUST update omnibus-software when adding new versions of
# software here: bundle exec rake dependencies:update_omnibus_gemfile_lock
override :rubygems, version: "3.0.3"
override :bundler, version: "1.17.3"
# grab the current train release from rubygems.org
train_stable = /^train \((.*)\)/.match(`gem list ^train$ --remote`)[1]
override "train", version: "v#{train_stable}"
override "ruby", version: "2.6.3"
