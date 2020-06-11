require 'active_support/time'
require 'timecop'
require 'timeliness'
require 'timeliness/core_ext'

module TimelinessHelpers
  def parser
    Timeliness::Parser
  end

  def definitions
    Timeliness::Definitions
  end

  def parse(*args)
    Timeliness::Parser.parse(*args)
  end

  def current_date(options={})
    Timeliness::Parser.send(:current_date, options)
  end

  def should_parse(*args)
    expect(Timeliness::Parser.parse(*args)).not_to be_nil
  end

  def should_not_parse(*args)
    expect(Timeliness::Parser.parse(*args)).to be_nil
  end
end

I18n.available_locales = ['en', 'es']

RSpec.configure do |c|
  c.mock_with :rspec
  c.include TimelinessHelpers
end