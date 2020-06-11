REM This file runs tests for merges, PRs, and nightlies.
REM There are a few rules for what tests are run:
REM  * PRs run all non-acceptance tests for every library.
REM  * Merges run all non-acceptance tests for every library, and acceptance tests for all altered libraries.
REM  * Nightlies run all acceptance tests for every library.
REM Currently only runs tests on 2.5.1

SET url="https://raw.githubusercontent.com/googleapis/google-cloud-ruby/master/.kokoro/build.bat"

SET "download=powershell -C Invoke-WebRequest -Uri %url% -OutFile master-build.bat"

SET EXIT_STATUS=1

%download% && master-build.bat && SET EXIT_STATUS=0

EXIT %EXIT_STATUS%
