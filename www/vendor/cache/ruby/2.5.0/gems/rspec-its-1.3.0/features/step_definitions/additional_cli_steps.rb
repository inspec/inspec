When /^I run rspec( with the documentation option)?$/ do |documentation|
  rspec_its_gem_location = File.expand_path('../../../lib/rspec/its', __FILE__)
  require_option = "--require #{rspec_its_gem_location}"
  format_option = documentation ? "--format documentation" : ""
  rspec_command = ['rspec', require_option, format_option, 'example_spec.rb'].join(' ')
  step "I run `#{rspec_command}`"
end

When /^I run rspec specifying line number (\d+)$/ do |line_number|
  rspec_its_gem_location = File.expand_path('../../../lib/rspec/its', __FILE__)
  require_option = "--require #{rspec_its_gem_location}"
  file_specification = "example_spec.rb:#{line_number}"
  rspec_command = ['rspec', require_option, file_specification].join(' ')
  step "I run `#{rspec_command}`"
end

Then /^the example(?:s)? should(?: all)? pass$/ do
  step %q{the output should contain "0 failures"}
  step %q{the output should not contain "0 examples"}
  step %q{the exit status should be 0}
end

Then(/^the example should fail$/) do
  step %q{the output should contain "1 failure"}
  step %q{the exit status should not be 0}
end

Then(/^the output should contain "(.*?)" and "(.*?)"$/) do |string1, string2|
  unless [string1, string2].all? { |s| all_output.include?(s) }
    fail %Q{Both "#{string1}" and "#{string2}" were found in:\n#{all_output}}
  end
end
