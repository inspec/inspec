@ECHO OFF

REM ; Set GEM_HOME and GEM_PATH to verify our appbundle inspec shim is correctly
REM ; removing them from the environment while launching from our embedded ruby.
SET GEM_HOME=C:\SHOULD_NOT_EXIST
SET GEM_PATH=C:\SHOULD_NOT_EXIST

cd C:\opscode\inspec\bin
inspec version
