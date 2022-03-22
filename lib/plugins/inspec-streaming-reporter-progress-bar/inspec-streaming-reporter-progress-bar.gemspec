# .gemspec file is added to add plugin details
# These specs are used in plugin list and search command

Gem::Specification.new do |spec|
  spec.name          = "inspec-streaming-reporter-progress-bar"
  spec.summary       = "Displays a real-time progress bar and control title as output"
  spec.description   = "This plugin is a streaming reporter plugin which shows the real-time progress of a running InSpec profile using a progress bar. It also outputs the ID of a running control with an indicator showing if the control has passed, failed or skipped."
  spec.license       = "Apache-2.0"
end