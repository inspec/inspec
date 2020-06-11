# Copyright 2015 Google Inc.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'date'
require 'google/apis/core/base_service'
require 'google/apis/core/json_representation'
require 'google/apis/core/hashable'
require 'google/apis/errors'

module Google
  module Apis
    module CloudprofilerV2
      
      # CreateProfileRequest describes a profile resource online creation request.
      # The deployment field must be populated. The profile_type specifies the list
      # of profile types supported by the agent. The creation call will hang until a
      # profile of one of these types needs to be collected.
      class CreateProfileRequest
        include Google::Apis::Core::Hashable
      
        # Deployment contains the deployment identification information.
        # Corresponds to the JSON property `deployment`
        # @return [Google::Apis::CloudprofilerV2::Deployment]
        attr_accessor :deployment
      
        # One or more profile types that the agent is capable of providing.
        # Corresponds to the JSON property `profileType`
        # @return [Array<String>]
        attr_accessor :profile_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deployment = args[:deployment] if args.key?(:deployment)
          @profile_type = args[:profile_type] if args.key?(:profile_type)
        end
      end
      
      # Deployment contains the deployment identification information.
      class Deployment
        include Google::Apis::Core::Hashable
      
        # Labels identify the deployment within the user universe and same target.
        # Validation regex for label names: `^[a-z0-9]([a-z0-9-]`0,61`[a-z0-9])?$`.
        # Value for an individual label must be <= 512 bytes, the total
        # size of all label names and values must be <= 1024 bytes.
        # Label named "language" can be used to record the programming language of
        # the profiled deployment. The standard choices for the value include "java",
        # "go", "python", "ruby", "nodejs", "php", "dotnet".
        # For deployments running on Google Cloud Platform, "zone" or "region" label
        # should be present describing the deployment location. An example of a zone
        # is "us-central1-a", an example of a region is "us-central1" or
        # "us-central".
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Project ID is the ID of a cloud project.
        # Validation regex: `^a-z`4,61`[a-z0-9]$`.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Target is the service name used to group related deployments:
        # * Service name for GAE Flex / Standard.
        # * Cluster and container name for GKE.
        # * User-specified string for direct GCE profiling (e.g. Java).
        # * Job name for Dataflow.
        # Validation regex: `^[a-z]([-a-z0-9_.]`0,253`[a-z0-9])?$`.
        # Corresponds to the JSON property `target`
        # @return [String]
        attr_accessor :target
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @labels = args[:labels] if args.key?(:labels)
          @project_id = args[:project_id] if args.key?(:project_id)
          @target = args[:target] if args.key?(:target)
        end
      end
      
      # Profile resource.
      class Profile
        include Google::Apis::Core::Hashable
      
        # Deployment contains the deployment identification information.
        # Corresponds to the JSON property `deployment`
        # @return [Google::Apis::CloudprofilerV2::Deployment]
        attr_accessor :deployment
      
        # Duration of the profiling session.
        # Input (for the offline mode) or output (for the online mode).
        # The field represents requested profiling duration. It may slightly differ
        # from the effective profiling duration, which is recorded in the profile
        # data, in case the profiling can't be stopped immediately (e.g. in case
        # stopping the profiling is handled asynchronously).
        # Corresponds to the JSON property `duration`
        # @return [String]
        attr_accessor :duration
      
        # Input only. Labels associated to this specific profile. These labels will
        # get merged with the deployment labels for the final data set.  See
        # documentation on deployment labels for validation rules and limits.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. Opaque, server-assigned, unique ID for this profile.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Input only. Profile bytes, as a gzip compressed serialized proto, the
        # format is https://github.com/google/pprof/blob/master/proto/profile.proto.
        # Corresponds to the JSON property `profileBytes`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :profile_bytes
      
        # Type of profile.
        # For offline mode, this must be specified when creating the profile. For
        # online mode it is assigned and returned by the server.
        # Corresponds to the JSON property `profileType`
        # @return [String]
        attr_accessor :profile_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @deployment = args[:deployment] if args.key?(:deployment)
          @duration = args[:duration] if args.key?(:duration)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @profile_bytes = args[:profile_bytes] if args.key?(:profile_bytes)
          @profile_type = args[:profile_type] if args.key?(:profile_type)
        end
      end
    end
  end
end
