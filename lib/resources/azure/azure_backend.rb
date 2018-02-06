# frozen_string_literal: true

require 'ms_rest_azure'
require 'azure_mgmt_resources'
require 'inifile'
require 'inspec'

# Class to manage the connection to Azure to retrieve the information required about the resources
#
# @author Russell Seymour
#
# @attr_reader [String] subscription_id ID of the subscription in which resources are to be tested
class AzureConnection
  attr_reader :subscription_id, :apis

  # Constructor which reads in the credentials file
  #
  # @author Russell Seymour
  def initialize
    # Ensure that the apis is a hash table
    @apis = {}

    # If an INSPEC_AZURE_CREDS environment has been specified set the
    # the credentials file to that, otherwise set the one in home
    azure_creds_file = ENV['AZURE_CREDS_FILE']
    if azure_creds_file.nil?

      # The environment file has not be set, so default to one in the home directory
      azure_creds_file = File.join(Dir.home, '.azure', 'credentials')
    end

    # Check to see if the credentials file exists
    if File.file?(azure_creds_file)
      @credentials = IniFile.load(File.expand_path(azure_creds_file))
    else
      @credentials = nil
      warn format('%s was not found or not accessible', azure_creds_file)
    end
  end

  # Connect to Azure using the specified credentials
  #
  # @author Russell Seymour
  def client
    # If a connection already exists then return it
    return @client if defined?(@client)

    creds = spn

    # Create a new connection
    token_provider = MsRestAzure::ApplicationTokenProvider.new(creds[:tenant_id], creds[:client_id], creds[:client_secret])
    token_creds = MsRest::TokenCredentials.new(token_provider)

    # Create the options hash
    options = {
      credentials: token_creds,
      subscription_id: azure_subscription_id,
      tenant_id: creds[:tenant_id],
      client_id: creds[:client_id],
      client_secret: creds[:client_secret],
    }

    @client = Azure::Resources::Profiles::Latest::Mgmt::Client.new(options)
  end

  # Method to retrieve the SPN credentials
  # This is also used by the Rakefile to get the necessary creds to run the tests on the environment
  # that has been created
  #
  # @author Russell Seymour
  def spn
    @subscription_id = azure_subscription_id

    # Check that the credential exists
    unless @credentials.nil?
      raise format('The specified Azure Subscription cannot be found in your credentials: %s', subscription_id) unless @credentials.sections.include?(subscription_id)
    end

    # Determine the client_id, tenant_id and the client_secret
    tenant_id = ENV['AZURE_TENANT_ID'] || @credentials[subscription_id]['tenant_id']
    client_id = ENV['AZURE_CLIENT_ID'] || @credentials[subscription_id]['client_id']
    client_secret = ENV['AZURE_CLIENT_SECRET'] || @credentials[subscription_id]['client_secret']

    # Return hash of the SPN information
    { subscription_id: subscription_id, client_id: client_id, client_secret: client_secret, tenant_id: tenant_id }
  end

  # Returns the api version for the specified resource type
  #
  # If an api version has been specified in the options then the apis version table is updated
  # with that value and it is returned
  #
  # However if it is not specified, or multiple types are being interrogated then this method
  # will interrogate Azure for each of the types versions and pick the latest one. This is added
  # to the apis table so that it can be retrieved quickly again of another one of those resources
  # is encountered again in the resource collection.
  #
  # @param string resource_type The resource type for which the API is required
  # @param hash options Options have that have been passed to the resource during the test.
  # @option opts [String] :group_name Resource group name
  # @option opts [String] :type Azure resource type
  # @option opts [String] :name Name of specific resource to look for
  # @option opts [String] :apiversion If looking for a specific item or type specify the api version to use
  #
  # @return string API Version of the specified resource type
  def get_api_version(resource_type, options)
    # if an api version has been set in the options, add to the apis hashtable with
    # the resource type
    if options[:apiversion]
      apis[resource_type] = options[:apiversion]
    else
      # only attempt to get the api version from Azure if the resource type
      # is not present in the apis hashtable
      unless apis.key?(resource_type)

        # determine the namespace for the resource type
        namespace, type = resource_type.split(%r{/})

        provider = client.providers.get(namespace)

        # get the latest API version for the type
        # assuming that this is the first one in the list
        api_versions = (provider.resource_types.find { |v| v.resource_type == type }).api_versions
        apis[resource_type] = api_versions[0]

      end
    end

    # return the api version for the type
    apis[resource_type]
  end

  private

  # Return the subscrtiption ID to use
  #
  # @author Russell Seymour
  def azure_subscription_id
    # If a subscription has been specified as an environment variable use that
    # If an index has been specified with AZURE_SUBSCRIPTION_INDEX attempt to use that value
    # Otherwise use the first entry in the file
    if !ENV['AZURE_SUBSCRIPTION_ID'].nil?
      id = ENV['AZURE_SUBSCRIPTION_ID']
    elsif !ENV['AZURE_SUBSCRIPTION_NUMBER'].nil?

      subscription_number = ENV['AZURE_SUBSCRIPTION_NUMBER'].to_i
      subscription_index = subscription_number - 1

      # Check that the specified index is not greater than the number of subscriptions
      if subscription_number > @credentials.sections.length
        raise format('Your credentials file only contains %s subscriptions.  You specified number %s.', @credentials.sections.length, subscription_number)
      end

      id = @credentials.sections[subscription_index]
    else
      id = @credentials.sections[0]
    end

    # Return the ID to the calling function
    id
  end
