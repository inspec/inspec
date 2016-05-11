# encoding: utf-8

# 'all_match' matcher tests
describe ['ananas', 'apples', 'oranges', 'air', 'alot'] do
  it { should all_match /[a]./}
end
describe ['ananas', 'apples', 'oranges', 'melons', 'air'] do
  it { should_not all_match /[a]./}
end
describe [true, true, true] do
  it { should all_match /^true$/}
end


# 'none_match' matcher tests
describe ['kiwi', 'avocado', 'grapefruit'] do
  it { should none_match /xyz/}
end
describe ['kiwi', 'avocado', 'grapefruit'] do
  it { should_not none_match /^avo/}
end
describe 999 do
  it { should none_match /^666/}
end


# 'contain_match' matcher tests
describe ['lemon', 'ginger', 'grapes'] do
  it { should contain_match /^gin/}
end
describe ['lemon', 'ginger', 'gra(pes'] do
  it { should contain_match 'gra\(pe' }
end
describe ['lemon', 'ginger', 'grapes'] do
  it { should_not contain_match /^chocolate/}
end
describe 'kiwi' do
  it { should contain_match /^kiw/}
end


# 'contain_duplicates' matcher tests
describe ['onion', 'carrot', 'onion'] do
  it { should contain_duplicates }
end
describe ['onion', 'carrot', 'brocoli'] do
  it { should_not contain_duplicates }
end
describe [80, 443] do
  it { should_not contain_duplicates }
end
