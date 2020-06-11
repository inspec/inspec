
SET url="https://raw.githubusercontent.com/googleapis/google-cloud-ruby/master/.kokoro/trampoline.bat"

SET "download=powershell -C Invoke-WebRequest -Uri %url% -OutFile master-trampoline.bat"

SET EXIT_STATUS=1

%download% && master-trampoline.bat && SET EXIT_STATUS=0

EXIT %EXIT_STATUS%
