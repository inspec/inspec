module Inspec
  class RunData
    Profile = Struct.new(
      :controls,         # complex standalone
      :copyright,
      :copyright_email,
      :depends,          # complex local
      :groups,           # complex local
      :inputs,           # complex local
      :license,
      :maintainer,
      :name,
      :sha256,
      :status,
      :summary,
      :supports,         # complex local
      :parent_profile,
      :status_message,
      :waiver_data,      # Undocumented but used in JSON reporter - should not be?
      :title,
      :version
    ) do
      include HashLikeStruct
      def initialize(raw_prof_data)
        self.controls = (raw_prof_data[:controls] || []).map { |c| Inspec::RunData::Control.new(c) }
        self.depends  = (raw_prof_data[:depends]  || []).map { |d| Inspec::RunData::Profile::Dependency.new(d) }
        self.groups   = (raw_prof_data[:groups]   || []).map { |g| Inspec::RunData::Profile::Group.new(g) }
        self.inputs   = (raw_prof_data[:inputs]   || []).map { |i| Inspec::RunData::Profile::Input.new(i) }
        self.supports = (raw_prof_data[:supports] || []).map { |s| Inspec::RunData::Profile::Support.new(s) }

        %i{
          copyright
          copyright_email
          license
          maintainer
          name
          sha256
          status
          summary
          title
          version
          parent_profile
          status_message
          waiver_data
        }.each do |field|
          self[field] = raw_prof_data[field]
        end
      end
    end

    class Profile
      # Good candidate for keyword_init, but that is not in 2.4
      Dependency = Struct.new(
        :name, :path, :status, :status_message, :git, :url, :compliance, :supermarket, :branch, :tag, :commit, :version, :relative_path
      ) do
        include HashLikeStruct
        def initialize(raw_dep_data)
          %i{name path status status_message git url supermarket compliance branch tag commit version relative_path}.each { |f| self[f] = raw_dep_data[f] }
        end
      end

      Support = Struct.new(
        #  snake case
        :platform_family, :platform_name, :release, :platform
      ) do
        include HashLikeStruct
        def initialize(raw_sup_data)
          %i{release platform}.each { |f| self[f] = raw_sup_data[f] }
          self.platform_family = raw_sup_data[:"platform-family"]
          self.platform_name = raw_sup_data[:"platform-name"]
        end
      end

      # Good candidate for keyword_init, but that is not in 2.4
      Group = Struct.new(
        :title, :controls, :id
      ) do
        include HashLikeStruct
        def initialize(raw_grp_data)
          %i{title id}.each { |f| self[f] = raw_grp_data[f] }
          [:controls].each { |f| self[f] = raw_grp_data[f] || [] }
        end
      end

      Input = Struct.new(
        :name, :options
      ) do
        include HashLikeStruct
        def initialize(raw_input_data)
          self.name = raw_input_data[:name]
          self.options = Inspec::RunData::Profile::Input::Options.new(raw_input_data[:options])
        end
      end
      class Input
        Options = Struct.new(
          # There are probably others
          :value,
          :type,
          :required,
          :sensitive
        ) do
          include HashLikeStruct
          def initialize(raw_opts_data)
            %i{value type required sensitive}.each { |f| self[f] = raw_opts_data[f] }
          end
        end
      end
    end
  end
end
