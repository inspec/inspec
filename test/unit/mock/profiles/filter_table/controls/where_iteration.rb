title 'Verify `where` filter blocks iterate properly - issue 2929'

control 'When the data has no rows, there should be zero iterations witth one where call' do
  $count = 0
  describe simple_plural([]).where { $count += 1; true } do
    subject { $count }
    it { should cmp 0 }
  end
end

control 'When the data has no rows, entries should report zero count' do
  describe simple_plural([]).where { true } do
    its('entries.count') { should be_zero }
  end
end

control 'When the data has no rows, field accessors should not be called' do
  $field_accessor_values = []
  describe simple_plural([]).where { $field_accessor_values << id; true } do
    subject { $field_accessor_values }
    it { should be_empty }
  end
end

control 'When the data has one row, there should be one iteration' do
  $count = 0
  describe simple_plural([{id: 1 }]).where { $count += 1; true } do
    subject { $count }
    it { should cmp 1 }
  end
end

control 'When the data has one row, field accessors should only contain expected types' do
  $field_accessor_values = []
  describe simple_plural([{id: 1}]).where { $field_accessor_values << id; true } do
    subject { $field_accessor_values.map { |v| v.class }.uniq }
    it { should contain_exactly Integer }
  end
end

control 'When the data has no rows, there should be zero iterations with two where calls' do
  $count = 0
  describe simple_plural([]).where { $count += 1; true }.where { $count += 1; true } do
    subject { $count }
    it { should cmp 0 }
  end
end

control 'When the data has no rows, field accessors should not be called with two where calls' do
  $field_accessor_values = []
  describe simple_plural([]).where { $field_accessor_values << id; true }.where { $field_accessor_values << id; true } do
    subject { $field_accessor_values }
    it { should be_empty }
  end
end