namespace :matrix do

  def with_gemfile gemfile, &block
    Bundler.with_clean_env do
      gemfile = File.expand_path(gemfile)
      ENV['BUNDLE_GEMFILE'] = gemfile

      if ENV['CLEAN'] && File.exist?("#{gemfile}.lock")
        system "rm #{gemfile}.lock"
      end

      unless File.exist?( "#{gemfile}.lock")
        args = ["--quiet"]
        puts "bundling #{gemfile}"
        `bundle install --gemfile='#{gemfile}' #{args.join(' ')}`
      end

      system "bundle exec '#{yield}'"
    end
  end

  def tracer msg
    puts ""
    puts (0..(msg.length+10)).map { |i| "=" }.join
    puts "     #{msg}"
    puts (0..(msg.length+10)).map { |i| "=" }.join
  end

  MATRIX = %w[ middleman-4.0 middleman-4.1 middleman-head sprockets-4.0 ]

  MATRIX.each do |gemfile_name|

    desc "run tests with #{gemfile_name} gemfile"
    task :"#{gemfile_name}" do
      tracer "running tests with #{gemfile_name} gemfile"
      with_gemfile "gemfiles/#{gemfile_name}.gemfile" do
        "rake test"
      end
    end

  end

  desc "run test on full matrix"
  task :all => MATRIX.map { |gn| "matrix:#{gn}" }

end
