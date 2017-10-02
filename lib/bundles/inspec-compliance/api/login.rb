# encodeing: utf-8
# author: Christoph Hartmann
# author: Dominik Ricter
# author: Jerry Aldrich

module Login
  def login(options)
    options['server_type'] = Compliance::API.determine_server_type(options['server'], options['insecure'])

    return Login::ComplianceServer.login(options) if options['server_type'] == 'compliance'
    verify_thor_options(options)

    options['url'] = options['server'] + '/compliance'
    token = options['dctoken'] || options['token']
    puts store_access_token(options, token)
  end

  private

  def store_access_token(options, token)
    token_info = { type: 'dctoken', msg: 'data colletor token' } if options['dctoken']
    token_info = { type: 'usertoken', msg: 'automate user token' } if options['token']

    config = Compliance::Configuration.new

    config.clean

    config['automate'] = {}
    config['automate']['ent'] = options['ent']
    config['automate']['token_type'] = token_info[:type]
    config['server'] = options['url']
    config['user'] = options['user']
    config['insecure'] = options['insecure'] || false
    config['server_type'] = options['server_type']

    config['token'] = token
    config['version'] = Compliance::API.version(config)
    config.store
    "Stored configuration for Chef Automate: '#{config['server']}' with user: '#{config['user']}', ent: '#{config['automate']['ent']}' and your #{token_info[:msg]}"
  end

  # Automate login requires `--ent`, `--user`, and either `--token` or `--dctoken`
  def verify_thor_options(o)
    error_msg = []

    error_msg.push('Please specify a server using `inspec compliance login https://SERVER`') if o['server'].nil?
    error_msg.push('Please specify a user using `--user=\'USER\'`') if o['user'].nil?
    error_msg.push('Please specify an enterprise using `--ent=\'automate\'`') if o['ent'].nil?

    if o['token'].nil? && o['dctoken'].nil?
      error_msg.push('Please specify a token using `--token=\'AUTOMATE_TOKEN\'` or `--dctoken=\'DATA_COLLECTOR_TOKEN\'`')
    end

    raise ArgumentError, error_msg.join("\n") unless error_msg.empty?
  end
end

module Login::ComplianceServer
  def self.login(options)
    compliance_verify_thor_options(options)

    options['url'] = options['server'] + '/api'

    if options['user'] && options['token']
      success = true
      msg = compliance_store_access_token(options, options['token'])
    elsif options['user'] && options['password']
      success, msg = compliance_login_user_pass(options)
    elsif options['refresh_token']
      success, msg = compliance_login_refresh_token(options)
    end

    raise msg unless success

    puts msg
  end

  def self.compliance_login_user_pass(options)
    success, msg, token = Compliance::API.get_token_via_password(
      options['url'],
      options['user'],
      options['password'],
      options['insecure'],
    )
    msg += "\n" + compliance_store_access_token(options, token) if success

    [success, msg]
  end

  def self.compliance_login_refresh_token(options)
    success, msg, token = Compliance::API.get_token_via_refresh_token(
      options['url'],
      options['refresh_token'],
      options['insecure'],
    )
    msg += "\n" + compliance_store_access_token(options, token) if success

    [success, msg]
  end

  def self.compliance_store_access_token(options, token)
    config = Compliance::Configuration.new
    config.clean

    config['user'] = options['user'] if options['user']
    config['server'] = options['url']
    config['insecure'] = options['insecure'] || false
    config['server_type'] = options['server_type']
    config['token'] = token
    config['version'] = Compliance::API.version(config)

    config.store

    'API access token stored'
  end

  # Compliance login requires `--user` or `--refresh_token`
  # If `--user` then either `--password`, `--token`, or `--refresh-token`, is required
  def self.compliance_verify_thor_options(o)
    error_msg = []

    error_msg.push('Please specify a server using `inspec compliance login https://SERVER`') if o['server'].nil?

    if o['user'].nil? && o['refresh_token'].nil?
      error_msg.push('Please specify a `--user=\'USER\'` or a `--refresh-token=\'TOKEN\'`')
    end

    if o['user'] && o['password'].nil? && o['token'].nil? && o['refresh_token'].nil?
      error_msg.push('Please specify either a `--password`, `--token`, or `--refresh-token`')
    end

    raise ArgumentError, error_msg.join("\n") unless error_msg.empty?
  end
end
