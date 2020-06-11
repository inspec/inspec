# frozen_string_literal: true

require 'English'

require_relative 'choices'
require_relative 'paginator'
require_relative 'block_paginator'

module TTY
  class Prompt
    # A class responsible for rendering select list menu
    # Used by {Prompt} to display interactive menu.
    #
    # @api private
    class List
      HELP = '(Use %s arrow%s keys, press Enter to select%s)'

      # Allowed keys for filter, along with backspace and canc.
      FILTER_KEYS_MATCHER = /\A([[:alnum:]]|[[:punct:]])\Z/.freeze

      # Create instance of TTY::Prompt::List menu.
      #
      # @param Hash options
      #   the configuration options
      # @option options [Symbol] :default
      #   the default active choice, defaults to 1
      # @option options [Symbol] :color
      #   the color for the selected item, defualts to :green
      # @option options [Symbol] :marker
      #   the marker for the selected item
      # @option options [String] :enum
      #   the delimiter for the item index
      #
      # @api public
      def initialize(prompt, **options)
        check_options_consistency(options)

        @prompt       = prompt
        @prefix       = options.fetch(:prefix) { @prompt.prefix }
        @enum         = options.fetch(:enum) { nil }
        @default      = Array(options[:default])
        @choices      = Choices.new
        @active_color = options.fetch(:active_color) { @prompt.active_color }
        @help_color   = options.fetch(:help_color) { @prompt.help_color }
        @cycle        = options.fetch(:cycle) { false }
        @filterable   = options.fetch(:filter) { false }
        @symbols      = @prompt.symbols.merge(options.fetch(:symbols, {}))
        @filter       = []
        @filter_cache = {}
        @help         = options[:help]
        @first_render = true
        @done         = false
        @per_page     = options[:per_page]
        @paginator    = Paginator.new
        @block_paginator = BlockPaginator.new
        @by_page      = false
        @paging_changed = false
      end

      # Change symbols used by this prompt
      #
      # @param [Hash] new_symbols
      #   the new symbols to use
      #
      # @api public
      def symbols(new_symbols = (not_set = true))
        return @symbols if not_set
        @symbols.merge!(new_symbols)
      end

      # Set default option selected
      #
      # @api public
      def default(*default_values)
        @default = default_values
      end

      # Select paginator based on the current navigation key
      #
      # @return [Paginator]
      #
      # @api private
      def paginator
        @by_page ? @block_paginator : @paginator
      end

      # Synchronize paginators start positions
      #
      # @api private
      def sync_paginators
        if @by_page
          if @paginator.start_index
            @block_paginator.reset!
            @block_paginator.start_index = @paginator.start_index
          end
        else
          if @block_paginator.start_index
            @paginator.reset!
            @paginator.start_index = @block_paginator.start_index
          end
        end
      end

      # Set number of items per page
      #
      # @api public
      def per_page(value)
        @per_page = value
      end

      def page_size
        (@per_page || Paginator::DEFAULT_PAGE_SIZE)
      end

      # Check if list is paginated
      #
      # @return [Boolean]
      #
      # @api private
      def paginated?
        choices.size > page_size
      end

      # Provide help information
      #
      # @param [String] value
      #   the new help text
      #
      # @return [String]
      #
      # @api public
      def help(value = (not_set = true))
        return @help if !@help.nil? && not_set

        @help = (@help.nil? && !not_set) ? value : default_help
      end

      # Information about arrow keys
      #
      # @return [String]
      #
      # @api private
      def arrows_help
        up_down = @symbols[:arrow_up] + "/" + @symbols[:arrow_down]
        left_right = @symbols[:arrow_left] + "/" + @symbols[:arrow_right]

        arrows = [up_down]
        arrows << " and " if paginated?
        arrows << left_right if paginated?
        arrows.join
      end

      # Default help text
      #
      # @api public
      def default_help
        # Note that enumeration and filter are mutually exclusive
        tokens = if enumerate?
                   [" or number (1-#{choices.size})", '']
                 elsif filterable?
                   ['', ', and letter keys to filter']
                 else
                   ['', '']
                 end

        format(self.class::HELP, arrows_help, *tokens)
      end

      # Set selecting active index using number pad
      #
      # @api public
      def enum(value)
        @enum = value
      end

      # Add a single choice
      #
      # @api public
      def choice(*value, &block)
        @filter_cache = {}
        if block
          @choices << (value << block)
        else
          @choices << value
        end
      end

      # Add multiple choices, or return them.
      #
      # @param [Array[Object]] values
      #   the values to add as choices; if not passed, the current
      #   choices are displayed.
      #
      # @api public
      def choices(values = (not_set = true))
        if not_set
          if !filterable? || @filter.empty?
            @choices
          else
            filter_value = @filter.join.downcase
            @filter_cache[filter_value] ||= @choices.select do |choice|
              !choice.disabled? &&
                choice.name.downcase.include?(filter_value)
            end
          end
        else
          @filter_cache = {}
          values.each { |val| @choices << val }
        end
      end

      # Call the list menu by passing question and choices
      #
      # @param [String] question
      #
      # @param
      # @api public
      def call(question, possibilities, &block)
        choices(possibilities)
        @question = question
        block.call(self) if block
        setup_defaults
        @prompt.subscribe(self) do
          render
        end
      end

      # Check if list is enumerated
      #
      # @return [Boolean]
      def enumerate?
        !@enum.nil?
      end

      def keynum(event)
        return unless enumerate?

        value = event.value.to_i
        return unless (1..choices.count).cover?(value)
        return if choices[value - 1].disabled?
        @active = value
      end

      def keyenter(*)
        @done = true unless choices.empty?
      end
      alias keyreturn keyenter
      alias keyspace keyenter

      def search_choice_in(searchable)
        searchable.find { |i| !choices[i - 1].disabled? }
      end

      def keyup(*)
        searchable  = (@active - 1).downto(1).to_a
        prev_active = search_choice_in(searchable)

        if prev_active
          @active = prev_active
        elsif @cycle
          searchable  = choices.length.downto(1).to_a
          prev_active = search_choice_in(searchable)

          @active = prev_active if prev_active
        end

        @paging_changed = @by_page
        @by_page = false
      end

      def keydown(*)
        searchable  = ((@active + 1)..choices.length)
        next_active = search_choice_in(searchable)

        if next_active
          @active = next_active
        elsif @cycle
          searchable = (1..choices.length)
          next_active = search_choice_in(searchable)

          @active = next_active if next_active
        end
        @paging_changed = @by_page
        @by_page = false
      end
      alias keytab keydown

      # Moves all choices page by page keeping the current selected item
      # at the same level on each page.
      #
      # When the choice on a page is outside of next page range then
      # adjust it to the last item, otherwise leave unchanged.
      def keyright(*)
        if (@active + page_size) <= @choices.size
          searchable = ((@active + page_size)..choices.length)
          @active = search_choice_in(searchable)
        elsif @active <= @choices.size # last page shorter
          current   = @active % page_size
          remaining = @choices.size % page_size
          if current.zero? || (remaining > 0 && current > remaining)
            searchable = @choices.size.downto(0).to_a
            @active = search_choice_in(searchable)
          elsif @cycle
            searchable = ((current.zero? ? page_size : current)..choices.length)
            @active = search_choice_in(searchable)
          end
        end

        @paging_changed = !@by_page
        @by_page = true
      end
      alias keypage_down keyright

      def keyleft(*)
        if (@active - page_size) > 0
          searchable = ((@active - page_size)..choices.length)
          @active = search_choice_in(searchable)
        elsif @cycle
          searchable = @choices.size.downto(1).to_a
          @active = search_choice_in(searchable)
        end
        @paging_changed = !@by_page
        @by_page = true
      end
      alias keypage_up keyleft

      def keypress(event)
        return unless filterable?

        if event.value =~ FILTER_KEYS_MATCHER
          @filter << event.value
          @active = 1
        end
      end

      def keydelete(*)
        return unless filterable?

        @filter.clear
        @active = 1
      end

      def keybackspace(*)
        return unless filterable?

        @filter.pop
        @active = 1
      end

      private

      def check_options_consistency(options)
        if options.key?(:enum) && options.key?(:filter)
          raise ConfigurationError,
                "Enumeration can't be used with filter"
        end
      end

      # Setup default option and active selection
      #
      # @api private
      def setup_defaults
        validate_defaults

        if !@default.empty?
          @active = @default.first
        else
          @active = @choices.index { |choice| !choice.disabled? } + 1
        end
      end

      # Validate default indexes to be within range
      #
      # @raise [ConfigurationError]
      #   raised when the default index is either non-integer,
      #   out of range or clashes with disabled choice item.
      #
      # @api private
      def validate_defaults
        @default.each do |d|
          msg = if d.nil? || d.to_s.empty?
                  "default index must be an integer in range (1 - #{choices.size})"
                elsif d < 1 || d > choices.size
                  "default index `#{d}` out of range (1 - #{choices.size})"
                elsif choices[d - 1] && choices[d - 1].disabled?
                  "default index `#{d}` matches disabled choice item"
                end

          raise(ConfigurationError, msg) if msg
        end
      end

      # Render a selection list.
      #
      # By default the result is printed out.
      #
      # @return [Object] value
      #   return the selected value
      #
      # @api private
      def render
        @prompt.print(@prompt.hide)
        until @done
          question = render_question
          @prompt.print(question)
          @prompt.read_keypress

          # Split manually; if the second line is blank (when there are no
          # matching lines), it won't be included by using String#lines.
          question_lines = question.split($INPUT_RECORD_SEPARATOR, -1)

          @prompt.print(refresh(question_lines_count(question_lines)))
        end
        @prompt.print(render_question)
        answer
      ensure
        @prompt.print(@prompt.show)
      end

      # Count how many screen lines the question spans
      #
      # @return [Integer]
      #
      # @api private
      def question_lines_count(question_lines)
        question_lines.reduce(0) do |acc, line|
          acc + @prompt.count_screen_lines(line)
        end
      end

      # Find value for the choice selected
      #
      # @return [nil, Object]
      #
      # @api private
      def answer
        choices[@active - 1].value
      end

      # Clear screen lines
      #
      # @param [String]
      #
      # @api private
      def refresh(lines)
        @prompt.clear_lines(lines)
      end

      # Render question with instructions and menu
      #
      # @return [String]
      #
      # @api private
      def render_question
        header = ["#{@prefix}#{@question} #{render_header}\n"]
        @first_render = false
        unless @done
          header << render_menu
        end
        header.join
      end

      # Is filtering enabled?
      #
      # @return [Boolean]
      #
      # @api private
      def filterable?
        @filterable
      end

      # Header part showing the current filter
      #
      # @return String
      #
      # @api private
      def filter_help
        "(Filter: #{@filter.join.inspect})"
      end

      # Render initial help and selected choice
      #
      # @return [String]
      #
      # @api private
      def render_header
        if @done
          selected_item = choices[@active - 1].name
          @prompt.decorate(selected_item.to_s, @active_color)
        elsif @first_render
          @prompt.decorate(help, @help_color)
        elsif filterable? && @filter.any?
          @prompt.decorate(filter_help, @help_color)
        end
      end

      # Render menu with choices to select from
      #
      # @return [String]
      #
      # @api private
      def render_menu
        output = []

        sync_paginators if @paging_changed
        paginator.paginate(choices, @active, @per_page) do |choice, index|
          num = enumerate? ? (index + 1).to_s + @enum + ' ' : ''
          message = if index + 1 == @active && !choice.disabled?
                      selected = "#{@symbols[:marker]} #{num}#{choice.name}"
                      @prompt.decorate(selected.to_s, @active_color)
                    elsif choice.disabled?
                      @prompt.decorate(@symbols[:cross], :red) +
                        " #{num}#{choice.name} #{choice.disabled}"
                    else
                      "  #{num}#{choice.name}"
                    end
          end_index = paginated? ? paginator.end_index : choices.size - 1
          newline = (index == end_index) ? '' : "\n"
          output << (message + newline)
        end

        output.join
      end
    end # List
  end # Prompt
end # TTY
