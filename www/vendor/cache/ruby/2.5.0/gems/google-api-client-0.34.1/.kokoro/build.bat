REM This file runs tests for merges, PRs, and nightlies.

SET url="https://raw.githubusercontent.com/googleapis/google-cloud-ruby/master/.kokoro/build.bat"

SET "download=powershell -C Invoke-WebRequest -Uri %url% -OutFile master-build.bat"

SET EXIT_STATUS=1

%download% && master-build.bat && SET EXIT_STATUS=0

EXIT %EXIT_STATUS%
