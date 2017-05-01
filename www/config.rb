# encoding: utf-8
require 'slim'

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# With alternative layout: we send the sidebar request to the default layout
page 'docs/*', layout: :docs, locals: { sidebar_layout: 'docs' }

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy '/this-page-has-no-template.html', '/template-file.html', locals: {
#  which_fake_page: 'Rendering a fake page with a local variable' }

###
# Helpers
###

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Methods defined in the helpers block are available in templates
require 'lib/sidebar_helpers'
helpers SidebarHelpers

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     'Helping'
#   end
# end
#
# Build-specific configuration
configure :build do
  # Minify CSS on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
end

activate :sprockets
activate :autoprefixer
activate :directory_indexes
activate :syntax
set :trailing_slash, false
set :markdown_engine, :redcarpet
set :markdown, fenced_code_blocks: true, smartypants: true, coderay_line_numbers: :table, tables: true
