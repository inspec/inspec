#!/usr/bin/env ruby
require "open-uri"

pipelines = {
  "chef-oss/inspec-inspec-master-verify" => "bf4c5fdc3858cc9f8c8bab8376e8e40d625ad046df9d4d8619",
  "chef/inspec-inspec-master-habitat-build" => "961fabb80eca2c55b4095132298bbe1a8f4acf51aaa76f5e38",
  "chef/inspec-inspec-master-omnibus-release" => "ca05c84bff6eac11c7be348f163d636ca52059699f5beeb233",
}

status = pipelines.all? { |source, token|
  uri = URI.parse "https://badge.buildkite.com/#{token}.svg"

  good = uri.read =~ /passing/

  warn "bad: https://buildkite.com/#{source}" unless good

  good
}

exit status
