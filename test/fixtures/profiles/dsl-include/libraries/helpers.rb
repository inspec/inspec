module Helpers
  def custom_helper
  end
end

::Inspec::DSL.include(Helpers)
