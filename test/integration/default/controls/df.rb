# encoding: utf-8
#
if ENV['DOCKER']
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are running in docker\033[0m"
  return
end

if os.windows?
  STDERR.puts "\033[1;33mTODO: Not running #{__FILE__.split("/").last} because we are not on Linux.\033[0m"
  return
end

describe df('/') do
  its(:space) { should be >= 1 }
end