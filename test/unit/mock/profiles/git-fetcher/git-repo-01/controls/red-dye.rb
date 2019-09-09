# This control would only appear if it were accidentally included
control 'red-dye' do
  # In rural areas where diesel fuel is sold for
  # agricultrual purposes and is exempt from taxation (as part
  # of farm subsidies), tractor diesel fuel is dyed red. Highway
  # patrol officers check for red dye in the fuel when they
  # stop grain hauling trucks, as it is a form of tax fraud.
  describe 'truck fuel color' do
    it { should cmp 'clear' }
  end
end