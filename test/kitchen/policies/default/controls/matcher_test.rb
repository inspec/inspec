# matcher be_in test

INSTALLED_MODULES = ['module1', 'module2', 'module3', 'module4', 'module5']

describe 'module1' do
  it { should be_in INSTALLED_MODULES}
end

describe ['module1', 'module2', 'module3'] do
  it { should be_in INSTALLED_MODULES}
end

describe 'badmodule' do
  it { should_not be_in INSTALLED_MODULES}
end

describe ['badmodule1', 'badmodule2'] do
  it { should_not be_in INSTALLED_MODULES}
end
