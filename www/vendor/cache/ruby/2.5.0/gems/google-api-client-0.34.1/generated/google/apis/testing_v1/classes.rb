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
    module TestingV1
      
      # Identifies an account and how to log into it.
      class Account
        include Google::Apis::Core::Hashable
      
        # Enables automatic Google account login.
        # If set, the service automatically generates a Google test account and adds
        # it to the device, before executing the test. Note that test accounts might be
        # reused.
        # Many applications show their full set of functionalities when an account is
        # present on the device. Logging into the device with these generated accounts
        # allows testing more functionalities.
        # Corresponds to the JSON property `googleAuto`
        # @return [Google::Apis::TestingV1::GoogleAuto]
        attr_accessor :google_auto
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @google_auto = args[:google_auto] if args.key?(:google_auto)
        end
      end
      
      # A single Android device.
      class AndroidDevice
        include Google::Apis::Core::Hashable
      
        # Required. The id of the Android device to be used.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `androidModelId`
        # @return [String]
        attr_accessor :android_model_id
      
        # Required. The id of the Android OS version to be used.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `androidVersionId`
        # @return [String]
        attr_accessor :android_version_id
      
        # Required. The locale the test device used for testing.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # Required. How the device is oriented during the test.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `orientation`
        # @return [String]
        attr_accessor :orientation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_model_id = args[:android_model_id] if args.key?(:android_model_id)
          @android_version_id = args[:android_version_id] if args.key?(:android_version_id)
          @locale = args[:locale] if args.key?(:locale)
          @orientation = args[:orientation] if args.key?(:orientation)
        end
      end
      
      # The currently supported Android devices.
      class AndroidDeviceCatalog
        include Google::Apis::Core::Hashable
      
        # The set of supported Android device models.
        # Corresponds to the JSON property `models`
        # @return [Array<Google::Apis::TestingV1::AndroidModel>]
        attr_accessor :models
      
        # Android configuration that can be selected at the time a test is run.
        # Corresponds to the JSON property `runtimeConfiguration`
        # @return [Google::Apis::TestingV1::AndroidRuntimeConfiguration]
        attr_accessor :runtime_configuration
      
        # The set of supported Android OS versions.
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::TestingV1::AndroidVersion>]
        attr_accessor :versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @models = args[:models] if args.key?(:models)
          @runtime_configuration = args[:runtime_configuration] if args.key?(:runtime_configuration)
          @versions = args[:versions] if args.key?(:versions)
        end
      end
      
      # A list of Android device configurations in which the test is to be executed.
      class AndroidDeviceList
        include Google::Apis::Core::Hashable
      
        # Required. A list of Android devices.
        # Corresponds to the JSON property `androidDevices`
        # @return [Array<Google::Apis::TestingV1::AndroidDevice>]
        attr_accessor :android_devices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_devices = args[:android_devices] if args.key?(:android_devices)
        end
      end
      
      # A test of an Android application that can control an Android component
      # independently of its normal lifecycle.
      # Android instrumentation tests run an application APK and test APK inside the
      # same process on a virtual or physical AndroidDevice.  They also specify
      # a test runner class, such as com.google.GoogleTestRunner, which can vary
      # on the specific instrumentation framework chosen.
      # See <http://developer.android.com/tools/testing/testing_android.html> for
      # more information on types of Android tests.
      class AndroidInstrumentationTest
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `appApk`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :app_apk
      
        # An Android App Bundle file format, containing a BundleConfig.pb file,
        # a base module directory, zero or more dynamic feature module directories.
        # <p>See https://developer.android.com/guide/app-bundle/build for guidance on
        # building App Bundles.
        # Corresponds to the JSON property `appBundle`
        # @return [Google::Apis::TestingV1::AppBundle]
        attr_accessor :app_bundle
      
        # The java package for the application under test.
        # The default value is determined by examining the application's manifest.
        # Corresponds to the JSON property `appPackageId`
        # @return [String]
        attr_accessor :app_package_id
      
        # The option of whether running each test within its own invocation of
        # instrumentation with Android Test Orchestrator or not.
        # ** Orchestrator is only compatible with AndroidJUnitRunner version 1.0 or
        # higher! **
        # Orchestrator offers the following benefits:
        # - No shared state
        # - Crashes are isolated
        # - Logs are scoped per test
        # See
        # <https://developer.android.com/training/testing/junit-runner.html#using-
        # android-test-orchestrator>
        # for more information about Android Test Orchestrator.
        # If not set, the test will be run without the orchestrator.
        # Corresponds to the JSON property `orchestratorOption`
        # @return [String]
        attr_accessor :orchestrator_option
      
        # Options for enabling sharding.
        # Corresponds to the JSON property `shardingOption`
        # @return [Google::Apis::TestingV1::ShardingOption]
        attr_accessor :sharding_option
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `testApk`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :test_apk
      
        # The java package for the test to be executed.
        # The default value is determined by examining the application's manifest.
        # Corresponds to the JSON property `testPackageId`
        # @return [String]
        attr_accessor :test_package_id
      
        # The InstrumentationTestRunner class.
        # The default value is determined by examining the application's manifest.
        # Corresponds to the JSON property `testRunnerClass`
        # @return [String]
        attr_accessor :test_runner_class
      
        # Each target must be fully qualified with the package name or class name,
        # in one of these formats:
        # - "package package_name"
        # - "class package_name.class_name"
        # - "class package_name.class_name#method_name"
        # If empty, all targets in the module will be run.
        # Corresponds to the JSON property `testTargets`
        # @return [Array<String>]
        attr_accessor :test_targets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_apk = args[:app_apk] if args.key?(:app_apk)
          @app_bundle = args[:app_bundle] if args.key?(:app_bundle)
          @app_package_id = args[:app_package_id] if args.key?(:app_package_id)
          @orchestrator_option = args[:orchestrator_option] if args.key?(:orchestrator_option)
          @sharding_option = args[:sharding_option] if args.key?(:sharding_option)
          @test_apk = args[:test_apk] if args.key?(:test_apk)
          @test_package_id = args[:test_package_id] if args.key?(:test_package_id)
          @test_runner_class = args[:test_runner_class] if args.key?(:test_runner_class)
          @test_targets = args[:test_targets] if args.key?(:test_targets)
        end
      end
      
      # A set of Android device configuration permutations is defined by the
      # the cross-product of the given axes. Internally, the given AndroidMatrix
      # will be expanded into a set of AndroidDevices.
      # Only supported permutations will be instantiated.  Invalid permutations
      # (e.g., incompatible models/versions) are ignored.
      class AndroidMatrix
        include Google::Apis::Core::Hashable
      
        # Required. The ids of the set of Android device to be used.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `androidModelIds`
        # @return [Array<String>]
        attr_accessor :android_model_ids
      
        # Required. The ids of the set of Android OS version to be used.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `androidVersionIds`
        # @return [Array<String>]
        attr_accessor :android_version_ids
      
        # Required. The set of locales the test device will enable for testing.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `locales`
        # @return [Array<String>]
        attr_accessor :locales
      
        # Required. The set of orientations to test with.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `orientations`
        # @return [Array<String>]
        attr_accessor :orientations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_model_ids = args[:android_model_ids] if args.key?(:android_model_ids)
          @android_version_ids = args[:android_version_ids] if args.key?(:android_version_ids)
          @locales = args[:locales] if args.key?(:locales)
          @orientations = args[:orientations] if args.key?(:orientations)
        end
      end
      
      # A description of an Android device tests may be run on.
      class AndroidModel
        include Google::Apis::Core::Hashable
      
        # The company that this device is branded with.
        # Example: "Google", "Samsung".
        # Corresponds to the JSON property `brand`
        # @return [String]
        attr_accessor :brand
      
        # The name of the industrial design.
        # This corresponds to android.os.Build.DEVICE.
        # Corresponds to the JSON property `codename`
        # @return [String]
        attr_accessor :codename
      
        # Whether this device is virtual or physical.
        # Corresponds to the JSON property `form`
        # @return [String]
        attr_accessor :form
      
        # Whether this device is a phone, tablet, wearable, etc.
        # Corresponds to the JSON property `formFactor`
        # @return [String]
        attr_accessor :form_factor
      
        # The unique opaque id for this model.
        # Use this for invoking the TestExecutionService.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # True if and only if tests with this model are recorded by stitching
        # together screenshots. See use_low_spec_video_recording in device config.
        # Corresponds to the JSON property `lowFpsVideoRecording`
        # @return [Boolean]
        attr_accessor :low_fps_video_recording
        alias_method :low_fps_video_recording?, :low_fps_video_recording
      
        # The manufacturer of this device.
        # Corresponds to the JSON property `manufacturer`
        # @return [String]
        attr_accessor :manufacturer
      
        # The human-readable marketing name for this device model.
        # Examples: "Nexus 5", "Galaxy S5".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Screen density in DPI.
        # This corresponds to ro.sf.lcd_density
        # Corresponds to the JSON property `screenDensity`
        # @return [Fixnum]
        attr_accessor :screen_density
      
        # Screen size in the horizontal (X) dimension measured in pixels.
        # Corresponds to the JSON property `screenX`
        # @return [Fixnum]
        attr_accessor :screen_x
      
        # Screen size in the vertical (Y) dimension measured in pixels.
        # Corresponds to the JSON property `screenY`
        # @return [Fixnum]
        attr_accessor :screen_y
      
        # The list of supported ABIs for this device.
        # This corresponds to either android.os.Build.SUPPORTED_ABIS (for API level
        # 21 and above) or android.os.Build.CPU_ABI/CPU_ABI2.
        # The most preferred ABI is the first element in the list.
        # Elements are optionally prefixed by "version_id:" (where version_id is
        # the id of an AndroidVersion), denoting an ABI that is supported only on
        # a particular version.
        # Corresponds to the JSON property `supportedAbis`
        # @return [Array<String>]
        attr_accessor :supported_abis
      
        # The set of Android versions this device supports.
        # Corresponds to the JSON property `supportedVersionIds`
        # @return [Array<String>]
        attr_accessor :supported_version_ids
      
        # Tags for this dimension.
        # Examples: "default", "preview", "deprecated".
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @brand = args[:brand] if args.key?(:brand)
          @codename = args[:codename] if args.key?(:codename)
          @form = args[:form] if args.key?(:form)
          @form_factor = args[:form_factor] if args.key?(:form_factor)
          @id = args[:id] if args.key?(:id)
          @low_fps_video_recording = args[:low_fps_video_recording] if args.key?(:low_fps_video_recording)
          @manufacturer = args[:manufacturer] if args.key?(:manufacturer)
          @name = args[:name] if args.key?(:name)
          @screen_density = args[:screen_density] if args.key?(:screen_density)
          @screen_x = args[:screen_x] if args.key?(:screen_x)
          @screen_y = args[:screen_y] if args.key?(:screen_y)
          @supported_abis = args[:supported_abis] if args.key?(:supported_abis)
          @supported_version_ids = args[:supported_version_ids] if args.key?(:supported_version_ids)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # A test of an android application that explores the application on a virtual
      # or physical Android Device, finding culprits and crashes as it goes.
      class AndroidRoboTest
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `appApk`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :app_apk
      
        # An Android App Bundle file format, containing a BundleConfig.pb file,
        # a base module directory, zero or more dynamic feature module directories.
        # <p>See https://developer.android.com/guide/app-bundle/build for guidance on
        # building App Bundles.
        # Corresponds to the JSON property `appBundle`
        # @return [Google::Apis::TestingV1::AppBundle]
        attr_accessor :app_bundle
      
        # The initial activity that should be used to start the app.
        # Corresponds to the JSON property `appInitialActivity`
        # @return [String]
        attr_accessor :app_initial_activity
      
        # The java package for the application under test.
        # The default value is determined by examining the application's manifest.
        # Corresponds to the JSON property `appPackageId`
        # @return [String]
        attr_accessor :app_package_id
      
        # The max depth of the traversal stack Robo can explore. Needs to be at least
        # 2 to make Robo explore the app beyond the first activity.
        # Default is 50.
        # Corresponds to the JSON property `maxDepth`
        # @return [Fixnum]
        attr_accessor :max_depth
      
        # The max number of steps Robo can execute.
        # Default is no limit.
        # Corresponds to the JSON property `maxSteps`
        # @return [Fixnum]
        attr_accessor :max_steps
      
        # A set of directives Robo should apply during the crawl.
        # This allows users to customize the crawl. For example, the username and
        # password for a test account can be provided.
        # Corresponds to the JSON property `roboDirectives`
        # @return [Array<Google::Apis::TestingV1::RoboDirective>]
        attr_accessor :robo_directives
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `roboScript`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :robo_script
      
        # The intents used to launch the app for the crawl.
        # If none are provided, then the main launcher activity is launched.
        # If some are provided, then only those provided are launched (the main
        # launcher activity must be provided explicitly).
        # Corresponds to the JSON property `startingIntents`
        # @return [Array<Google::Apis::TestingV1::RoboStartingIntent>]
        attr_accessor :starting_intents
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_apk = args[:app_apk] if args.key?(:app_apk)
          @app_bundle = args[:app_bundle] if args.key?(:app_bundle)
          @app_initial_activity = args[:app_initial_activity] if args.key?(:app_initial_activity)
          @app_package_id = args[:app_package_id] if args.key?(:app_package_id)
          @max_depth = args[:max_depth] if args.key?(:max_depth)
          @max_steps = args[:max_steps] if args.key?(:max_steps)
          @robo_directives = args[:robo_directives] if args.key?(:robo_directives)
          @robo_script = args[:robo_script] if args.key?(:robo_script)
          @starting_intents = args[:starting_intents] if args.key?(:starting_intents)
        end
      end
      
      # Android configuration that can be selected at the time a test is run.
      class AndroidRuntimeConfiguration
        include Google::Apis::Core::Hashable
      
        # The set of available locales.
        # Corresponds to the JSON property `locales`
        # @return [Array<Google::Apis::TestingV1::Locale>]
        attr_accessor :locales
      
        # The set of available orientations.
        # Corresponds to the JSON property `orientations`
        # @return [Array<Google::Apis::TestingV1::Orientation>]
        attr_accessor :orientations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locales = args[:locales] if args.key?(:locales)
          @orientations = args[:orientations] if args.key?(:orientations)
        end
      end
      
      # A test of an Android Application with a Test Loop.
      # The intent \<intent-name\> will be implicitly added, since Games is the only
      # user of this api, for the time being.
      class AndroidTestLoop
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `appApk`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :app_apk
      
        # An Android App Bundle file format, containing a BundleConfig.pb file,
        # a base module directory, zero or more dynamic feature module directories.
        # <p>See https://developer.android.com/guide/app-bundle/build for guidance on
        # building App Bundles.
        # Corresponds to the JSON property `appBundle`
        # @return [Google::Apis::TestingV1::AppBundle]
        attr_accessor :app_bundle
      
        # The java package for the application under test.
        # The default is determined by examining the application's manifest.
        # Corresponds to the JSON property `appPackageId`
        # @return [String]
        attr_accessor :app_package_id
      
        # The list of scenario labels that should be run during the test.
        # The scenario labels should map to labels defined in the application's
        # manifest. For example, player_experience and
        # com.google.test.loops.player_experience add all of the loops labeled in the
        # manifest with the com.google.test.loops.player_experience name to the
        # execution.
        # Scenarios can also be specified in the scenarios field.
        # Corresponds to the JSON property `scenarioLabels`
        # @return [Array<String>]
        attr_accessor :scenario_labels
      
        # The list of scenarios that should be run during the test.
        # The default is all test loops, derived from the application's
        # manifest.
        # Corresponds to the JSON property `scenarios`
        # @return [Array<Fixnum>]
        attr_accessor :scenarios
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_apk = args[:app_apk] if args.key?(:app_apk)
          @app_bundle = args[:app_bundle] if args.key?(:app_bundle)
          @app_package_id = args[:app_package_id] if args.key?(:app_package_id)
          @scenario_labels = args[:scenario_labels] if args.key?(:scenario_labels)
          @scenarios = args[:scenarios] if args.key?(:scenarios)
        end
      end
      
      # A version of the Android OS.
      class AndroidVersion
        include Google::Apis::Core::Hashable
      
        # The API level for this Android version.
        # Examples: 18, 19.
        # Corresponds to the JSON property `apiLevel`
        # @return [Fixnum]
        attr_accessor :api_level
      
        # The code name for this Android version.
        # Examples: "JellyBean", "KitKat".
        # Corresponds to the JSON property `codeName`
        # @return [String]
        attr_accessor :code_name
      
        # Data about the relative number of devices running a
        # given configuration of the Android platform.
        # Corresponds to the JSON property `distribution`
        # @return [Google::Apis::TestingV1::Distribution]
        attr_accessor :distribution
      
        # An opaque id for this Android version.
        # Use this id to invoke the TestExecutionService.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Represents a whole or partial calendar date, e.g. a birthday. The time of day
        # and time zone are either specified elsewhere or are not significant. The date
        # is relative to the Proleptic Gregorian Calendar. This can represent:
        # * A full date, with non-zero year, month and day values
        # * A month and day value, with a zero year, e.g. an anniversary
        # * A year on its own, with zero month and day values
        # * A year and month value, with a zero day, e.g. a credit card expiration date
        # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
        # Corresponds to the JSON property `releaseDate`
        # @return [Google::Apis::TestingV1::Date]
        attr_accessor :release_date
      
        # Tags for this dimension.
        # Examples: "default", "preview", "deprecated".
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        # A string representing this version of the Android OS.
        # Examples: "4.3", "4.4".
        # Corresponds to the JSON property `versionString`
        # @return [String]
        attr_accessor :version_string
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @api_level = args[:api_level] if args.key?(:api_level)
          @code_name = args[:code_name] if args.key?(:code_name)
          @distribution = args[:distribution] if args.key?(:distribution)
          @id = args[:id] if args.key?(:id)
          @release_date = args[:release_date] if args.key?(:release_date)
          @tags = args[:tags] if args.key?(:tags)
          @version_string = args[:version_string] if args.key?(:version_string)
        end
      end
      
      # An Android package file to install.
      class Apk
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `location`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :location
      
        # The java package for the APK to be installed.
        # Value is determined by examining the application's manifest.
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @location = args[:location] if args.key?(:location)
          @package_name = args[:package_name] if args.key?(:package_name)
        end
      end
      
      # Android application details based on application manifest and apk archive
      # contents.
      class ApkDetail
        include Google::Apis::Core::Hashable
      
        # An Android app manifest. See
        # http://developer.android.com/guide/topics/manifest/manifest-intro.html
        # Corresponds to the JSON property `apkManifest`
        # @return [Google::Apis::TestingV1::ApkManifest]
        attr_accessor :apk_manifest
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @apk_manifest = args[:apk_manifest] if args.key?(:apk_manifest)
        end
      end
      
      # An Android app manifest. See
      # http://developer.android.com/guide/topics/manifest/manifest-intro.html
      class ApkManifest
        include Google::Apis::Core::Hashable
      
        # User-readable name for the application.
        # Corresponds to the JSON property `applicationLabel`
        # @return [String]
        attr_accessor :application_label
      
        # 
        # Corresponds to the JSON property `intentFilters`
        # @return [Array<Google::Apis::TestingV1::IntentFilter>]
        attr_accessor :intent_filters
      
        # Maximum API level on which the application is designed to run.
        # Corresponds to the JSON property `maxSdkVersion`
        # @return [Fixnum]
        attr_accessor :max_sdk_version
      
        # Minimum API level required for the application to run.
        # Corresponds to the JSON property `minSdkVersion`
        # @return [Fixnum]
        attr_accessor :min_sdk_version
      
        # Full Java-style package name for this application, e.g.
        # "com.example.foo".
        # Corresponds to the JSON property `packageName`
        # @return [String]
        attr_accessor :package_name
      
        # Specifies the API Level on which the application is designed to run.
        # Corresponds to the JSON property `targetSdkVersion`
        # @return [Fixnum]
        attr_accessor :target_sdk_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @application_label = args[:application_label] if args.key?(:application_label)
          @intent_filters = args[:intent_filters] if args.key?(:intent_filters)
          @max_sdk_version = args[:max_sdk_version] if args.key?(:max_sdk_version)
          @min_sdk_version = args[:min_sdk_version] if args.key?(:min_sdk_version)
          @package_name = args[:package_name] if args.key?(:package_name)
          @target_sdk_version = args[:target_sdk_version] if args.key?(:target_sdk_version)
        end
      end
      
      # An Android App Bundle file format, containing a BundleConfig.pb file,
      # a base module directory, zero or more dynamic feature module directories.
      # <p>See https://developer.android.com/guide/app-bundle/build for guidance on
      # building App Bundles.
      class AppBundle
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `bundleLocation`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :bundle_location
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bundle_location = args[:bundle_location] if args.key?(:bundle_location)
        end
      end
      
      # Response containing the current state of the specified test matrix.
      class CancelTestMatrixResponse
        include Google::Apis::Core::Hashable
      
        # The current rolled-up state of the test matrix.
        # If this state is already final, then the cancelation request will
        # have no effect.
        # Corresponds to the JSON property `testState`
        # @return [String]
        attr_accessor :test_state
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @test_state = args[:test_state] if args.key?(:test_state)
        end
      end
      
      # Information about the client which invoked the test.
      class ClientInfo
        include Google::Apis::Core::Hashable
      
        # The list of detailed information about client.
        # Corresponds to the JSON property `clientInfoDetails`
        # @return [Array<Google::Apis::TestingV1::ClientInfoDetail>]
        attr_accessor :client_info_details
      
        # Required. Client name, such as gcloud.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_info_details = args[:client_info_details] if args.key?(:client_info_details)
          @name = args[:name] if args.key?(:name)
        end
      end
      
      # Key-value pair of detailed information about the client which invoked the
      # test. Examples: `'Version', '1.0'`, `'Release Track', 'BETA'`.
      class ClientInfoDetail
        include Google::Apis::Core::Hashable
      
        # Required. The key of detailed client information.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Required. The value of detailed client information.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # Represents a whole or partial calendar date, e.g. a birthday. The time of day
      # and time zone are either specified elsewhere or are not significant. The date
      # is relative to the Proleptic Gregorian Calendar. This can represent:
      # * A full date, with non-zero year, month and day values
      # * A month and day value, with a zero year, e.g. an anniversary
      # * A year on its own, with zero month and day values
      # * A year and month value, with a zero day, e.g. a credit card expiration date
      # Related types are google.type.TimeOfDay and `google.protobuf.Timestamp`.
      class Date
        include Google::Apis::Core::Hashable
      
        # Day of month. Must be from 1 to 31 and valid for the year and month, or 0
        # if specifying a year by itself or a year and month where the day is not
        # significant.
        # Corresponds to the JSON property `day`
        # @return [Fixnum]
        attr_accessor :day
      
        # Month of year. Must be from 1 to 12, or 0 if specifying a year without a
        # month and day.
        # Corresponds to the JSON property `month`
        # @return [Fixnum]
        attr_accessor :month
      
        # Year of date. Must be from 1 to 9999, or 0 if specifying a date without
        # a year.
        # Corresponds to the JSON property `year`
        # @return [Fixnum]
        attr_accessor :year
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @day = args[:day] if args.key?(:day)
          @month = args[:month] if args.key?(:month)
          @year = args[:year] if args.key?(:year)
        end
      end
      
      # A single device file description.
      class DeviceFile
        include Google::Apis::Core::Hashable
      
        # An opaque binary blob file to install on the device before the test starts.
        # Corresponds to the JSON property `obbFile`
        # @return [Google::Apis::TestingV1::ObbFile]
        attr_accessor :obb_file
      
        # A file or directory to install on the device before the test starts.
        # Corresponds to the JSON property `regularFile`
        # @return [Google::Apis::TestingV1::RegularFile]
        attr_accessor :regular_file
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @obb_file = args[:obb_file] if args.key?(:obb_file)
          @regular_file = args[:regular_file] if args.key?(:regular_file)
        end
      end
      
      # Data about the relative number of devices running a
      # given configuration of the Android platform.
      class Distribution
        include Google::Apis::Core::Hashable
      
        # Output only. The estimated fraction (0-1) of the total market with this
        # configuration.
        # Corresponds to the JSON property `marketShare`
        # @return [Float]
        attr_accessor :market_share
      
        # Output only. The time this distribution was measured.
        # Corresponds to the JSON property `measurementTime`
        # @return [String]
        attr_accessor :measurement_time
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @market_share = args[:market_share] if args.key?(:market_share)
          @measurement_time = args[:measurement_time] if args.key?(:measurement_time)
        end
      end
      
      # The environment in which the test is run.
      class Environment
        include Google::Apis::Core::Hashable
      
        # A single Android device.
        # Corresponds to the JSON property `androidDevice`
        # @return [Google::Apis::TestingV1::AndroidDevice]
        attr_accessor :android_device
      
        # A single iOS device.
        # Corresponds to the JSON property `iosDevice`
        # @return [Google::Apis::TestingV1::IosDevice]
        attr_accessor :ios_device
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_device = args[:android_device] if args.key?(:android_device)
          @ios_device = args[:ios_device] if args.key?(:ios_device)
        end
      end
      
      # The matrix of environments in which the test is to be executed.
      class EnvironmentMatrix
        include Google::Apis::Core::Hashable
      
        # A list of Android device configurations in which the test is to be executed.
        # Corresponds to the JSON property `androidDeviceList`
        # @return [Google::Apis::TestingV1::AndroidDeviceList]
        attr_accessor :android_device_list
      
        # A set of Android device configuration permutations is defined by the
        # the cross-product of the given axes. Internally, the given AndroidMatrix
        # will be expanded into a set of AndroidDevices.
        # Only supported permutations will be instantiated.  Invalid permutations
        # (e.g., incompatible models/versions) are ignored.
        # Corresponds to the JSON property `androidMatrix`
        # @return [Google::Apis::TestingV1::AndroidMatrix]
        attr_accessor :android_matrix
      
        # A list of iOS device configurations in which the test is to be executed.
        # Corresponds to the JSON property `iosDeviceList`
        # @return [Google::Apis::TestingV1::IosDeviceList]
        attr_accessor :ios_device_list
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_device_list = args[:android_device_list] if args.key?(:android_device_list)
          @android_matrix = args[:android_matrix] if args.key?(:android_matrix)
          @ios_device_list = args[:ios_device_list] if args.key?(:ios_device_list)
        end
      end
      
      # A key-value pair passed as an environment variable to the test.
      class EnvironmentVariable
        include Google::Apis::Core::Hashable
      
        # Key for the environment variable.
        # Corresponds to the JSON property `key`
        # @return [String]
        attr_accessor :key
      
        # Value for the environment variable.
        # Corresponds to the JSON property `value`
        # @return [String]
        attr_accessor :value
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @key = args[:key] if args.key?(:key)
          @value = args[:value] if args.key?(:value)
        end
      end
      
      # A reference to a file, used for user inputs.
      class FileReference
        include Google::Apis::Core::Hashable
      
        # A path to a file in Google Cloud Storage.
        # Example: gs://build-app-1414623860166/app-debug-unaligned.apk
        # Corresponds to the JSON property `gcsPath`
        # @return [String]
        attr_accessor :gcs_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_path = args[:gcs_path] if args.key?(:gcs_path)
        end
      end
      
      # Response containing the details of the specified Android application APK.
      class GetApkDetailsResponse
        include Google::Apis::Core::Hashable
      
        # Android application details based on application manifest and apk archive
        # contents.
        # Corresponds to the JSON property `apkDetail`
        # @return [Google::Apis::TestingV1::ApkDetail]
        attr_accessor :apk_detail
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @apk_detail = args[:apk_detail] if args.key?(:apk_detail)
        end
      end
      
      # Enables automatic Google account login.
      # If set, the service automatically generates a Google test account and adds
      # it to the device, before executing the test. Note that test accounts might be
      # reused.
      # Many applications show their full set of functionalities when an account is
      # present on the device. Logging into the device with these generated accounts
      # allows testing more functionalities.
      class GoogleAuto
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A storage location within Google cloud storage (GCS).
      class GoogleCloudStorage
        include Google::Apis::Core::Hashable
      
        # Required. The path to a directory in GCS that will
        # eventually contain the results for this test.
        # The requesting user must have write access on the bucket in the supplied
        # path.
        # Corresponds to the JSON property `gcsPath`
        # @return [String]
        attr_accessor :gcs_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @gcs_path = args[:gcs_path] if args.key?(:gcs_path)
        end
      end
      
      # The <intent-filter> section of an <activity> tag.
      # https://developer.android.com/guide/topics/manifest/intent-filter-element.html
      class IntentFilter
        include Google::Apis::Core::Hashable
      
        # The android:name value of the <action> tag.
        # Corresponds to the JSON property `actionNames`
        # @return [Array<String>]
        attr_accessor :action_names
      
        # The android:name value of the <category> tag.
        # Corresponds to the JSON property `categoryNames`
        # @return [Array<String>]
        attr_accessor :category_names
      
        # The android:mimeType value of the <data> tag.
        # Corresponds to the JSON property `mimeType`
        # @return [String]
        attr_accessor :mime_type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_names = args[:action_names] if args.key?(:action_names)
          @category_names = args[:category_names] if args.key?(:category_names)
          @mime_type = args[:mime_type] if args.key?(:mime_type)
        end
      end
      
      # A single iOS device.
      class IosDevice
        include Google::Apis::Core::Hashable
      
        # Required. The id of the iOS device to be used.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `iosModelId`
        # @return [String]
        attr_accessor :ios_model_id
      
        # Required. The id of the iOS major software version to be used.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `iosVersionId`
        # @return [String]
        attr_accessor :ios_version_id
      
        # Required. The locale the test device used for testing.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `locale`
        # @return [String]
        attr_accessor :locale
      
        # Required. How the device is oriented during the test.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Corresponds to the JSON property `orientation`
        # @return [String]
        attr_accessor :orientation
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ios_model_id = args[:ios_model_id] if args.key?(:ios_model_id)
          @ios_version_id = args[:ios_version_id] if args.key?(:ios_version_id)
          @locale = args[:locale] if args.key?(:locale)
          @orientation = args[:orientation] if args.key?(:orientation)
        end
      end
      
      # The currently supported iOS devices.
      class IosDeviceCatalog
        include Google::Apis::Core::Hashable
      
        # The set of supported iOS device models.
        # Corresponds to the JSON property `models`
        # @return [Array<Google::Apis::TestingV1::IosModel>]
        attr_accessor :models
      
        # iOS configuration that can be selected at the time a test is run.
        # Corresponds to the JSON property `runtimeConfiguration`
        # @return [Google::Apis::TestingV1::IosRuntimeConfiguration]
        attr_accessor :runtime_configuration
      
        # The set of supported iOS software versions.
        # Corresponds to the JSON property `versions`
        # @return [Array<Google::Apis::TestingV1::IosVersion>]
        attr_accessor :versions
      
        # The set of supported Xcode versions.
        # Corresponds to the JSON property `xcodeVersions`
        # @return [Array<Google::Apis::TestingV1::XcodeVersion>]
        attr_accessor :xcode_versions
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @models = args[:models] if args.key?(:models)
          @runtime_configuration = args[:runtime_configuration] if args.key?(:runtime_configuration)
          @versions = args[:versions] if args.key?(:versions)
          @xcode_versions = args[:xcode_versions] if args.key?(:xcode_versions)
        end
      end
      
      # A list of iOS device configurations in which the test is to be executed.
      class IosDeviceList
        include Google::Apis::Core::Hashable
      
        # Required. A list of iOS devices.
        # Corresponds to the JSON property `iosDevices`
        # @return [Array<Google::Apis::TestingV1::IosDevice>]
        attr_accessor :ios_devices
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @ios_devices = args[:ios_devices] if args.key?(:ios_devices)
        end
      end
      
      # A description of an iOS device tests may be run on.
      # Next tag: 11
      class IosModel
        include Google::Apis::Core::Hashable
      
        # Device capabilities.
        # Copied from
        # https://developer.apple.com/library/archive/documentation/DeviceInformation/
        # Reference/iOSDeviceCompatibility/DeviceCompatibilityMatrix/
        # DeviceCompatibilityMatrix.html
        # Corresponds to the JSON property `deviceCapabilities`
        # @return [Array<String>]
        attr_accessor :device_capabilities
      
        # Whether this device is a phone, tablet, wearable, etc.
        # Corresponds to the JSON property `formFactor`
        # @return [String]
        attr_accessor :form_factor
      
        # The unique opaque id for this model.
        # Use this for invoking the TestExecutionService.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # The human-readable name for this device model.
        # Examples: "iPhone 4s", "iPad Mini 2".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Screen density in DPI.
        # Corresponds to the JSON property `screenDensity`
        # @return [Fixnum]
        attr_accessor :screen_density
      
        # Screen size in the horizontal (X) dimension measured in pixels.
        # Corresponds to the JSON property `screenX`
        # @return [Fixnum]
        attr_accessor :screen_x
      
        # Screen size in the vertical (Y) dimension measured in pixels.
        # Corresponds to the JSON property `screenY`
        # @return [Fixnum]
        attr_accessor :screen_y
      
        # The set of iOS major software versions this device supports.
        # Corresponds to the JSON property `supportedVersionIds`
        # @return [Array<String>]
        attr_accessor :supported_version_ids
      
        # Tags for this dimension.
        # Examples: "default", "preview", "deprecated".
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @device_capabilities = args[:device_capabilities] if args.key?(:device_capabilities)
          @form_factor = args[:form_factor] if args.key?(:form_factor)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @screen_density = args[:screen_density] if args.key?(:screen_density)
          @screen_x = args[:screen_x] if args.key?(:screen_x)
          @screen_y = args[:screen_y] if args.key?(:screen_y)
          @supported_version_ids = args[:supported_version_ids] if args.key?(:supported_version_ids)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # iOS configuration that can be selected at the time a test is run.
      class IosRuntimeConfiguration
        include Google::Apis::Core::Hashable
      
        # The set of available locales.
        # Corresponds to the JSON property `locales`
        # @return [Array<Google::Apis::TestingV1::Locale>]
        attr_accessor :locales
      
        # The set of available orientations.
        # Corresponds to the JSON property `orientations`
        # @return [Array<Google::Apis::TestingV1::Orientation>]
        attr_accessor :orientations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @locales = args[:locales] if args.key?(:locales)
          @orientations = args[:orientations] if args.key?(:orientations)
        end
      end
      
      # A test of an iOS application that implements one or more game loop scenarios.
      # This test type accepts an archived application (.ipa file) and a list of
      # integer scenarios that will be executed on the app sequentially.
      class IosTestLoop
        include Google::Apis::Core::Hashable
      
        # Output only. The bundle id for the application under test.
        # Corresponds to the JSON property `appBundleId`
        # @return [String]
        attr_accessor :app_bundle_id
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `appIpa`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :app_ipa
      
        # The list of scenarios that should be run during the test. Defaults to the
        # single scenario 0 if unspecified.
        # Corresponds to the JSON property `scenarios`
        # @return [Array<Fixnum>]
        attr_accessor :scenarios
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_bundle_id = args[:app_bundle_id] if args.key?(:app_bundle_id)
          @app_ipa = args[:app_ipa] if args.key?(:app_ipa)
          @scenarios = args[:scenarios] if args.key?(:scenarios)
        end
      end
      
      # A description of how to set up an iOS device prior to running the test.
      class IosTestSetup
        include Google::Apis::Core::Hashable
      
        # The network traffic profile used for running the test.
        # Available network profiles can be queried by using the
        # NETWORK_CONFIGURATION environment type when calling
        # TestEnvironmentDiscoveryService.GetTestEnvironmentCatalog.
        # Corresponds to the JSON property `networkProfile`
        # @return [String]
        attr_accessor :network_profile
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @network_profile = args[:network_profile] if args.key?(:network_profile)
        end
      end
      
      # An iOS version.
      class IosVersion
        include Google::Apis::Core::Hashable
      
        # An opaque id for this iOS version.
        # Use this id to invoke the TestExecutionService.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # An integer representing the major iOS version.
        # Examples: "8", "9".
        # Corresponds to the JSON property `majorVersion`
        # @return [Fixnum]
        attr_accessor :major_version
      
        # An integer representing the minor iOS version.
        # Examples: "1", "2".
        # Corresponds to the JSON property `minorVersion`
        # @return [Fixnum]
        attr_accessor :minor_version
      
        # The available Xcode versions for this version.
        # Corresponds to the JSON property `supportedXcodeVersionIds`
        # @return [Array<String>]
        attr_accessor :supported_xcode_version_ids
      
        # Tags for this dimension.
        # Examples: "default", "preview", "deprecated".
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @major_version = args[:major_version] if args.key?(:major_version)
          @minor_version = args[:minor_version] if args.key?(:minor_version)
          @supported_xcode_version_ids = args[:supported_xcode_version_ids] if args.key?(:supported_xcode_version_ids)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # A test of an iOS application that uses the XCTest framework.
      # Xcode supports the option to "build for testing", which generates an
      # .xctestrun file that contains a test specification (arguments, test methods,
      # etc). This test type accepts a zip file containing the .xctestrun file and
      # the corresponding contents of the Build/Products directory that contains all
      # the binaries needed to run the tests.
      class IosXcTest
        include Google::Apis::Core::Hashable
      
        # Output only. The bundle id for the application under test.
        # Corresponds to the JSON property `appBundleId`
        # @return [String]
        attr_accessor :app_bundle_id
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `testsZip`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :tests_zip
      
        # The Xcode version that should be used for the test.
        # Use the TestEnvironmentDiscoveryService to get supported options.
        # Defaults to the latest Xcode version Firebase Test Lab supports.
        # Corresponds to the JSON property `xcodeVersion`
        # @return [String]
        attr_accessor :xcode_version
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `xctestrun`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :xctestrun
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @app_bundle_id = args[:app_bundle_id] if args.key?(:app_bundle_id)
          @tests_zip = args[:tests_zip] if args.key?(:tests_zip)
          @xcode_version = args[:xcode_version] if args.key?(:xcode_version)
          @xctestrun = args[:xctestrun] if args.key?(:xctestrun)
        end
      end
      
      # Specifies an intent that starts the main launcher activity.
      class LauncherActivityIntent
        include Google::Apis::Core::Hashable
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
        end
      end
      
      # A location/region designation for language.
      class Locale
        include Google::Apis::Core::Hashable
      
        # The id for this locale.
        # Example: "en_US".
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A human-friendly name for this language/locale.
        # Example: "English".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # A human-friendly string representing the region for this
        # locale. Example: "United States". Not present for every locale.
        # Corresponds to the JSON property `region`
        # @return [String]
        attr_accessor :region
      
        # Tags for this dimension.
        # Example: "default".
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @region = args[:region] if args.key?(:region)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # Shards test cases into the specified groups of packages, classes, and/or
      # methods.
      # With manual sharding enabled, specifying test targets via
      # environment_variables or in InstrumentationTest is invalid.
      class ManualSharding
        include Google::Apis::Core::Hashable
      
        # Required. Group of packages, classes, and/or test methods to be run for
        # each shard. The number of shard_test_targets must be > 1, and <= 50.
        # Corresponds to the JSON property `testTargetsForShard`
        # @return [Array<Google::Apis::TestingV1::TestTargetsForShard>]
        attr_accessor :test_targets_for_shard
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @test_targets_for_shard = args[:test_targets_for_shard] if args.key?(:test_targets_for_shard)
        end
      end
      
      # 
      class NetworkConfiguration
        include Google::Apis::Core::Hashable
      
        # Network emulation parameters.
        # Corresponds to the JSON property `downRule`
        # @return [Google::Apis::TestingV1::TrafficRule]
        attr_accessor :down_rule
      
        # The unique opaque id for this network traffic configuration.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Network emulation parameters.
        # Corresponds to the JSON property `upRule`
        # @return [Google::Apis::TestingV1::TrafficRule]
        attr_accessor :up_rule
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @down_rule = args[:down_rule] if args.key?(:down_rule)
          @id = args[:id] if args.key?(:id)
          @up_rule = args[:up_rule] if args.key?(:up_rule)
        end
      end
      
      # 
      class NetworkConfigurationCatalog
        include Google::Apis::Core::Hashable
      
        # 
        # Corresponds to the JSON property `configurations`
        # @return [Array<Google::Apis::TestingV1::NetworkConfiguration>]
        attr_accessor :configurations
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @configurations = args[:configurations] if args.key?(:configurations)
        end
      end
      
      # An opaque binary blob file to install on the device before the test starts.
      class ObbFile
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `obb`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :obb
      
        # Required. OBB file name which must conform to the format as specified by
        # Android
        # e.g. [main|patch].0300110.com.example.android.obb
        # which will be installed into
        # \<shared-storage\>/Android/obb/\<package-name\>/
        # on the device.
        # Corresponds to the JSON property `obbFileName`
        # @return [String]
        attr_accessor :obb_file_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @obb = args[:obb] if args.key?(:obb)
          @obb_file_name = args[:obb_file_name] if args.key?(:obb_file_name)
        end
      end
      
      # Screen orientation of the device.
      class Orientation
        include Google::Apis::Core::Hashable
      
        # The id for this orientation.
        # Example: "portrait".
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # A human-friendly name for this orientation.
        # Example: "portrait".
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Tags for this dimension.
        # Example: "default".
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @id = args[:id] if args.key?(:id)
          @name = args[:name] if args.key?(:name)
          @tags = args[:tags] if args.key?(:tags)
        end
      end
      
      # The currently provided software environment on the devices under test.
      class ProvidedSoftwareCatalog
        include Google::Apis::Core::Hashable
      
        # A string representing the current version of Android Test
        # Orchestrator that is provided by TestExecutionService.
        # Example: "1.0.2 beta".
        # Corresponds to the JSON property `orchestratorVersion`
        # @return [String]
        attr_accessor :orchestrator_version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @orchestrator_version = args[:orchestrator_version] if args.key?(:orchestrator_version)
        end
      end
      
      # A file or directory to install on the device before the test starts.
      class RegularFile
        include Google::Apis::Core::Hashable
      
        # A reference to a file, used for user inputs.
        # Corresponds to the JSON property `content`
        # @return [Google::Apis::TestingV1::FileReference]
        attr_accessor :content
      
        # Required. Where to put the content on the device. Must be an absolute,
        # whitelisted path. If the file exists, it will be replaced.
        # The following device-side directories and any of their subdirectories are
        # whitelisted:
        # <p>$`EXTERNAL_STORAGE`, or /sdcard</p>
        # <p>$`ANDROID_DATA`/local/tmp, or /data/local/tmp</p>
        # <p>Specifying a path outside of these directory trees is invalid.
        # <p> The paths /sdcard and /data will be made available and treated as
        # implicit path substitutions. E.g. if /sdcard on a particular device does
        # not map to external storage, the system will replace it with the external
        # storage path prefix for that device and copy the file there.
        # <p> It is strongly advised to use the <a href=
        # "http://developer.android.com/reference/android/os/Environment.html">
        # Environment API</a> in app and test code to access files on the device in a
        # portable way.
        # Corresponds to the JSON property `devicePath`
        # @return [String]
        attr_accessor :device_path
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @content = args[:content] if args.key?(:content)
          @device_path = args[:device_path] if args.key?(:device_path)
        end
      end
      
      # Locations where the results of running the test are stored.
      class ResultStorage
        include Google::Apis::Core::Hashable
      
        # A storage location within Google cloud storage (GCS).
        # Corresponds to the JSON property `googleCloudStorage`
        # @return [Google::Apis::TestingV1::GoogleCloudStorage]
        attr_accessor :google_cloud_storage
      
        # Output only. URL to the results in the Firebase Web Console.
        # Corresponds to the JSON property `resultsUrl`
        # @return [String]
        attr_accessor :results_url
      
        # Represents a tool results execution resource.
        # This has the results of a TestMatrix.
        # Corresponds to the JSON property `toolResultsExecution`
        # @return [Google::Apis::TestingV1::ToolResultsExecution]
        attr_accessor :tool_results_execution
      
        # Represents a tool results history resource.
        # Corresponds to the JSON property `toolResultsHistory`
        # @return [Google::Apis::TestingV1::ToolResultsHistory]
        attr_accessor :tool_results_history
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @google_cloud_storage = args[:google_cloud_storage] if args.key?(:google_cloud_storage)
          @results_url = args[:results_url] if args.key?(:results_url)
          @tool_results_execution = args[:tool_results_execution] if args.key?(:tool_results_execution)
          @tool_results_history = args[:tool_results_history] if args.key?(:tool_results_history)
        end
      end
      
      # Directs Robo to interact with a specific UI element if it is encountered
      # during the crawl. Currently, Robo can perform text entry or element click.
      class RoboDirective
        include Google::Apis::Core::Hashable
      
        # Required. The type of action that Robo should perform on the specified
        # element.
        # Corresponds to the JSON property `actionType`
        # @return [String]
        attr_accessor :action_type
      
        # The text that Robo is directed to set. If left empty, the directive will be
        # treated as a CLICK on the element matching the resource_name.
        # Corresponds to the JSON property `inputText`
        # @return [String]
        attr_accessor :input_text
      
        # Required. The android resource name of the target UI element.
        # For example,
        # in Java: R.string.foo
        # in xml: @string/foo
        # Only the "foo" part is needed.
        # Reference doc:
        # https://developer.android.com/guide/topics/resources/accessing-resources.html
        # Corresponds to the JSON property `resourceName`
        # @return [String]
        attr_accessor :resource_name
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action_type = args[:action_type] if args.key?(:action_type)
          @input_text = args[:input_text] if args.key?(:input_text)
          @resource_name = args[:resource_name] if args.key?(:resource_name)
        end
      end
      
      # Message for specifying the start activities to crawl.
      class RoboStartingIntent
        include Google::Apis::Core::Hashable
      
        # Specifies an intent that starts the main launcher activity.
        # Corresponds to the JSON property `launcherActivity`
        # @return [Google::Apis::TestingV1::LauncherActivityIntent]
        attr_accessor :launcher_activity
      
        # A starting intent specified by an action, uri, and categories.
        # Corresponds to the JSON property `startActivity`
        # @return [Google::Apis::TestingV1::StartActivityIntent]
        attr_accessor :start_activity
      
        # Timeout in seconds for each intent.
        # Corresponds to the JSON property `timeout`
        # @return [String]
        attr_accessor :timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @launcher_activity = args[:launcher_activity] if args.key?(:launcher_activity)
          @start_activity = args[:start_activity] if args.key?(:start_activity)
          @timeout = args[:timeout] if args.key?(:timeout)
        end
      end
      
      # Output only. Details about the shard.
      class Shard
        include Google::Apis::Core::Hashable
      
        # Output only. The total number of shards.
        # Corresponds to the JSON property `numShards`
        # @return [Fixnum]
        attr_accessor :num_shards
      
        # Output only. The index of the shard among all the shards.
        # Corresponds to the JSON property `shardIndex`
        # @return [Fixnum]
        attr_accessor :shard_index
      
        # Test targets for a shard.
        # Corresponds to the JSON property `testTargetsForShard`
        # @return [Google::Apis::TestingV1::TestTargetsForShard]
        attr_accessor :test_targets_for_shard
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_shards = args[:num_shards] if args.key?(:num_shards)
          @shard_index = args[:shard_index] if args.key?(:shard_index)
          @test_targets_for_shard = args[:test_targets_for_shard] if args.key?(:test_targets_for_shard)
        end
      end
      
      # Options for enabling sharding.
      class ShardingOption
        include Google::Apis::Core::Hashable
      
        # Shards test cases into the specified groups of packages, classes, and/or
        # methods.
        # With manual sharding enabled, specifying test targets via
        # environment_variables or in InstrumentationTest is invalid.
        # Corresponds to the JSON property `manualSharding`
        # @return [Google::Apis::TestingV1::ManualSharding]
        attr_accessor :manual_sharding
      
        # Uniformly shards test cases given a total number of shards.
        # For Instrumentation test, it will be translated to “-e numShard” “-e
        # shardIndex” AndroidJUnitRunner arguments. With uniform sharding enabled,
        # specifying these sharding arguments via environment_variables is invalid.
        # Corresponds to the JSON property `uniformSharding`
        # @return [Google::Apis::TestingV1::UniformSharding]
        attr_accessor :uniform_sharding
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @manual_sharding = args[:manual_sharding] if args.key?(:manual_sharding)
          @uniform_sharding = args[:uniform_sharding] if args.key?(:uniform_sharding)
        end
      end
      
      # A starting intent specified by an action, uri, and categories.
      class StartActivityIntent
        include Google::Apis::Core::Hashable
      
        # Action name.
        # Required for START_ACTIVITY.
        # Corresponds to the JSON property `action`
        # @return [String]
        attr_accessor :action
      
        # Intent categories to set on the intent.
        # Corresponds to the JSON property `categories`
        # @return [Array<String>]
        attr_accessor :categories
      
        # URI for the action.
        # Corresponds to the JSON property `uri`
        # @return [String]
        attr_accessor :uri
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @action = args[:action] if args.key?(:action)
          @categories = args[:categories] if args.key?(:categories)
          @uri = args[:uri] if args.key?(:uri)
        end
      end
      
      # Additional details about the progress of the running test.
      class TestDetails
        include Google::Apis::Core::Hashable
      
        # Output only. If the TestState is ERROR, then this string will contain
        # human-readable details about the error.
        # Corresponds to the JSON property `errorMessage`
        # @return [String]
        attr_accessor :error_message
      
        # Output only. Human-readable, detailed descriptions of the test's progress.
        # For example: "Provisioning a device", "Starting Test".
        # During the course of execution new data may be appended
        # to the end of progress_messages.
        # Corresponds to the JSON property `progressMessages`
        # @return [Array<String>]
        attr_accessor :progress_messages
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @error_message = args[:error_message] if args.key?(:error_message)
          @progress_messages = args[:progress_messages] if args.key?(:progress_messages)
        end
      end
      
      # A description of a test environment.
      class TestEnvironmentCatalog
        include Google::Apis::Core::Hashable
      
        # The currently supported Android devices.
        # Corresponds to the JSON property `androidDeviceCatalog`
        # @return [Google::Apis::TestingV1::AndroidDeviceCatalog]
        attr_accessor :android_device_catalog
      
        # The currently supported iOS devices.
        # Corresponds to the JSON property `iosDeviceCatalog`
        # @return [Google::Apis::TestingV1::IosDeviceCatalog]
        attr_accessor :ios_device_catalog
      
        # Supported network configurations.
        # Corresponds to the JSON property `networkConfigurationCatalog`
        # @return [Google::Apis::TestingV1::NetworkConfigurationCatalog]
        attr_accessor :network_configuration_catalog
      
        # The currently provided software environment on the devices under test.
        # Corresponds to the JSON property `softwareCatalog`
        # @return [Google::Apis::TestingV1::ProvidedSoftwareCatalog]
        attr_accessor :software_catalog
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_device_catalog = args[:android_device_catalog] if args.key?(:android_device_catalog)
          @ios_device_catalog = args[:ios_device_catalog] if args.key?(:ios_device_catalog)
          @network_configuration_catalog = args[:network_configuration_catalog] if args.key?(:network_configuration_catalog)
          @software_catalog = args[:software_catalog] if args.key?(:software_catalog)
        end
      end
      
      # A single test executed in a single environment.
      class TestExecution
        include Google::Apis::Core::Hashable
      
        # The environment in which the test is run.
        # Corresponds to the JSON property `environment`
        # @return [Google::Apis::TestingV1::Environment]
        attr_accessor :environment
      
        # Output only. Unique id set by the service.
        # Corresponds to the JSON property `id`
        # @return [String]
        attr_accessor :id
      
        # Output only. Id of the containing TestMatrix.
        # Corresponds to the JSON property `matrixId`
        # @return [String]
        attr_accessor :matrix_id
      
        # Output only. The cloud project that owns the test execution.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Output only. Details about the shard.
        # Corresponds to the JSON property `shard`
        # @return [Google::Apis::TestingV1::Shard]
        attr_accessor :shard
      
        # Output only. Indicates the current progress of the test execution
        # (e.g., FINISHED).
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Additional details about the progress of the running test.
        # Corresponds to the JSON property `testDetails`
        # @return [Google::Apis::TestingV1::TestDetails]
        attr_accessor :test_details
      
        # A description of how to run the test.
        # Corresponds to the JSON property `testSpecification`
        # @return [Google::Apis::TestingV1::TestSpecification]
        attr_accessor :test_specification
      
        # Output only. The time this test execution was initially created.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        # Represents a tool results step resource.
        # This has the results of a TestExecution.
        # Corresponds to the JSON property `toolResultsStep`
        # @return [Google::Apis::TestingV1::ToolResultsStep]
        attr_accessor :tool_results_step
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @environment = args[:environment] if args.key?(:environment)
          @id = args[:id] if args.key?(:id)
          @matrix_id = args[:matrix_id] if args.key?(:matrix_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @shard = args[:shard] if args.key?(:shard)
          @state = args[:state] if args.key?(:state)
          @test_details = args[:test_details] if args.key?(:test_details)
          @test_specification = args[:test_specification] if args.key?(:test_specification)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
          @tool_results_step = args[:tool_results_step] if args.key?(:tool_results_step)
        end
      end
      
      # TestMatrix captures all details about a test. It contains the environment
      # configuration, test specification, test executions and overall state and
      # outcome.
      class TestMatrix
        include Google::Apis::Core::Hashable
      
        # Information about the client which invoked the test.
        # Corresponds to the JSON property `clientInfo`
        # @return [Google::Apis::TestingV1::ClientInfo]
        attr_accessor :client_info
      
        # The matrix of environments in which the test is to be executed.
        # Corresponds to the JSON property `environmentMatrix`
        # @return [Google::Apis::TestingV1::EnvironmentMatrix]
        attr_accessor :environment_matrix
      
        # The number of times a TestExecution should be re-attempted if one or more
        # of its test cases fail for any reason.
        # The maximum number of reruns allowed is 10.
        # Default is 0, which implies no reruns.
        # Corresponds to the JSON property `flakyTestAttempts`
        # @return [Fixnum]
        attr_accessor :flaky_test_attempts
      
        # Output only. Describes why the matrix is considered invalid.
        # Only useful for matrices in the INVALID state.
        # Corresponds to the JSON property `invalidMatrixDetails`
        # @return [String]
        attr_accessor :invalid_matrix_details
      
        # Output Only. The overall outcome of the test.
        # Only set when the test matrix state is FINISHED.
        # Corresponds to the JSON property `outcomeSummary`
        # @return [String]
        attr_accessor :outcome_summary
      
        # The cloud project that owns the test matrix.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Locations where the results of running the test are stored.
        # Corresponds to the JSON property `resultStorage`
        # @return [Google::Apis::TestingV1::ResultStorage]
        attr_accessor :result_storage
      
        # Output only. Indicates the current progress of the test matrix.
        # Corresponds to the JSON property `state`
        # @return [String]
        attr_accessor :state
      
        # Output only. The list of test executions that the service creates for
        # this matrix.
        # Corresponds to the JSON property `testExecutions`
        # @return [Array<Google::Apis::TestingV1::TestExecution>]
        attr_accessor :test_executions
      
        # Output only. Unique id set by the service.
        # Corresponds to the JSON property `testMatrixId`
        # @return [String]
        attr_accessor :test_matrix_id
      
        # A description of how to run the test.
        # Corresponds to the JSON property `testSpecification`
        # @return [Google::Apis::TestingV1::TestSpecification]
        attr_accessor :test_specification
      
        # Output only. The time this test matrix was initially created.
        # Corresponds to the JSON property `timestamp`
        # @return [String]
        attr_accessor :timestamp
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @client_info = args[:client_info] if args.key?(:client_info)
          @environment_matrix = args[:environment_matrix] if args.key?(:environment_matrix)
          @flaky_test_attempts = args[:flaky_test_attempts] if args.key?(:flaky_test_attempts)
          @invalid_matrix_details = args[:invalid_matrix_details] if args.key?(:invalid_matrix_details)
          @outcome_summary = args[:outcome_summary] if args.key?(:outcome_summary)
          @project_id = args[:project_id] if args.key?(:project_id)
          @result_storage = args[:result_storage] if args.key?(:result_storage)
          @state = args[:state] if args.key?(:state)
          @test_executions = args[:test_executions] if args.key?(:test_executions)
          @test_matrix_id = args[:test_matrix_id] if args.key?(:test_matrix_id)
          @test_specification = args[:test_specification] if args.key?(:test_specification)
          @timestamp = args[:timestamp] if args.key?(:timestamp)
        end
      end
      
      # A description of how to set up the Android device prior to running the test.
      class TestSetup
        include Google::Apis::Core::Hashable
      
        # Identifies an account and how to log into it.
        # Corresponds to the JSON property `account`
        # @return [Google::Apis::TestingV1::Account]
        attr_accessor :account
      
        # APKs to install in addition to those being directly tested.
        # Currently capped at 100.
        # Corresponds to the JSON property `additionalApks`
        # @return [Array<Google::Apis::TestingV1::Apk>]
        attr_accessor :additional_apks
      
        # List of directories on the device to upload to GCS at the end of the test;
        # they must be absolute paths under /sdcard or /data/local/tmp.
        # Path names are restricted to characters a-z A-Z 0-9 _ - . + and /
        # Note: The paths /sdcard and /data will be made available and treated as
        # implicit path substitutions. E.g. if /sdcard on a particular device does
        # not map to external storage, the system will replace it with the external
        # storage path prefix for that device.
        # Corresponds to the JSON property `directoriesToPull`
        # @return [Array<String>]
        attr_accessor :directories_to_pull
      
        # Environment variables to set for the test (only applicable for
        # instrumentation tests).
        # Corresponds to the JSON property `environmentVariables`
        # @return [Array<Google::Apis::TestingV1::EnvironmentVariable>]
        attr_accessor :environment_variables
      
        # List of files to push to the device before starting the test.
        # Corresponds to the JSON property `filesToPush`
        # @return [Array<Google::Apis::TestingV1::DeviceFile>]
        attr_accessor :files_to_push
      
        # The network traffic profile used for running the test.
        # Available network profiles can be queried by using the
        # NETWORK_CONFIGURATION environment type when calling
        # TestEnvironmentDiscoveryService.GetTestEnvironmentCatalog.
        # Corresponds to the JSON property `networkProfile`
        # @return [String]
        attr_accessor :network_profile
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @account = args[:account] if args.key?(:account)
          @additional_apks = args[:additional_apks] if args.key?(:additional_apks)
          @directories_to_pull = args[:directories_to_pull] if args.key?(:directories_to_pull)
          @environment_variables = args[:environment_variables] if args.key?(:environment_variables)
          @files_to_push = args[:files_to_push] if args.key?(:files_to_push)
          @network_profile = args[:network_profile] if args.key?(:network_profile)
        end
      end
      
      # A description of how to run the test.
      class TestSpecification
        include Google::Apis::Core::Hashable
      
        # A test of an Android application that can control an Android component
        # independently of its normal lifecycle.
        # Android instrumentation tests run an application APK and test APK inside the
        # same process on a virtual or physical AndroidDevice.  They also specify
        # a test runner class, such as com.google.GoogleTestRunner, which can vary
        # on the specific instrumentation framework chosen.
        # See <http://developer.android.com/tools/testing/testing_android.html> for
        # more information on types of Android tests.
        # Corresponds to the JSON property `androidInstrumentationTest`
        # @return [Google::Apis::TestingV1::AndroidInstrumentationTest]
        attr_accessor :android_instrumentation_test
      
        # A test of an android application that explores the application on a virtual
        # or physical Android Device, finding culprits and crashes as it goes.
        # Corresponds to the JSON property `androidRoboTest`
        # @return [Google::Apis::TestingV1::AndroidRoboTest]
        attr_accessor :android_robo_test
      
        # A test of an Android Application with a Test Loop.
        # The intent \<intent-name\> will be implicitly added, since Games is the only
        # user of this api, for the time being.
        # Corresponds to the JSON property `androidTestLoop`
        # @return [Google::Apis::TestingV1::AndroidTestLoop]
        attr_accessor :android_test_loop
      
        # Disables performance metrics recording. May reduce test latency.
        # Corresponds to the JSON property `disablePerformanceMetrics`
        # @return [Boolean]
        attr_accessor :disable_performance_metrics
        alias_method :disable_performance_metrics?, :disable_performance_metrics
      
        # Disables video recording. May reduce test latency.
        # Corresponds to the JSON property `disableVideoRecording`
        # @return [Boolean]
        attr_accessor :disable_video_recording
        alias_method :disable_video_recording?, :disable_video_recording
      
        # A test of an iOS application that implements one or more game loop scenarios.
        # This test type accepts an archived application (.ipa file) and a list of
        # integer scenarios that will be executed on the app sequentially.
        # Corresponds to the JSON property `iosTestLoop`
        # @return [Google::Apis::TestingV1::IosTestLoop]
        attr_accessor :ios_test_loop
      
        # A description of how to set up an iOS device prior to running the test.
        # Corresponds to the JSON property `iosTestSetup`
        # @return [Google::Apis::TestingV1::IosTestSetup]
        attr_accessor :ios_test_setup
      
        # A test of an iOS application that uses the XCTest framework.
        # Xcode supports the option to "build for testing", which generates an
        # .xctestrun file that contains a test specification (arguments, test methods,
        # etc). This test type accepts a zip file containing the .xctestrun file and
        # the corresponding contents of the Build/Products directory that contains all
        # the binaries needed to run the tests.
        # Corresponds to the JSON property `iosXcTest`
        # @return [Google::Apis::TestingV1::IosXcTest]
        attr_accessor :ios_xc_test
      
        # A description of how to set up the Android device prior to running the test.
        # Corresponds to the JSON property `testSetup`
        # @return [Google::Apis::TestingV1::TestSetup]
        attr_accessor :test_setup
      
        # Max time a test execution is allowed to run before it is
        # automatically cancelled.
        # The default value is 5 min.
        # Corresponds to the JSON property `testTimeout`
        # @return [String]
        attr_accessor :test_timeout
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android_instrumentation_test = args[:android_instrumentation_test] if args.key?(:android_instrumentation_test)
          @android_robo_test = args[:android_robo_test] if args.key?(:android_robo_test)
          @android_test_loop = args[:android_test_loop] if args.key?(:android_test_loop)
          @disable_performance_metrics = args[:disable_performance_metrics] if args.key?(:disable_performance_metrics)
          @disable_video_recording = args[:disable_video_recording] if args.key?(:disable_video_recording)
          @ios_test_loop = args[:ios_test_loop] if args.key?(:ios_test_loop)
          @ios_test_setup = args[:ios_test_setup] if args.key?(:ios_test_setup)
          @ios_xc_test = args[:ios_xc_test] if args.key?(:ios_xc_test)
          @test_setup = args[:test_setup] if args.key?(:test_setup)
          @test_timeout = args[:test_timeout] if args.key?(:test_timeout)
        end
      end
      
      # Test targets for a shard.
      class TestTargetsForShard
        include Google::Apis::Core::Hashable
      
        # Group of packages, classes, and/or test methods to be run for each shard.
        # The targets need to be specified in AndroidJUnitRunner argument format. For
        # example, “package com.my.packages” “class com.my.package.MyClass”.
        # The number of shard_test_targets must be greater than 0.
        # Corresponds to the JSON property `testTargets`
        # @return [Array<String>]
        attr_accessor :test_targets
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @test_targets = args[:test_targets] if args.key?(:test_targets)
        end
      end
      
      # Represents a tool results execution resource.
      # This has the results of a TestMatrix.
      class ToolResultsExecution
        include Google::Apis::Core::Hashable
      
        # Output only. A tool results execution ID.
        # Corresponds to the JSON property `executionId`
        # @return [String]
        attr_accessor :execution_id
      
        # Output only. A tool results history ID.
        # Corresponds to the JSON property `historyId`
        # @return [String]
        attr_accessor :history_id
      
        # Output only. The cloud project that owns the tool results execution.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @execution_id = args[:execution_id] if args.key?(:execution_id)
          @history_id = args[:history_id] if args.key?(:history_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Represents a tool results history resource.
      class ToolResultsHistory
        include Google::Apis::Core::Hashable
      
        # Required. A tool results history ID.
        # Corresponds to the JSON property `historyId`
        # @return [String]
        attr_accessor :history_id
      
        # Required. The cloud project that owns the tool results history.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @history_id = args[:history_id] if args.key?(:history_id)
          @project_id = args[:project_id] if args.key?(:project_id)
        end
      end
      
      # Represents a tool results step resource.
      # This has the results of a TestExecution.
      class ToolResultsStep
        include Google::Apis::Core::Hashable
      
        # Output only. A tool results execution ID.
        # Corresponds to the JSON property `executionId`
        # @return [String]
        attr_accessor :execution_id
      
        # Output only. A tool results history ID.
        # Corresponds to the JSON property `historyId`
        # @return [String]
        attr_accessor :history_id
      
        # Output only. The cloud project that owns the tool results step.
        # Corresponds to the JSON property `projectId`
        # @return [String]
        attr_accessor :project_id
      
        # Output only. A tool results step ID.
        # Corresponds to the JSON property `stepId`
        # @return [String]
        attr_accessor :step_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @execution_id = args[:execution_id] if args.key?(:execution_id)
          @history_id = args[:history_id] if args.key?(:history_id)
          @project_id = args[:project_id] if args.key?(:project_id)
          @step_id = args[:step_id] if args.key?(:step_id)
        end
      end
      
      # Network emulation parameters.
      class TrafficRule
        include Google::Apis::Core::Hashable
      
        # Bandwidth in kbits/second.
        # Corresponds to the JSON property `bandwidth`
        # @return [Float]
        attr_accessor :bandwidth
      
        # Burst size in kbits.
        # Corresponds to the JSON property `burst`
        # @return [Float]
        attr_accessor :burst
      
        # Packet delay, must be >= 0.
        # Corresponds to the JSON property `delay`
        # @return [String]
        attr_accessor :delay
      
        # Packet duplication ratio (0.0 - 1.0).
        # Corresponds to the JSON property `packetDuplicationRatio`
        # @return [Float]
        attr_accessor :packet_duplication_ratio
      
        # Packet loss ratio (0.0 - 1.0).
        # Corresponds to the JSON property `packetLossRatio`
        # @return [Float]
        attr_accessor :packet_loss_ratio
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @bandwidth = args[:bandwidth] if args.key?(:bandwidth)
          @burst = args[:burst] if args.key?(:burst)
          @delay = args[:delay] if args.key?(:delay)
          @packet_duplication_ratio = args[:packet_duplication_ratio] if args.key?(:packet_duplication_ratio)
          @packet_loss_ratio = args[:packet_loss_ratio] if args.key?(:packet_loss_ratio)
        end
      end
      
      # Uniformly shards test cases given a total number of shards.
      # For Instrumentation test, it will be translated to “-e numShard” “-e
      # shardIndex” AndroidJUnitRunner arguments. With uniform sharding enabled,
      # specifying these sharding arguments via environment_variables is invalid.
      class UniformSharding
        include Google::Apis::Core::Hashable
      
        # Required. Total number of shards. The number must be > 1, and <= 50.
        # Corresponds to the JSON property `numShards`
        # @return [Fixnum]
        attr_accessor :num_shards
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @num_shards = args[:num_shards] if args.key?(:num_shards)
        end
      end
      
      # An Xcode version that an iOS version is compatible with.
      class XcodeVersion
        include Google::Apis::Core::Hashable
      
        # Tags for this Xcode version.
        # Example: "default".
        # Corresponds to the JSON property `tags`
        # @return [Array<String>]
        attr_accessor :tags
      
        # The id for this version.
        # Example: "9.2".
        # Corresponds to the JSON property `version`
        # @return [String]
        attr_accessor :version
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @tags = args[:tags] if args.key?(:tags)
          @version = args[:version] if args.key?(:version)
        end
      end
    end
  end
end
