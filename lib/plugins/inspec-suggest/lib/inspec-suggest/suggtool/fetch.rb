require_relative "base"
require "fileutils" unless defined?(FileUtils)
require "git"

module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    desc "fetch SETNAME", "Fetches sets of source profiles for later processing."
    def fetch(*requested_sets)
      setup(requested_sets)

      with_requested_sets do |set_name, set_cfg|
        set_dir = File.join(@working_dir, set_name)
        FileUtils.mkdir_p(set_dir)
        ui.info "fetch: working on set #{set_name}"

        set_cfg["fetch"].each do |fetch_cfg|
          checkout_dir = File.join(set_dir, (File.basename(fetch_cfg["repo"], ".git")))
          git = nil
          if File.exist?(File.join(checkout_dir, ".git"))
            git = Git.open(checkout_dir)
            git.fetch
            ui.info "fetch: updated"
          else
            git = Git.clone(fetch_cfg["repo"], checkout_dir)
            ui.info "fetch: cloned from #{fetch_cfg["repo"]}"
          end

          ref = fetch_cfg["ref"] || "main"
          git.checkout(ref)
          ui.info "fetch: checked out #{ref}"
        end
      end
    end
  end
end
