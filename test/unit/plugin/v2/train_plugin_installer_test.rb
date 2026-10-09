# frozen_string_literal: true
require "helper"

require "inspec/plugin/v2/train_plugin_installer"

class TestTrainPluginInstaller < Minitest::Test
  def setup
    @installer = Inspec::Plugin::V2::TrainPluginInstaller.new
  end

  def test_install_and_activate_returns_true_and_activates_specs_on_success
    spec = Minitest::Mock.new
    spec.expect :activated?, false
    spec.expect :activate, true

    dependency_installer = Minitest::Mock.new
    dependency_installer.expect :install, [spec], ["train-aws-premium"]

    Gem::DependencyInstaller.stub :new, dependency_installer do
      assert_equal true, @installer.install_and_activate("train-aws-premium")
    end

    spec.verify
    dependency_installer.verify
  end

  def test_install_and_activate_skips_activation_for_already_activated_specs
    spec = Minitest::Mock.new
    spec.expect :activated?, true

    dependency_installer = Minitest::Mock.new
    dependency_installer.expect :install, [spec], ["train-aws-premium"]

    Gem::DependencyInstaller.stub :new, dependency_installer do
      assert_equal true, @installer.install_and_activate("train-aws-premium")
    end

    spec.verify
    dependency_installer.verify
  end

  def test_install_and_activate_returns_false_when_gem_not_found
    dependency_installer = Minitest::Mock.new
    dependency_installer.expect :install, nil do
      raise Gem::GemNotFoundException, "gem not found"
    end

    Gem::DependencyInstaller.stub :new, dependency_installer do
      assert_equal false, @installer.install_and_activate("train-does-not-exist")
    end
  end

  def test_install_and_activate_returns_false_when_install_fails
    dependency_installer = Minitest::Mock.new
    dependency_installer.expect :install, nil do
      raise Gem::InstallError, "install failed"
    end

    Gem::DependencyInstaller.stub :new, dependency_installer do
      assert_equal false, @installer.install_and_activate("train-aws")
    end
  end

  def test_install_and_activate_returns_false_on_remote_fetch_error
    dependency_installer = Minitest::Mock.new
    dependency_installer.expect :install, nil do
      raise Gem::RemoteFetcher::FetchError.new("network error", "https://rubygems.org")
    end

    Gem::DependencyInstaller.stub :new, dependency_installer do
      assert_equal false, @installer.install_and_activate("train-aws")
    end
  end
end
