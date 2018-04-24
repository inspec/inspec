#!/bin/bash

bundle exec inspec --version
bundle exec inspec exec profile-01 --reporter json > profile-01.json 2> profile-01.err
INSPEC_EXIT_CODE=$?
if [ "$INSPEC_EXIT_CODE" -ne "100" ]; then
  echo "inspec returned unexpected error code: $INSPEC_EXIT_CODE"
  exit 1
fi

CONTROL_COUNT=$(jq '.profiles[0].controls | length' < profile-01.json)
if [ "$CONTROL_COUNT" -ne "10" ]; then
  echo "expected 10 controls, saw $CONTROL_COUNT"
  exit 1
fi

echo "Regression test successful."

rm profile-01.err profile-01.json