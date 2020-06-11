# Copyright 2010 Dan Wanek <dan.wanek@gmail.com>
# Copyright 2016 Shawn Neal <sneal@sneal.net>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

module WinRM
  module WSMV
    # WSMV SOAP namespaces mixin
    module SOAP
      NS_SOAP_ENV    = 's'.freeze   # http://www.w3.org/2003/05/soap-envelope
      NS_ADDRESSING  = 'a'.freeze   # http://schemas.xmlsoap.org/ws/2004/08/addressing
      NS_CIMBINDING  = 'b'.freeze   # http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd
      NS_ENUM        = 'n'.freeze   # http://schemas.xmlsoap.org/ws/2004/09/enumeration
      NS_TRANSFER    = 'x'.freeze   # http://schemas.xmlsoap.org/ws/2004/09/transfer
      NS_WSMAN_DMTF  = 'w'.freeze   # http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd
      NS_WSMAN_MSFT  = 'p'.freeze   # http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd
      NS_SCHEMA_INST = 'xsi'.freeze # http://www.w3.org/2001/XMLSchema-instance
      NS_WIN_SHELL   = 'rsp'.freeze # http://schemas.microsoft.com/wbem/wsman/1/windows/shell
      NS_WSMAN_FAULT = 'f'.freeze   # http://schemas.microsoft.com/wbem/wsman/1/wsmanfault
      NS_WSMAN_CONF  = 'cfg'.freeze # http://schemas.microsoft.com/wbem/wsman/1/config

      def namespaces
        @namespaces ||= {
          'xmlns:xsd' => 'http://www.w3.org/2001/XMLSchema',
          'xmlns:xsi' => 'http://www.w3.org/2001/XMLSchema-instance',
          'xmlns:env' => 'http://www.w3.org/2003/05/soap-envelope',
          "xmlns:#{NS_ADDRESSING}" => 'http://schemas.xmlsoap.org/ws/2004/08/addressing',
          "xmlns:#{NS_CIMBINDING}" => 'http://schemas.dmtf.org/wbem/wsman/1/cimbinding.xsd',
          "xmlns:#{NS_ENUM}" => 'http://schemas.xmlsoap.org/ws/2004/09/enumeration',
          "xmlns:#{NS_TRANSFER}" => 'http://schemas.xmlsoap.org/ws/2004/09/transfer',
          "xmlns:#{NS_WSMAN_DMTF}" => 'http://schemas.dmtf.org/wbem/wsman/1/wsman.xsd',
          "xmlns:#{NS_WSMAN_MSFT}" => 'http://schemas.microsoft.com/wbem/wsman/1/wsman.xsd',
          "xmlns:#{NS_WIN_SHELL}" => 'http://schemas.microsoft.com/wbem/wsman/1/windows/shell',
          "xmlns:#{NS_WSMAN_CONF}" => 'http://schemas.microsoft.com/wbem/wsman/1/config'
        }
      end
    end
  end
end
