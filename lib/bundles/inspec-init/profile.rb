module Init
  class Profile

    # 1. iterate over all files
    # 2. read content in erb
    # 3. write to target
    def self.generator(type, attributes = {}, options = {}) # rubocop:disable Metrics/AbcSize
      # path of this script
      dir = File.dirname(__FILE__)
      # look for template directory
      base_dir = File.join(dir, 'templates', type)
      # prepare glob for all subdirectories and files
      template = File.join(base_dir, '**', '{*,.*}')
      # Use the name attribute to define the path to the profile.
      profile_path = attributes[:name]
      # Use slashes (\, /) to split up the name into an Array then use the last entry
      # to reset the name of the profile.
      attributes[:name] = attributes[:name].split(%r{\\|\/}).last
      # Generate the full target path on disk
      target = Pathname.new(Dir.pwd).join(profile_path)
      puts "Create new #{type} at #{Inspec::BaseCLI.mark_text(target)}"

      # check that the directory does not exist
      if File.exist?(target) && !options['overwrite']
        puts "#{Inspec::BaseCLI.mark_text(target)} exists already, use --overwrite"
        exit 1
      end

      # ensure that target directory is available
      FileUtils.mkdir_p(target)

      # iterate over files and write to target path
      Dir.glob(template) do |file|
        relative = Pathname.new(file).relative_path_from(Pathname.new(base_dir))
        destination = Pathname.new(target).join(relative)
        if File.directory?(file)
          Inspec::BaseCLI.li "Create directory #{Inspec::BaseCLI.mark_text(relative)}"
          FileUtils.mkdir_p(destination)
        elsif File.file?(file)
          Inspec::BaseCLI.li "Create file #{Inspec::BaseCLI.mark_text(relative)}"
          # read & render content
          content = render(File.read(file), attributes)
          # write file content
          File.write(destination, content)
        else
          puts "Ignore #{file}, because its not an file or directoy"
        end
      end
    end

    # This is a render helper to bind hash values to a ERB template
    def self.render(content, hash)
      # create a new binding class
      cls = Class.new do
        hash.each do |key, value|
          define_method key.to_sym do
            value
          end
        end
        # expose binding
        define_method :bind do
          binding
        end
      end
      ERB.new(content).result(cls.new.bind)
    end

  end
end
