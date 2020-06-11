# frozen_string_literal: true

libdir = File.dirname(__FILE__)
$LOAD_PATH.unshift(libdir) unless $LOAD_PATH.include?(libdir)

require "train-habitat/version"
require "train-habitat/transport"
require "train-habitat/platform"
require "train-habitat/connection"
