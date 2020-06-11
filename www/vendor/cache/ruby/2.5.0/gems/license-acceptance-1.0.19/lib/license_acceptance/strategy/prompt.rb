require "tty-prompt"
require "pastel"
require "license_acceptance/logger"
require "license_acceptance/strategy/base"
require "timeout"

module LicenseAcceptance
  module Strategy

    # Interactive prompt for accepting and persistnce license acceptance, or failing with custom exit code
    class Prompt < Base
      include Logger

      attr_reader :output

      def initialize(config)
        @output = config.output
      end

      WIDTH = 50
      PASTEL = Pastel.new
      BORDER = "+---------------------------------------------+".freeze
      YES = PASTEL.green.bold("yes")
      CHECK = PASTEL.green("✔")

      def request(missing_licenses, &persist_callback)
        logger.debug("Requesting a license for #{missing_licenses.map(&:id)}")
        c = missing_licenses.size
        s = c > 1 ? "s" : ""

        acceptance_question = "Do you accept the #{c} product license#{s} (#{YES}/no)?"
        output.puts <<~EOM
          #{BORDER}
                      Chef License Acceptance

          Before you can continue, #{c} product license#{s}
          must be accepted. View the license at
          https://www.chef.io/end-user-license-agreement/

          License#{s} that need accepting:
            * #{missing_licenses.map(&:pretty_name).join("\n  * ")}

          #{acceptance_question}

        EOM

        if ask(output, c, s, persist_callback)
          output.puts BORDER
          return true
        end

        output.puts <<~EOM

          If you do not accept this license you will
          not be able to use Chef products.

          #{acceptance_question}

        EOM

        answer = ask(output, c, s, persist_callback)
        if answer != "yes"
          output.puts BORDER
        end
        answer
      end

      private

      def ask(output, c, s, persist_callback)
        logger.debug("Attempting to request interactive prompt on TTY")
        prompt = TTY::Prompt.new(track_history: false, active_color: :bold, interrupt: :exit, output: output)

        answer = "no"
        begin
          Timeout.timeout(60, PromptTimeout) do
            answer = prompt.ask(">") do |q|
              q.modify :down, :trim
              q.required true
              q.messages[:required?] = "You must enter 'yes' or 'no'"
              q.validate /^\s*(yes|no)\s*$/i
              q.messages[:valid?] = "You must enter 'yes' or 'no'"
            end
          end
        rescue PromptTimeout
          prompt.unsubscribe(prompt.reader)
          output.puts "Prompt timed out. Use non-interactive flags or enter an answer within 60 seconds."
        end

        if answer == "yes"
          output.puts
          output.puts "Persisting #{c} product license#{s}..."
          errs = persist_callback.call
          if errs.empty?
            output.puts "#{CHECK} #{c} product license#{s} persisted.\n\n"
          else
            output.puts <<~EOM
              #{CHECK} #{c} product license#{s} accepted.
              Could not persist acceptance:\n\t* #{errs.map(&:message).join("\n\t* ")}
            EOM
          end
          return true
        end
        false
      end
    end

    class PromptTimeout < StandardError; end

  end
end
