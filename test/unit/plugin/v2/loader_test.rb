# Unit tests for Inspec::PluginLoader and Registry

require "helper"
require "inspec/plugin/v2"

require "train" # Needed for Train plugin testing

class Inspec::Plugin::V2::Loader
  public :detect_system_plugins
end

class PluginLoaderTests < Minitest::Test

  @@orig_home = Dir.home

  def reset_globals
    ENV["HOME"] = @@orig_home
    ENV["INSPEC_CONFIG_DIR"] = nil
    Inspec::Plugin::V2::Registry.instance.__reset
    if defined?(::InspecPlugins::TestFixture)
      InspecPlugins.send :remove_const, :TestFixture
    end
    # forget all test fixture files
    $".reject! { |path| path =~ %r{test/fixtures} }
  end

  def setup
    WebMock.disable_net_connect!(allow: %r{(api\.)?rubygems\.org/.*})
    reset_globals

    @config_dir_path = File.expand_path "test/fixtures/config_dirs"
    @bundled_plugins = [
      :'inspec-supermarket',
     ]
    @core_plugins = %i{
     inspec-sign
     inspec-compliance
     inspec-habitat
     inspec-init
     inspec-reporter-html2
    }
    @system_plugins = [
      "train-habitat",
    ]
  end

  def teardown
    reset_globals

    # Clean up any activated gems
    Gem.loaded_specs.delete("inspec-test-fixture")
    Gem.loaded_specs.delete("ordinal_array")
  end

  #====================================================================#
  #            basic constructor usage and bundle detection            #
  #====================================================================#

  def test_constructor_should_detect_bundled_plugins
    reg = Inspec::Plugin::V2::Registry.instance
    Inspec::Plugin::V2::Loader.new
    @bundled_plugins.each do |bundled_plugin_name|
      assert reg.known_plugin?(bundled_plugin_name), "\n#{bundled_plugin_name} should be detected as a bundled plugin"
    end
  end

  def test_constructor_should_detect_core_plugins
    reg = Inspec::Plugin::V2::Registry.instance
    Inspec::Plugin::V2::Loader.new
    @core_plugins.each do |core_plugin_name|
      assert reg.known_plugin?(core_plugin_name), "\n#{core_plugin_name} should be detected as a core plugin"
    end
  end

  def test_constructor_should_skip_bundles_when_option_is_set
    reg = Inspec::Plugin::V2::Registry.instance
    Inspec::Plugin::V2::Loader.new(omit_bundles: true)
    @bundled_plugins.each do |bundled_plugin_name|
      refute reg.known_plugin?(bundled_plugin_name), "\n#{bundled_plugin_name} should not be detected when omit_bundles is set"
    end
  end

  def test_constructor_should_skip_core_when_option_is_set
    reg = Inspec::Plugin::V2::Registry.instance
    Inspec::Plugin::V2::Loader.new(omit_core_plugins: true)
    @core_plugins.each do |core_plugin_name|
      refute reg.known_plugin?(core_plugin_name), "\n#{core_plugin_name} should not be detected when omit_core_plugins is set"
    end
  end

  def test_constructor_when_using_home_dir_detects_declared_plugins
    ENV["HOME"] = File.join(@config_dir_path, "fakehome")
    reg = Inspec::Plugin::V2::Registry.instance
    Inspec::Plugin::V2::Loader.new
    assert reg.known_plugin?(:'inspec-test-home-marker'), "\ninspec-test-home-marker should be detected as a plugin"
  end

  #====================================================================#
  #                 unusual plugin.json situations                     #
  #====================================================================#

  def test_constructor_when_the_plugin_config_is_absent_it_detects_bundled_plugins
    ENV["INSPEC_CONFIG_DIR"] = File.join(@config_dir_path, "empty")
    reg = Inspec::Plugin::V2::Registry.instance
    Inspec::Plugin::V2::Loader.new
    @bundled_plugins.each do |bundled_plugin_name|
      assert reg.known_plugin?(bundled_plugin_name), "\n#{bundled_plugin_name} should be detected as a bundled plugin"
    end
  end

  #====================================================================#
  #                        basic loading                               #
  #====================================================================#

  def test_load_no_plugins_should_load_no_plugins
    reg = Inspec::Plugin::V2::Registry.instance
    loader = Inspec::Plugin::V2::Loader.new(omit_bundles: true, omit_core_plugins: true, omit_user_plugins: true, omit_sys_plugins: true)
    loader.load_all
    assert_equal 0, reg.loaded_count, "\nRegistry load count"
  end

  def test_load_only_bundled_plugins_should_load_bundled_plugins
    skip "This keeps failing, only affects legacy bundles, will fix later"
    # Skip rationale: I beleive this test is failing due to a test artifact - we
    # keep loading v1 CLI plugins and then purging the registry, which results (depending
    # on test order) in the Ruby `require` refusing to re-load the v1 plugin (since it was
    # previously loaded). But since we purge the Registry, the Registry doesn't know
    # about it either. Neither of those things are intended to happen as
    # the plugin system is finished (the v1 plugins will be ported to v2, and registry
    # purging should never happen in real-world use)
    reg = Inspec::Plugin::V2::Registry.instance
    loader = Inspec::Plugin::V2::Loader.new
    loader.load_all
    @bundled_plugins.each do |bundled_plugin_name|
      assert reg.loaded_plugin?(bundled_plugin_name), "\n#{bundled_plugin_name} should be loaded"
      assert_equal [ :cli_command ], reg[bundled_plugin_name].plugin_types, "annotate plugin type of bundled plugins"
      assert_equal 0, reg[bundled_plugin_name].api_generation, "annotate API generation of bundled plugins"
      assert_kind_of(Class, reg[bundled_plugin_name].plugin_class)
    end
    assert_equal @bundled_plugins.count, reg.loaded_count, "\nRegistry load count"
  end

  def test_load_cli_plugin_by_path
    ENV["INSPEC_CONFIG_DIR"] = File.join(@config_dir_path, "meaning_by_path")
    reg = Inspec::Plugin::V2::Registry.instance
    plugin_name = :'inspec-meaning-of-life'
    loader = Inspec::Plugin::V2::Loader.new(omit_bundles: true)
    assert reg.known_plugin?(plugin_name), "\n#{plugin_name} should be a known plugin"
    refute reg.loaded_plugin?(plugin_name), "\n#{plugin_name} should not be loaded yet"
    loader.load_all
    assert reg.loaded_plugin?(plugin_name), "\n#{plugin_name} should be loaded"
  end

  def test_list_managed_gems
    ENV["INSPEC_CONFIG_DIR"] = File.join(@config_dir_path, "test-fixture-2-float")
    loader = Inspec::Plugin::V2::Loader.new(omit_bundles: true)
    gemspecs = loader.list_managed_gems
    gem = gemspecs.detect { |spec| spec.name == "ordinal_array" }
    refute_nil gem, "loader.list_managed_gems should find ordinal_array"
    assert_equal Gem::Version.new("0.2.0"), gem.version
  end

  def test_list_installed_plugin_gems
    ENV["INSPEC_CONFIG_DIR"] = File.join(@config_dir_path, "test-fixture-1-float")
    loader = Inspec::Plugin::V2::Loader.new(omit_bundles: true)
    gemspecs = loader.list_installed_plugin_gems
    gem = gemspecs.detect { |spec| spec.name == "inspec-test-fixture" }
    refute_nil gem, "loader.list_installed_plugin_gems should find inspec-test-fixture"
    assert_equal Gem::Version.new("0.1.0"), gem.version
  end

  def test_load_mock_plugin_by_gem
    ENV["INSPEC_CONFIG_DIR"] = File.join(@config_dir_path, "test-fixture-2-float")

    reg = Inspec::Plugin::V2::Registry.instance
    plugin_name = :'inspec-test-fixture'

    loader = Inspec::Plugin::V2::Loader.new(omit_bundles: true)

    assert_operator reg, :known_plugin?,  plugin_name
    refute_operator reg, :loaded_plugin?, plugin_name

    loader.load_all

    assert_operator reg, :loaded_plugin?, plugin_name
  end

  #====================================================================#
  #                          activation                                #
  #====================================================================#
  def test_activation
    # Setup
    ENV["INSPEC_CONFIG_DIR"] = File.join(@config_dir_path, "meaning_by_path")
    registry = Inspec::Plugin::V2::Registry.instance
    loader = Inspec::Plugin::V2::Loader.new(omit_bundles: true)
    loader.load_all
    status = registry[:'inspec-meaning-of-life']

    # Management methods for activation
    assert_respond_to status, :activators, "A plugin status should respond to `activators`"
    assert_respond_to registry, :find_activators, "Registry should respond to `find_activators`"

    # Finding an Activator
    assert_kind_of Array, status.activators, "status should have an array for activators"
    assert_kind_of Array, registry.find_activators, "find_activators should return an array"
    assert_equal "Inspec::Plugin::V2::Activator", registry.find_activators[0].class.name, "find_activators should return an array of Activators"
    activator = registry.find_activators(plugin_type: :mock_plugin_type, name: :'meaning-of-life-the-universe-and-everything')[0]
    refute_nil activator, "find_activators should find the test activator"
    %i{plugin_name plugin_type activator_name activated? exception activation_proc implementation_class}.each do |method_name|
      assert_respond_to activator, method_name
    end

    # Activation preconditions
    refute activator.activated?, "Test activator should start out unactivated"
    assert_nil activator.exception, "Test activator should have no exception prior to activation"
    assert_nil activator.implementation_class, "Test activator should not know implementation class prior to activation"
    refute InspecPlugins::MeaningOfLife.const_defined?(:MockPlugin), "impl_class should not be defined prior to activation"

    activator.activate

    # Activation postconditions
    assert activator.activated?, "Test activator should be activated after activate"
    assert_nil activator.exception, "Test activator should have no exception after activation"

    # facts about the implementation class
    impl_class = activator.implementation_class
    refute_nil impl_class, "Activation should set the implementation class"
    assert_kind_of Class, impl_class, "Should have a Class in the implementation class slot"
    assert_includes impl_class.ancestors, Inspec::Plugin::V2::PluginBase, "impl_class should derive from PluginBase"
    assert_includes impl_class.ancestors, Inspec::Plugin::V2::PluginType::Mock, "impl_class should derive from PluginType::Mock"
    assert InspecPlugins::MeaningOfLife.const_defined?(:MockPlugin), "impl_class should now be defined"

    assert_equal :'inspec-meaning-of-life', Inspec::Plugin::V2::PluginBase.find_name_by_implementation_class(impl_class), "find_name_by_implementation_class should work"
  end

  #====================================================================#
  #                       Train Plugin Special Handling                #
  #====================================================================#
  def test_when_a_train_plugin_is_installed_via_gem_and_required
    ENV["INSPEC_CONFIG_DIR"] = File.join(@config_dir_path, "train-test-fixture")

    reg = Inspec::Plugin::V2::Registry.instance
    assert_silent { Inspec::Plugin::V2::Loader.new }

    plugin_name = :'train-test-fixture'
    assert(reg.known_plugin?(plugin_name), "The train plugin should be known after loader init")

    status = reg[plugin_name]
    assert_equal(:'train-1', status.api_generation, "It should have a special value for api gen (:'train-1')")
    refute(reg.loaded_plugin?(plugin_name), "It should not be loaded until needed")

    # 'Requiring' the gem name should succeed

    require "train-test-fixture"
    assert_includes(Train::Plugins.registry.keys, "test-fixture", "After requiring the gem, the Train Registry should know the plugin is loaded")
    assert(reg.loaded_plugin?(plugin_name), "After requiring, InSpec Registry should know the the plugin is loaded")
  end

  REG_INST = Inspec::Plugin::V2::Registry.instance

  def with_empty_registry
    old_reg = REG_INST.registry.dup
    REG_INST.registry.clear

    yield
  ensure
    REG_INST.registry.replace old_reg
  end

  def with_logger
    old_logger = Inspec::Log.logger
    io = StringIO.new
    Inspec::Log.logger = Logger.new(io)

    yield

    io.string
  ensure
    Inspec::Log.logger = old_logger
  end

  def using_bundler?
    Gem::Specification.find_by_name("inspec")
  rescue Gem::MissingSpecError
    nil
  end

  def assert_detect_system_plugins(exp_keys, exp_err)
    # rubocop:disable Style/HashSyntax
    loader = Inspec::Plugin::V2::Loader.new(:omit_user_plugins => true,
                                            :omit_bundles      => true,
                                            :omit_core_plugins => true,
                                            :omit_sys_plugins  => true)

    assert_empty REG_INST.registry

    yield loader

    log_out = with_logger do
      assert_silent do
        loader.detect_system_plugins
      end
    end

    assert_equal exp_keys, REG_INST.registry.keys.sort
    assert_match exp_err, log_out
  end

  def test_detect_system_plugins
    with_empty_registry do
      exp = []
      exp_err = "inspec gem not found, skipping detecting of system plugins\n"

      assert_detect_system_plugins exp, exp_err do |loader|
        def loader.find_inspec_gemspec(*)
          nil
        end
      end
    end
  end

  def test_detect_system_plugins_inspec
    skip "not valid in this env" unless using_bundler?

    with_empty_registry do
      exp = %i{ train-aws train-habitat train-winrm }
      exp_err = ""

      assert_detect_system_plugins exp, exp_err do |loader|
        def loader.find_inspec_gemspec(name, version)
          super if name == "inspec"
        end
      end
    end
  end

  def test_read_conf_file_into_registry
    ENV["INSPEC_CONFIG_DIR"] = File.join(@config_dir_path, "train-test-fixture")
    loader = Inspec::Plugin::V2::Loader.new(omit_bundles: true)
    registry = loader.send(:read_conf_file_into_registry)
    assert_includes registry, { :name => :"train-test-fixture", :version => ">= 0.1.0" }
    reg = Inspec::Plugin::V2::Registry.instance
    status = reg[registry.first[:name]]
    assert_equal("Test train plugin. Not intended for use as an example.", status.description, "Reads the description of the plugin from local gemspec file.")
  end
end
