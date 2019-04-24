require_relative '../../../shared/core_plugin_test_helper.rb'

#-----------------------------------------------------------------------#
# Thor option defs
#-----------------------------------------------------------------------#
class PluginManagerCliOptions < Minitest::Test
  include CorePluginUnitHelper
  let(:cli_class) { InspecPlugins::PluginManager::CliCommand }

  def setup
    require_relative '../../lib/inspec-plugin-manager-cli/cli_command'
  end

  def test_list_args
    arg_config = cli_class.all_commands['list'].options
    assert_equal 1, arg_config.count, 'The list command should have 1 option'

    assert_includes arg_config.keys, :all, 'The list command should have an --all option'
    assert_equal :boolean, arg_config[:all].type, 'The --all option should be boolean'
    assert_equal :a, arg_config[:all].aliases.first, 'The --all option should be aliased as -a'
    refute_nil arg_config[:all].description, 'The --all option should have a description'
    refute arg_config[:all].required, 'The --all option should not be required'

    assert_equal 0, cli_class.instance_method(:list).arity, 'The list command should take no arguments'
  end

  def test_search_args
    arg_config = cli_class.all_commands['search'].options
    assert_equal 3, arg_config.count, 'The search command should have 3 options'

    assert_includes arg_config.keys, :all, 'The search command should have an --all option'
    assert_equal :boolean, arg_config[:all].type, 'The --all option should be boolean'
    assert_equal :a, arg_config[:all].aliases.first, 'The --all option should be aliased as -a'
    refute_nil arg_config[:all].description, 'The --all option should have a description'
    refute arg_config[:all].required, 'The --all option should not be required'

    assert_includes arg_config.keys, :exact, 'The search command should have an --exact option'
    assert_equal :boolean, arg_config[:exact].type, 'The --exact option should be boolean'
    assert_equal :e, arg_config[:exact].aliases.first, 'The --exact option should be aliased as -e'
    refute_nil arg_config[:exact].description, 'The --exact option should have a description'
    refute arg_config[:exact].required, 'The --exact option should not be required'

    assert_includes arg_config.keys, :'include-test-fixture', 'The search command should have an --include-test-fixture option'
    assert_equal :boolean, arg_config[:'include-test-fixture'].type, 'The --include-test-fixture option should be boolean'
    refute arg_config[:'include-test-fixture'].required, 'The --include-test-fixture option should not be required'

    assert_equal 1, cli_class.instance_method(:search).arity, 'The search command should take one argument'
  end

  def test_install_args
    arg_config = cli_class.all_commands['install'].options
    assert_equal 1, arg_config.count, 'The install command should have 1 option'

    assert_includes arg_config.keys, :version, 'The install command should have a --version option'
    assert_equal :string, arg_config[:version].type, 'The --version option should be a string'
    assert_equal :v, arg_config[:version].aliases.first, 'The --version option should be aliased as -v'
    refute_nil arg_config[:version].description, 'The --version option should have a description'
    refute arg_config[:version].required, 'The --version option should not be required'

    assert_equal 1, cli_class.instance_method(:install).arity, 'The install command should take one argument'
  end

  def test_update_args
    # TODO: allow specifying version
    arg_config = cli_class.all_commands['update'].options
    assert_equal 0, arg_config.count, 'The update command should have no options'
    assert_equal 1, cli_class.instance_method(:update).arity, 'The update command should take one argument'
  end

  def test_uninstall_args
    arg_config = cli_class.all_commands['uninstall'].options
    assert_equal 0, arg_config.count, 'The uninstall command should have no options'
    assert_equal 1, cli_class.instance_method(:uninstall).arity, 'The uninstall command should take one argument'
  end
end
