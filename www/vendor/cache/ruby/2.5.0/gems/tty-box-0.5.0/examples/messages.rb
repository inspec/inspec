# frozen_string_literal: true

require_relative "../lib/tty-box"

puts TTY::Cursor.clear_screen
puts TTY::Box.info "Deploying application", top: 2, left: 2
puts TTY::Box.success "Deploying application", top: 2, left: 29
puts TTY::Box.warn "Deploying application", top: 8, left: 2
puts TTY::Box.error "Deploying application", top: 8, left: 29

puts
