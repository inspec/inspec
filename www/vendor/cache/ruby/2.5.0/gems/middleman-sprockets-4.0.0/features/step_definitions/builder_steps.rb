Given /^a built app$/ do
  step %Q{I run `middleman build --verbose`}
end

Given /^a successfully built app$/ do
  step %Q{a built app}
  step %Q{was successfully built}
end
