class Basic < Inspec.resource(1)
  name 'basic'

  def resource_id
    super("42")
  end
end
