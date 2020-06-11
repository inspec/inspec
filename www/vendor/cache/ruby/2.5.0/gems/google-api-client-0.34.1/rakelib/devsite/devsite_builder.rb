require "pathname"
require "tmpdir"

require_relative "repo_metadata.rb"

class DevsiteBuilder
  def initialize build_tag = nil
    @build_tag = build_tag || latest_tag
    @output_dir = "doc"
  end

  def build tag
    checkout_tag tag
    doc_path = tmp_dir + @output_dir
    FileUtils.remove_dir doc_path if Dir.exist? doc_path
    markup = "--markup markdown --markup-provider redcarpet"

    Dir.chdir tmp_dir do
      cmds = ["-o #{@output_dir}", markup]
      cmd "yard --verbose #{cmds.join ' '}"
    end
    metadata.build doc_path
  end

  def upload
    Dir.chdir tmp_dir + @output_dir do
      opts = [
        "--credentials=#{ENV['KOKORO_KEYSTORE_DIR']}/73713_docuploader_service_account",
        "--staging-bucket=#{ENV.fetch 'STAGING_BUCKET', 'docs-staging'}",
        "--metadata-file=./docs.metadata"
      ]
      cmd "python3 -m docuploader upload . #{opts.join ' '}"
    end
  end

  def publish tag = nil
    build(tag || @build_tag)
    upload
  end

  def publish_if_missing tag = nil
    tag ||= @build_tag
    puts tag
    puts missing? tag
    publish tag if missing? tag
  end

  def missing? tag
    require "httparty"

    url = "https://googleapis.dev/ruby/google-api-client/v#{version tag}/index.html"
    response = HTTParty.get url
    response.code != 200
  rescue StandardError
    true
  end

  def cmd line
    puts line
    output = `#{line}`
    puts output
    output
  end

  def metadata
    return @metadata if @metadata

    metadata_json = "#{tmp_dir}/.repo-metadata.json"
    @metadata = RepoMetadata.from_source metadata_json if File.file? metadata_json
    @metadata ||= RepoMetadata.from_source "name"              => "google-api-client",
                                           "distribution-name" => "google-api-client",
                                           "language"          => "ruby"
    @metadata["version"] = version @build_tag
    @metadata
  end

  def checkout_tag git_tag
    Dir.chdir tmp_dir do
      `git checkout tags/#{git_tag} -b v#{version git_tag}`
    end
  end

  def version git_tag
    m = git_tag.match(/(\d+\.\d+\.\d+)/)
    return m if m.nil?
    m[0]
  end

  def versions
    Dir.chdir tmp_dir do
      tags.map { |t| version t }.reject(&:nil?).sort_by { |v| Gem::Version.new v }.reverse
    end
  end

  def tags
    Dir.chdir tmp_dir do
      `git tag`.split "\n"
    end
  end

  def latest_version
    @latest_version ||= versions.first
  end

  def latest_tag
    @latest_tag ||= tags.select { |t| t.include? latest_version }.min_by(&:size)
  end

  def tmp_dir
    return @tmp_dir if @tmp_dir

    tmp = Dir.tmpdir
    dir_name = "google-api-ruby-client"
    @tmp_dir = Pathname.new(tmp) + dir_name
    FileUtils.remove_dir @tmp_dir if Dir.exist? @tmp_dir

    Dir.chdir tmp do
      `git clone https://github.com/googleapis/google-api-ruby-client.git`
    end
    Dir.chdir @tmp_dir do
      `git fetch`
    end

    @tmp_dir
  end
end
