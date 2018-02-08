# Intended to be pulled in via extend, not include
module AwsBackendFactoryMixin
  def create(inspec)
    @selected_backend.new(inspec)
  end

  def select(klass)
    @selected_backend = klass
  end

  alias set_default_backend select
end
