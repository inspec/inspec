# frozen_string_literal: true
require "helper"

require "inspec/plugin/v2/train_plugin_installer"

class TestTrainPluginInstaller < Minitest::Test
  def setup
    @installer = Inspec::Plugin::V2::TrainPluginInstaller.new
    @plugin_installer = Minitest::Mock.new
    @loader = Minitest::Mock.new
  end

  def with_stubs(&block)
    Inspec::Plugin::V2::Installer.stub :instance, @plugin_installer do
      Inspec::Plugin::V2::Loader.stub :new, @loader, &block
    end
  end

  def test_installs_via_plugin_installer_and_activates
    @plugin_installer.expect :ensure_installed, true, ["train-aws-premium"]
    @loader.expect :activate_managed_gems_for_plugin, true, ["train-aws-premium"]

    with_stubs { assert_equal true, @installer.install_and_activate("train-aws-premium") }

    @plugin_installer.verify
    @loader.verify
  end

  def test_returns_false_on_plugin_install_error
    @plugin_installer.expect :ensure_installed, nil do
      raise Inspec::Plugin::V2::InstallError, "not found"
    end

    with_stubs { assert_equal false, @installer.install_and_activate("train-aws-premium") }
  end

  def test_returns_false_on_gem_install_error
    @plugin_installer.expect :ensure_installed, nil do
      raise Gem::InstallError, "install failed"
    end

    with_stubs { assert_equal false, @installer.install_and_activate("train-aws") }
  end

  def test_returns_false_on_remote_fetch_error
    @plugin_installer.expect :ensure_installed, nil do
      raise Gem::RemoteFetcher::FetchError.new("network error", "https://rubygems.org")
    end

    with_stubs { assert_equal false, @installer.install_and_activate("train-aws") }
  end

  def test_returns_false_when_activation_fails
    @plugin_installer.expect :ensure_installed, true, ["train-aws"]
    @loader.expect :activate_managed_gems_for_plugin, nil do
      raise Gem::LoadError, "cannot activate"
    end

    with_stubs { assert_equal false, @installer.install_and_activate("train-aws") }
  end
end
