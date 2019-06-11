# Base class for Azure Resources. This allows the generic class to work
# as well as the specific target resources for Azure Resources
#
# @author Russell Seymour
module Inspec::Resources
  class AzureResourceBase < Inspec.resource(1)
    attr_reader :opts, :client, :azure

    # Constructor that retreives the specified resource
    #
    # The opts hash should contain the following
    #   :group_name - name of the resource group in which to look for items
    #   :type - the type of Azure resource to look for
    #   :apiversion - API version to use when looking for a specific resource
    #   :name - name of the resource to find
    #
    # @author Russell Seymour
    #
    # @param [Hash] opts Hashtable of options as highlighted above
    # rubocop:disable Metrics/AbcSize
    def initialize(opts)
      # declare the hashtable of counts
      @counts = {}
      @total = 0
      @opts = opts

      # Determine if the environment variables for the options have been set
      option_var_names = {
        group_name: "AZURE_RESOURCE_GROUP_NAME",
        name: "AZURE_RESOURCE_NAME",
        type: "AZURE_RESOURCE_TYPE",
        apiversion: "AZURE_RESOURCE_API_VERSION",
      }
      option_var_names.each do |option_name, env_var_name|
        opts[option_name] = ENV[env_var_name] unless ENV[env_var_name].nil?
      end

      @azure = inspec.backend
      @client = azure.azure_client
      @failed_resource = false
    end

    def failed_resource?
      @failed_resource
    end

    def catch_azure_errors
      yield
    rescue MsRestAzure::AzureOperationError => e
      # e.message is actually a massive stringified JSON, which might be useful in the future.
      # You want error_message here.
      fail_resource e.error_message
      @failed_resource = true
      nil
    end

    # Return information about the resource group
    def resource_group
      catch_azure_errors do
        resource_group = client.resource_groups.get(opts[:group_name])

        # create the methods for the resource group object
        dm = AzureResourceDynamicMethods.new
        dm.create_methods(self, resource_group)
      end
    end

    def resources
      resources = nil
      catch_azure_errors do
        resources = client.resources.list_by_resource_group(opts[:group_name])
      end
      return if failed_resource?

      # filter the resources based on the type, and the name if they been specified
      resources = filter_resources(resources, opts)

      # if there is one resource then define methods on this class
      if resources.count == 1
        @total = 1

        resource = nil
        catch_azure_errors do
          # get the apiversion for the resource, if one has not been specified
          apiversion = azure.get_api_version(resources[0].type, opts)

          # get the resource by id so it can be interrogated
          resource = client.resources.get_by_id(resources[0].id, apiversion)
        end
        return if failed_resource?

        dm = AzureResourceDynamicMethods.new

        dm.create_methods(self, resource)
      else

        # As there are many resources, parse each one so that it can be
        # interrogated by the FilterTable
        # @probes = parse_resources(resources, azure)
        @probes = resources.each.map do |item|
          # update the total
          @total += 1

          # determine the counts for each type
          namespace, type_name = item.type.split(/\./)
          counts.key?(namespace) ? false : counts[namespace] = {}
          counts[namespace].key?(type_name) ? counts[namespace][type_name] += 1 : counts[namespace][type_name] = 1

          # get the detail about the resource
          apiversion = azure.get_api_version(item.type, opts)
          resource = client.resources.get_by_id(item.id, apiversion)

          # parse the resource
          parse_resource(resource)
        end.compact

        # Iterate around the counts and create the necessary classes
        counts.each do |namespace, ns_counts|
          define_singleton_method namespace do
            AzureResourceTypeCounts.new(ns_counts)
          end
        end
      end
    end

    # Does the resource have any tags?
    #
    # If it is a Hashtable then it does not, because there was nothing to parse so there is not
    # a nested object to work with
    #
    # @author Russell Seymour
    def has_tags?
      tags.is_a?(Hash) ? false : true
    end

    # Returns how many tags have been set on the resource
    #
    # @author Russell Seymour
    def tag_count
      tags.count
    end

    # It is necessary to be able to test the tags of a resource. It is possible to say of the
    # resource has tags or not, and it is possible to check that the tags include a specific tag
    # However the value is not accessible, this function creates methods for all the tags that
    # are available.
    #
    # The format of the method name is '<TAG_NAME>_tag' and will return the value of that tag
    #
    # Disabling rubopcop check. If this is set as a normal if..then..end statement there is a
    # violation stating it should use a guard. When using a guard it throws this error
    #
    # @author Russell Seymour
    def create_tag_methods
      # Iterate around the items of the tags and create the necessary access methods
      if defined?(tags.item)
        tags.item.each do |name, value|
          method_name = format("%s_tag", name)
          define_singleton_method method_name do
            value
          end
        end
      end
    end

    private

    # Filter the resources that are returned by the options that have been specified
    #
    def filter_resources(resources, opts)
      if opts[:type] && opts[:name]
        resources.select { |r| r.type == opts[:type] && r.name == opts[:name] }
      elsif opts[:type]
        resources.select { |r| r.type == opts[:type] }
      elsif opts[:name]
        resources.select { |r| r.name == opts[:name] }
      else
        resources
      end
    end
  end
