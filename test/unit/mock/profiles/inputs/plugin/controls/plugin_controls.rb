control 'only_in_plugin' do
  describe attribute('test_only_in_plugin') do
    it { should cmp 'only_in_plugin' }
  end
end

control 'collide_plugin_higher' do
  describe attribute('test_collide_plugin_higher', value: 'wrong', priority: 10) do
    it { should cmp 'collide_plugin_higher' }
  end
end

control 'collide_inline_higher' do
  describe attribute('test_collide_inline_higher', value: 'collide_inline_higher', priority: 70) do
    it { should cmp 'collide_inline_higher' }
  end
end

control 'event_log' do
  # This attribute is set here here in the DSL and in the plugin
  # An attribute with this history should have 3 events - a create, a DSL set, and a plugin fetch.
  attribute('test_event_log', value: 'setting_in_dsl')

  # Fetch the attribute object from the registry
  input_obj = Inspec::InputRegistry.find_or_register_input('test_event_log', 'input-test-fixture')

  describe input_obj.events.count do
    it { should eq 3 }
  end

  create_evt = input_obj.events.detect { |e| e.action == :create }
  describe create_evt do
    it { should_not be_nil }
  end

  dsl_set_evt = input_obj.events.detect { |e| e.action == :set && e.provider == :inline_control_code }
  describe dsl_set_evt do
    it { should_not be_nil }
    its('file') { should include 'plugin_controls.rb' }
  end

  plugin_fetch_evt = input_obj.events.detect { |e| e.action == :fetch && e.provider == :'inspec-input-test-fixture' }
  describe plugin_fetch_evt do
    it { should_not be_nil }
  end

end

control 'list_inputs' do
  inputs = Inspec::InputRegistry.list_potential_input_names_for_profile('input-test-fixture')

  describe inputs do
    [
      'test_only_in_plugin',
      'test_collide_inline_higher',
      'test_collide_plugin_higher',
      'test_not_mentioned_inline',
    ].each do |input_name|
      it { should include input_name }
    end

    it { should_not include 'nonesuch' }
  end
end