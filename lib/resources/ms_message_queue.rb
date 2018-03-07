# encoding: utf-8

require 'utils/pinvoke_wrapper'

module Inspec::Resources
  # NOTE: This resource (currently) only works with private queues on the localhost. It supports Windows 2008r2 up to 2016
  class MicrosoftMessageQueue < Inspec.resource(1)
    name 'ms_message_queue'
    supports platform: 'windows'
    desc <<-EOH
      Provides visibility into a Microsoft Message Queue
    EOH

    example <<-EOH
      describe ms_message_queue('.\\private$\\MyQueueHere') do
        it { should exist }
        its('QueueName') { should eq 'MyQueueHere' }
        it { should be_allowed('full-control', by_user: 'MyComputerName\\MyAwesomeUser') }
      end
    EOH

    PERMISSIONS = {
      'full-control' => 'MQSEC_QUEUE_GENERIC_ALL',
      'read' => 'MQSEC_QUEUE_GENERIC_READ',
      'write' => 'MQSEC_QUEUE_GENERIC_WRITE',

      'take-ownership' => 'MQSEC_TAKE_QUEUE_OWNERSHIP',
      'delete-queue' => 'MQSEC_DELETE_QUEUE',
      'delete-journal' => 'MQSEC_DELETE_JOURNAL_MESSAGE',
      'peek' => 'MQSEC_PEEK_MESSAGE',
      'read-permission' => 'MQSEC_GET_QUEUE_PERMISSIONS',
      'change-permission' => 'MQSEC_CHANGE_QUEUE_PERMISSIONS',
      'read-property' => 'MQSEC_GET_QUEUE_PROPERTiES',
      'write-property' => 'MQSEC_SET_QUEUE_PROPERTIES',
      'read-journal' => 'MQSEC_RECEIVE_JOURNAL_MESSAGE',
      'read-message' => 'MQSEC_RECEIVE_MESSAGE',
      'write-message' => 'MQSEC_WRITE_MESSAGE',
      'delete-message' => 'MQSEC_DELETE_MESSAGE',
    }.freeze

    def initialize(path)
      @path = path
      generate_cache
    end

    def to_s
      "Message Queue #{@path.inspect}"
    end

    def method_missing(method, *)
      if @cache.respond_to?(:keys) && @cache.keys.include?(method.to_s.downcase)
        return @cache[method.to_s.downcase]
      end

      super
    end

    def respond_to_missing?(method, *)
      if @cache.respond_to?(:keys)
        return true if @cache.keys.include?(method.to_s.downcase)
      end

      super
    end

    def exists?
      !@cache.nil?
    end

    # If negating `#denied?`, use this method instead. A lot may be lost serializing and deserializing the
    # binary values, so it's best to just have PowerShell handle the comparison.
    def allowed?(permission, opts = {})
      script = allowed_wrapper(permission, opts) + "\n\n"
      script += 'If (($mask -band $target_perm) -eq $target_perm) { Exit 98; } Else { Exit 99; }'

      cmd = inspec.powershell(script)

      case cmd.exit_status
      when 98 then return true
      when 99 then return false
      else
        # It should never reach here, but for debugging, this will be left in
        obj = {
          code: cmd.exit_status,
          stderr: cmd.stderr,
          stdout: cmd.stdout,
        }
        raise "Problem with P/Invoke: #{obj.inspect}"
      end
    end

    # If negating `#allowed?`, use this method instead. A lot may be lost serializing and deserializing the
    # binary values, so it's best to just have PowerShell handle the comparison.
    def denied?(permission, opts = {})
      script = allowed_wrapper(permission, opts) + "\n\n"
      script += 'If (($mask -band $target_perm) -ne $target_perm) { Exit 98; } Else { Exit 99; }'

      cmd = inspec.powershell(script)

      case cmd.exit_status
      when 98 then return true
      when 99 then return false
      else
        # It should never reach here, but for debugging, this will be left in
        obj = {
          code: cmd.exit_status,
          stderr: cmd.stderr,
          stdout: cmd.stdout,
        }
        raise "Problem with P/Invoke: #{obj.inspect}"
      end
    end

    private

    def allowed_wrapper(permission, opts)
      user = opts.fetch(:by_user) { current_user }.gsub(/^\.\\/) { current_computer_name + '\\' }

      computer_name = @path.split('\\').first
      queue_name = @path.split('\\').tap(&:shift).join('\\').gsub(/^private\%\\/i, '')

      <<-EOH
        #{PInvokeWrapper.wrap('MSMQSecurity.cs')}
        $path = New-Object -TypeName MSMQSecurity.QueuePath -ArgumentList '#{computer_name}','#{queue_name}'
        $mask = [MSMQSecurity.MSMQSecurity]::GetAccessMask($path, '#{user}')
        $target_perm = [MSMQSecurity.MQQUEUEACCESSMASK]::#{PERMISSIONS.fetch(permission)}
      EOH
    end

    def generate_cache # rubocop:disable Metrics/MethodLength
      script = <<-EOH
        Add-Type -AssemblyName 'System.Messaging'
        If (![System.Messaging.MessageQueue]::Exists("#{@path}")) { Exit 0 }
        $queues = [System.Messaging.MessageQueue]::GetPrivateQueuesByMachine(".")
        $out = [PSCustomObject]@{
          AccessMode = if ($my_queue.AccessMode -eq $null) { $null } else { $my_queue.AccessMode.ToString() }
          Authenticate = $my_queue.Authenticate
          BasePriority = $my_queue.BasePriority
          CanRaiseEvents = $my_queue.CanRaiseEvents
          CanRead = $my_queue.CanRead
          CanWrite = $my_queue.CanWrite
          Container = $my_queue.Container
          CreateTime = if ($my_queue.CreateTime -eq $null) { $null } else { $my_queue.CreateTime.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffffffZ") }
          DefaultPropertiesToSend = [PSCustomObject]@{
            AcknowledgeType = if ($my_queue.DefaultPropertiesToSend.AcknowledgeType -eq $null) { $null } else { $my_queue.DefaultPropertiesToSend.AcknowledgeType.ToString() }
            AdministrationQueue = $my_queue.DefaultPropertiesToSend.AdministrationQueue
            AppSpecific = $my_queue.DefaultPropertiesToSend.AppSpecific
            AttachSenderId = $my_queue.DefaultPropertiesToSend.AttachSenderId
            EncryptionAlgorithm = if ($my_queue.DefaultPropertiesToSend.EncryptionAlgorithm -eq $null) { $null } else { $my_queue.DefaultPropertiesToSend.EncryptionAlgorithm.ToString() }
            Extension = $my_queue.DefaultPropertiesToSend.Extension
            HashAlgorithm = if ($my_queue.DefaultPropertiesToSend.HashAlgorithm -eq $null) { $null } else { $my_queue.DefaultPropertiesToSend.HashAlgorithm.ToString() }
            Label = $my_queue.DefaultPropertiesToSend.Label
            Priority = if ($my_queue.DefaultPropertiesToSend.Priority -eq $null) { $null } else { $my_queue.DefaultPropertiesToSend.Priority.ToString() }
            Recoverable = $my_queue.DefaultPropertiesToSend.Recoverable
            ResponseQueue = $my_queue.DefaultPropertiesToSend.ResponseQueue
            TimeToBeReceived = $my_queue.DefaultPropertiesToSend.TimeToBeReceived
            TimeToReachQueue = $my_queue.DefaultPropertiesToSend.TimeToReachQueue
            TransactionStatusQueue = $my_queue.DefaultPropertiesToSend.TransactionStatusQueue
            UseAuthentication = $my_queue.DefaultPropertiesToSend.UseAuthentication
            UseDeadLetterQueue = $my_queue.DefaultPropertiesToSend.UseDeadLetterQueue
            UseEncryption = $my_queue.DefaultPropertiesToSend.UseEncryption
            UseJournalQueue = $my_queue.DefaultPropertiesToSend.UseJournalQueue
            UseTracing = $my_queue.DefaultPropertiesToSend.UseTracing
          }
          DenySharedReceive = $my_queue.DenySharedReceive
          DesignMode = $my_queue.DesignMode
          EnableConnectionCache = $my_queue.EnableConnectionCache
          EncryptionRequired = if ($my_queue.EncryptionRequired -eq $null) { $null } else { $my_queue.EncryptionRequired.ToString() }
          Events = $my_queue.Events
          FormatName = $my_queue.FormatName
          Formatter = $my_queue.Formatter
          Id = if ($my_queue.Id -eq $null) { $null } else { $my_queue.Id.ToString() }
          Label = $my_queue.Label
          LastModifyTime = if ($my_queue.LastModifyTime -eq $null) { $null } else { $my_queue.LastModifyTime.ToUniversalTime().ToString("yyyy-MM-ddTHH:mm:ss.fffffffZ") }
          MachineName = $my_queue.MachineName
          MaximumJournalSize = $my_queue.MaximumJournalSize
          MaximumQueueSize = $my_queue.MaximumQueueSize
          MessageReadPropertyFilter = $my_queue.MessageReadPropertyFilter
          MulticastAddress = $my_queue.MulticastAddress
          Path = $my_queue.Path
          QueueName = $my_queue.QueueName
          ReadHandle = $my_queue.ReadHandle
          Site = $my_queue.Site
          SynchronizingObject = $my_queue.SynchronizingObject
          Transactional = $my_queue.Transactional
          UseJournalQueue = $my_queue.UseJournalQueue
          WriteHandle = $my_queue.WriteHandle
        }
        Write-Host $(ConvertTo-JSON -InputObject $out -Compress)
      EOH

      @cache = run_cmd(script)
    end

    def run_cmd(script)
      cmd = inspec.powershell(script)
      raise "Unexpected command exit code #{cmd.exit_status.inspect}" unless [nil, 0].include? cmd.exit_status
      data = {}
      out = JSON.parse(cmd.stdout)

      if out.respond_to? :fetch
        out.each do |key, value|
          data[key.to_s.downcase] = value
        end
      else
        data = out
      end

      data
    rescue JSON::ParserError
      nil
    end

    def current_user
      @current_user ||= run_cmd('Write-Host $($env:UserDomain + "\" + $env:UserName | ConvertTo-JSON -Compress)').strip
    end

    def current_computer_name
      @current_computer_name ||= inspec.powershell('Write-Host $env:COMPUTERNAME').stdout.strip
    end
  end
end