end

# Class to create methods on the calling object at run time.
# Each of the Azure Resources have different attributes and properties, and they all need
# to be testable. To do this no methods are hardcoded, each on is craeted based on the
# information returned from Azure.
#
# The class is a helper class essentially as it creates the methods on the calling class
# rather than itself. This means that there is less duplication of code and it can be
# reused easily.
#
# @author Russell Seymour
# @since 0.2.0
class AzureResourceDynamicMethods
  # Given the calling object and its data, create the methods on the object according
  # to the data that has been retrieved. Various types of data can be returned so the method
  # checks the type to ensure that the necessary methods are configured correctly
  #
  # @param AzureResourceProbe|AzureResource object The object on which the methods should be craeted
  # @param variant data The data from which the methods should be created
  def create_methods(object, data)
    # Check the type of data as this affects the setup of the methods
    # If it is an Azure Generic Resource then setup methods for each of
    # the instance variables
    case data.class.to_s
    when /^Azure::Resources::Mgmt::.*::Models::GenericResource$/,
         /^Azure::Resources::Mgmt::.*::Models::ResourceGroup$/
      # iterate around the instance variables
      data.instance_variables.each do |var|
        create_method(object, var.to_s.delete("@"), data.instance_variable_get(var))
      end
    # When the data is a Hash object iterate around each of the key value pairs and
    # craete a method for each one.
    when "Hash"
      data.each do |key, value|
        create_method(object, key, value)
      end
    end
  end

  private

  # Method that is responsible for creating the method on the calling object. This is
  # because some nesting maybe required. For example of the value is a Hash then it will
  # need to have an AzureResourceProbe create for each key, whereas if it is a simple
  # string then the value just needs to be returned
  #
  # @private
  #
  # @param AzureResourceProbe|AzureResource object Object on which the methods need to be created
  # @param string name The name of the method
  # @param variant value The value that needs to be returned by the method
  def create_method(object, name, value)
    # Create the necessary method based on the var that has been passed
    # Test the value for its type so that the method can be setup correctly
    case value.class.to_s
    when "String", "Integer", "TrueClass", "FalseClass", "Fixnum"
      object.define_singleton_method name do
        value
      end
    when "Hash"
      value.count.zero? ? return_value = value : return_value = AzureResourceProbe.new(value)
      object.define_singleton_method name do
        return_value
      end
    when /^Azure::Resources::Mgmt::.*::Models::ResourceGroupProperties$/
      # This is a special case where the properties of the resource group is not a simple JSON model
      # This is because the plugin is using the Azure SDK to get this information so it is an SDK object
      # that has to be interrogated in a different way. This is the only object type that behaves like this
      value.instance_variables.each do |var|
        create_method(object, var.to_s.delete("@"), value.instance_variable_get(var))
      end
    when "Array"
      # Some things are just string or integer arrays
      # Check this by seeing if the first element is a string / integer / boolean or
      # a hashtable
      # This may not be the best methid, but short of testing all elements in the array, this is
      # the quickest test
      case value[0].class.to_s
      when "String", "Integer", "TrueClass", "FalseClass", "Fixnum"
        probes = value
      else
        probes = []
        value.each do |value_item|
          probes << AzureResourceProbe.new(value_item)
        end
      end
      object.define_singleton_method name do
        probes
      end
    end
  end
