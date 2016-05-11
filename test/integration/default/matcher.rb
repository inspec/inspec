# encoding: utf-8

describe ['ananas', 'apples', 'oranges', 'air', 'alot'] do
  it { should all_match  /[a]./}
end

describe ['ananas', 'apples', 'oranges', 'air', 'melons'] do
  it { should_not all_match  /[a]./}
end
