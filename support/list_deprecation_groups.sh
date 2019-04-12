#!/bin/bash

fgrep 'Inspec.deprecate' -r lib |cut -f2 -d'(' | cut -f1 -d',' | cut -f1 -d ')' | cut -f2 -d':' | sort -u > inspec-deprecations-in-lib.txt
jq -r '.groups|keys|.[]' < etc/deprecations.json | sort -u > inspec-deprecations-in-cfg.txt

echo '<< Only in cfg'
echo '        >> Only in lib/'
comm -3 inspec-deprecations-in-cfg.txt inspec-deprecations-in-lib.txt