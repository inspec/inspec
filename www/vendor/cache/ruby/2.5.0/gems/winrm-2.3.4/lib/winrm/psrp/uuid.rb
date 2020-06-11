# Copyright 2016 Shawn Neal <sneal@sneal.net>
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

module WinRM
  module PSRP
    # UUID helper methods
    module UUID
      # Format a UUID into a GUID compatible byte array for Windows
      #
      # https://msdn.microsoft.com/en-us/library/windows/desktop/aa373931(v=vs.85).aspx
      # typedef struct _GUID {
      #   DWORD Data1;
      #   WORD  Data2;
      #   WORD  Data3;
      #   BYTE  Data4[8];
      # } GUID;
      #
      # @param uuid [String] Canonical hex format with hypens.
      # @return [Array<byte>] UUID in a Windows GUID compatible byte array layout.
      def uuid_to_windows_guid_bytes(uuid)
        return [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] unless uuid

        b = uuid.scan(/[0-9a-fA-F]{2}/).map { |x| x.to_i(16) }
        b[0..3].reverse + b[4..5].reverse + b[6..7].reverse + b[8..15]
      end
    end
  end
end
