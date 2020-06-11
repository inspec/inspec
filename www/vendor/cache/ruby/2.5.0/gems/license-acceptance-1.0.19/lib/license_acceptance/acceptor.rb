require "forwardable"
require "license_acceptance/config"
require "license_acceptance/logger"
require "license_acceptance/product_reader"
require "license_acceptance/product_relationship"
require "license_acceptance/strategy/environment"
require "license_acceptance/strategy/file"
require "license_acceptance/strategy/argument"
require "license_acceptance/strategy/prompt"
require "license_acceptance/strategy/provided_value"

module LicenseAcceptance

  ACCEPT = "accept".freeze
  ACCEPT_SILENT = "accept-silent".freeze
  ACCEPT_NO_PERSIST = "accept-no-persist".freeze

  class Acceptor
    extend Forwardable
    include Logger

    attr_reader :config, :product_reader, :env_strategy, :file_strategy, :arg_strategy, :prompt_strategy, :provided_strategy

    def initialize(opts = {})
      @config = Config.new(opts)
      Logger.initialize(config.logger)
      @product_reader = ProductReader.new
      product_reader.read
      @env_strategy = Strategy::Environment.new(ENV)
      @file_strategy = Strategy::File.new(config)
      @arg_strategy = Strategy::Argument.new(ARGV)
      @prompt_strategy = Strategy::Prompt.new(config)
      @provided_strategy = Strategy::ProvidedValue.new(opts.fetch(:provided, nil))
      @acceptance_value = nil
    end

    def_delegator :@config, :output

    # For applications that just need simple logic to handle a failed license acceptance flow we include this small
    # wrapper. Apps with more complex logic (like logging to a logging engine) should call the non-bang version and
    # handle the exception.
    def check_and_persist!(product_id, version)
      check_and_persist(product_id, version)
    rescue LicenseNotAcceptedError => e
      output.puts "#{e.product.pretty_name} cannot execute without accepting the license"
      exit 172
    end

    def check_and_persist(product_id, version)
      if accepted_no_persist?
        logger.debug("Chef License accepted with no persistence")
        @acceptance_value = ACCEPT_NO_PERSIST
        return true
      end

      product_relationship = product_reader.lookup(product_id, version)

      missing_licenses = file_strategy.accepted?(product_relationship)

      # They have already accepted all licenses and stored their acceptance in the persistent files
      if missing_licenses.empty?
        logger.debug("All licenses present")
        @acceptance_value = ACCEPT
        return true
      end

      if accepted? || accepted_silent?
        if config.persist
          errs = file_strategy.persist(product_relationship, missing_licenses)
          if errs.empty?
            output_num_persisted(missing_licenses.size) unless accepted_silent?
          else
            output_persist_failed(errs)
          end
        end
        @acceptance_value = accepted_silent? ? ACCEPT_SILENT : ACCEPT
        true
      elsif config.output.isatty && prompt_strategy.request(missing_licenses) do
          # We have to infer the acceptance value if they use the prompt to accept
        if config.persist
          @acceptance_value = ACCEPT # rubocop: disable Lint/AssignmentInCondition
          file_strategy.persist(product_relationship, missing_licenses)
        else
          @acceptance_value = ACCEPT_NO_PERSIST # rubocop: disable Lint/AssignmentInCondition
          []
        end
      end
        true
      else
        raise LicenseNotAcceptedError.new(product_relationship.parent, missing_licenses)
      end
    end

    def self.check_and_persist!(product_id, version, opts = {})
      new(opts).check_and_persist!(product_id, version)
    end

    def self.check_and_persist(product_id, version, opts = {})
      new(opts).check_and_persist(product_id, version)
    end

    # Check whether the specified product requires license acceptance for the given version.
    def license_required?(mixlib_name, version)
      product = product_reader.lookup_by_mixlib(mixlib_name)
      return false if product.nil?
      # If they don't pass a version we assume they want latest
      # All versions in all channels require license acceptance
      return true if %w{latest unstable current stable}.include?(version.to_s) || version.nil?

      Gem::Version.new(version) >= Gem::Version.new(product.license_required_version)
    end

    # Some callers only know about mixlib names so we need a way for them to get the product
    # id as this library knows it.
    def id_from_mixlib(mixlib_name)
      product = product_reader.lookup_by_mixlib(mixlib_name)
      return nil if product.nil?

      product.id
    end

    # Return the value that was matched ("accept", "accept-no-persist", etc.). Used by callers so they do not
    # have to know the precedence order between provided/environment/argument. Can just get back the value
    # that was used. Value is only guaranteed to be set after calling check_and_persist.
    def acceptance_value
      @acceptance_value
    end

    def accepted?
      provided_strategy.accepted? || env_strategy.accepted? || arg_strategy.accepted?
    end

    # no-persist is silent too
    def accepted_no_persist?
      provided_strategy.no_persist? || env_strategy.no_persist? || arg_strategy.no_persist?
    end

    # persist but be silent like no-persist
    def accepted_silent?
      provided_strategy.silent? || env_strategy.silent? || arg_strategy.silent?
    end

    # In the case where users accept with a command line argument or environment variable
    # we still want to output the fact that the filesystem was changed.
    def output_num_persisted(count)
      s = count > 1 ? "s" : ""
      output.puts <<~EOM
        #{Strategy::Prompt::BORDER}
        #{Strategy::Prompt::CHECK} #{count} product license#{s} accepted.
        #{Strategy::Prompt::BORDER}
      EOM
    end

    def output_persist_failed(errs)
      output.puts <<~EOM
        #{Strategy::Prompt::BORDER}
        #{Strategy::Prompt::CHECK} Product license accepted.
        Could not persist acceptance:\n\t* #{errs.map(&:message).join("\n\t* ")}
        #{Strategy::Prompt::BORDER}
      EOM
    end

  end

  class LicenseNotAcceptedError < RuntimeError
    attr_reader :product
    def initialize(product, missing_licenses)
      @product = product
      msg = "Missing licenses for the following:\n* " + missing_licenses.map(&:id).join("\n* ")
      super(msg)
    end
  end

end
