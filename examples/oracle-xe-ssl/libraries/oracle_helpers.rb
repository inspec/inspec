# encoding: utf-8
# copyright: 2024, Chef Software, Inc.
# Oracle Database Helper Functions for InSpec Profiles

# Helper module for common Oracle database operations
module OracleHelpers
  # Check if a TNS alias exists in tnsnames.ora
  # @param tns_admin_path [String] Path to directory containing tnsnames.ora
  # @param alias_name [String] TNS alias name to check
  # @return [Boolean] true if alias exists, false otherwise
  def tns_alias_exists?(tns_admin_path, alias_name)
    return false if tns_admin_path.nil? || alias_name.nil?
    
    tnsnames_file = File.join(tns_admin_path, 'tnsnames.ora')
    return false unless File.exist?(tnsnames_file)
    
    content = File.read(tnsnames_file)
    content.match?(/^\s*#{Regexp.escape(alias_name)}\s*=/mi)
  end
  
  # Check if Oracle wallet files exist
  # @param wallet_path [String] Path to wallet directory
  # @return [Boolean] true if wallet files exist, false otherwise
  def wallet_configured?(wallet_path)
    return false if wallet_path.nil?
    return false unless Dir.exist?(wallet_path)
    
    # Check for auto-login wallet file
    cwallet = File.join(wallet_path, 'cwallet.sso')
    File.exist?(cwallet)
  end
  
  # Parse Oracle version string
  # @param version_banner [String] Version banner from v$version
  # @return [Hash] Hash with :major, :minor, :patch version numbers
  def parse_oracle_version(version_banner)
    # Example: "Oracle Database 21c Express Edition Release 21.0.0.0.0 - Production"
    match = version_banner.match(/Release\s+(\d+)\.(\d+)\.(\d+)/)
    if match
      {
        major: match[1].to_i,
        minor: match[2].to_i,
        patch: match[3].to_i,
        full: "#{match[1]}.#{match[2]}.#{match[3]}"
      }
    else
      nil
    end
  end
  
  # Check if Oracle is XE (Express Edition)
  # @param version_banner [String] Version banner from v$version
  # @return [Boolean] true if XE, false otherwise
  def oracle_xe?(version_banner)
    version_banner&.include?('Express Edition')
  end
  
  # Get recommended connection parameters based on environment
  # @param use_ssl [Boolean] Whether to use SSL/TCPS
  # @return [Hash] Recommended connection parameters
  def recommended_connection_params(use_ssl: false)
    params = {
      debug: false,
      env: {}
    }
    
    # Add TNS_ADMIN if tnsnames.ora location is provided
    if input('tns_admin_path')
      params[:env]['TNS_ADMIN'] = input('tns_admin_path')
    end
    
    # Add library path if provided
    if input('ld_library_path')
      params[:env]['LD_LIBRARY_PATH'] = input('ld_library_path')
    end
    
    # Add ORACLE_HOME if provided
    if input('oracle_home')
      params[:env]['ORACLE_HOME'] = input('oracle_home')
    end
    
    # Use TNS alias if configured
    if use_ssl && input('tns_alias_tcps')
      params[:tns_alias] = input('tns_alias_tcps')
    elsif input('tns_alias_tcp')
      params[:tns_alias] = input('tns_alias_tcp')
    else
      # Fallback to host:port/service
      params[:host] = input('oracle_host')
      params[:port] = input('oracle_port')
      params[:service] = input('oracle_service')
    end
    
    params
  end
  
  # Validate Oracle connection parameters
  # @param params [Hash] Connection parameters
  # @return [Array<String>] Array of validation errors (empty if valid)
  def validate_connection_params(params)
    errors = []
    
    # Must have user and password
    errors << 'Missing user' if params[:user].nil? || params[:user].empty?
    errors << 'Missing password' if params[:password].nil? || params[:password].empty?
    
    # Must have either TNS alias or host/service
    has_tns = params[:tns_alias] && !params[:tns_alias].empty?
    has_host = params[:host] && params[:service]
    
    unless has_tns || has_host
      errors << 'Must provide either tns_alias or (host and service)'
    end
    
    # If TNS alias is used, TNS_ADMIN should be set
    if has_tns && (params[:env].nil? || params[:env]['TNS_ADMIN'].nil?)
      errors << 'TNS_ADMIN environment variable should be set when using tns_alias'
    end
    
    errors
  end
  
  # Get Oracle error code from error message
  # @param error_message [String] Oracle error message
  # @return [String, nil] Error code (e.g., "ORA-12154") or nil
  def extract_oracle_error_code(error_message)
    match = error_message&.match(/(ORA-\d{5}|SP2-\d{4})/)
    match ? match[1] : nil
  end
  
  # Check if error is a connection error
  # @param error_message [String] Oracle error message
  # @return [Boolean] true if connection error
  def connection_error?(error_message)
    error_code = extract_oracle_error_code(error_message)
    return false if error_code.nil?
    
    # Common connection error codes
    connection_errors = %w[
      ORA-12154  # TNS:could not resolve
      ORA-12514  # TNS:listener does not know of service
      ORA-12541  # TNS:no listener
      ORA-12545  # Connect failed because target host or object does not exist
      ORA-28759  # Wallet error
      ORA-01017  # Invalid username/password
    ]
    
    connection_errors.include?(error_code)
  end
  
  # Format Oracle query result for display
  # @param result [DatabaseHelper::SQLQueryResult] Query result
  # @return [String] Formatted output
  def format_query_result(result)
    return '' if result.rows.empty?
    
    # Get column names
    cols = result.rows.first.keys
    
    # Build output
    output = []
    output << cols.join("\t")
    output << ('-' * 60)
    
    result.rows.each do |row|
      output << cols.map { |col| row[col] }.join("\t")
    end
    
    output.join("\n")
  end
end

# Make helpers available to controls
::Inspec::Describe.send(:include, OracleHelpers)
