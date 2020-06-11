# frozen_string_literal: true

require_relative 'paginator'

module TTY
  class Prompt
    class BlockPaginator < Paginator
      # Paginate list of choices based on current active choice.
      # Move entire pages.
      #
      # @api public
      def paginate(list, active, per_page = nil, &block)
        default_size = (list.size <= DEFAULT_PAGE_SIZE ? list.size : DEFAULT_PAGE_SIZE)
        @per_page = @per_page || per_page || default_size

        check_page_size!

        # Don't paginate short lists
        if list.size <= @per_page
          @start_index = 0
          @end_index = list.size - 1
          if block
            return list.each_with_index(&block)
          else
            return list.each_with_index.to_enum
          end
        end

        unless active.nil? # User may input index out of range
          @last_index = active
        end
        page  = (@last_index / @per_page.to_f).ceil
        pages = (list.size / @per_page.to_f).ceil
        if page == 0
          @start_index = 0
          @end_index = @start_index + @per_page - 1
        elsif page > 0 && page < pages
          @start_index = (page - 1) * @per_page
          @end_index = @start_index + @per_page - 1
        elsif page == pages
          @start_index = (page - 1) * @per_page
          @end_index = list.size - 1
        else
          @end_index = list.size - 1
          @start_index = @end_index - @per_page + 1
        end

        sliced_list = list[@start_index..@end_index]
        page_range = (@start_index..@end_index)

        return sliced_list.zip(page_range).to_enum unless block_given?

        sliced_list.each_with_index do |item, index|
          block[item, @start_index + index]
        end
      end
    end # EnumPaginator
  end # Prompt
end # TTY
