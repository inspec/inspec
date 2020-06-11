#--
# Author:: Daniel DeLeo (<dan@chef.io>)
# Author:: John Keiser (<jkeiser@chef.io>)
# Copyright:: Copyright (c) 2011-2016 Chef Software, Inc.
# License:: Apache License, Version 2.0
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

require "win32/process"

# Add new constants for Logon
module Process::Constants
  private

  LOGON32_LOGON_INTERACTIVE = 0x00000002
  LOGON32_LOGON_BATCH = 0x00000004
  LOGON32_PROVIDER_DEFAULT = 0x00000000
  UOI_NAME = 0x00000002

  WAIT_OBJECT_0    = 0
  WAIT_TIMEOUT     = 0x102
  WAIT_ABANDONED   = 128
  WAIT_ABANDONED_0 = WAIT_ABANDONED
  WAIT_FAILED      = 0xFFFFFFFF

  ERROR_PRIVILEGE_NOT_HELD = 1314
  ERROR_LOGON_TYPE_NOT_GRANTED = 0x569

  # Only documented in Userenv.h ???
  # - ZERO (type Local) is assumed, no docs found
  WIN32_PROFILETYPE_LOCAL                  = 0x00
  WIN32_PROFILETYPE_PT_TEMPORARY           = 0x01
  WIN32_PROFILETYPE_PT_ROAMING             = 0x02
  WIN32_PROFILETYPE_PT_MANDATORY           = 0x04
  WIN32_PROFILETYPE_PT_ROAMING_PREEXISTING = 0x08

end

# Structs required for data handling
module Process::Structs

  class PROFILEINFO < FFI::Struct
    layout(
      :dwSize,        :dword,
      :dwFlags,       :dword,
      :lpUserName,    :pointer,
      :lpProfilePath, :pointer,
      :lpDefaultPath, :pointer,
      :lpServerName,  :pointer,
      :lpPolicyPath,  :pointer,
      :hProfile,      :handle
    )
  end

end

# Define the functions needed to check with Service windows station
module Process::Functions
  ffi_lib :userenv

  attach_pfunc :GetProfileType,
    [:pointer], :bool

  attach_pfunc :LoadUserProfileW,
    %i{handle pointer}, :bool

  attach_pfunc :UnloadUserProfile,
    %i{handle handle}, :bool

  ffi_lib :advapi32

  attach_pfunc :LogonUserW,
    %i{buffer_in buffer_in buffer_in ulong ulong pointer}, :bool

  attach_pfunc :CreateProcessAsUserW,
    %i{ulong buffer_in buffer_inout pointer pointer int
      ulong buffer_in buffer_in pointer pointer}, :bool

  ffi_lib :user32

  attach_pfunc :GetProcessWindowStation,
    [], :ulong

  attach_pfunc :GetUserObjectInformationA,
    %i{ulong uint buffer_out ulong pointer}, :bool
end

