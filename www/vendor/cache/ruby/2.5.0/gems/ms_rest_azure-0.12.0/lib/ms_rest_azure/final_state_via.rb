# encoding: utf-8
# Copyright (c) Microsoft Corporation. All rights reserved.
# Licensed under the MIT License. See License.txt in the project root for license information.

module MsRestAzure
  #
  # Class which represents a final state via of Azure long running operation.
  #
  class FinalStateVia
    NONE = -1
    DEFAULT = 0
    AZURE_ASYNC_OPERATION = 0
    LOCATION = 1
    ORIGINAL_URI = 2
  end
end