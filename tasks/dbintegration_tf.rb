MYSQL_TERRAFORM_DIR = "./test/integration/db/mysql_terraform".freeze
MONGO_TERRAFORM_DIR = "./test/integration/db/mongo_terraform".freeze
TF_PLAN_FILE_NAME = "inspec-db-testing.plan".freeze
ATTRIBUTES_FILE_NAME = "".freeze
DB_INTEGRATION_DIR = "./test/integration/db/profiles".freeze

namespace :dbintegration_tf do
  desc "Initializes Terraform Plan for database environment setup"
  task :init, [:database] do |_t, args|
    database = args[:database]
    case database
    when "mysql"
      dir_path = MYSQL_TERRAFORM_DIR
    when "mongodb"
      dir_path = MONGO_TERRAFORM_DIR
    else
      puts "Please specify database ...."
      exit
    end

    Dir.chdir(dir_path) do
      sh("terraform", "init")
    end
  end

  desc "Creates a Terraform execution plan from the plan file"
  task :plan, [:database] do |_t, args|
    database = args[:database]
    case database
    when "mysql"
      dir_path = MYSQL_TERRAFORM_DIR
    when "mongodb"
      dir_path = MONGO_TERRAFORM_DIR
    else
      puts "Please specify database ...."
      exit
    end

    Dir.chdir(dir_path) do
      sh("terraform", "get")
      sh("terraform", "plan", "-out", "inspec-db-testing.plan")
    end
    Rake::Task["dbintegration_tf:write_tf_output_to_file"].invoke(database)
  end

  desc "Executes the Terraform plan"
  task :apply, [:database, :optionals] do |_t, args|
    case args[:database]
    when "mysql"
      dir_path = MYSQL_TERRAFORM_DIR
    when "mongodb"
      dir_path = MONGO_TERRAFORM_DIR
    else
      puts "Please specify database ...."
      exit
    end
    tf_plan_file = File.join(dir_path, TF_PLAN_FILE_NAME)
    if File.exist?(tf_plan_file)
      puts "-> Applying an existing terraform plan: #{tf_plan_file}"
      unless args[:optionals].nil?
        puts "These arguments are ignored: #{Array(args[:optionals]) + args.extras}."
      end
    else
      Rake::Task["dbintegration_tf:plan"].reenable
      Rake::Task["dbintegration_tf:plan"].invoke(args[:database])
    end

    Dir.chdir(dir_path) do
      sh("terraform", "apply", "inspec-db-testing.plan")
    end
  end

  desc "Destroys the Terraform environment"
  task :destroy, [:database] do |_t, args|
    database = args[:database]
    case database
    when "mysql"
      dir_path = MYSQL_TERRAFORM_DIR
    when "mongodb"
      dir_path = MONGO_TERRAFORM_DIR
    else
      puts "Please specify database ...."
      exit
    end

    Dir.chdir(dir_path) do
      sh("terraform", "destroy", "-auto-approve")
    end
    File.delete("#{dir_path}/#{ENV["ATTRIBUTES_FILE"]}")
  end

  task :write_tf_output_to_file, [:database] do |_t, args|
    case args[:database]
    when "mysql"
      dir_path = MYSQL_TERRAFORM_DIR
    when "mongodb"
      dir_path = MONGO_TERRAFORM_DIR
    else
      puts "Please specify the database ...."
      exit
    end
    Dir.chdir(dir_path) do
      stdout, stderr, status = Open3.capture3("terraform output -json")

      abort(stderr) unless status.success?
      abort("$ATTRIBUTES_FILE not set. Please source .envrc.") if ENV["ATTRIBUTES_FILE"].nil?
      abort("$ATTRIBUTES_FILE has no content. Check .envrc.") if ENV["ATTRIBUTES_FILE"].empty?

      AttributeFileWriter.write_yaml(ENV["ATTRIBUTES_FILE"], stdout)
    end
  end

  task :setup_env, [:database] do |_t, args|
    database = args[:database]
    case database
    when "mysql"
      dir_path = MYSQL_TERRAFORM_DIR
    when "mongodb"
      dir_path = MONGO_TERRAFORM_DIR
    else
      puts "Please specify database ...."
      exit
    end
    ENV["EC2_PUBLIC_DNS"] = YAML.load_file("#{dir_path}/#{ENV["ATTRIBUTES_FILE"]}")["ec2_public_dns"]
  end

  desc "Runs database integraton test"
  task :test, [:database, :controls] do |_t, args|

    database = args[:database]

    Rake::Task["dbintegration_tf:write_tf_output_to_file"].reenable
    Rake::Task["dbintegration_tf:write_tf_output_to_file"].invoke(database)

    Rake::Task["dbintegration_tf:setup_env"].reenable
    Rake::Task["dbintegration_tf:setup_env"].invoke(database)

    case database
    when "mysql"
      dir_path = MYSQL_TERRAFORM_DIR
      db_integration_dir = "#{DB_INTEGRATION_DIR}/mysql"
      user = "ec2-user"
    when "mongodb"
      dir_path = MONGO_TERRAFORM_DIR
      db_integration_dir = "#{DB_INTEGRATION_DIR}/mongodb"
      user = "ubuntu"
    else
      puts "Please specify database ...."
      exit
    end
    cmd = %W{ bundle exec inspec exec #{db_integration_dir}
              --input-file #{dir_path}/#{ENV["ATTRIBUTES_FILE"]}
              --reporter cli
              --no-distinct-exit
              -t ssh://#{user}@#{ENV["EC2_PUBLIC_DNS"]}
              -i #{dir_path}/inspec-db-test.pem
              --chef-license accept-silent }

    if args[:controls]
      sh(*cmd, "--controls", args[:controls], *args.extras)
    else
      sh(*cmd)
    end
  end
end