# Override Process.create to check for running in the Service window station and doing
# a full logon with LogonUser, instead of a CreateProcessWithLogon
# Cloned from https://github.com/djberg96/win32-process/blob/ffi/lib/win32/process.rb
# as of 2015-10-15 from commit cc066e5df25048f9806a610f54bf5f7f253e86f7
module Process

  class UnsupportedFeature < StandardError; end

  # Explicitly reopen singleton class so that class/constant declarations from
  # extensions are visible in Modules.nesting.
  class << self

    def create(args)
      create3(args).first
    end

    def create3(args)
      unless args.is_a?(Hash)
        raise TypeError, "hash keyword arguments expected"
      end

      valid_keys = %w{
        app_name command_line inherit creation_flags cwd environment
        startup_info thread_inherit process_inherit close_handles with_logon
        domain password elevated
      }

      valid_si_keys = %w{
        startf_flags desktop title x y x_size y_size x_count_chars
        y_count_chars fill_attribute sw_flags stdin stdout stderr
      }

      # Set default values
      hash = {
        "app_name" => nil,
        "creation_flags" => 0,
        "close_handles" => true,
      }

      # Validate the keys, and convert symbols and case to lowercase strings.
      args.each do |key, val|
        key = key.to_s.downcase
        unless valid_keys.include?(key)
          raise ArgumentError, "invalid key '#{key}'"
        end

        hash[key] = val
      end

      si_hash = {}

      # If the startup_info key is present, validate its subkeys
      if hash["startup_info"]
        hash["startup_info"].each do |key, val|
          key = key.to_s.downcase
          unless valid_si_keys.include?(key)
            raise ArgumentError, "invalid startup_info key '#{key}'"
          end

          si_hash[key] = val
        end
      end

      # The +command_line+ key is mandatory unless the +app_name+ key
      # is specified.
      unless hash["command_line"]
        if hash["app_name"]
          hash["command_line"] = hash["app_name"]
          hash["app_name"] = nil
        else
          raise ArgumentError, "command_line or app_name must be specified"
        end
      end

      env = nil

      # The env string should be passed as a string of ';' separated paths.
      if hash["environment"]
        env = hash["environment"]

        unless env.respond_to?(:join)
          env = hash["environment"].split(File::PATH_SEPARATOR)
        end

        env = env.map { |e| e + 0.chr }.join("") + 0.chr
        env.to_wide_string! if hash["with_logon"]
      end

      # Process SECURITY_ATTRIBUTE structure
      process_security = nil

      if hash["process_inherit"]
        process_security = SECURITY_ATTRIBUTES.new
        process_security[:nLength] = 12
        process_security[:bInheritHandle] = 1
      end

      # Thread SECURITY_ATTRIBUTE structure
      thread_security = nil

      if hash["thread_inherit"]
        thread_security = SECURITY_ATTRIBUTES.new
        thread_security[:nLength] = 12
        thread_security[:bInheritHandle] = 1
      end

      # Automatically handle stdin, stdout and stderr as either IO objects
      # or file descriptors. This won't work for StringIO, however. It also
      # will not work on JRuby because of the way it handles internal file
      # descriptors.
      #
      %w{stdin stdout stderr}.each do |io|
        if si_hash[io]
          if si_hash[io].respond_to?(:fileno)
            handle = get_osfhandle(si_hash[io].fileno)
          else
            handle = get_osfhandle(si_hash[io])
          end

          if handle == INVALID_HANDLE_VALUE
            ptr = FFI::MemoryPointer.new(:int)

            if windows_version >= 6 && get_errno(ptr) == 0
              errno = ptr.read_int
            else
              errno = FFI.errno
            end

            raise SystemCallError.new("get_osfhandle", errno)
          end

          # Most implementations of Ruby on Windows create inheritable
          # handles by default, but some do not. RF bug #26988.
          bool = SetHandleInformation(
            handle,
            HANDLE_FLAG_INHERIT,
            HANDLE_FLAG_INHERIT
          )

          raise SystemCallError.new("SetHandleInformation", FFI.errno) unless bool

          si_hash[io] = handle
          si_hash["startf_flags"] ||= 0
          si_hash["startf_flags"] |= STARTF_USESTDHANDLES
          hash["inherit"] = true
        end
      end

      procinfo  = PROCESS_INFORMATION.new
      startinfo = STARTUPINFO.new

      unless si_hash.empty?
        startinfo[:cb]              = startinfo.size
        startinfo[:lpDesktop]       = si_hash["desktop"] if si_hash["desktop"]
        startinfo[:lpTitle]         = si_hash["title"] if si_hash["title"]
        startinfo[:dwX]             = si_hash["x"] if si_hash["x"]
        startinfo[:dwY]             = si_hash["y"] if si_hash["y"]
        startinfo[:dwXSize]         = si_hash["x_size"] if si_hash["x_size"]
        startinfo[:dwYSize]         = si_hash["y_size"] if si_hash["y_size"]
        startinfo[:dwXCountChars]   = si_hash["x_count_chars"] if si_hash["x_count_chars"]
        startinfo[:dwYCountChars]   = si_hash["y_count_chars"] if si_hash["y_count_chars"]
        startinfo[:dwFillAttribute] = si_hash["fill_attribute"] if si_hash["fill_attribute"]
        startinfo[:dwFlags]         = si_hash["startf_flags"] if si_hash["startf_flags"]
        startinfo[:wShowWindow]     = si_hash["sw_flags"] if si_hash["sw_flags"]
        startinfo[:cbReserved2]     = 0
        startinfo[:hStdInput]       = si_hash["stdin"] if si_hash["stdin"]
        startinfo[:hStdOutput]      = si_hash["stdout"] if si_hash["stdout"]
        startinfo[:hStdError]       = si_hash["stderr"] if si_hash["stderr"]
      end

      app = nil
      cmd = nil

      # Convert strings to wide character strings if present
      if hash["app_name"]
        app = hash["app_name"].to_wide_string
      end

      if hash["command_line"]
        cmd = hash["command_line"].to_wide_string
      end

      if hash["cwd"]
        cwd = hash["cwd"].to_wide_string
      end

      inherit = hash["inherit"] ? 1 : 0

      if hash["with_logon"]

        logon, passwd, domain = format_creds_from_hash(hash)

        hash["creation_flags"] |= CREATE_UNICODE_ENVIRONMENT

        winsta_name = get_windows_station_name

        # If running in the service windows station must do a log on to get
        # to the interactive desktop. The running process user account must have
        # the 'Replace a process level token' permission.  This is necessary as
        # the logon (which happens with CreateProcessWithLogon) must have an
        # interactive windows station to attach to, which is created with the
        # LogonUser call with the LOGON32_LOGON_INTERACTIVE flag.
        #
        # User Access Control (UAC) only applies to interactive logons, so we
        # can simulate running a command 'elevated' by running it under a separate
        # logon as a batch process.
        if hash["elevated"] || winsta_name =~ /^Service-0x0-.*$/i

          logon_type = hash["elevated"] ? LOGON32_LOGON_BATCH : LOGON32_LOGON_INTERACTIVE
          token      = logon_user(logon, domain, passwd, logon_type)
          logon_ptr  = FFI::MemoryPointer.from_string(logon)
          profile    = PROFILEINFO.new.tap do |dat|
            dat[:dwSize]     = dat.size
            dat[:dwFlags]    = 1
            dat[:lpUserName] = logon_ptr
          end

          if logon_has_roaming_profile?
            msg = %w{
              Mixlib does not currently support executing commands as users
              configured with Roaming Profiles. [%s]
            }.join(" ") % logon.encode("UTF-8").unpack("A*")
            raise UnsupportedFeature.new(msg)
          end

          load_user_profile(token, profile.pointer)

          create_process_as_user(token, app, cmd, process_security,
            thread_security, inherit, hash["creation_flags"], env,
            cwd, startinfo, procinfo)

        else

          create_process_with_logon(logon, domain, passwd, LOGON_WITH_PROFILE,
            app, cmd, hash["creation_flags"], env, cwd, startinfo, procinfo)

        end

      else

        create_process(app, cmd, process_security, thread_security, inherit,
          hash["creation_flags"], env, cwd, startinfo, procinfo)

      end

      # Automatically close the process and thread handles in the
      # PROCESS_INFORMATION struct unless explicitly told not to.
      if hash["close_handles"]
        CloseHandle(procinfo[:hProcess])
        CloseHandle(procinfo[:hThread])
        # Clear these fields so callers don't attempt to close the handle
        # which can result in the wrong handle being closed or an
        # exception in some circumstances.
        procinfo[:hProcess] = 0
        procinfo[:hThread] = 0
      end

      process = ProcessInfo.new(
        procinfo[:hProcess],
        procinfo[:hThread],
        procinfo[:dwProcessId],
        procinfo[:dwThreadId]
      )

      [ process, profile, token ]
    end

    # See Process::Constants::WIN32_PROFILETYPE
    def logon_has_roaming_profile?
      get_profile_type >= 2
    end

    def get_profile_type
      ptr = FFI::MemoryPointer.new(:uint)
      unless GetProfileType(ptr)
        raise SystemCallError.new("GetProfileType", FFI.errno)
      end

      ptr.read_uint
    end

    def load_user_profile(token, profile_ptr)
      unless LoadUserProfileW(token, profile_ptr)
        raise SystemCallError.new("LoadUserProfileW", FFI.errno)
      end

      true
    end

    def unload_user_profile(token, profile)
      if profile[:hProfile] == 0
        warn "\n\nWARNING: Profile not loaded\n"
      else
        unless UnloadUserProfile(token, profile[:hProfile])
          raise SystemCallError.new("UnloadUserProfile", FFI.errno)
        end
      end
      true
    end

    def create_process_as_user(token, app, cmd, process_security,
      thread_security, inherit, creation_flags, env, cwd, startinfo, procinfo)

      bool = CreateProcessAsUserW(
        token,            # User token handle
        app,              # App name
        cmd,              # Command line
        process_security, # Process attributes
        thread_security,  # Thread attributes
        inherit,          # Inherit handles
        creation_flags,   # Creation Flags
        env,              # Environment
        cwd,              # Working directory
        startinfo,        # Startup Info
        procinfo          # Process Info
      )

      unless bool
        msg = case FFI.errno
              when ERROR_PRIVILEGE_NOT_HELD
                [
                  %{CreateProcessAsUserW (User '%s' must hold the 'Replace a process},
                  %{level token' and 'Adjust Memory Quotas for a process' permissions.},
                  %{Logoff the user after adding this right to make it effective.)},
                ].join(" ") % ::ENV["USERNAME"]
              else
                "CreateProcessAsUserW failed."
              end
        raise SystemCallError.new(msg, FFI.errno)
      end
    end

    def create_process_with_logon(logon, domain, passwd, logon_flags, app, cmd,
      creation_flags, env, cwd, startinfo, procinfo)

      bool = CreateProcessWithLogonW(
        logon,           # User
        domain,          # Domain
        passwd,          # Password
        logon_flags,     # Logon flags
        app,             # App name
        cmd,             # Command line
        creation_flags,  # Creation flags
        env,             # Environment
        cwd,             # Working directory
        startinfo,       # Startup Info
        procinfo         # Process Info
      )

      unless bool
        raise SystemCallError.new("CreateProcessWithLogonW", FFI.errno)
      end
    end

    def create_process(app, cmd, process_security, thread_security, inherit,
      creation_flags, env, cwd, startinfo, procinfo)

      bool = CreateProcessW(
        app,               # App name
        cmd,               # Command line
        process_security,  # Process attributes
        thread_security,   # Thread attributes
        inherit,           # Inherit handles?
        creation_flags,    # Creation flags
        env,               # Environment
        cwd,               # Working directory
        startinfo,         # Startup Info
        procinfo           # Process Info
      )

      unless bool
        raise SystemCallError.new("CreateProcessW", FFI.errno)
      end
    end

    def logon_user(user, domain, passwd, type, provider = LOGON32_PROVIDER_DEFAULT)
      token = FFI::MemoryPointer.new(:ulong)

      bool = LogonUserW(
        user,                       # User
        domain,                     # Domain
        passwd,                     # Password
        type,                       # Logon Type
        provider,                   # Logon Provider
        token                       # User token handle
      )

      unless bool
        if (FFI.errno == ERROR_LOGON_TYPE_NOT_GRANTED) && (type == LOGON32_LOGON_BATCH)
          user_utf8 = user.encode( "UTF-8", invalid: :replace, undef: :replace, replace: "" ).delete("\0")
          raise SystemCallError.new("LogonUserW (User '#{user_utf8}' must hold 'Log on as a batch job' permissions.)", FFI.errno)
        else
          raise SystemCallError.new("LogonUserW", FFI.errno)
        end
      end

      token.read_ulong
    end

    def get_windows_station_name
      winsta_name = FFI::MemoryPointer.new(:char, 256)
      return_size = FFI::MemoryPointer.new(:ulong)

      bool = GetUserObjectInformationA(
        GetProcessWindowStation(),  # Window station handle
        UOI_NAME,                   # Information to get
        winsta_name,                # Buffer to receive information
        winsta_name.size,           # Size of buffer
        return_size                 # Size filled into buffer
      )

      unless bool
        raise SystemCallError.new("GetUserObjectInformationA", FFI.errno)
      end

      winsta_name.read_string(return_size.read_ulong)
    end

    def format_creds_from_hash(hash)
      logon = hash["with_logon"].to_wide_string

      if hash["password"]
        passwd = hash["password"].to_wide_string
      else
        raise ArgumentError, "password must be specified if with_logon is used"
      end

      if hash["domain"]
        domain = hash["domain"].to_wide_string
      end

      [ logon, passwd, domain ]
    end

  end
end
