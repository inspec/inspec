class AwsBackendBase
  attr_reader :aws_transport
  class << self; attr_accessor :aws_client_class end

  def initialize(inspec = nil)
    @aws_transport = inspec ? inspec.backend : nil
  end

  def aws_service_client
    aws_transport.aws_client(self.class.aws_client_class)
  end
end
