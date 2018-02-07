class AwsRouteTable < Inspec.resource(1)
  name 'aws_route_table'
  desc 'Verifies settings for an AWS Route Table'
  example "
    describe aws_route_table do
      its('route_table_id') { should cmp 'rtb-2c60ec44' }
    end
  "

  include AwsResourceMixin

  def to_s
    "Route Table #{@route_table_id}"
  end

  attr_reader :route_table_id, :vpc_id

  private

  def validate_params(raw_params)
    validated_params = check_resource_param_names(
      raw_params: raw_params,
      allowed_params: [:route_table_id],
      allowed_scalar_name: :route_table_id,
      allowed_scalar_type: String,
    )

    if validated_params.key?(:route_table_id) && validated_params[:route_table_id] !~ /^rtb\-[0-9a-f]{8}/
      raise ArgumentError, 'aws_route_table Route Table ID must be in the' \
       ' format "rtb-" followed by 8 hexadecimal characters.'
    end

    validated_params
  end

  def fetch_from_aws
    backend = AwsRouteTable::BackendFactory.create

    if @route_table_id.nil?
      args = nil
    else
      args = { filters: [{ name: 'route-table-id', values: [@route_table_id] }] }
    end

    resp = backend.describe_route_tables(args)
    routetable = resp.to_h[:route_tables]
    @exists = !routetable.empty?
  end

  class Backend
    class AwsClientApi
      BackendFactory.set_default_backend(self)

      def describe_route_tables(query)
        AWSConnection.new.ec2_client.describe_route_tables(query)
      end
    end
  end
end
