# encoding: utf-8
# copyright: 2015, Vulcano Security GmbH
# author: Dominik Richter
# author: Christoph Hartmann
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
    res = 'be readable'
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
    res = 'be writable'
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
    res = 'be executable'
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
      result = i.match(regex)
      result || i.match(/$/)
    }
  end
end

RSpec::Matchers.define :contain_duplicates do
  match do |arr|
    dup = arr.select { |element| arr.count(element) > 1 }
    !dup.uniq.empty?
  end
end

# for packages
RSpec::Matchers.define :be_installed do
  match do |package|
    package.installed? == true
  end

  failure_message do |package|
    "expected that `#{package}` is installed"
  end

  chain :by do
    fail "[UNSUPPORTED] Please use the new resources 'gem', 'npm' or 'pip'."
  end

  chain :with_version do |version|
    warn "[DEPRECATION] `with_version` is deprecated.  Please use `its(:version) { should eq '1.4.1' }` instead."
    @version = version
  end
end

# for services
RSpec::Matchers.define :be_enabled do
  match do |service|
    service.enabled? == true
  end

  chain :with_level do |_level|
    fail '[UNSUPPORTED] with level is not supported'
  end

  failure_message do |service|
    "expected that `#{service}` is enabled"
  end
end

# service resource matcher for serverspec compatibility
# Deprecated: You should not use this matcher anymore
RSpec::Matchers.define :be_running do
  match do |service|
    service.running? == true
  end

  chain :under do |_under|
    fail '[UNSUPPORTED] under is not supported'
  end

  failure_message do |service|
    "expected that `#{service}` is running"
  end
end

# user resource matcher for serverspec compatibility
# Deprecated: You should not use this matcher anymore
RSpec::Matchers.define :belong_to_group do |compare_group|
  match do |user|
    warn "[DEPRECATION] `belong_to_group` is deprecated.  Please use `its(:groups) { should include('root') }` instead."
    user.groups.include?(compare_group)
  end

  failure_message do |group|
    "expected that the user belongs to group `#{group}`"
  end
end

# user resource matcher for serverspec compatibility
# Deprecated: You should not use this matcher anymore
RSpec::Matchers.define :belong_to_primary_group do |compare_group|
  match do |user|
    warn "[DEPRECATION] `belong_to_primary_group` is deprecated.  Please use `its(:group) { should eq 'root' }` instead."
    user.group == compare_group
  end

  failure_message do |group|
    "expected that the user belongs to primary group `#{group}`"
  end
end