end

# Base class for Azure Resources. This allows the generic class to work
# as well as the specific target resources for Azure Resources
#
# @author Russell Seymour
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
      group_name: 'AZURE_RESOURCE_GROUP_NAME',
      name: 'AZURE_RESOURCE_NAME',
      type: 'AZURE_RESOURCE_TYPE',
      apiversion: 'AZURE_RESOURCE_API_VERSION',
    }
    option_var_names.each do |option_name, env_var_name|
      opts[option_name] = ENV[env_var_name] unless ENV[env_var_name].nil?
    end

    @azure = AzureConnection.new
    @client = azure.client
  end

  # Return information about the resource group
  def resource_group
    resource_group = client.resource_groups.get(opts[:group_name])

    # create the methods for the resource group object
    dm = AzureResourceDynamicMethods.new
    dm.create_methods(self, resource_group)
  end

  def resources
    resources = client.resources.list_by_resource_group(opts[:group_name])

    # filter the resources based on the type, and the name if they been specified
    resources = filter_resources(resources, opts)

    # if there is one resource then define methods on this class
    if resources.count == 1
      @total = 1

      # get the apiversion for the resource, if one has not been specified
      apiversion = azure.get_api_version(resources[0].type, opts)

      # get the resource by id so it can be interrogated
      resource = client.resources.get_by_id(resources[0].id, apiversion)

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
  # rubocop:disable Style/MultilineIfModifier
  #
  # @author Russell Seymour
  def create_tag_methods
    # Iterate around the items of the tags and create the necessary access methods
    tags.item.each do |name, value|
      method_name = format('%s_tag', name)
      define_singleton_method method_name do
        value
      end
    end if defined?(tags.item)
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
        create_method(object, var.to_s.delete('@'), data.instance_variable_get(var))
      end
    # When the data is a Hash object iterate around each of the key value pairs and
    # craete a method for each one.
    when 'Hash'
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
    when 'String', 'Integer', 'TrueClass', 'FalseClass', 'Fixnum'
      object.define_singleton_method name do
        value
      end
    when 'Hash'
      value.count.zero? ? return_value = value : return_value = AzureResourceProbe.new(value)
      object.define_singleton_method name do
        return_value
      end
    when /^Azure::Resources::Mgmt::.*::Models::ResourceGroupProperties$/
      # This is a special case where the properties of the resource group is not a simple JSON model
      # This is because the plugin is using the Azure SDK to get this information so it is an SDK object
      # that has to be interrogated in a different way. This is the only object type that behaves like this
      value.instance_variables.each do |var|
        create_method(object, var.to_s.delete('@'), value.instance_variable_get(var))
      end
    when 'Array'
      # Some things are just string or integer arrays
      # Check this by seeing if the first element is a string / integer / boolean or
      # a hashtable
      # This may not be the best methid, but short of testing all elements in the array, this is
      # the quickest test
      case value[0].class.to_s
      when 'String', 'Integer', 'TrueClass', 'FalseClass', 'Fixnum'
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
    camel_case_data = data.split('_').inject([]) { |buffer, e| buffer.push(buffer.empty? ? e : e.capitalize) }.join

    # Ensure that gb (as in gigabytes) is uppercased
    camel_case_data.gsub(/[gb]/, &:upcase)
  end
end
