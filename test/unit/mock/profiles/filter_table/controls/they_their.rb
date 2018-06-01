title 'Verify they / their support works correctly - Issue 3109'

fresh_data = ->() do
  [
    { id: 0, color: :red }.dup,
    { id: 1, color: :blue, }.dup,
    { id: 2, color: :green }.dup,
  ]
end

control '3109_their' do
  desc 'their should work as an alias for its'
  describe simple_plural(fresh_data.call) do
    its('count') { should eq 3 }
    their('count') { should eq 3 }
    its('ids.count') { should eq 3 }
    their('ids.count') { should eq 3 }
  end
end
