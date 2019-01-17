title "Test case 3 for exceptions controls"

control "a control with an undefined method" do
  plowshares = swords.beat
end

control "a control with a divide-by-zero" do
  1 / 0
end
