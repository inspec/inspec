require 'helper'

class TestAwsEc2Instances < Minitest::Test

#=============================================================================#
#                              Mocked Objects
#=============================================================================#

  def setup
    @mock_conn = Minitest::Mock.new
    @mock_client = Minitest::Mock.new
    # @mock_resource = Minitest::Mock.new
    # @mock_iam_resource = Minitest::Mock.new

    @mock_conn.expect(:ec2_client, @mock_client)
    @mock_client.expect(:describe_instances, fixture_described_instances, [Hash])
  end



#=============================================================================#
#                                  Tests
#=============================================================================#


  def test_direct_parsing_of_api_data
    assert_equal ['i-0c0c0c0c0c0c0c0c0'],
    AwsEc2Instances.new(nil, @mock_conn).instance_id
  end

  def test_filtered_parsing_of_api_data
    assert_equal ['i-0c0c0c0c0c0c0c0c0'],
    AwsEc2Instances.new(nil, @mock_conn).where().instance_id
  end

  def test_filter_by_param_match
    assert_equal ['i-0c0c0c0c0c0c0c0c0'],
    AwsEc2Instances.new(nil, @mock_conn).where(
      instance_id:'i-0c0c0c0c0c0c0c0c0'
    ).instance_id
  end

  def test_filter_by_param_no_match
    assert_equal [],
    AwsEc2Instances.new(nil, @mock_conn).where(
      instance_id:'i-00000000000000000'
    ).instance_id
  end

  def test_filter_by_block_match
    assert_equal ['i-0c0c0c0c0c0c0c0c0'],
    AwsEc2Instances.new(nil, @mock_conn).where{
      instance_id == 'i-0c0c0c0c0c0c0c0c0' && public_ip_address != nil
    }.instance_id
  end

  def test_filter_by_block_no_match
    assert_equal [],
    AwsEc2Instances.new(nil, @mock_conn).where{
      instance_id == 'i-0c000000000000000' && public_ip_address != nil
    }.instance_id
  end

  def test_entries_count
    assert_equal 1,
    AwsEc2Instances.new(nil, @mock_conn).entries.count
  end

  def test_entries_empty
    assert_equal false,
    AwsEc2Instances.new(nil, @mock_conn).entries.empty?
  end

#=============================================================================#
#                              Test Fixtures
#=============================================================================#

  # Extend OpenStruct to support use of #key? method by ::FilterTable
  class OpenStructPatched < OpenStruct
    def key?(keyname)
      to_h.key? keyname
    end
  end

  # Slightly anonymised example response from ec2's decribe_instances
  def fixture_described_instances
    OpenStructPatched.new(
      reservations: [

        OpenStructPatched.new(
          groups: [],
          instances: [

            OpenStructPatched.new(
              ami_launch_index: 0,
              image_id: "ami-d7aab2b3",
              instance_id: "i-0c0c0c0c0c0c0c0c0",
              instance_type: "m4.large",
              kernel_id: nil,
              key_name: "beelzebub",
              launch_time: '2018-02-15 14:18:39 UTC',
              monitoring: OpenStructPatched.new( state: "disabled" ),
              placement: OpenStructPatched.new( availability_zone: "eu-west-2c", affinity: nil, group_name: "", host_id: nil, tenancy: "default", spread_domain: nil ),
              platform: nil,
              private_dns_name: "ip-10-0-1-210.eu-west-2.compute.internal",
              private_ip_address: "10.0.1.210",
              product_codes: [],
              public_dns_name: "",
              public_ip_address: "35.177.17.103",
              ramdisk_id: nil,
              state: OpenStruct.new(code: 16, name: "running"),
              state_transition_reason: "",
              subnet_id: "subnet-f70a0000",
              vpc_id: "vpc-5ef00000",
              architecture: "x86_64",
              block_device_mappings: [

                OpenStructPatched.new(
                  device_name: "/dev/sda1",

                  ebs: OpenStructPatched.new(
                    attach_time: '2018-02-15 14:18:39 UTC',
                    delete_on_termination: true,
                    status: "attached",
                    volume_id: "vol-0499bf20f11930000"
                  )

                )

              ],
              client_token: "",
              ebs_optimized: false,
              ena_support: true,
              hypervisor: "xen",
              iam_instance_profile: nil,
              instance_lifecycle: nil,
              elastic_gpu_associations: [],
              network_interfaces: [

                OpenStructPatched.new(
                  association: OpenStructPatched.new( ip_owner_id: "amazon", public_dns_name: "", public_ip: "35.177.17.103" ),
                  attachment: OpenStructPatched.new( attach_time: '2018-02-15 14:18:39 UTC', attachment_id: "eni-attach-f3e90000", delete_on_termination: true, device_index: 0, status: "attached" ),
                  description: "",
                  groups: [ OpenStructPatched.new( group_name: "beelzebub-group", group_id: "sg-65a60000" ) ],
                  ipv_6_addresses: [],
                  mac_address: "02:d4:24:d1:8a:f0",
                  network_interface_id: "eni-a1c5e6fd",
                  owner_id: "496323860000",
                  private_dns_name: nil,
                  private_ip_address: "10.0.1.210",
                  private_ip_addresses: [

                    OpenStructPatched.new(
                      association: OpenStructPatched.new( ip_owner_id: "amazon", public_dns_name: "", public_ip: "35.177.17.103" ),
                      primary: true, private_dns_name: nil, private_ip_address: "10.0.1.210"
                    )

                  ],
                  source_dest_check: true,
                  status: "in-use",
                  subnet_id: "subnet-f7000000",
                  vpc_id: "vpc-5ef00000"
                )

              ],
              root_device_name: "/dev/sda1",
              root_device_type: "ebs",
              security_groups: [
                  {group_name: "afd-london-412fd3e1-national-parks", group_id: "sg-65a6ff0d"}
              ],
              source_dest_check: true,
              spot_instance_request_id: nil,
              sriov_net_support: nil,
              state_reason: nil,
              tags: [

                OpenStructPatched.new( key: "X-Contact", value: "beelzebub-london" ),
                OpenStructPatched.new( key: "Name",      value: "beelzebub" ),
                OpenStructPatched.new( key: "X-Dept",    value: "SCE" )

              ],
              virtualization_type: "hvm"
            )

          ]
        )
      ],
      next_token: nil
    )
  end
end
