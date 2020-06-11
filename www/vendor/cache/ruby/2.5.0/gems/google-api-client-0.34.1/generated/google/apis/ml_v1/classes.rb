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
    module MlV1
      
      # Message that represents an arbitrary HTTP body. It should only be used for
      # payload formats that can't be represented as JSON, such as raw binary or
      # an HTML page.
      # This message can be used both in streaming and non-streaming API methods in
      # the request as well as the response.
      # It can be used as a top-level request field, which is convenient if one
      # wants to extract parameters from either the URL or HTTP template into the
      # request fields and also want access to the raw HTTP body.
      # Example:
      # message GetResourceRequest `
      # // A unique request id.
      # string request_id = 1;
      # // The raw HTTP body is bound to this field.
      # google.api.HttpBody http_body = 2;
      # `
      # service ResourceService `
      # rpc GetResource(GetResourceRequest) returns (google.api.HttpBody);
      # rpc UpdateResource(google.api.HttpBody) returns
      # (google.protobuf.Empty);
      # `
      # Example with streaming methods:
      # service CaldavService `
      # rpc GetCalendar(stream google.api.HttpBody)
      # returns (stream google.api.HttpBody);
      # rpc UpdateCalendar(stream google.api.HttpBody)
      # returns (stream google.api.HttpBody);
      # `
      # Use of this type only changes how the request and response bodies are
      # handled, all other features will continue to work unchanged.
      class GoogleApiHttpBody
        include Google::Apis::Core::Hashable
      
        # The HTTP Content-Type header value specifying the content type of the body.
        # Corresponds to the JSON property `contentType`
        # @return [String]
        attr_accessor :content_type
      
        # The HTTP request/response body as raw binary.
        # Corresponds to the JSON property `data`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :data
      
        # Application specific response metadata. Must be set in the first response
        # for streaming APIs.
        # Corresponds to the JSON property `extensions`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :extensions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content_type = args[:content_type] if args.key?(:content_type)
          @data = args[:data] if args.key?(:data)
          @extensions = args[:extensions] if args.key?(:extensions)
        end
      end
      
      # An observed value of a metric.
      class GoogleCloudMlV1HyperparameterOutputHyperparameterMetric
        include Google::Apis::Core::Hashable
      
        # The objective value at this training step.
        # Corresponds to the JSON property `objectiveValue`
        # @return [Float]
        attr_accessor :objective_value
      
        # The global training step for this metric.
        # Corresponds to the JSON property `trainingStep`
        # @return [Fixnum]
        attr_accessor :training_step
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @objective_value = args[:objective_value] if args.key?(:objective_value)
          @training_step = args[:training_step] if args.key?(:training_step)
        end
      end
      
      # Represents a hardware accelerator request config.
      # Note that the AcceleratorConfig can be used in both Jobs and Versions.
      # Learn more about [accelerators for training](/ml-engine/docs/using-gpus) and
      # [accelerators for online
      # prediction](/ml-engine/docs/machine-types-online-prediction#gpus).
      class GoogleCloudMlV1AcceleratorConfig
        include Google::Apis::Core::Hashable
      
        # The number of accelerators to attach to each machine running the job.
        # Corresponds to the JSON property `count`
        # @return [Fixnum]
        attr_accessor :count
      
        # The type of accelerator to use.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @count = args[:count] if args.key?(:count)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Options for automatically scaling a model.
      class GoogleCloudMlV1AutoScaling
        include Google::Apis::Core::Hashable
      
        # Optional. The minimum number of nodes to allocate for this model. These
        # nodes are always up, starting from the time the model is deployed.
        # Therefore, the cost of operating this model will be at least
        # `rate` * `min_nodes` * number of hours since last billing cycle,
        # where `rate` is the cost per node-hour as documented in the
        # [pricing guide](/ml-engine/docs/pricing),
        # even if no predictions are performed. There is additional cost for each
        # prediction performed.
        # Unlike manual scaling, if the load gets too heavy for the nodes
        # that are up, the service will automatically add nodes to handle the
        # increased load as well as scale back as traffic drops, always maintaining
        # at least `min_nodes`. You will be charged for the time in which additional
        # nodes are used.
        # If `min_nodes` is not specified and AutoScaling is used with a [legacy
        # (MLS1) machine type](/ml-engine/docs/machine-types-online-prediction),
        # `min_nodes` defaults to 0, in which case, when traffic to a model stops
        # (and after a cool-down period), nodes will be shut down and no charges will
        # be incurred until traffic to the model resumes.
        # If `min_nodes` is not specified and AutoScaling is used with a [Compute
        # Engine (N1) machine type](/ml-engine/docs/machine-types-online-prediction),
        # `min_nodes` defaults to 1. `min_nodes` must be at least 1 for use with a
        # Compute Engine machine type.
        # Note that you cannot use AutoScaling if your version uses
        # [GPUs](#Version.FIELDS.accelerator_config). Instead, you must use
        # ManualScaling.
        # You can set `min_nodes` when creating the model version, and you can also
        # update `min_nodes` for an existing version:
        # <pre>
        # update_body.json:
        # `
        # 'autoScaling': `
        # 'minNodes': 5
        # `
        # `
        # </pre>
        # HTTP request:
        # <pre style="max-width: 626px;">
        # PATCH
        # https://ml.googleapis.com/v1/`name=projects/*/models/*/versions/*`?update_mask=
        # autoScaling.minNodes
        # -d @./update_body.json
        # </pre>
        # Corresponds to the JSON property `minNodes`
        # @return [Fixnum]
        attr_accessor :min_nodes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @min_nodes = args[:min_nodes] if args.key?(:min_nodes)
        end
      end
      
      # Represents output related to a built-in algorithm Job.
      class GoogleCloudMlV1BuiltInAlgorithmOutput
        include Google::Apis::Core::Hashable
      
        # Framework on which the built-in algorithm was trained.
        # Corresponds to the JSON property `framework`
        # @return [String]
        attr_accessor :framework
      
        # The Cloud Storage path to the `model/` directory where the training job
        # saves the trained model. Only set for successful jobs that don't use
        # hyperparameter tuning.
        # Corresponds to the JSON property `modelPath`
        # @return [String]
        attr_accessor :model_path
      
        # Python version on which the built-in algorithm was trained.
        # Corresponds to the JSON property `pythonVersion`
        # @return [String]
        attr_accessor :python_version
      
        # AI Platform runtime version on which the built-in algorithm was
        # trained.
        # Corresponds to the JSON property `runtimeVersion`
        # @return [String]
        attr_accessor :runtime_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @framework = args[:framework] if args.key?(:framework)
          @model_path = args[:model_path] if args.key?(:model_path)
          @python_version = args[:python_version] if args.key?(:python_version)
          @runtime_version = args[:runtime_version] if args.key?(:runtime_version)
        end
      end
      
      # Request message for the CancelJob method.
      class GoogleCloudMlV1CancelJobRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # 
      class GoogleCloudMlV1Capability
        include Google::Apis::Core::Hashable
      
        # Available accelerators for the capability.
        # Corresponds to the JSON property `availableAccelerators`
        # @return [Array<String>]
        attr_accessor :available_accelerators
      
        # 
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @available_accelerators = args[:available_accelerators] if args.key?(:available_accelerators)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # 
      class GoogleCloudMlV1Config
        include Google::Apis::Core::Hashable
      
        # The service account Cloud ML uses to run on TPU node.
        # Corresponds to the JSON property `tpuServiceAccount`
        # @return [String]
        attr_accessor :tpu_service_account
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tpu_service_account = args[:tpu_service_account] if args.key?(:tpu_service_account)
        end
      end
      
      # Returns service account information associated with a project.
      class GoogleCloudMlV1GetConfigResponse
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `config`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1Config]
        attr_accessor :config
      
        # The service account Cloud ML uses to access resources in the project.
        # Corresponds to the JSON property `serviceAccount`
        # @return [String]
        attr_accessor :service_account
      
        # The project number for `service_account`.
        # Corresponds to the JSON property `serviceAccountProject`
        # @return [Fixnum]
        attr_accessor :service_account_project
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @config = args[:config] if args.key?(:config)
          @service_account = args[:service_account] if args.key?(:service_account)
          @service_account_project = args[:service_account_project] if args.key?(:service_account_project)
        end
      end
      
      # Represents the result of a single hyperparameter tuning trial from a
      # training job. The TrainingOutput object that is returned on successful
      # completion of a training job with hyperparameter tuning includes a list
      # of HyperparameterOutput objects, one for each successful trial.
      class GoogleCloudMlV1HyperparameterOutput
        include Google::Apis::Core::Hashable
      
        # All recorded object metrics for this trial. This field is not currently
        # populated.
        # Corresponds to the JSON property `allMetrics`
        # @return [Array<Google::Apis::MlV1::GoogleCloudMlV1HyperparameterOutputHyperparameterMetric>]
        attr_accessor :all_metrics
      
        # Represents output related to a built-in algorithm Job.
        # Corresponds to the JSON property `builtInAlgorithmOutput`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1BuiltInAlgorithmOutput]
        attr_accessor :built_in_algorithm_output
      
        # Output only. End time for the trial.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # An observed value of a metric.
        # Corresponds to the JSON property `finalMetric`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1HyperparameterOutputHyperparameterMetric]
        attr_accessor :final_metric
      
        # The hyperparameters given to this trial.
        # Corresponds to the JSON property `hyperparameters`
        # @return [Hash<String,String>]
        attr_accessor :hyperparameters
      
        # True if the trial is stopped early.
        # Corresponds to the JSON property `isTrialStoppedEarly`
        # @return [Boolean]
        attr_accessor :is_trial_stopped_early
        alias_method :is_trial_stopped_early?, :is_trial_stopped_early
      
        # Output only. Start time for the trial.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Output only. The detailed state of the trial.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # The trial id for these results.
        # Corresponds to the JSON property `trialId`
        # @return [String]
        attr_accessor :trial_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @all_metrics = args[:all_metrics] if args.key?(:all_metrics)
          @built_in_algorithm_output = args[:built_in_algorithm_output] if args.key?(:built_in_algorithm_output)
          @end_time = args[:end_time] if args.key?(:end_time)
          @final_metric = args[:final_metric] if args.key?(:final_metric)
          @hyperparameters = args[:hyperparameters] if args.key?(:hyperparameters)
          @is_trial_stopped_early = args[:is_trial_stopped_early] if args.key?(:is_trial_stopped_early)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @trial_id = args[:trial_id] if args.key?(:trial_id)
        end
      end
      
      # Represents a set of hyperparameters to optimize.
      class GoogleCloudMlV1HyperparameterSpec
        include Google::Apis::Core::Hashable
      
        # Optional. The search algorithm specified for the hyperparameter
        # tuning job.
        # Uses the default AI Platform hyperparameter tuning
        # algorithm if unspecified.
        # Corresponds to the JSON property `algorithm`
        # @return [String]
        attr_accessor :algorithm
      
        # Optional. Indicates if the hyperparameter tuning job enables auto trial
        # early stopping.
        # Corresponds to the JSON property `enableTrialEarlyStopping`
        # @return [Boolean]
        attr_accessor :enable_trial_early_stopping
        alias_method :enable_trial_early_stopping?, :enable_trial_early_stopping
      
        # Required. The type of goal to use for tuning. Available types are
        # `MAXIMIZE` and `MINIMIZE`.
        # Defaults to `MAXIMIZE`.
        # Corresponds to the JSON property `goal`
        # @return [String]
        attr_accessor :goal
      
        # Optional. The TensorFlow summary tag name to use for optimizing trials. For
        # current versions of TensorFlow, this tag name should exactly match what is
        # shown in TensorBoard, including all scopes.  For versions of TensorFlow
        # prior to 0.12, this should be only the tag passed to tf.Summary.
        # By default, "training/hptuning/metric" will be used.
        # Corresponds to the JSON property `hyperparameterMetricTag`
        # @return [String]
        attr_accessor :hyperparameter_metric_tag
      
        # Optional. The number of failed trials that need to be seen before failing
        # the hyperparameter tuning job. You can specify this field to override the
        # default failing criteria for AI Platform hyperparameter tuning jobs.
        # Defaults to zero, which means the service decides when a hyperparameter
        # job should fail.
        # Corresponds to the JSON property `maxFailedTrials`
        # @return [Fixnum]
        attr_accessor :max_failed_trials
      
        # Optional. The number of training trials to run concurrently.
        # You can reduce the time it takes to perform hyperparameter tuning by adding
        # trials in parallel. However, each trail only benefits from the information
        # gained in completed trials. That means that a trial does not get access to
        # the results of trials running at the same time, which could reduce the
        # quality of the overall optimization.
        # Each trial will use the same scale tier and machine types.
        # Defaults to one.
        # Corresponds to the JSON property `maxParallelTrials`
        # @return [Fixnum]
        attr_accessor :max_parallel_trials
      
        # Optional. How many training trials should be attempted to optimize
        # the specified hyperparameters.
        # Defaults to one.
        # Corresponds to the JSON property `maxTrials`
        # @return [Fixnum]
        attr_accessor :max_trials
      
        # Required. The set of parameters to tune.
        # Corresponds to the JSON property `params`
        # @return [Array<Google::Apis::MlV1::GoogleCloudMlV1ParameterSpec>]
        attr_accessor :params
      
        # Optional. The prior hyperparameter tuning job id that users hope to
        # continue with. The job id will be used to find the corresponding vizier
        # study guid and resume the study.
        # Corresponds to the JSON property `resumePreviousJobId`
        # @return [String]
        attr_accessor :resume_previous_job_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @algorithm = args[:algorithm] if args.key?(:algorithm)
          @enable_trial_early_stopping = args[:enable_trial_early_stopping] if args.key?(:enable_trial_early_stopping)
          @goal = args[:goal] if args.key?(:goal)
          @hyperparameter_metric_tag = args[:hyperparameter_metric_tag] if args.key?(:hyperparameter_metric_tag)
          @max_failed_trials = args[:max_failed_trials] if args.key?(:max_failed_trials)
          @max_parallel_trials = args[:max_parallel_trials] if args.key?(:max_parallel_trials)
          @max_trials = args[:max_trials] if args.key?(:max_trials)
          @params = args[:params] if args.key?(:params)
          @resume_previous_job_id = args[:resume_previous_job_id] if args.key?(:resume_previous_job_id)
        end
      end
      
      # Represents a training or prediction job.
      class GoogleCloudMlV1Job
        include Google::Apis::Core::Hashable
      
        # Output only. When the job was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Output only. When the job processing was completed.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Output only. The details of a failure or a cancellation.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a job from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform job updates in order to avoid race
        # conditions: An `etag` is returned in the response to `GetJob`, and
        # systems are expected to put that etag in the request to `UpdateJob` to
        # ensure that their change will be applied to the same version of the job.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Required. The user-specified id of the job.
        # Corresponds to the JSON property `jobId`
        # @return [String]
        attr_accessor :job_id
      
        # Optional. One or more labels that you can add, to organize your jobs.
        # Each label is a key-value pair, where both the key and the value are
        # arbitrary strings that you supply.
        # For more information, see the documentation on
        # <a href="/ml-engine/docs/tensorflow/resource-labels">using labels</a>.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Represents input parameters for a prediction job.
        # Corresponds to the JSON property `predictionInput`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1PredictionInput]
        attr_accessor :prediction_input
      
        # Represents results of a prediction job.
        # Corresponds to the JSON property `predictionOutput`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1PredictionOutput]
        attr_accessor :prediction_output
      
        # Output only. When the job processing was started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Output only. The detailed state of a job.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Represents input parameters for a training job. When using the
        # gcloud command to submit your training job, you can specify
        # the input parameters as command-line arguments and/or in a YAML configuration
        # file referenced from the --config command-line argument. For
        # details, see the guide to
        # <a href="/ml-engine/docs/tensorflow/training-jobs">submitting a training
        # job</a>.
        # Corresponds to the JSON property `trainingInput`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1TrainingInput]
        attr_accessor :training_input
      
        # Represents results of a training job. Output only.
        # Corresponds to the JSON property `trainingOutput`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1TrainingOutput]
        attr_accessor :training_output
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @error_message = args[:error_message] if args.key?(:error_message)
          @etag = args[:etag] if args.key?(:etag)
          @job_id = args[:job_id] if args.key?(:job_id)
          @labels = args[:labels] if args.key?(:labels)
          @prediction_input = args[:prediction_input] if args.key?(:prediction_input)
          @prediction_output = args[:prediction_output] if args.key?(:prediction_output)
          @start_time = args[:start_time] if args.key?(:start_time)
          @state = args[:state] if args.key?(:state)
          @training_input = args[:training_input] if args.key?(:training_input)
          @training_output = args[:training_output] if args.key?(:training_output)
        end
      end
      
      # Response message for the ListJobs method.
      class GoogleCloudMlV1ListJobsResponse
        include Google::Apis::Core::Hashable
      
        # The list of jobs.
        # Corresponds to the JSON property `jobs`
        # @return [Array<Google::Apis::MlV1::GoogleCloudMlV1Job>]
        attr_accessor :jobs
      
        # Optional. Pass this token as the `page_token` field of the request for a
        # subsequent call.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @jobs = args[:jobs] if args.key?(:jobs)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # 
      class GoogleCloudMlV1ListLocationsResponse
        include Google::Apis::Core::Hashable
      
        # Locations where at least one type of CMLE capability is available.
        # Corresponds to the JSON property `locations`
        # @return [Array<Google::Apis::MlV1::GoogleCloudMlV1Location>]
        attr_accessor :locations
      
        # Optional. Pass this token as the `page_token` field of the request for a
        # subsequent call.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locations = args[:locations] if args.key?(:locations)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for the ListModels method.
      class GoogleCloudMlV1ListModelsResponse
        include Google::Apis::Core::Hashable
      
        # The list of models.
        # Corresponds to the JSON property `models`
        # @return [Array<Google::Apis::MlV1::GoogleCloudMlV1Model>]
        attr_accessor :models
      
        # Optional. Pass this token as the `page_token` field of the request for a
        # subsequent call.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @models = args[:models] if args.key?(:models)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Response message for the ListVersions method.
      class GoogleCloudMlV1ListVersionsResponse
        include Google::Apis::Core::Hashable
      
        # Optional. Pass this token as the `page_token` field of the request for a
        # subsequent call.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # The list of versions.
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::MlV1::GoogleCloudMlV1Version>]
        attr_accessor :versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @versions = args[:versions] if args.key?(:versions)
        end
      end
      
      # 
      class GoogleCloudMlV1Location
        include Google::Apis::Core::Hashable
      
        # Capabilities available in the location.
        # Corresponds to the JSON property `capabilities`
        # @return [Array<Google::Apis::MlV1::GoogleCloudMlV1Capability>]
        attr_accessor :capabilities
      
        # 
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @capabilities = args[:capabilities] if args.key?(:capabilities)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Options for manually scaling a model.
      class GoogleCloudMlV1ManualScaling
        include Google::Apis::Core::Hashable
      
        # The number of nodes to allocate for this model. These nodes are always up,
        # starting from the time the model is deployed, so the cost of operating
        # this model will be proportional to `nodes` * number of hours since
        # last billing cycle plus the cost for each prediction performed.
        # Corresponds to the JSON property `nodes`
        # @return [Fixnum]
        attr_accessor :nodes
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @nodes = args[:nodes] if args.key?(:nodes)
        end
      end
      
      # Represents a machine learning solution.
      # A model can have multiple versions, each of which is a deployed, trained
      # model ready to receive prediction requests. The model itself is just a
      # container.
      class GoogleCloudMlV1Model
        include Google::Apis::Core::Hashable
      
        # Represents a version of the model.
        # Each version is a trained model deployed in the cloud, ready to handle
        # prediction requests. A model can have multiple versions. You can get
        # information about all of the versions of a given model by calling
        # [projects.models.versions.list](/ml-engine/reference/rest/v1/projects.models.
        # versions/list).
        # Corresponds to the JSON property `defaultVersion`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1Version]
        attr_accessor :default_version
      
        # Optional. The description specified for the model when it was created.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a model from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform model updates in order to avoid race
        # conditions: An `etag` is returned in the response to `GetModel`, and
        # systems are expected to put that etag in the request to `UpdateModel` to
        # ensure that their change will be applied to the model as intended.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Optional. One or more labels that you can add, to organize your models.
        # Each label is a key-value pair, where both the key and the value are
        # arbitrary strings that you supply.
        # For more information, see the documentation on
        # <a href="/ml-engine/docs/tensorflow/resource-labels">using labels</a>.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Required. The name specified for the model when it was created.
        # The model name must be unique within the project it is created in.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. If true, online prediction nodes send `stderr` and `stdout`
        # streams to Stackdriver Logging. These can be more verbose than the standard
        # access logs (see `onlinePredictionLogging`) and can incur higher cost.
        # However, they are helpful for debugging. Note that
        # [Stackdriver logs may incur a cost](/stackdriver/pricing), especially if
        # your project receives prediction requests at a high QPS. Estimate your
        # costs before enabling this option.
        # Default is false.
        # Corresponds to the JSON property `onlinePredictionConsoleLogging`
        # @return [Boolean]
        attr_accessor :online_prediction_console_logging
        alias_method :online_prediction_console_logging?, :online_prediction_console_logging
      
        # Optional. If true, online prediction access logs are sent to StackDriver
        # Logging. These logs are like standard server access logs, containing
        # information like timestamp and latency for each request. Note that
        # [Stackdriver logs may incur a cost](/stackdriver/pricing), especially if
        # your project receives prediction requests at a high queries per second rate
        # (QPS). Estimate your costs before enabling this option.
        # Default is false.
        # Corresponds to the JSON property `onlinePredictionLogging`
        # @return [Boolean]
        attr_accessor :online_prediction_logging
        alias_method :online_prediction_logging?, :online_prediction_logging
      
        # Optional. The list of regions where the model is going to be deployed.
        # Currently only one region per model is supported.
        # Defaults to 'us-central1' if nothing is set.
        # See the <a href="/ml-engine/docs/tensorflow/regions">available regions</a>
        # for AI Platform services.
        # Note:
        # *   No matter where a model is deployed, it can always be accessed by
        # users from anywhere, both for online and batch prediction.
        # *   The region for a batch prediction job is set by the region field when
        # submitting the batch prediction job and does not take its value from
        # this field.
        # Corresponds to the JSON property `regions`
        # @return [Array<String>]
        attr_accessor :regions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @default_version = args[:default_version] if args.key?(:default_version)
          @description = args[:description] if args.key?(:description)
          @etag = args[:etag] if args.key?(:etag)
          @labels = args[:labels] if args.key?(:labels)
          @name = args[:name] if args.key?(:name)
          @online_prediction_console_logging = args[:online_prediction_console_logging] if args.key?(:online_prediction_console_logging)
          @online_prediction_logging = args[:online_prediction_logging] if args.key?(:online_prediction_logging)
          @regions = args[:regions] if args.key?(:regions)
        end
      end
      
      # Represents the metadata of the long-running operation.
      class GoogleCloudMlV1OperationMetadata
        include Google::Apis::Core::Hashable
      
        # The time the operation was submitted.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # The time operation processing completed.
        # Corresponds to the JSON property `endTime`
        # @return [String]
        attr_accessor :end_time
      
        # Indicates whether a request to cancel this operation has been made.
        # Corresponds to the JSON property `isCancellationRequested`
        # @return [Boolean]
        attr_accessor :is_cancellation_requested
        alias_method :is_cancellation_requested?, :is_cancellation_requested
      
        # The user labels, inherited from the model or the model version being
        # operated on.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Contains the name of the model associated with the operation.
        # Corresponds to the JSON property `modelName`
        # @return [String]
        attr_accessor :model_name
      
        # The operation type.
        # Corresponds to the JSON property `operationType`
        # @return [String]
        attr_accessor :operation_type
      
        # Contains the project number associated with the operation.
        # Corresponds to the JSON property `projectNumber`
        # @return [Fixnum]
        attr_accessor :project_number
      
        # The time operation processing started.
        # Corresponds to the JSON property `startTime`
        # @return [String]
        attr_accessor :start_time
      
        # Represents a version of the model.
        # Each version is a trained model deployed in the cloud, ready to handle
        # prediction requests. A model can have multiple versions. You can get
        # information about all of the versions of a given model by calling
        # [projects.models.versions.list](/ml-engine/reference/rest/v1/projects.models.
        # versions/list).
        # Corresponds to the JSON property `version`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1Version]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @create_time = args[:create_time] if args.key?(:create_time)
          @end_time = args[:end_time] if args.key?(:end_time)
          @is_cancellation_requested = args[:is_cancellation_requested] if args.key?(:is_cancellation_requested)
          @labels = args[:labels] if args.key?(:labels)
          @model_name = args[:model_name] if args.key?(:model_name)
          @operation_type = args[:operation_type] if args.key?(:operation_type)
          @project_number = args[:project_number] if args.key?(:project_number)
          @start_time = args[:start_time] if args.key?(:start_time)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Represents a single hyperparameter to optimize.
      class GoogleCloudMlV1ParameterSpec
        include Google::Apis::Core::Hashable
      
        # Required if type is `CATEGORICAL`. The list of possible categories.
        # Corresponds to the JSON property `categoricalValues`
        # @return [Array<String>]
        attr_accessor :categorical_values
      
        # Required if type is `DISCRETE`.
        # A list of feasible points.
        # The list should be in strictly increasing order. For instance, this
        # parameter might have possible settings of 1.5, 2.5, and 4.0. This list
        # should not contain more than 1,000 values.
        # Corresponds to the JSON property `discreteValues`
        # @return [Array<Float>]
        attr_accessor :discrete_values
      
        # Required if type is `DOUBLE` or `INTEGER`. This field
        # should be unset if type is `CATEGORICAL`. This value should be integers if
        # type is `INTEGER`.
        # Corresponds to the JSON property `maxValue`
        # @return [Float]
        attr_accessor :max_value
      
        # Required if type is `DOUBLE` or `INTEGER`. This field
        # should be unset if type is `CATEGORICAL`. This value should be integers if
        # type is INTEGER.
        # Corresponds to the JSON property `minValue`
        # @return [Float]
        attr_accessor :min_value
      
        # Required. The parameter name must be unique amongst all ParameterConfigs in
        # a HyperparameterSpec message. E.g., "learning_rate".
        # Corresponds to the JSON property `parameterName`
        # @return [String]
        attr_accessor :parameter_name
      
        # Optional. How the parameter should be scaled to the hypercube.
        # Leave unset for categorical parameters.
        # Some kind of scaling is strongly recommended for real or integral
        # parameters (e.g., `UNIT_LINEAR_SCALE`).
        # Corresponds to the JSON property `scaleType`
        # @return [String]
        attr_accessor :scale_type
      
        # Required. The type of the parameter.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @categorical_values = args[:categorical_values] if args.key?(:categorical_values)
          @discrete_values = args[:discrete_values] if args.key?(:discrete_values)
          @max_value = args[:max_value] if args.key?(:max_value)
          @min_value = args[:min_value] if args.key?(:min_value)
          @parameter_name = args[:parameter_name] if args.key?(:parameter_name)
          @scale_type = args[:scale_type] if args.key?(:scale_type)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Request for predictions to be issued against a trained model.
      class GoogleCloudMlV1PredictRequest
        include Google::Apis::Core::Hashable
      
        # Message that represents an arbitrary HTTP body. It should only be used for
        # payload formats that can't be represented as JSON, such as raw binary or
        # an HTML page.
        # This message can be used both in streaming and non-streaming API methods in
        # the request as well as the response.
        # It can be used as a top-level request field, which is convenient if one
        # wants to extract parameters from either the URL or HTTP template into the
        # request fields and also want access to the raw HTTP body.
        # Example:
        # message GetResourceRequest `
        # // A unique request id.
        # string request_id = 1;
        # // The raw HTTP body is bound to this field.
        # google.api.HttpBody http_body = 2;
        # `
        # service ResourceService `
        # rpc GetResource(GetResourceRequest) returns (google.api.HttpBody);
        # rpc UpdateResource(google.api.HttpBody) returns
        # (google.protobuf.Empty);
        # `
        # Example with streaming methods:
        # service CaldavService `
        # rpc GetCalendar(stream google.api.HttpBody)
        # returns (stream google.api.HttpBody);
        # rpc UpdateCalendar(stream google.api.HttpBody)
        # returns (stream google.api.HttpBody);
        # `
        # Use of this type only changes how the request and response bodies are
        # handled, all other features will continue to work unchanged.
        # Corresponds to the JSON property `httpBody`
        # @return [Google::Apis::MlV1::GoogleApiHttpBody]
        attr_accessor :http_body
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @http_body = args[:http_body] if args.key?(:http_body)
        end
      end
      
      # Represents input parameters for a prediction job.
      class GoogleCloudMlV1PredictionInput
        include Google::Apis::Core::Hashable
      
        # Optional. Number of records per batch, defaults to 64.
        # The service will buffer batch_size number of records in memory before
        # invoking one Tensorflow prediction call internally. So take the record
        # size and memory available into consideration when setting this parameter.
        # Corresponds to the JSON property `batchSize`
        # @return [Fixnum]
        attr_accessor :batch_size
      
        # Required. The format of the input data files.
        # Corresponds to the JSON property `dataFormat`
        # @return [String]
        attr_accessor :data_format
      
        # Required. The Cloud Storage location of the input data files. May contain
        # <a href="/storage/docs/gsutil/addlhelp/WildcardNames">wildcards</a>.
        # Corresponds to the JSON property `inputPaths`
        # @return [Array<String>]
        attr_accessor :input_paths
      
        # Optional. The maximum number of workers to be used for parallel processing.
        # Defaults to 10 if not specified.
        # Corresponds to the JSON property `maxWorkerCount`
        # @return [Fixnum]
        attr_accessor :max_worker_count
      
        # Use this field if you want to use the default version for the specified
        # model. The string must use the following format:
        # `"projects/YOUR_PROJECT/models/YOUR_MODEL"`
        # Corresponds to the JSON property `modelName`
        # @return [String]
        attr_accessor :model_name
      
        # Optional. Format of the output data files, defaults to JSON.
        # Corresponds to the JSON property `outputDataFormat`
        # @return [String]
        attr_accessor :output_data_format
      
        # Required. The output Google Cloud Storage location.
        # Corresponds to the JSON property `outputPath`
        # @return [String]
        attr_accessor :output_path
      
        # Required. The Google Compute Engine region to run the prediction job in.
        # See the <a href="/ml-engine/docs/tensorflow/regions">available regions</a>
        # for AI Platform services.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # Optional. The AI Platform runtime version to use for this batch
        # prediction. If not set, AI Platform will pick the runtime version used
        # during the CreateVersion request for this model version, or choose the
        # latest stable version when model version information is not available
        # such as when the model is specified by uri.
        # Corresponds to the JSON property `runtimeVersion`
        # @return [String]
        attr_accessor :runtime_version
      
        # Optional. The name of the signature defined in the SavedModel to use for
        # this job. Please refer to
        # [SavedModel](https://tensorflow.github.io/serving/serving_basic.html)
        # for information about how to use signatures.
        # Defaults to
        # [DEFAULT_SERVING_SIGNATURE_DEF_KEY](https://www.tensorflow.org/api_docs/python/
        # tf/saved_model/signature_constants)
        # , which is "serving_default".
        # Corresponds to the JSON property `signatureName`
        # @return [String]
        attr_accessor :signature_name
      
        # Use this field if you want to specify a Google Cloud Storage path for
        # the model to use.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        # Use this field if you want to specify a version of the model to use. The
        # string is formatted the same way as `model_version`, with the addition
        # of the version information:
        # `"projects/YOUR_PROJECT/models/YOUR_MODEL/versions/YOUR_VERSION"`
        # Corresponds to the JSON property `versionName`
        # @return [String]
        attr_accessor :version_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @batch_size = args[:batch_size] if args.key?(:batch_size)
          @data_format = args[:data_format] if args.key?(:data_format)
          @input_paths = args[:input_paths] if args.key?(:input_paths)
          @max_worker_count = args[:max_worker_count] if args.key?(:max_worker_count)
          @model_name = args[:model_name] if args.key?(:model_name)
          @output_data_format = args[:output_data_format] if args.key?(:output_data_format)
          @output_path = args[:output_path] if args.key?(:output_path)
          @region = args[:region] if args.key?(:region)
          @runtime_version = args[:runtime_version] if args.key?(:runtime_version)
          @signature_name = args[:signature_name] if args.key?(:signature_name)
          @uri = args[:uri] if args.key?(:uri)
          @version_name = args[:version_name] if args.key?(:version_name)
        end
      end
      
      # Represents results of a prediction job.
      class GoogleCloudMlV1PredictionOutput
        include Google::Apis::Core::Hashable
      
        # The number of data instances which resulted in errors.
        # Corresponds to the JSON property `errorCount`
        # @return [Fixnum]
        attr_accessor :error_count
      
        # Node hours used by the batch prediction job.
        # Corresponds to the JSON property `nodeHours`
        # @return [Float]
        attr_accessor :node_hours
      
        # The output Google Cloud Storage location provided at the job creation time.
        # Corresponds to the JSON property `outputPath`
        # @return [String]
        attr_accessor :output_path
      
        # The number of generated predictions.
        # Corresponds to the JSON property `predictionCount`
        # @return [Fixnum]
        attr_accessor :prediction_count
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_count = args[:error_count] if args.key?(:error_count)
          @node_hours = args[:node_hours] if args.key?(:node_hours)
          @output_path = args[:output_path] if args.key?(:output_path)
          @prediction_count = args[:prediction_count] if args.key?(:prediction_count)
        end
      end
      
      # Represents the configuration for a replica in a cluster.
      class GoogleCloudMlV1ReplicaConfig
        include Google::Apis::Core::Hashable
      
        # Represents a hardware accelerator request config.
        # Note that the AcceleratorConfig can be used in both Jobs and Versions.
        # Learn more about [accelerators for training](/ml-engine/docs/using-gpus) and
        # [accelerators for online
        # prediction](/ml-engine/docs/machine-types-online-prediction#gpus).
        # Corresponds to the JSON property `acceleratorConfig`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1AcceleratorConfig]
        attr_accessor :accelerator_config
      
        # The Docker image to run on the replica. This image must be in Container
        # Registry. Learn more about [configuring custom
        # containers](/ml-engine/docs/distributed-training-containers).
        # Corresponds to the JSON property `imageUri`
        # @return [String]
        attr_accessor :image_uri
      
        # The AI Platform runtime version that includes a TensorFlow version matching
        # the one used in the custom container. This field is required if the replica
        # is a TPU worker that uses a custom container. Otherwise, do not specify
        # this field. This must be a [runtime version that currently supports
        # training with
        # TPUs](/ml-engine/docs/tensorflow/runtime-version-list#tpu-support).
        # Note that the version of TensorFlow included in a runtime version may
        # differ from the numbering of the runtime version itself, because it may
        # have a different [patch
        # version](https://www.tensorflow.org/guide/version_compat#
        # semantic_versioning_20).
        # In this field, you must specify the runtime version (TensorFlow minor
        # version). For example, if your custom container runs TensorFlow `1.x.y`,
        # specify `1.x`.
        # Corresponds to the JSON property `tpuTfVersion`
        # @return [String]
        attr_accessor :tpu_tf_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerator_config = args[:accelerator_config] if args.key?(:accelerator_config)
          @image_uri = args[:image_uri] if args.key?(:image_uri)
          @tpu_tf_version = args[:tpu_tf_version] if args.key?(:tpu_tf_version)
        end
      end
      
      # Configuration for logging request-response pairs to a BigQuery table.
      # Online prediction requests to a model version and the responses to these
      # requests are converted to raw strings and saved to the specified BigQuery
      # table. Logging is constrained by [BigQuery quotas and
      # limits](/bigquery/quotas). If your project exceeds BigQuery quotas or limits,
      # AI Platform Prediction does not log request-response pairs, but it continues
      # to serve predictions.
      # If you are using [continuous
      # evaluation](/ml-engine/docs/continuous-evaluation/), you do not need to
      # specify this configuration manually. Setting up continuous evaluation
      # automatically enables logging of request-response pairs.
      class GoogleCloudMlV1RequestLoggingConfig
        include Google::Apis::Core::Hashable
      
        # Required. Fully qualified BigQuery table name in the following format:
        # "<var>project_id</var>.<var>dataset_name</var>.<var>table_name</var>"
        # The specifcied table must already exist, and the "Cloud ML Service Agent"
        # for your project must have permission to write to it. The table must have
        # the following [schema](/bigquery/docs/schemas):
        # <table>
        # <tr><th>Field name</th><th style="display: table-cell">Type</th>
        # <th style="display: table-cell">Mode</th></tr>
        # <tr><td>model</td><td>STRING</td><td>REQUIRED</td></tr>
        # <tr><td>model_version</td><td>STRING</td><td>REQUIRED</td></tr>
        # <tr><td>time</td><td>TIMESTAMP</td><td>REQUIRED</td></tr>
        # <tr><td>raw_data</td><td>STRING</td><td>REQUIRED</td></tr>
        # <tr><td>raw_prediction</td><td>STRING</td><td>NULLABLE</td></tr>
        # <tr><td>groundtruth</td><td>STRING</td><td>NULLABLE</td></tr>
        # </table>
        # Corresponds to the JSON property `bigqueryTableName`
        # @return [String]
        attr_accessor :bigquery_table_name
      
        # Percentage of requests to be logged, expressed as a fraction from 0 to 1.
        # For example, if you want to log 10% of requests, enter `0.1`. The sampling
        # window is the lifetime of the model version. Defaults to 0.
        # Corresponds to the JSON property `samplingPercentage`
        # @return [Float]
        attr_accessor :sampling_percentage
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bigquery_table_name = args[:bigquery_table_name] if args.key?(:bigquery_table_name)
          @sampling_percentage = args[:sampling_percentage] if args.key?(:sampling_percentage)
        end
      end
      
      # Request message for the SetDefaultVersion request.
      class GoogleCloudMlV1SetDefaultVersionRequest
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # Represents input parameters for a training job. When using the
      # gcloud command to submit your training job, you can specify
      # the input parameters as command-line arguments and/or in a YAML configuration
      # file referenced from the --config command-line argument. For
      # details, see the guide to
      # <a href="/ml-engine/docs/tensorflow/training-jobs">submitting a training
      # job</a>.
      class GoogleCloudMlV1TrainingInput
        include Google::Apis::Core::Hashable
      
        # Optional. Command line arguments to pass to the program.
        # Corresponds to the JSON property `args`
        # @return [Array<String>]
        attr_accessor :args
      
        # Represents a set of hyperparameters to optimize.
        # Corresponds to the JSON property `hyperparameters`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1HyperparameterSpec]
        attr_accessor :hyperparameters
      
        # Optional. A Google Cloud Storage path in which to store training outputs
        # and other data needed for training. This path is passed to your TensorFlow
        # program as the '--job-dir' command-line argument. The benefit of specifying
        # this field is that Cloud ML validates the path for use in training.
        # Corresponds to the JSON property `jobDir`
        # @return [String]
        attr_accessor :job_dir
      
        # Represents the configuration for a replica in a cluster.
        # Corresponds to the JSON property `masterConfig`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1ReplicaConfig]
        attr_accessor :master_config
      
        # Optional. Specifies the type of virtual machine to use for your training
        # job's master worker.
        # The following types are supported:
        # <dl>
        # <dt>standard</dt>
        # <dd>
        # A basic machine configuration suitable for training simple models with
        # small to moderate datasets.
        # </dd>
        # <dt>large_model</dt>
        # <dd>
        # A machine with a lot of memory, specially suited for parameter servers
        # when your model is large (having many hidden layers or layers with very
        # large numbers of nodes).
        # </dd>
        # <dt>complex_model_s</dt>
        # <dd>
        # A machine suitable for the master and workers of the cluster when your
        # model requires more computation than the standard machine can handle
        # satisfactorily.
        # </dd>
        # <dt>complex_model_m</dt>
        # <dd>
        # A machine with roughly twice the number of cores and roughly double the
        # memory of <i>complex_model_s</i>.
        # </dd>
        # <dt>complex_model_l</dt>
        # <dd>
        # A machine with roughly twice the number of cores and roughly double the
        # memory of <i>complex_model_m</i>.
        # </dd>
        # <dt>standard_gpu</dt>
        # <dd>
        # A machine equivalent to <i>standard</i> that
        # also includes a single NVIDIA Tesla K80 GPU. See more about
        # <a href="/ml-engine/docs/tensorflow/using-gpus">using GPUs to
        # train your model</a>.
        # </dd>
        # <dt>complex_model_m_gpu</dt>
        # <dd>
        # A machine equivalent to <i>complex_model_m</i> that also includes
        # four NVIDIA Tesla K80 GPUs.
        # </dd>
        # <dt>complex_model_l_gpu</dt>
        # <dd>
        # A machine equivalent to <i>complex_model_l</i> that also includes
        # eight NVIDIA Tesla K80 GPUs.
        # </dd>
        # <dt>standard_p100</dt>
        # <dd>
        # A machine equivalent to <i>standard</i> that
        # also includes a single NVIDIA Tesla P100 GPU.
        # </dd>
        # <dt>complex_model_m_p100</dt>
        # <dd>
        # A machine equivalent to <i>complex_model_m</i> that also includes
        # four NVIDIA Tesla P100 GPUs.
        # </dd>
        # <dt>standard_v100</dt>
        # <dd>
        # A machine equivalent to <i>standard</i> that
        # also includes a single NVIDIA Tesla V100 GPU.
        # </dd>
        # <dt>large_model_v100</dt>
        # <dd>
        # A machine equivalent to <i>large_model</i> that
        # also includes a single NVIDIA Tesla V100 GPU.
        # </dd>
        # <dt>complex_model_m_v100</dt>
        # <dd>
        # A machine equivalent to <i>complex_model_m</i> that
        # also includes four NVIDIA Tesla V100 GPUs.
        # </dd>
        # <dt>complex_model_l_v100</dt>
        # <dd>
        # A machine equivalent to <i>complex_model_l</i> that
        # also includes eight NVIDIA Tesla V100 GPUs.
        # </dd>
        # <dt>cloud_tpu</dt>
        # <dd>
        # A TPU VM including one Cloud TPU. See more about
        # <a href="/ml-engine/docs/tensorflow/using-tpus">using TPUs to train
        # your model</a>.
        # </dd>
        # </dl>
        # You may also use certain Compute Engine machine types directly in this
        # field. The following types are supported:
        # - `n1-standard-4`
        # - `n1-standard-8`
        # - `n1-standard-16`
        # - `n1-standard-32`
        # - `n1-standard-64`
        # - `n1-standard-96`
        # - `n1-highmem-2`
        # - `n1-highmem-4`
        # - `n1-highmem-8`
        # - `n1-highmem-16`
        # - `n1-highmem-32`
        # - `n1-highmem-64`
        # - `n1-highmem-96`
        # - `n1-highcpu-16`
        # - `n1-highcpu-32`
        # - `n1-highcpu-64`
        # - `n1-highcpu-96`
        # See more about [using Compute Engine machine
        # types](/ml-engine/docs/tensorflow/machine-types#compute-engine-machine-types).
        # You must set this value when `scaleTier` is set to `CUSTOM`.
        # Corresponds to the JSON property `masterType`
        # @return [String]
        attr_accessor :master_type
      
        # Required. The Google Cloud Storage location of the packages with
        # the training program and any additional dependencies.
        # The maximum number of package URIs is 100.
        # Corresponds to the JSON property `packageUris`
        # @return [Array<String>]
        attr_accessor :package_uris
      
        # Represents the configuration for a replica in a cluster.
        # Corresponds to the JSON property `parameterServerConfig`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1ReplicaConfig]
        attr_accessor :parameter_server_config
      
        # Optional. The number of parameter server replicas to use for the training
        # job. Each replica in the cluster will be of the type specified in
        # `parameter_server_type`.
        # This value can only be used when `scale_tier` is set to `CUSTOM`.If you
        # set this value, you must also set `parameter_server_type`.
        # The default value is zero.
        # Corresponds to the JSON property `parameterServerCount`
        # @return [Fixnum]
        attr_accessor :parameter_server_count
      
        # Optional. Specifies the type of virtual machine to use for your training
        # job's parameter server.
        # The supported values are the same as those described in the entry for
        # `master_type`.
        # This value must be consistent with the category of machine type that
        # `masterType` uses. In other words, both must be AI Platform machine
        # types or both must be Compute Engine machine types.
        # This value must be present when `scaleTier` is set to `CUSTOM` and
        # `parameter_server_count` is greater than zero.
        # Corresponds to the JSON property `parameterServerType`
        # @return [String]
        attr_accessor :parameter_server_type
      
        # Required. The Python module name to run after installing the packages.
        # Corresponds to the JSON property `pythonModule`
        # @return [String]
        attr_accessor :python_module
      
        # Optional. The version of Python used in training. If not set, the default
        # version is '2.7'. Python '3.5' is available when `runtime_version` is set
        # to '1.4' and above. Python '2.7' works with all supported
        # <a href="/ml-engine/docs/runtime-version-list">runtime versions</a>.
        # Corresponds to the JSON property `pythonVersion`
        # @return [String]
        attr_accessor :python_version
      
        # Required. The Google Compute Engine region to run the training job in.
        # See the <a href="/ml-engine/docs/tensorflow/regions">available regions</a>
        # for AI Platform services.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # Optional. The AI Platform runtime version to use for training. If not
        # set, AI Platform uses the default stable version, 1.0. For more
        # information, see the
        # <a href="/ml-engine/docs/runtime-version-list">runtime version list</a>
        # and
        # <a href="/ml-engine/docs/versioning">how to manage runtime versions</a>.
        # Corresponds to the JSON property `runtimeVersion`
        # @return [String]
        attr_accessor :runtime_version
      
        # Required. Specifies the machine types, the number of replicas for workers
        # and parameter servers.
        # Corresponds to the JSON property `scaleTier`
        # @return [String]
        attr_accessor :scale_tier
      
        # Optional. Use 'chief' instead of 'master' in TF_CONFIG when Custom
        # Container is used and evaluator is not specified.
        # Defaults to false.
        # Corresponds to the JSON property `useChiefInTfConfig`
        # @return [Boolean]
        attr_accessor :use_chief_in_tf_config
        alias_method :use_chief_in_tf_config?, :use_chief_in_tf_config
      
        # Represents the configuration for a replica in a cluster.
        # Corresponds to the JSON property `workerConfig`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1ReplicaConfig]
        attr_accessor :worker_config
      
        # Optional. The number of worker replicas to use for the training job. Each
        # replica in the cluster will be of the type specified in `worker_type`.
        # This value can only be used when `scale_tier` is set to `CUSTOM`. If you
        # set this value, you must also set `worker_type`.
        # The default value is zero.
        # Corresponds to the JSON property `workerCount`
        # @return [Fixnum]
        attr_accessor :worker_count
      
        # Optional. Specifies the type of virtual machine to use for your training
        # job's worker nodes.
        # The supported values are the same as those described in the entry for
        # `masterType`.
        # This value must be consistent with the category of machine type that
        # `masterType` uses. In other words, both must be AI Platform machine
        # types or both must be Compute Engine machine types.
        # If you use `cloud_tpu` for this value, see special instructions for
        # [configuring a custom TPU
        # machine](/ml-engine/docs/tensorflow/using-tpus#
        # configuring_a_custom_tpu_machine).
        # This value must be present when `scaleTier` is set to `CUSTOM` and
        # `workerCount` is greater than zero.
        # Corresponds to the JSON property `workerType`
        # @return [String]
        attr_accessor :worker_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @args = args[:args] if args.key?(:args)
          @hyperparameters = args[:hyperparameters] if args.key?(:hyperparameters)
          @job_dir = args[:job_dir] if args.key?(:job_dir)
          @master_config = args[:master_config] if args.key?(:master_config)
          @master_type = args[:master_type] if args.key?(:master_type)
          @package_uris = args[:package_uris] if args.key?(:package_uris)
          @parameter_server_config = args[:parameter_server_config] if args.key?(:parameter_server_config)
          @parameter_server_count = args[:parameter_server_count] if args.key?(:parameter_server_count)
          @parameter_server_type = args[:parameter_server_type] if args.key?(:parameter_server_type)
          @python_module = args[:python_module] if args.key?(:python_module)
          @python_version = args[:python_version] if args.key?(:python_version)
          @region = args[:region] if args.key?(:region)
          @runtime_version = args[:runtime_version] if args.key?(:runtime_version)
          @scale_tier = args[:scale_tier] if args.key?(:scale_tier)
          @use_chief_in_tf_config = args[:use_chief_in_tf_config] if args.key?(:use_chief_in_tf_config)
          @worker_config = args[:worker_config] if args.key?(:worker_config)
          @worker_count = args[:worker_count] if args.key?(:worker_count)
          @worker_type = args[:worker_type] if args.key?(:worker_type)
        end
      end
      
      # Represents results of a training job. Output only.
      class GoogleCloudMlV1TrainingOutput
        include Google::Apis::Core::Hashable
      
        # Represents output related to a built-in algorithm Job.
        # Corresponds to the JSON property `builtInAlgorithmOutput`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1BuiltInAlgorithmOutput]
        attr_accessor :built_in_algorithm_output
      
        # The number of hyperparameter tuning trials that completed successfully.
        # Only set for hyperparameter tuning jobs.
        # Corresponds to the JSON property `completedTrialCount`
        # @return [Fixnum]
        attr_accessor :completed_trial_count
      
        # The amount of ML units consumed by the job.
        # Corresponds to the JSON property `consumedMLUnits`
        # @return [Float]
        attr_accessor :consumed_ml_units
      
        # The TensorFlow summary tag name used for optimizing hyperparameter tuning
        # trials. See
        # [`HyperparameterSpec.hyperparameterMetricTag`](#HyperparameterSpec.FIELDS.
        # hyperparameter_metric_tag)
        # for more information. Only set for hyperparameter tuning jobs.
        # Corresponds to the JSON property `hyperparameterMetricTag`
        # @return [String]
        attr_accessor :hyperparameter_metric_tag
      
        # Whether this job is a built-in Algorithm job.
        # Corresponds to the JSON property `isBuiltInAlgorithmJob`
        # @return [Boolean]
        attr_accessor :is_built_in_algorithm_job
        alias_method :is_built_in_algorithm_job?, :is_built_in_algorithm_job
      
        # Whether this job is a hyperparameter tuning job.
        # Corresponds to the JSON property `isHyperparameterTuningJob`
        # @return [Boolean]
        attr_accessor :is_hyperparameter_tuning_job
        alias_method :is_hyperparameter_tuning_job?, :is_hyperparameter_tuning_job
      
        # Results for individual Hyperparameter trials.
        # Only set for hyperparameter tuning jobs.
        # Corresponds to the JSON property `trials`
        # @return [Array<Google::Apis::MlV1::GoogleCloudMlV1HyperparameterOutput>]
        attr_accessor :trials
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @built_in_algorithm_output = args[:built_in_algorithm_output] if args.key?(:built_in_algorithm_output)
          @completed_trial_count = args[:completed_trial_count] if args.key?(:completed_trial_count)
          @consumed_ml_units = args[:consumed_ml_units] if args.key?(:consumed_ml_units)
          @hyperparameter_metric_tag = args[:hyperparameter_metric_tag] if args.key?(:hyperparameter_metric_tag)
          @is_built_in_algorithm_job = args[:is_built_in_algorithm_job] if args.key?(:is_built_in_algorithm_job)
          @is_hyperparameter_tuning_job = args[:is_hyperparameter_tuning_job] if args.key?(:is_hyperparameter_tuning_job)
          @trials = args[:trials] if args.key?(:trials)
        end
      end
      
      # Represents a version of the model.
      # Each version is a trained model deployed in the cloud, ready to handle
      # prediction requests. A model can have multiple versions. You can get
      # information about all of the versions of a given model by calling
      # [projects.models.versions.list](/ml-engine/reference/rest/v1/projects.models.
      # versions/list).
      class GoogleCloudMlV1Version
        include Google::Apis::Core::Hashable
      
        # Represents a hardware accelerator request config.
        # Note that the AcceleratorConfig can be used in both Jobs and Versions.
        # Learn more about [accelerators for training](/ml-engine/docs/using-gpus) and
        # [accelerators for online
        # prediction](/ml-engine/docs/machine-types-online-prediction#gpus).
        # Corresponds to the JSON property `acceleratorConfig`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1AcceleratorConfig]
        attr_accessor :accelerator_config
      
        # Options for automatically scaling a model.
        # Corresponds to the JSON property `autoScaling`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1AutoScaling]
        attr_accessor :auto_scaling
      
        # Output only. The time the version was created.
        # Corresponds to the JSON property `createTime`
        # @return [String]
        attr_accessor :create_time
      
        # Required. The Cloud Storage location of the trained model used to
        # create the version. See the
        # [guide to model
        # deployment](/ml-engine/docs/tensorflow/deploying-models) for more
        # information.
        # When passing Version to
        # [projects.models.versions.create](/ml-engine/reference/rest/v1/projects.models.
        # versions/create)
        # the model service uses the specified location as the source of the model.
        # Once deployed, the model version is hosted by the prediction service, so
        # this location is useful only as a historical record.
        # The total number of model files can't exceed 1000.
        # Corresponds to the JSON property `deploymentUri`
        # @return [String]
        attr_accessor :deployment_uri
      
        # Optional. The description specified for the version when it was created.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Output only. The details of a failure or a cancellation.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a model from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform model updates in order to avoid race
        # conditions: An `etag` is returned in the response to `GetVersion`, and
        # systems are expected to put that etag in the request to `UpdateVersion` to
        # ensure that their change will be applied to the model as intended.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Optional. The machine learning framework AI Platform uses to train
        # this version of the model. Valid values are `TENSORFLOW`, `SCIKIT_LEARN`,
        # `XGBOOST`. If you do not specify a framework, AI Platform
        # will analyze files in the deployment_uri to determine a framework. If you
        # choose `SCIKIT_LEARN` or `XGBOOST`, you must also set the runtime version
        # of the model to 1.4 or greater.
        # Do **not** specify a framework if you're deploying a [custom
        # prediction routine](/ml-engine/docs/tensorflow/custom-prediction-routines).
        # If you specify a [Compute Engine (N1) machine
        # type](/ml-engine/docs/machine-types-online-prediction) in the
        # `machineType` field, you must specify `TENSORFLOW`
        # for the framework.
        # Corresponds to the JSON property `framework`
        # @return [String]
        attr_accessor :framework
      
        # Output only. If true, this version will be used to handle prediction
        # requests that do not specify a version.
        # You can change the default version by calling
        # [projects.methods.versions.setDefault](/ml-engine/reference/rest/v1/projects.
        # models.versions/setDefault).
        # Corresponds to the JSON property `isDefault`
        # @return [Boolean]
        attr_accessor :is_default
        alias_method :is_default?, :is_default
      
        # Optional. One or more labels that you can add, to organize your model
        # versions. Each label is a key-value pair, where both the key and the value
        # are arbitrary strings that you supply.
        # For more information, see the documentation on
        # <a href="/ml-engine/docs/tensorflow/resource-labels">using labels</a>.
        # Corresponds to the JSON property `labels`
        # @return [Hash<String,String>]
        attr_accessor :labels
      
        # Output only. The time the version was last used for prediction.
        # Corresponds to the JSON property `lastUseTime`
        # @return [String]
        attr_accessor :last_use_time
      
        # Optional. The type of machine on which to serve the model. Currently only
        # applies to online prediction service. If this field is not specified, it
        # defaults to `mls1-c1-m2`.
        # Online prediction supports the following machine types:
        # * `mls1-c1-m2`
        # * `mls1-c4-m2`
        # * `n1-standard-2`
        # * `n1-standard-4`
        # * `n1-standard-8`
        # * `n1-standard-16`
        # * `n1-standard-32`
        # * `n1-highmem-2`
        # * `n1-highmem-4`
        # * `n1-highmem-8`
        # * `n1-highmem-16`
        # * `n1-highmem-32`
        # * `n1-highcpu-2`
        # * `n1-highcpu-4`
        # * `n1-highcpu-8`
        # * `n1-highcpu-16`
        # * `n1-highcpu-32`
        # `mls1-c1-m2` is generally available. All other machine types are available
        # in beta. Learn more about the [differences between machine
        # types](/ml-engine/docs/machine-types-online-prediction).
        # Corresponds to the JSON property `machineType`
        # @return [String]
        attr_accessor :machine_type
      
        # Options for manually scaling a model.
        # Corresponds to the JSON property `manualScaling`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1ManualScaling]
        attr_accessor :manual_scaling
      
        # Required. The name specified for the version when it was created.
        # The version name must be unique within the model it is created in.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional. Cloud Storage paths (`gs://…`) of packages for [custom
        # prediction routines](/ml-engine/docs/tensorflow/custom-prediction-routines)
        # or [scikit-learn pipelines with custom
        # code](/ml-engine/docs/scikit/exporting-for-prediction#custom-pipeline-code).
        # For a custom prediction routine, one of these packages must contain your
        # Predictor class (see
        # [`predictionClass`](#Version.FIELDS.prediction_class)). Additionally,
        # include any dependencies used by your Predictor or scikit-learn pipeline
        # uses that are not already included in your selected [runtime
        # version](/ml-engine/docs/tensorflow/runtime-version-list).
        # If you specify this field, you must also set
        # [`runtimeVersion`](#Version.FIELDS.runtime_version) to 1.4 or greater.
        # Corresponds to the JSON property `packageUris`
        # @return [Array<String>]
        attr_accessor :package_uris
      
        # Optional. The fully qualified name
        # (<var>module_name</var>.<var>class_name</var>) of a class that implements
        # the Predictor interface described in this reference field. The module
        # containing this class should be included in a package provided to the
        # [`packageUris` field](#Version.FIELDS.package_uris).
        # Specify this field if and only if you are deploying a [custom prediction
        # routine (beta)](/ml-engine/docs/tensorflow/custom-prediction-routines).
        # If you specify this field, you must set
        # [`runtimeVersion`](#Version.FIELDS.runtime_version) to 1.4 or greater and
        # you must set `machineType` to a [legacy (MLS1)
        # machine type](/ml-engine/docs/machine-types-online-prediction).
        # The following code sample provides the Predictor interface:
        # <pre style="max-width: 626px;">
        # class Predictor(object):
        # """Interface for constructing custom predictors."""
        # def predict(self, instances, **kwargs):
        # """Performs custom prediction.
        # Instances are the decoded values from the request. They have already
        # been deserialized from JSON.
        # Args:
        # instances: A list of prediction input instances.
        # **kwargs: A dictionary of keyword args provided as additional
        # fields on the predict request body.
        # Returns:
        # A list of outputs containing the prediction results. This list must
        # be JSON serializable.
        # """
        # raise NotImplementedError()
        # @classmethod
        # def from_path(cls, model_dir):
        # """Creates an instance of Predictor using the given path.
        # Loading of the predictor should be done in this method.
        # Args:
        # model_dir: The local directory that contains the exported model
        # file along with any additional files uploaded when creating the
        # version resource.
        # Returns:
        # An instance implementing this Predictor class.
        # """
        # raise NotImplementedError()
        # </pre>
        # Learn more about [the Predictor interface and custom prediction
        # routines](/ml-engine/docs/tensorflow/custom-prediction-routines).
        # Corresponds to the JSON property `predictionClass`
        # @return [String]
        attr_accessor :prediction_class
      
        # Optional. The version of Python used in prediction. If not set, the default
        # version is '2.7'. Python '3.5' is available when `runtime_version` is set
        # to '1.4' and above. Python '2.7' works with all supported runtime versions.
        # Corresponds to the JSON property `pythonVersion`
        # @return [String]
        attr_accessor :python_version
      
        # Configuration for logging request-response pairs to a BigQuery table.
        # Online prediction requests to a model version and the responses to these
        # requests are converted to raw strings and saved to the specified BigQuery
        # table. Logging is constrained by [BigQuery quotas and
        # limits](/bigquery/quotas). If your project exceeds BigQuery quotas or limits,
        # AI Platform Prediction does not log request-response pairs, but it continues
        # to serve predictions.
        # If you are using [continuous
        # evaluation](/ml-engine/docs/continuous-evaluation/), you do not need to
        # specify this configuration manually. Setting up continuous evaluation
        # automatically enables logging of request-response pairs.
        # Corresponds to the JSON property `requestLoggingConfig`
        # @return [Google::Apis::MlV1::GoogleCloudMlV1RequestLoggingConfig]
        attr_accessor :request_logging_config
      
        # Optional. The AI Platform runtime version to use for this deployment.
        # If not set, AI Platform uses the default stable version, 1.0. For more
        # information, see the
        # [runtime version list](/ml-engine/docs/runtime-version-list) and
        # [how to manage runtime versions](/ml-engine/docs/versioning).
        # Corresponds to the JSON property `runtimeVersion`
        # @return [String]
        attr_accessor :runtime_version
      
        # Optional. Specifies the service account for resource access control.
        # Corresponds to the JSON property `serviceAccount`
        # @return [String]
        attr_accessor :service_account
      
        # Output only. The state of a version.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @accelerator_config = args[:accelerator_config] if args.key?(:accelerator_config)
          @auto_scaling = args[:auto_scaling] if args.key?(:auto_scaling)
          @create_time = args[:create_time] if args.key?(:create_time)
          @deployment_uri = args[:deployment_uri] if args.key?(:deployment_uri)
          @description = args[:description] if args.key?(:description)
          @error_message = args[:error_message] if args.key?(:error_message)
          @etag = args[:etag] if args.key?(:etag)
          @framework = args[:framework] if args.key?(:framework)
          @is_default = args[:is_default] if args.key?(:is_default)
          @labels = args[:labels] if args.key?(:labels)
          @last_use_time = args[:last_use_time] if args.key?(:last_use_time)
          @machine_type = args[:machine_type] if args.key?(:machine_type)
          @manual_scaling = args[:manual_scaling] if args.key?(:manual_scaling)
          @name = args[:name] if args.key?(:name)
          @package_uris = args[:package_uris] if args.key?(:package_uris)
          @prediction_class = args[:prediction_class] if args.key?(:prediction_class)
          @python_version = args[:python_version] if args.key?(:python_version)
          @request_logging_config = args[:request_logging_config] if args.key?(:request_logging_config)
          @runtime_version = args[:runtime_version] if args.key?(:runtime_version)
          @service_account = args[:service_account] if args.key?(:service_account)
          @state = args[:state] if args.key?(:state)
        end
      end
      
      # Specifies the audit configuration for a service.
      # The configuration determines which permission types are logged, and what
      # identities, if any, are exempted from logging.
      # An AuditConfig must have one or more AuditLogConfigs.
      # If there are AuditConfigs for both `allServices` and a specific service,
      # the union of the two AuditConfigs is used for that service: the log_types
      # specified in each AuditConfig are enabled, and the exempted_members in each
      # AuditLogConfig are exempted.
      # Example Policy with multiple AuditConfigs:
      # `
      # "audit_configs": [
      # `
      # "service": "allServices"
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # "exempted_members": [
      # "user:jose@example.com"
      # ]
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # `,
      # `
      # "log_type": "ADMIN_READ",
      # `
      # ]
      # `,
      # `
      # "service": "sampleservice.googleapis.com"
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # "exempted_members": [
      # "user:aliya@example.com"
      # ]
      # `
      # ]
      # `
      # ]
      # `
      # For sampleservice, this policy enables DATA_READ, DATA_WRITE and ADMIN_READ
      # logging. It also exempts jose@example.com from DATA_READ logging, and
      # aliya@example.com from DATA_WRITE logging.
      class GoogleIamV1AuditConfig
        include Google::Apis::Core::Hashable
      
        # The configuration for logging of each type of permission.
        # Corresponds to the JSON property `auditLogConfigs`
        # @return [Array<Google::Apis::MlV1::GoogleIamV1AuditLogConfig>]
        attr_accessor :audit_log_configs
      
        # Specifies a service that will be enabled for audit logging.
        # For example, `storage.googleapis.com`, `cloudsql.googleapis.com`.
        # `allServices` is a special value that covers all services.
        # Corresponds to the JSON property `service`
        # @return [String]
        attr_accessor :service
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_log_configs = args[:audit_log_configs] if args.key?(:audit_log_configs)
          @service = args[:service] if args.key?(:service)
        end
      end
      
      # Provides the configuration for logging a type of permissions.
      # Example:
      # `
      # "audit_log_configs": [
      # `
      # "log_type": "DATA_READ",
      # "exempted_members": [
      # "user:jose@example.com"
      # ]
      # `,
      # `
      # "log_type": "DATA_WRITE",
      # `
      # ]
      # `
      # This enables 'DATA_READ' and 'DATA_WRITE' logging, while exempting
      # jose@example.com from DATA_READ logging.
      class GoogleIamV1AuditLogConfig
        include Google::Apis::Core::Hashable
      
        # Specifies the identities that do not cause logging for this type of
        # permission.
        # Follows the same format of Binding.members.
        # Corresponds to the JSON property `exemptedMembers`
        # @return [Array<String>]
        attr_accessor :exempted_members
      
        # The log type that this config enables.
        # Corresponds to the JSON property `logType`
        # @return [String]
        attr_accessor :log_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @exempted_members = args[:exempted_members] if args.key?(:exempted_members)
          @log_type = args[:log_type] if args.key?(:log_type)
        end
      end
      
      # Associates `members` with a `role`.
      class GoogleIamV1Binding
        include Google::Apis::Core::Hashable
      
        # Represents an expression text. Example:
        # title: "User account presence"
        # description: "Determines whether the request has a user account"
        # expression: "size(request.user) > 0"
        # Corresponds to the JSON property `condition`
        # @return [Google::Apis::MlV1::GoogleTypeExpr]
        attr_accessor :condition
      
        # Specifies the identities requesting access for a Cloud Platform resource.
        # `members` can have the following values:
        # * `allUsers`: A special identifier that represents anyone who is
        # on the internet; with or without a Google account.
        # * `allAuthenticatedUsers`: A special identifier that represents anyone
        # who is authenticated with a Google account or a service account.
        # * `user:`emailid``: An email address that represents a specific Google
        # account. For example, `alice@example.com` .
        # * `serviceAccount:`emailid``: An email address that represents a service
        # account. For example, `my-other-app@appspot.gserviceaccount.com`.
        # * `group:`emailid``: An email address that represents a Google group.
        # For example, `admins@example.com`.
        # * `domain:`domain``: The G Suite domain (primary) that represents all the
        # users of that domain. For example, `google.com` or `example.com`.
        # Corresponds to the JSON property `members`
        # @return [Array<String>]
        attr_accessor :members
      
        # Role that is assigned to `members`.
        # For example, `roles/viewer`, `roles/editor`, or `roles/owner`.
        # Corresponds to the JSON property `role`
        # @return [String]
        attr_accessor :role
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @condition = args[:condition] if args.key?(:condition)
          @members = args[:members] if args.key?(:members)
          @role = args[:role] if args.key?(:role)
        end
      end
      
      # Defines an Identity and Access Management (IAM) policy. It is used to
      # specify access control policies for Cloud Platform resources.
      # A `Policy` is a collection of `bindings`. A `binding` binds one or more
      # `members` to a single `role`. Members can be user accounts, service accounts,
      # Google groups, and domains (such as G Suite). A `role` is a named list of
      # permissions (defined by IAM or configured by users). A `binding` can
      # optionally specify a `condition`, which is a logic expression that further
      # constrains the role binding based on attributes about the request and/or
      # target resource.
      # **JSON Example**
      # `
      # "bindings": [
      # `
      # "role": "roles/resourcemanager.organizationAdmin",
      # "members": [
      # "user:mike@example.com",
      # "group:admins@example.com",
      # "domain:google.com",
      # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
      # ]
      # `,
      # `
      # "role": "roles/resourcemanager.organizationViewer",
      # "members": ["user:eve@example.com"],
      # "condition": `
      # "title": "expirable access",
      # "description": "Does not grant access after Sep 2020",
      # "expression": "request.time <
      # timestamp('2020-10-01T00:00:00.000Z')",
      # `
      # `
      # ]
      # `
      # **YAML Example**
      # bindings:
      # - members:
      # - user:mike@example.com
      # - group:admins@example.com
      # - domain:google.com
      # - serviceAccount:my-project-id@appspot.gserviceaccount.com
      # role: roles/resourcemanager.organizationAdmin
      # - members:
      # - user:eve@example.com
      # role: roles/resourcemanager.organizationViewer
      # condition:
      # title: expirable access
      # description: Does not grant access after Sep 2020
      # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
      # For a description of IAM and its features, see the
      # [IAM developer's guide](https://cloud.google.com/iam/docs).
      class GoogleIamV1Policy
        include Google::Apis::Core::Hashable
      
        # Specifies cloud audit logging configuration for this policy.
        # Corresponds to the JSON property `auditConfigs`
        # @return [Array<Google::Apis::MlV1::GoogleIamV1AuditConfig>]
        attr_accessor :audit_configs
      
        # Associates a list of `members` to a `role`. Optionally may specify a
        # `condition` that determines when binding is in effect.
        # `bindings` with no members will result in an error.
        # Corresponds to the JSON property `bindings`
        # @return [Array<Google::Apis::MlV1::GoogleIamV1Binding>]
        attr_accessor :bindings
      
        # `etag` is used for optimistic concurrency control as a way to help
        # prevent simultaneous updates of a policy from overwriting each other.
        # It is strongly suggested that systems make use of the `etag` in the
        # read-modify-write cycle to perform policy updates in order to avoid race
        # conditions: An `etag` is returned in the response to `getIamPolicy`, and
        # systems are expected to put that etag in the request to `setIamPolicy` to
        # ensure that their change will be applied to the same version of the policy.
        # If no `etag` is provided in the call to `setIamPolicy`, then the existing
        # policy is overwritten. Due to blind-set semantics of an etag-less policy,
        # 'setIamPolicy' will not fail even if either of incoming or stored policy
        # does not meet the version requirements.
        # Corresponds to the JSON property `etag`
        # NOTE: Values are automatically base64 encoded/decoded in the client library.
        # @return [String]
        attr_accessor :etag
      
        # Specifies the format of the policy.
        # Valid values are 0, 1, and 3. Requests specifying an invalid value will be
        # rejected.
        # Operations affecting conditional bindings must specify version 3. This can
        # be either setting a conditional policy, modifying a conditional binding,
        # or removing a conditional binding from the stored conditional policy.
        # Operations on non-conditional policies may specify any valid value or
        # leave the field unset.
        # If no etag is provided in the call to `setIamPolicy`, any version
        # compliance checks on the incoming and/or stored policy is skipped.
        # Corresponds to the JSON property `version`
        # @return [Fixnum]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @audit_configs = args[:audit_configs] if args.key?(:audit_configs)
          @bindings = args[:bindings] if args.key?(:bindings)
          @etag = args[:etag] if args.key?(:etag)
          @version = args[:version] if args.key?(:version)
        end
      end
      
      # Request message for `SetIamPolicy` method.
      class GoogleIamV1SetIamPolicyRequest
        include Google::Apis::Core::Hashable
      
        # Defines an Identity and Access Management (IAM) policy. It is used to
        # specify access control policies for Cloud Platform resources.
        # A `Policy` is a collection of `bindings`. A `binding` binds one or more
        # `members` to a single `role`. Members can be user accounts, service accounts,
        # Google groups, and domains (such as G Suite). A `role` is a named list of
        # permissions (defined by IAM or configured by users). A `binding` can
        # optionally specify a `condition`, which is a logic expression that further
        # constrains the role binding based on attributes about the request and/or
        # target resource.
        # **JSON Example**
        # `
        # "bindings": [
        # `
        # "role": "roles/resourcemanager.organizationAdmin",
        # "members": [
        # "user:mike@example.com",
        # "group:admins@example.com",
        # "domain:google.com",
        # "serviceAccount:my-project-id@appspot.gserviceaccount.com"
        # ]
        # `,
        # `
        # "role": "roles/resourcemanager.organizationViewer",
        # "members": ["user:eve@example.com"],
        # "condition": `
        # "title": "expirable access",
        # "description": "Does not grant access after Sep 2020",
        # "expression": "request.time <
        # timestamp('2020-10-01T00:00:00.000Z')",
        # `
        # `
        # ]
        # `
        # **YAML Example**
        # bindings:
        # - members:
        # - user:mike@example.com
        # - group:admins@example.com
        # - domain:google.com
        # - serviceAccount:my-project-id@appspot.gserviceaccount.com
        # role: roles/resourcemanager.organizationAdmin
        # - members:
        # - user:eve@example.com
        # role: roles/resourcemanager.organizationViewer
        # condition:
        # title: expirable access
        # description: Does not grant access after Sep 2020
        # expression: request.time < timestamp('2020-10-01T00:00:00.000Z')
        # For a description of IAM and its features, see the
        # [IAM developer's guide](https://cloud.google.com/iam/docs).
        # Corresponds to the JSON property `policy`
        # @return [Google::Apis::MlV1::GoogleIamV1Policy]
        attr_accessor :policy
      
        # OPTIONAL: A FieldMask specifying which fields of the policy to modify. Only
        # the fields in the mask will be modified. If no mask is provided, the
        # following default mask is used:
        # paths: "bindings, etag"
        # This field is only used by Cloud IAM.
        # Corresponds to the JSON property `updateMask`
        # @return [String]
        attr_accessor :update_mask
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @policy = args[:policy] if args.key?(:policy)
          @update_mask = args[:update_mask] if args.key?(:update_mask)
        end
      end
      
      # Request message for `TestIamPermissions` method.
      class GoogleIamV1TestIamPermissionsRequest
        include Google::Apis::Core::Hashable
      
        # The set of permissions to check for the `resource`. Permissions with
        # wildcards (such as '*' or 'storage.*') are not allowed. For more
        # information see
        # [IAM Overview](https://cloud.google.com/iam/docs/overview#permissions).
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # Response message for `TestIamPermissions` method.
      class GoogleIamV1TestIamPermissionsResponse
        include Google::Apis::Core::Hashable
      
        # A subset of `TestPermissionsRequest.permissions` that the caller is
        # allowed.
        # Corresponds to the JSON property `permissions`
        # @return [Array<String>]
        attr_accessor :permissions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @permissions = args[:permissions] if args.key?(:permissions)
        end
      end
      
      # The response message for Operations.ListOperations.
      class GoogleLongrunningListOperationsResponse
        include Google::Apis::Core::Hashable
      
        # The standard List next-page token.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # A list of operations that matches the specified filter in the request.
        # Corresponds to the JSON property `operations`
        # @return [Array<Google::Apis::MlV1::GoogleLongrunningOperation>]
        attr_accessor :operations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @operations = args[:operations] if args.key?(:operations)
        end
      end
      
      # This resource represents a long-running operation that is the result of a
      # network API call.
      class GoogleLongrunningOperation
        include Google::Apis::Core::Hashable
      
        # If the value is `false`, it means the operation is still in progress.
        # If `true`, the operation is completed, and either `error` or `response` is
        # available.
        # Corresponds to the JSON property `done`
        # @return [Boolean]
        attr_accessor :done
        alias_method :done?, :done
      
        # The `Status` type defines a logical error model that is suitable for
        # different programming environments, including REST APIs and RPC APIs. It is
        # used by [gRPC](https://github.com/grpc). Each `Status` message contains
        # three pieces of data: error code, error message, and error details.
        # You can find out more about this error model and how to work with it in the
        # [API Design Guide](https://cloud.google.com/apis/design/errors).
        # Corresponds to the JSON property `error`
        # @return [Google::Apis::MlV1::GoogleRpcStatus]
        attr_accessor :error
      
        # Service-specific metadata associated with the operation.  It typically
        # contains progress information and common metadata such as create time.
        # Some services might not provide such metadata.  Any method that returns a
        # long-running operation should document the metadata type, if any.
        # Corresponds to the JSON property `metadata`
        # @return [Hash<String,Object>]
        attr_accessor :metadata
      
        # The server-assigned name, which is only unique within the same service that
        # originally returns it. If you use the default HTTP mapping, the
        # `name` should be a resource name ending with `operations/`unique_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # The normal response of the operation in case of success.  If the original
        # method returns no data on success, such as `Delete`, the response is
        # `google.protobuf.Empty`.  If the original method is standard
        # `Get`/`Create`/`Update`, the response should be the resource.  For other
        # methods, the response should have the type `XxxResponse`, where `Xxx`
        # is the original method name.  For example, if the original method name
        # is `TakeSnapshot()`, the inferred response type is
        # `TakeSnapshotResponse`.
        # Corresponds to the JSON property `response`
        # @return [Hash<String,Object>]
        attr_accessor :response
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @done = args[:done] if args.key?(:done)
          @error = args[:error] if args.key?(:error)
          @metadata = args[:metadata] if args.key?(:metadata)
          @name = args[:name] if args.key?(:name)
          @response = args[:response] if args.key?(:response)
        end
      end
      
      # A generic empty message that you can re-use to avoid defining duplicated
      # empty messages in your APIs. A typical example is to use it as the request
      # or the response type of an API method. For instance:
      # service Foo `
      # rpc Bar(google.protobuf.Empty) returns (google.protobuf.Empty);
      # `
      # The JSON representation for `Empty` is empty JSON object ````.
      class GoogleProtobufEmpty
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # The `Status` type defines a logical error model that is suitable for
      # different programming environments, including REST APIs and RPC APIs. It is
      # used by [gRPC](https://github.com/grpc). Each `Status` message contains
      # three pieces of data: error code, error message, and error details.
      # You can find out more about this error model and how to work with it in the
      # [API Design Guide](https://cloud.google.com/apis/design/errors).
      class GoogleRpcStatus
        include Google::Apis::Core::Hashable
      
        # The status code, which should be an enum value of google.rpc.Code.
        # Corresponds to the JSON property `code`
        # @return [Fixnum]
        attr_accessor :code
      
        # A list of messages that carry the error details.  There is a common set of
        # message types for APIs to use.
        # Corresponds to the JSON property `details`
        # @return [Array<Hash<String,Object>>]
        attr_accessor :details
      
        # A developer-facing error message, which should be in English. Any
        # user-facing error message should be localized and sent in the
        # google.rpc.Status.details field, or localized by the client.
        # Corresponds to the JSON property `message`
        # @return [String]
        attr_accessor :message
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @code = args[:code] if args.key?(:code)
          @details = args[:details] if args.key?(:details)
          @message = args[:message] if args.key?(:message)
        end
      end
      
      # Represents an expression text. Example:
      # title: "User account presence"
      # description: "Determines whether the request has a user account"
      # expression: "size(request.user) > 0"
      class GoogleTypeExpr
        include Google::Apis::Core::Hashable
      
        # An optional description of the expression. This is a longer text which
        # describes the expression, e.g. when hovered over it in a UI.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Textual representation of an expression in
        # Common Expression Language syntax.
        # The application context of the containing message determines which
        # well-known feature set of CEL is supported.
        # Corresponds to the JSON property `expression`
        # @return [String]
        attr_accessor :expression
      
        # An optional string indicating the location of the expression for error
        # reporting, e.g. a file name and a position in the file.
        # Corresponds to the JSON property `location`
        # @return [String]
        attr_accessor :location
      
        # An optional title for the expression, i.e. a short string describing
        # its purpose. This can be used e.g. in UIs which allow to enter the
        # expression.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @description = args[:description] if args.key?(:description)
          @expression = args[:expression] if args.key?(:expression)
          @location = args[:location] if args.key?(:location)
          @title = args[:title] if args.key?(:title)
        end
      end
    end
  end
end
