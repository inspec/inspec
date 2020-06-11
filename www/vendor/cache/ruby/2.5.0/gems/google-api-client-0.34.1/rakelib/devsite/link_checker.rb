require "open3"

class LinkChecker
  def initialize
    @failed = false
  end

  def run
    job_info
    git_commit = ENV.fetch "KOKORO_GITHUB_COMMIT", "master"

    markdown_files = Dir.glob "**/*.md"
    broken_markdown_links = check_links(markdown_files,
                                        "https://github.com/googleapis/google-api-ruby-client/tree/#{git_commit}",
                                        " --skip '^(?!(\\Wruby.*google|.*google.*\\Wruby|.*cloud\\.google\\.com))'")

    broken_devsite_links = check_links(["google-api-client"],
                                       "https://googleapis.dev/ruby",
                                       "/latest/ --recurse --skip https:.*github.*")

    puts_broken_links broken_markdown_links
    puts_broken_links broken_devsite_links
  end

  def check_links location_list, base, tail
    broken_links = Hash.new { |h, k| h[k] = [] }
    location_list.each do |location|
      out, err, st = Open3.capture3 "npx linkinator #{base}/#{location}#{tail}"
      puts out
      unless st.to_i.zero?
        @failed = true
        puts err
      end
      checked_links = out.split "\n"
      checked_links.select! { |link| link =~ /\[\d+\]/ && !link.include?("[200]") }
      unless checked_links.empty?
        @failed = true
        broken_links[location] += checked_links
      end
    end
    broken_links
  end

  def puts_broken_links link_hash
    link_hash.each do |location, links|
      puts "#{location} contains the following broken links:"
      links.each { |link| puts "  #{link}" }
      puts ""
    end
  end

  def job_info
    line_length = "Using Ruby - #{RUBY_VERSION}".length + 8
    puts
    puts "#" * line_length
    puts "### Using Ruby - #{RUBY_VERSION} ###"
    puts "#" * line_length
    puts
  end

  def exit_status
    @failed ? 1 : 0
  end
end