end

# Class object to maintain a count of the Azure Resource types that are found
# when a less specific test is carried out. For example if all the resoures of a resource
# group are called for, there will be variaous types and number of those types.
#
# Each type is namespaced, so for example a virtual machine has the type 'Microsoft.Compute/virtualMachines'
# This is broken down into the 'Microsoft' class with the type 'Compute/virtualMachines'
# This has been done for two reasons:
#  1. Enable the dotted notation to work in the test
#  2. Allow third party resource types ot be catered for if they are ever enabled by Microsoft
#
# @author Russell Seymour
# @since 0.2.0
class AzureResourceTypeCounts
  # Constructor to setup a new class for a specific Azure Resource type.
  # It should be passed a hashtable with information such as:
  #   {
  #     "Compute/virtualMachines" => 2,
  #     "Network/networkInterfaces" => 3
  #   }
  # This will result in two methods being created on the class:
  #  - Compute/virtualNetworks
  #  - Network/networkInterfaces
  # Each of which will return the corresponding count value
  #
  # @param Hash counts Hash table of types and the count of each one
  #
  # @return AzureResourceTypeCounts
  def initialize(counts)
    counts.each do |type, count|
      define_singleton_method type do
        count
      end
    end
  end
end

# Class object that is created for each element that is returned by Azure.
# This is what is interogated by Inspec. If they are nested hashes, then this results
# in nested AzureResourceProbe objects.
#
# For example, if the following was seen in an Azure Resource
#    properties -> storageProfile -> imageReference
# Would result in the following nestec classes
#    AzureResource -> AzureResourceProbe -> AzureResourceProbe
#
# The methods for each of the classes are dynamically defined at run time and will
# match the items that are retrieved from Azure. See the 'test/integration/verify/controls' for
# examples
#
# This class will not be called externally
#
# @author Russell Seymour
# @since 0.2.0
# @attr_reader string name Name of the Azure resource
# @attr_reader string type Type of the Azure Resource
# @attr_reader string location Location in Azure of the resource
class AzureResourceProbe
  attr_reader :name, :type, :location, :item, :count

  # Initialize method for the class. Accepts an item, be it a scalar value, hash or Azure object
  # It will then create the necessary dynamic methods so that they can be called in the tests
  # This is accomplished by call the AzureResourceDynamicMethods
  #
  # @param varaint The item from which the class will be initialized
  #
  # @return AzureResourceProbe
  def initialize(item)
    dm = AzureResourceDynamicMethods.new
    dm.create_methods(self, item)

    # Set the item as a property on the class
    # This is so that it is possible to interrogate what has been added to the class and isolate them from
    # the standard methods that a Ruby class has.
    # This used for checking Tags on a resource for example
    # It also allows direct access if so required
    @item = item

    # Set how many items have been set
    @count = item.length
  end

  # Allows resources to respond to the include test
  # This means that things like tags can be checked for and then their value tested
  #
  # @author Russell Seymour
  #
  # @param [String] key Name of the item to look for in the @item property
  def include?(key)
    @item.key?(key)
  end

  # Give a sting like `computer_name` return the camelCase version, e.g.
  # computerName
  #
  # @param string data Data that needs to be converted from snake_case to camelCase
  #
  # @return string
  def camel_case(data)
    camel_case_data = data.split("_").inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join

    # Ensure that gb (as in gigabytes) is uppercased
    camel_case_data.gsub(/[gb]/, &:upcase)
  end
end
