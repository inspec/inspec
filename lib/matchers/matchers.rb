# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# license: All rights reserved

RSpec::Matchers.define :be_readable do
  match do |file|
    file.readable?(@by_type, @by_user)
  end

  chain :by do |by_type|
    @by_type = by_type
  end

  chain :by_user do |by_user|
    @by_user = by_user
  end

  description do
    res = "be readable"
    res += " by #{@by_type}" unless @by_type.nil?
    res += " by user #{@by_user}" unless @by_user.nil?
    res
  end
end

RSpec::Matchers.define :be_writable do
  match do |file|
    file.writable?(@by_type, @by_user)
  end

  chain :by do |by_type|
    @by_type = by_type
  end

  chain :by_user do |by_user|
    @by_user = by_user
  end

  description do
    res = "be writable"
    res += " by #{@by_type}" unless @by_type.nil?
    res += " by user #{@by_user}" unless @by_user.nil?
    res
  end
end

RSpec::Matchers.define :be_executable do
  match do |file|
    file.executable?(@by_type, @by_user)
  end

  chain :by do |by_type|
    @by_type = by_type
  end

  chain :by_user do |by_user|
    @by_user = by_user
  end

  description do
    res = "be executable"
    res += " by #{@by_type}" unless @by_type.nil?
    res += " by user #{@by_user}" unless @by_user.nil?
    res
  end
end

# matcher to check /etc/passwd, /etc/shadow and /etc/group
RSpec::Matchers.define :contain_legacy_plus do
  match do |file|
    file.content.match(/^\+:/)
  end
end

# verifies that no entry in an array contains a value
RSpec::Matchers.define :contain_match do |regex|
  match do |arr|
    arr.inject { |result, i| 
      match = i.match(regex)
      puts "#{i} + #{match}"
      result || i.match(/$/)
    } 
  end
end

RSpec::Matchers.define :contain_duplicates do
  match do |arr|
    dup = arr.select{|element| arr.count(element) > 1 }
    !dup.uniq.empty?
  end
end
