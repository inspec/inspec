if os.unix?
  filename = '/tmp/example.xml'
else
  filename = 'c:/windows/temp/example.xml'
end

describe xml(filename) do
  its ('/breakfast_menu/food[1]/name') { should eq(['Belgian Waffles']) }
  its ('/breakfast_menu/food/name') { should eq(['Belgian Waffles', 'Strawberry Belgian Waffles']) }
  its ('/breakfast_menu/food[3]/@name') { should eq(['Blueberry Belgian Waffles']) }
end
