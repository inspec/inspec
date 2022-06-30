require_relative "base"
module InspecPlugins::Suggest
  class SuggToolCommand < Inspec.plugin(2, :cli_command)

    desc "fetch SETNAME", "Fetches sets of source profiles for later processing."
    def fetch(*requested_sets)
      setup(requested_sets)

      with_requested_sets do |set_name, set_cfg|
        # construct expected checkout dir
        # mkdir -p
        # for each checkout
        # check for expected directory
        # if does not exist
        #   git clone
        # else
        #   git fetch
        # git checkout onto requested ref
        #
      end
    end
  end
end
