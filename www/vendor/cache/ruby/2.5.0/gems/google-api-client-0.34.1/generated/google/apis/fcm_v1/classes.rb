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
    module FcmV1
      
      # Android specific options for messages sent through
      # [FCM connection server](https://goo.gl/4GLdUl).
      class AndroidConfig
        include Google::Apis::Core::Hashable
      
        # An identifier of a group of messages that can be collapsed, so that only
        # the last message gets sent when delivery can be resumed. A maximum of 4
        # different collapse keys is allowed at any given time.
        # Corresponds to the JSON property `collapseKey`
        # @return [String]
        attr_accessor :collapse_key
      
        # Arbitrary key/value payload. If present, it will override
        # google.firebase.fcm.v1.Message.data.
        # Corresponds to the JSON property `data`
        # @return [Hash<String,String>]
        attr_accessor :data
      
        # Options for features provided by the FCM SDK for Android.
        # Corresponds to the JSON property `fcmOptions`
        # @return [Google::Apis::FcmV1::AndroidFcmOptions]
        attr_accessor :fcm_options
      
        # Notification to send to android devices.
        # Corresponds to the JSON property `notification`
        # @return [Google::Apis::FcmV1::AndroidNotification]
        attr_accessor :notification
      
        # Message priority. Can take "normal" and "high" values.
        # For more information, see [Setting the priority of a
        # message](https://goo.gl/GjONJv).
        # Corresponds to the JSON property `priority`
        # @return [String]
        attr_accessor :priority
      
        # Package name of the application where the registration token must match in
        # order to receive the message.
        # Corresponds to the JSON property `restrictedPackageName`
        # @return [String]
        attr_accessor :restricted_package_name
      
        # How long (in seconds) the message should be kept in FCM storage if the
        # device is offline. The maximum time to live supported is 4 weeks, and the
        # default value is 4 weeks if not set. Set it to 0 if want to send the
        # message immediately.
        # In JSON format, the Duration type is encoded as a string rather than an
        # object, where the string ends in the suffix "s" (indicating seconds) and
        # is preceded by the number of seconds, with nanoseconds expressed as
        # fractional seconds. For example, 3 seconds with 0 nanoseconds should be
        # encoded in JSON format as "3s", while 3 seconds and 1 nanosecond should
        # be expressed in JSON format as "3.000000001s". The ttl will be rounded down
        # to the nearest second.
        # Corresponds to the JSON property `ttl`
        # @return [String]
        attr_accessor :ttl
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @collapse_key = args[:collapse_key] if args.key?(:collapse_key)
          @data = args[:data] if args.key?(:data)
          @fcm_options = args[:fcm_options] if args.key?(:fcm_options)
          @notification = args[:notification] if args.key?(:notification)
          @priority = args[:priority] if args.key?(:priority)
          @restricted_package_name = args[:restricted_package_name] if args.key?(:restricted_package_name)
          @ttl = args[:ttl] if args.key?(:ttl)
        end
      end
      
      # Options for features provided by the FCM SDK for Android.
      class AndroidFcmOptions
        include Google::Apis::Core::Hashable
      
        # Label associated with the message's analytics data.
        # Corresponds to the JSON property `analyticsLabel`
        # @return [String]
        attr_accessor :analytics_label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analytics_label = args[:analytics_label] if args.key?(:analytics_label)
        end
      end
      
      # Notification to send to android devices.
      class AndroidNotification
        include Google::Apis::Core::Hashable
      
        # The notification's body text. If present, it will override
        # google.firebase.fcm.v1.Notification.body.
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # Variable string values to be used in place of the format specifiers in
        # body_loc_key to use to localize the body text to the user's current
        # localization.
        # See [Formatting and Styling](https://goo.gl/MalYE3) for more information.
        # Corresponds to the JSON property `bodyLocArgs`
        # @return [Array<String>]
        attr_accessor :body_loc_args
      
        # The key to the body string in the app's string resources to use to localize
        # the body text to the user's current localization.
        # See [String Resources](https://goo.gl/NdFZGI) for more information.
        # Corresponds to the JSON property `bodyLocKey`
        # @return [String]
        attr_accessor :body_loc_key
      
        # The [notification's channel
        # id](https://developer.android.com/guide/topics/ui/notifiers/notifications#
        # ManageChannels)
        # (new in Android O). The app must create a channel with this channel ID
        # before any notification with this channel ID is received. If you don't send
        # this channel ID in the request, or if the channel ID provided has not yet
        # been created by the app, FCM uses the channel ID specified in the app
        # manifest.
        # Corresponds to the JSON property `channelId`
        # @return [String]
        attr_accessor :channel_id
      
        # The action associated with a user click on the notification.
        # If specified, an activity with a matching intent filter is launched when
        # a user clicks on the notification.
        # Corresponds to the JSON property `clickAction`
        # @return [String]
        attr_accessor :click_action
      
        # The notification's icon color, expressed in #rrggbb format.
        # Corresponds to the JSON property `color`
        # @return [String]
        attr_accessor :color
      
        # If set to true, use the Android framework's default LED light settings for
        # the notification. Default values are specified in
        # [config.xml](https://android.googlesource.com/platform/frameworks/base/+/
        # master/core/res/res/values/config.xml).
        # If `default_light_settings` is set to true and `light_settings` is also
        # set, the user-specified `light_settings` is used instead of the
        # default value.
        # Corresponds to the JSON property `defaultLightSettings`
        # @return [Boolean]
        attr_accessor :default_light_settings
        alias_method :default_light_settings?, :default_light_settings
      
        # If set to true, use the Android framework's default sound for the
        # notification. Default values are specified in
        # [config.xml](https://android.googlesource.com/platform/frameworks/base/+/
        # master/core/res/res/values/config.xml).
        # Corresponds to the JSON property `defaultSound`
        # @return [Boolean]
        attr_accessor :default_sound
        alias_method :default_sound?, :default_sound
      
        # If set to true, use the Android framework's default vibrate pattern for the
        # notification. Default values are specified in
        # [config.xml](https://android.googlesource.com/platform/frameworks/base/+/
        # master/core/res/res/values/config.xml).
        # If `default_vibrate_timings` is set to true and `vibrate_timings` is also
        # set, the default value is used instead of the user-specified
        # `vibrate_timings`.
        # Corresponds to the JSON property `defaultVibrateTimings`
        # @return [Boolean]
        attr_accessor :default_vibrate_timings
        alias_method :default_vibrate_timings?, :default_vibrate_timings
      
        # Set the time that the event in the notification occurred. Notifications in
        # the panel are sorted by this time. A point in time is represented using
        # [protobuf.Timestamp](https://developers.google.com/protocol-buffers/docs/
        # reference/java/com/google/protobuf/Timestamp).
        # Corresponds to the JSON property `eventTime`
        # @return [String]
        attr_accessor :event_time
      
        # The notification's icon.
        # Sets the notification icon to myicon for drawable resource myicon.
        # If you don't send this key in the request, FCM displays the launcher icon
        # specified in your app manifest.
        # Corresponds to the JSON property `icon`
        # @return [String]
        attr_accessor :icon
      
        # Contains the URL of an image that is going to be displayed in a
        # notification. If present, it will override
        # google.firebase.fcm.v1.Notification.image.
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # Settings to control notification LED.
        # Corresponds to the JSON property `lightSettings`
        # @return [Google::Apis::FcmV1::LightSettings]
        attr_accessor :light_settings
      
        # Set whether or not this notification is relevant only to the current
        # device. Some notifications can be bridged to other devices for remote
        # display, such as a Wear OS watch. This hint can be set to recommend this
        # notification not be bridged. See [Wear OS
        # guides](https://developer.android.com/training/wearables/notifications/bridger#
        # existing-method-of-preventing-bridging)
        # Corresponds to the JSON property `localOnly`
        # @return [Boolean]
        attr_accessor :local_only
        alias_method :local_only?, :local_only
      
        # Sets the number of items this notification represents. May be displayed as
        # a badge count for launchers that support badging.See [Notification
        # Badge](https://developer.android.com/training/notify-user/badges).
        # For example, this might be useful if you're using just one notification to
        # represent multiple new messages but you want the count here to represent
        # the number of total new messages.
        # If zero or unspecified, systems that support badging use the default, which
        # is to increment a number displayed on the long-press menu each time a new
        # notification arrives.
        # Corresponds to the JSON property `notificationCount`
        # @return [Fixnum]
        attr_accessor :notification_count
      
        # Set the relative priority for this notification. Priority is an indication
        # of how much of the user's attention should be consumed by this
        # notification. Low-priority notifications may be hidden from the user in
        # certain situations, while the user might be interrupted for a
        # higher-priority notification. The effect of setting the same priorities may
        # differ slightly on different platforms. Note this priority differs from
        # `AndroidMessagePriority`. This priority is processed by the client after
        # the message has been delivered, whereas
        # [AndroidMessagePriority](https://firebase.google.com/docs/reference/fcm/rest/
        # v1/projects.messages#androidmessagepriority)
        # is an FCM concept that controls when the message is delivered.
        # Corresponds to the JSON property `notificationPriority`
        # @return [String]
        attr_accessor :notification_priority
      
        # The sound to play when the device receives the notification.
        # Supports "default" or the filename of a sound resource bundled in the app.
        # Sound files must reside in /res/raw/.
        # Corresponds to the JSON property `sound`
        # @return [String]
        attr_accessor :sound
      
        # When set to false or unset, the notification is automatically
        # dismissed when the user clicks it in the panel. When set to true, the
        # notification persists even when the user clicks it.
        # Corresponds to the JSON property `sticky`
        # @return [Boolean]
        attr_accessor :sticky
        alias_method :sticky?, :sticky
      
        # Identifier used to replace existing notifications in the notification
        # drawer.
        # If not specified, each request creates a new notification.
        # If specified and a notification with the same tag is already being shown,
        # the new notification replaces the existing one in the notification drawer.
        # Corresponds to the JSON property `tag`
        # @return [String]
        attr_accessor :tag
      
        # Sets the "ticker" text, which is sent to accessibility services.
        # Prior to API level 21 (`Lollipop`), sets the text that is displayed in the
        # status bar when the notification first arrives.
        # Corresponds to the JSON property `ticker`
        # @return [String]
        attr_accessor :ticker
      
        # The notification's title. If present, it will override
        # google.firebase.fcm.v1.Notification.title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        # Variable string values to be used in place of the format specifiers in
        # title_loc_key to use to localize the title text to the user's current
        # localization.
        # See [Formatting and Styling](https://goo.gl/MalYE3) for more information.
        # Corresponds to the JSON property `titleLocArgs`
        # @return [Array<String>]
        attr_accessor :title_loc_args
      
        # The key to the title string in the app's string resources to use to
        # localize the title text to the user's current localization.
        # See [String Resources](https://goo.gl/NdFZGI) for more information.
        # Corresponds to the JSON property `titleLocKey`
        # @return [String]
        attr_accessor :title_loc_key
      
        # Set the vibration pattern to use. Pass in an array of
        # [protobuf.Duration](https://developers.google.com/protocol-buffers/docs/
        # reference/google.protobuf#google.protobuf.Duration)
        # to turn on or off the vibrator. The first value indicates the `Duration` to
        # wait before turning the vibrator on. The next value indicates the
        # `Duration` to keep the vibrator on. Subsequent values alternate between
        # `Duration` to turn the vibrator off and to turn the vibrator on.
        # If `vibrate_timings` is set and `default_vibrate_timings` is set to `true`,
        # the default value is used instead of the user-specified `vibrate_timings`.
        # Corresponds to the JSON property `vibrateTimings`
        # @return [Array<String>]
        attr_accessor :vibrate_timings
      
        # Set the
        # [Notification.visibility](https://developer.android.com/reference/android/app/
        # Notification.html#visibility)
        # of the notification.
        # Corresponds to the JSON property `visibility`
        # @return [String]
        attr_accessor :visibility
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @body_loc_args = args[:body_loc_args] if args.key?(:body_loc_args)
          @body_loc_key = args[:body_loc_key] if args.key?(:body_loc_key)
          @channel_id = args[:channel_id] if args.key?(:channel_id)
          @click_action = args[:click_action] if args.key?(:click_action)
          @color = args[:color] if args.key?(:color)
          @default_light_settings = args[:default_light_settings] if args.key?(:default_light_settings)
          @default_sound = args[:default_sound] if args.key?(:default_sound)
          @default_vibrate_timings = args[:default_vibrate_timings] if args.key?(:default_vibrate_timings)
          @event_time = args[:event_time] if args.key?(:event_time)
          @icon = args[:icon] if args.key?(:icon)
          @image = args[:image] if args.key?(:image)
          @light_settings = args[:light_settings] if args.key?(:light_settings)
          @local_only = args[:local_only] if args.key?(:local_only)
          @notification_count = args[:notification_count] if args.key?(:notification_count)
          @notification_priority = args[:notification_priority] if args.key?(:notification_priority)
          @sound = args[:sound] if args.key?(:sound)
          @sticky = args[:sticky] if args.key?(:sticky)
          @tag = args[:tag] if args.key?(:tag)
          @ticker = args[:ticker] if args.key?(:ticker)
          @title = args[:title] if args.key?(:title)
          @title_loc_args = args[:title_loc_args] if args.key?(:title_loc_args)
          @title_loc_key = args[:title_loc_key] if args.key?(:title_loc_key)
          @vibrate_timings = args[:vibrate_timings] if args.key?(:vibrate_timings)
          @visibility = args[:visibility] if args.key?(:visibility)
        end
      end
      
      # [Apple Push Notification Service](https://goo.gl/MXRTPa) specific options.
      class ApnsConfig
        include Google::Apis::Core::Hashable
      
        # Options for features provided by the FCM SDK for iOS.
        # Corresponds to the JSON property `fcmOptions`
        # @return [Google::Apis::FcmV1::ApnsFcmOptions]
        attr_accessor :fcm_options
      
        # HTTP request headers defined in Apple Push Notification Service. Refer to
        # [APNs request
        # headers](https://developer.apple.com/documentation/usernotifications/
        # setting_up_a_remote_notification_server/sending_notification_requests_to_apns)
        # for supported headers, e.g. "apns-priority": "10".
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,String>]
        attr_accessor :headers
      
        # APNs payload as a JSON object, including both `aps` dictionary and custom
        # payload. See [Payload Key
        # Reference](https://developer.apple.com/documentation/usernotifications/
        # setting_up_a_remote_notification_server/generating_a_remote_notification).
        # If present, it overrides google.firebase.fcm.v1.Notification.title
        # and google.firebase.fcm.v1.Notification.body.
        # Corresponds to the JSON property `payload`
        # @return [Hash<String,Object>]
        attr_accessor :payload
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fcm_options = args[:fcm_options] if args.key?(:fcm_options)
          @headers = args[:headers] if args.key?(:headers)
          @payload = args[:payload] if args.key?(:payload)
        end
      end
      
      # Options for features provided by the FCM SDK for iOS.
      class ApnsFcmOptions
        include Google::Apis::Core::Hashable
      
        # Label associated with the message's analytics data.
        # Corresponds to the JSON property `analyticsLabel`
        # @return [String]
        attr_accessor :analytics_label
      
        # Contains the URL of an image that is going to be displayed in a
        # notification. If present, it will override
        # google.firebase.fcm.v1.Notification.image.
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analytics_label = args[:analytics_label] if args.key?(:analytics_label)
          @image = args[:image] if args.key?(:image)
        end
      end
      
      # Represents a color in the RGBA color space. This representation is designed
      # for simplicity of conversion to/from color representations in various
      # languages over compactness; for example, the fields of this representation
      # can be trivially provided to the constructor of "java.awt.Color" in Java; it
      # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
      # method in iOS; and, with just a little work, it can be easily formatted into
      # a CSS "rgba()" string in JavaScript, as well.
      # Note: this proto does not carry information about the absolute color space
      # that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
      # DCI-P3, BT.2020, etc.). By default, applications SHOULD assume the sRGB color
      # space.
      # Example (Java):
      # import com.google.type.Color;
      # // ...
      # public static java.awt.Color fromProto(Color protocolor) `
      # float alpha = protocolor.hasAlpha()
      # ? protocolor.getAlpha().getValue()
      # : 1.0;
      # return new java.awt.Color(
      # protocolor.getRed(),
      # protocolor.getGreen(),
      # protocolor.getBlue(),
      # alpha);
      # `
      # public static Color toProto(java.awt.Color color) `
      # float red = (float) color.getRed();
      # float green = (float) color.getGreen();
      # float blue = (float) color.getBlue();
      # float denominator = 255.0;
      # Color.Builder resultBuilder =
      # Color
      # .newBuilder()
      # .setRed(red / denominator)
      # .setGreen(green / denominator)
      # .setBlue(blue / denominator);
      # int alpha = color.getAlpha();
      # if (alpha != 255) `
      # result.setAlpha(
      # FloatValue
      # .newBuilder()
      # .setValue(((float) alpha) / denominator)
      # .build());
      # `
      # return resultBuilder.build();
      # `
      # // ...
      # Example (iOS / Obj-C):
      # // ...
      # static UIColor* fromProto(Color* protocolor) `
      # float red = [protocolor red];
      # float green = [protocolor green];
      # float blue = [protocolor blue];
      # FloatValue* alpha_wrapper = [protocolor alpha];
      # float alpha = 1.0;
      # if (alpha_wrapper != nil) `
      # alpha = [alpha_wrapper value];
      # `
      # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
      # `
      # static Color* toProto(UIColor* color) `
      # CGFloat red, green, blue, alpha;
      # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
      # return nil;
      # `
      # Color* result = [[Color alloc] init];
      # [result setRed:red];
      # [result setGreen:green];
      # [result setBlue:blue];
      # if (alpha <= 0.9999) `
      # [result setAlpha:floatWrapperWithValue(alpha)];
      # `
      # [result autorelease];
      # return result;
      # `
      # // ...
      # Example (JavaScript):
      # // ...
      # var protoToCssColor = function(rgb_color) `
      # var redFrac = rgb_color.red || 0.0;
      # var greenFrac = rgb_color.green || 0.0;
      # var blueFrac = rgb_color.blue || 0.0;
      # var red = Math.floor(redFrac * 255);
      # var green = Math.floor(greenFrac * 255);
      # var blue = Math.floor(blueFrac * 255);
      # if (!('alpha' in rgb_color)) `
      # return rgbToCssColor_(red, green, blue);
      # `
      # var alphaFrac = rgb_color.alpha.value || 0.0;
      # var rgbParams = [red, green, blue].join(',');
      # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
      # `;
      # var rgbToCssColor_ = function(red, green, blue) `
      # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
      # var hexString = rgbNumber.toString(16);
      # var missingZeros = 6 - hexString.length;
      # var resultBuilder = ['#'];
      # for (var i = 0; i < missingZeros; i++) `
      # resultBuilder.push('0');
      # `
      # resultBuilder.push(hexString);
      # return resultBuilder.join('');
      # `;
      # // ...
      class Color
        include Google::Apis::Core::Hashable
      
        # The fraction of this color that should be applied to the pixel. That is,
        # the final pixel color is defined by the equation:
        # pixel color = alpha * (this color) + (1.0 - alpha) * (background color)
        # This means that a value of 1.0 corresponds to a solid color, whereas
        # a value of 0.0 corresponds to a completely transparent color. This
        # uses a wrapper message rather than a simple float scalar so that it is
        # possible to distinguish between a default value and the value being unset.
        # If omitted, this color object is to be rendered as a solid color
        # (as if the alpha value had been explicitly given with a value of 1.0).
        # Corresponds to the JSON property `alpha`
        # @return [Float]
        attr_accessor :alpha
      
        # The amount of blue in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `blue`
        # @return [Float]
        attr_accessor :blue
      
        # The amount of green in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `green`
        # @return [Float]
        attr_accessor :green
      
        # The amount of red in the color as a value in the interval [0, 1].
        # Corresponds to the JSON property `red`
        # @return [Float]
        attr_accessor :red
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @alpha = args[:alpha] if args.key?(:alpha)
          @blue = args[:blue] if args.key?(:blue)
          @green = args[:green] if args.key?(:green)
          @red = args[:red] if args.key?(:red)
        end
      end
      
      # Platform independent options for features provided by the FCM SDKs.
      class FcmOptions
        include Google::Apis::Core::Hashable
      
        # Label associated with the message's analytics data.
        # Corresponds to the JSON property `analyticsLabel`
        # @return [String]
        attr_accessor :analytics_label
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @analytics_label = args[:analytics_label] if args.key?(:analytics_label)
        end
      end
      
      # Settings to control notification LED.
      class LightSettings
        include Google::Apis::Core::Hashable
      
        # Represents a color in the RGBA color space. This representation is designed
        # for simplicity of conversion to/from color representations in various
        # languages over compactness; for example, the fields of this representation
        # can be trivially provided to the constructor of "java.awt.Color" in Java; it
        # can also be trivially provided to UIColor's "+colorWithRed:green:blue:alpha"
        # method in iOS; and, with just a little work, it can be easily formatted into
        # a CSS "rgba()" string in JavaScript, as well.
        # Note: this proto does not carry information about the absolute color space
        # that should be used to interpret the RGB value (e.g. sRGB, Adobe RGB,
        # DCI-P3, BT.2020, etc.). By default, applications SHOULD assume the sRGB color
        # space.
        # Example (Java):
        # import com.google.type.Color;
        # // ...
        # public static java.awt.Color fromProto(Color protocolor) `
        # float alpha = protocolor.hasAlpha()
        # ? protocolor.getAlpha().getValue()
        # : 1.0;
        # return new java.awt.Color(
        # protocolor.getRed(),
        # protocolor.getGreen(),
        # protocolor.getBlue(),
        # alpha);
        # `
        # public static Color toProto(java.awt.Color color) `
        # float red = (float) color.getRed();
        # float green = (float) color.getGreen();
        # float blue = (float) color.getBlue();
        # float denominator = 255.0;
        # Color.Builder resultBuilder =
        # Color
        # .newBuilder()
        # .setRed(red / denominator)
        # .setGreen(green / denominator)
        # .setBlue(blue / denominator);
        # int alpha = color.getAlpha();
        # if (alpha != 255) `
        # result.setAlpha(
        # FloatValue
        # .newBuilder()
        # .setValue(((float) alpha) / denominator)
        # .build());
        # `
        # return resultBuilder.build();
        # `
        # // ...
        # Example (iOS / Obj-C):
        # // ...
        # static UIColor* fromProto(Color* protocolor) `
        # float red = [protocolor red];
        # float green = [protocolor green];
        # float blue = [protocolor blue];
        # FloatValue* alpha_wrapper = [protocolor alpha];
        # float alpha = 1.0;
        # if (alpha_wrapper != nil) `
        # alpha = [alpha_wrapper value];
        # `
        # return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
        # `
        # static Color* toProto(UIColor* color) `
        # CGFloat red, green, blue, alpha;
        # if (![color getRed:&red green:&green blue:&blue alpha:&alpha]) `
        # return nil;
        # `
        # Color* result = [[Color alloc] init];
        # [result setRed:red];
        # [result setGreen:green];
        # [result setBlue:blue];
        # if (alpha <= 0.9999) `
        # [result setAlpha:floatWrapperWithValue(alpha)];
        # `
        # [result autorelease];
        # return result;
        # `
        # // ...
        # Example (JavaScript):
        # // ...
        # var protoToCssColor = function(rgb_color) `
        # var redFrac = rgb_color.red || 0.0;
        # var greenFrac = rgb_color.green || 0.0;
        # var blueFrac = rgb_color.blue || 0.0;
        # var red = Math.floor(redFrac * 255);
        # var green = Math.floor(greenFrac * 255);
        # var blue = Math.floor(blueFrac * 255);
        # if (!('alpha' in rgb_color)) `
        # return rgbToCssColor_(red, green, blue);
        # `
        # var alphaFrac = rgb_color.alpha.value || 0.0;
        # var rgbParams = [red, green, blue].join(',');
        # return ['rgba(', rgbParams, ',', alphaFrac, ')'].join('');
        # `;
        # var rgbToCssColor_ = function(red, green, blue) `
        # var rgbNumber = new Number((red << 16) | (green << 8) | blue);
        # var hexString = rgbNumber.toString(16);
        # var missingZeros = 6 - hexString.length;
        # var resultBuilder = ['#'];
        # for (var i = 0; i < missingZeros; i++) `
        # resultBuilder.push('0');
        # `
        # resultBuilder.push(hexString);
        # return resultBuilder.join('');
        # `;
        # // ...
        # Corresponds to the JSON property `color`
        # @return [Google::Apis::FcmV1::Color]
        attr_accessor :color
      
        # Required. Along with `light_on_duration `, define the blink rate of LED
        # flashes. Resolution defined by
        # [proto.Duration](https://developers.google.com/protocol-buffers/docs/reference/
        # google.protobuf#google.protobuf.Duration)
        # Corresponds to the JSON property `lightOffDuration`
        # @return [String]
        attr_accessor :light_off_duration
      
        # Required. Along with `light_off_duration`, define the blink rate of LED
        # flashes. Resolution defined by
        # [proto.Duration](https://developers.google.com/protocol-buffers/docs/reference/
        # google.protobuf#google.protobuf.Duration)
        # Corresponds to the JSON property `lightOnDuration`
        # @return [String]
        attr_accessor :light_on_duration
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @light_off_duration = args[:light_off_duration] if args.key?(:light_off_duration)
          @light_on_duration = args[:light_on_duration] if args.key?(:light_on_duration)
        end
      end
      
      # Message to send by Firebase Cloud Messaging Service.
      class Message
        include Google::Apis::Core::Hashable
      
        # Android specific options for messages sent through
        # [FCM connection server](https://goo.gl/4GLdUl).
        # Corresponds to the JSON property `android`
        # @return [Google::Apis::FcmV1::AndroidConfig]
        attr_accessor :android
      
        # [Apple Push Notification Service](https://goo.gl/MXRTPa) specific options.
        # Corresponds to the JSON property `apns`
        # @return [Google::Apis::FcmV1::ApnsConfig]
        attr_accessor :apns
      
        # Condition to send a message to,
        # e.g. "'foo' in topics && 'bar' in topics".
        # Corresponds to the JSON property `condition`
        # @return [String]
        attr_accessor :condition
      
        # Input only. Arbitrary key/value payload. The key should not be a reserved
        # word ("from", "message_type", or any word starting with "google" or "gcm").
        # Corresponds to the JSON property `data`
        # @return [Hash<String,String>]
        attr_accessor :data
      
        # Platform independent options for features provided by the FCM SDKs.
        # Corresponds to the JSON property `fcmOptions`
        # @return [Google::Apis::FcmV1::FcmOptions]
        attr_accessor :fcm_options
      
        # Output Only. The identifier of the message sent, in the format of
        # `projects/*/messages/`message_id``.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Basic notification template to use across all platforms.
        # Corresponds to the JSON property `notification`
        # @return [Google::Apis::FcmV1::Notification]
        attr_accessor :notification
      
        # Registration token to send a message to.
        # Corresponds to the JSON property `token`
        # @return [String]
        attr_accessor :token
      
        # Topic name to send a message to, e.g. "weather".
        # Note: "/topics/" prefix should not be provided.
        # Corresponds to the JSON property `topic`
        # @return [String]
        attr_accessor :topic
      
        # [Webpush protocol](https://tools.ietf.org/html/rfc8030) options.
        # Corresponds to the JSON property `webpush`
        # @return [Google::Apis::FcmV1::WebpushConfig]
        attr_accessor :webpush
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @android = args[:android] if args.key?(:android)
          @apns = args[:apns] if args.key?(:apns)
          @condition = args[:condition] if args.key?(:condition)
          @data = args[:data] if args.key?(:data)
          @fcm_options = args[:fcm_options] if args.key?(:fcm_options)
          @name = args[:name] if args.key?(:name)
          @notification = args[:notification] if args.key?(:notification)
          @token = args[:token] if args.key?(:token)
          @topic = args[:topic] if args.key?(:topic)
          @webpush = args[:webpush] if args.key?(:webpush)
        end
      end
      
      # Basic notification template to use across all platforms.
      class Notification
        include Google::Apis::Core::Hashable
      
        # The notification's body text.
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # Contains the URL of an image that is going to be downloaded on the device
        # and displayed in a notification.
        # JPEG, PNG, BMP have full support across platforms. Animated GIF and video
        # only work on iOS. WebP and HEIF have varying levels of support across
        # platforms and platform versions.
        # Android has 1MB image size limit.
        # Quota usage and implications/costs for hosting image on Firebase Storage:
        # https://firebase.google.com/pricing
        # Corresponds to the JSON property `image`
        # @return [String]
        attr_accessor :image
      
        # The notification's title.
        # Corresponds to the JSON property `title`
        # @return [String]
        attr_accessor :title
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @body = args[:body] if args.key?(:body)
          @image = args[:image] if args.key?(:image)
          @title = args[:title] if args.key?(:title)
        end
      end
      
      # Request to send a message to specified target.
      class SendMessageRequest
        include Google::Apis::Core::Hashable
      
        # Message to send by Firebase Cloud Messaging Service.
        # Corresponds to the JSON property `message`
        # @return [Google::Apis::FcmV1::Message]
        attr_accessor :message
      
        # Flag for testing the request without actually delivering the message.
        # Corresponds to the JSON property `validateOnly`
        # @return [Boolean]
        attr_accessor :validate_only
        alias_method :validate_only?, :validate_only
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @message = args[:message] if args.key?(:message)
          @validate_only = args[:validate_only] if args.key?(:validate_only)
        end
      end
      
      # [Webpush protocol](https://tools.ietf.org/html/rfc8030) options.
      class WebpushConfig
        include Google::Apis::Core::Hashable
      
        # Arbitrary key/value payload. If present, it will override
        # google.firebase.fcm.v1.Message.data.
        # Corresponds to the JSON property `data`
        # @return [Hash<String,String>]
        attr_accessor :data
      
        # Options for features provided by the FCM SDK for Web.
        # Corresponds to the JSON property `fcmOptions`
        # @return [Google::Apis::FcmV1::WebpushFcmOptions]
        attr_accessor :fcm_options
      
        # HTTP headers defined in webpush protocol. Refer to
        # [Webpush protocol](https://tools.ietf.org/html/rfc8030#section-5) for
        # supported headers, e.g. "TTL": "15".
        # Corresponds to the JSON property `headers`
        # @return [Hash<String,String>]
        attr_accessor :headers
      
        # Web Notification options as a JSON object. Supports Notification instance
        # properties as defined in [Web Notification
        # API](https://developer.mozilla.org/en-US/docs/Web/API/Notification). If
        # present, "title" and "body" fields override
        # [google.firebase.fcm.v1.Notification.title] and
        # [google.firebase.fcm.v1.Notification.body].
        # Corresponds to the JSON property `notification`
        # @return [Hash<String,Object>]
        attr_accessor :notification
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @data = args[:data] if args.key?(:data)
          @fcm_options = args[:fcm_options] if args.key?(:fcm_options)
          @headers = args[:headers] if args.key?(:headers)
          @notification = args[:notification] if args.key?(:notification)
        end
      end
      
      # Options for features provided by the FCM SDK for Web.
      class WebpushFcmOptions
        include Google::Apis::Core::Hashable
      
        # The link to open when the user clicks on the notification.
        # For all URL values, HTTPS is required.
        # Corresponds to the JSON property `link`
        # @return [String]
        attr_accessor :link
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @link = args[:link] if args.key?(:link)
        end
      end
    end
  end
end
