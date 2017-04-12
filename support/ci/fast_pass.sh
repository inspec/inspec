#!/bin/bash
#
# Check to see what directories have been affected by a change. If directories
# have not been affected, exit 0
#
# Since we can only stop the build early by calling "exit" from within the
# .travis.yml in the `before_install`, we exit non-zero if we want the build to
# be skipped, so we can do `|| exit 0` in the YAML.

echo "TAG: $TRAVIS_TAG"
echo "PR: $TRAVIS_PULL_REQUEST"
echo "COMMIT_RANGE: $TRAVIS_COMMIT_RANGE"

if [ -n "$STEAM_ROLLER" ]; then
  echo 'STEAM_ROLLER is set. Not exiting and running everything.'
elif [ -z "$AFFECTED_DIRS" ]; then
  # Don't do anything if $AFFECTED_DIRS is not set
  echo 'AFFECTED_DIRS is not set. Not exiting and running everything.'
else
  # If $AFFECTED_DIRS (a "|" separated list of directories) is set, see if we have
  # any changes

  # TRAVIS_COMMIT_RANGE is empty for the first push to a new branch (which is how our bot
  # validates before merge), so if TRAVIS_COMMIT_RANGE is empty, we'll look for the
  # last merge commit and check from there.
  COMMIT_RANGE=${TRAVIS_COMMIT_RANGE:-$(git show :/^Merge --pretty=format:%H)}
  git diff --name-only "$COMMIT_RANGE" | grep -qE "^($AFFECTED_DIRS)" || {
    echo "No files in $AFFECTED_DIRS have changed. Skipping CI run."
    exit 1
  }
fi
