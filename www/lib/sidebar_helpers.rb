# helper methods for source/layouts/sidebar.slim
module SidebarHelpers
  SIDEBAR_LAYOUTS = %w{docs}.freeze

  def sidebar_data(sidebar_layout)
    unless SIDEBAR_LAYOUTS.include?(sidebar_layout)
      raise "'#{sidebar_layout}' is not a valid sidebar layout type."
    end

    data.public_send(:"#{sidebar_layout}_sidebar").sidebar_links.dup
  end

  def link_classes(current_url, item_link)
    "t-purple" if same_link?(current_url, item_link.link)
  end

  def print_sub_links?(current_url, item_link)
    return false unless sub_links?(item_link)

    same_link?(item_link.link, current_url) ||
      active_child?(current_url, item_link)
  end

  def same_link?(one, two)
    # fix comparing '.html' to empty suffix links
    if !one.end_with?(".html") && two.end_with?(".html")
      two = two.sub(/\.html$/, "")
    end
    strip_trailing_slash(one) == strip_trailing_slash(two)
  end

  def strip_trailing_slash(str)
    str.end_with?("/") ? str[0..-2] : str
  end

  def active_child?(current_url, item_link)
    return false unless sub_links?(item_link)

    sub_link_urls(item_link).include?(strip_trailing_slash(current_url))
  end

  def sub_links?(item_link)
    item_link.respond_to?(:sub_links) && item_link.sub_links.count > 0
  end

  def sub_link_urls(item)
    item.sub_links.collect { |sub| strip_trailing_slash(sub.link) }
  end
end
