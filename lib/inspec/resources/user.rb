require "inspec/resources/users"
# user resource belong_to matcher for serverspec compatibility
RSpec::Matchers.define :belong_to_primary_group do |group|
  match do |user|
    user.belongs_to_primary_group?(group)
  end
end

RSpec::Matchers.define :belong_to_group do |group|
  match do |user|
    user.belongs_to_group?(group)
  end
end
