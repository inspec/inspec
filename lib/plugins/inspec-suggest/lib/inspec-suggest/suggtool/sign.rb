require_relative "base"
require "yaml" unless defined? YAML

module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    option :keyname, type: :string,
      desc: "Name of key to sign the profile. Passed to `inspec sign profile`."

    option :out_dir, type: :string,
      desc: "Output directory for the IAF files. Default: SRC/etc/suggest"

    desc "sign SETNAME", "Sign one or more suggestion sets into IAF files."
    def sign(*requested_sets)
      setup(requested_sets)

      out_dir = options[:out_dir] || File.join(Inspec.src_root, "etc", "suggest")
      unless Dir.exist?(out_dir)
        ui.error "sign: Output directory '#{out_dir}' does not exist"
        ui.exit(:usage_error)
      end

      unless options[:keyname]
        ui.error "sign: Required option 'keyname' is missing"
        ui.exit(:usage_error)
      end

      with_requested_sets do |set_name, set_cfg|
        # find profile directory
        profile_dir = File.join(@working_dir, "profiles", set_name)
        unless Dir.exist?(profile_dir)
          ui.error "sign: Profile directory '#{profile_dir}' does not exist - did you call `suggtool package`?"
          ui.exit(:usage_error)
        end

        # Read version out of metadata
        unless File.exist?(File.join(profile_dir, "inspec.yml"))
          ui.error "sign: inspec.yml in '#{profile_dir}' does not exist - did you call `suggtool package`?"
          ui.exit(:usage_error)
        end
        version = YAML.load_file(File.join(profile_dir, "inspec.yml"))["version"]

        # call inspec sign via Inspec.start
        ui.info "sign: going to sign #{set_name} v#{version} with key #{options[:keyname]}"
        # Capturing the stdout just becuase it is ugly
        old_stdout = $stdout
        _captured_stdout = $stdout = StringIO.new
        Inspec::InspecCLI.start(["sign", "profile", profile_dir, "--keyname", options[:keyname]])
        $stdout = old_stdout

        # Kind of gross that we have to use relative path for this, but sign drops it
        # in current directory as PROFILENAME-VERSION.iaf
        # Note that we drop the version number from the filename as we rename
        FileUtils.mv("#{set_name}-#{version}.iaf", "#{out_dir}/#{set_name}.iaf")
        ui.info "sign: signed '#{set_name}.iaf' OK - size " + File.size("#{out_dir}/#{set_name}.iaf").to_s
      end
    end
  end
end
