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

require 'google/apis/fitness_v1/service.rb'
require 'google/apis/fitness_v1/classes.rb'
require 'google/apis/fitness_v1/representations.rb'

module Google
  module Apis
    # Fitness
    #
    # Stores and accesses user data in the fitness store from apps on any platform.
    #
    # @see https://developers.google.com/fit/rest/
    module FitnessV1
      VERSION = 'V1'
      REVISION = '20191014'

      # Use Google Fit to see and store your physical activity data
      AUTH_FITNESS_ACTIVITY_READ = 'https://www.googleapis.com/auth/fitness.activity.read'

      # See and add to your Google Fit physical activity data
      AUTH_FITNESS_ACTIVITY_WRITE = 'https://www.googleapis.com/auth/fitness.activity.write'

      # See info about your blood glucose in Google Fit
      AUTH_FITNESS_BLOOD_GLUCOSE_READ = 'https://www.googleapis.com/auth/fitness.blood_glucose.read'

      # See and add info about your blood glucose to Google Fit
      AUTH_FITNESS_BLOOD_GLUCOSE_WRITE = 'https://www.googleapis.com/auth/fitness.blood_glucose.write'

      # See info about your blood pressure in Google Fit
      AUTH_FITNESS_BLOOD_PRESSURE_READ = 'https://www.googleapis.com/auth/fitness.blood_pressure.read'

      # See and add info about your blood pressure in Google Fit
      AUTH_FITNESS_BLOOD_PRESSURE_WRITE = 'https://www.googleapis.com/auth/fitness.blood_pressure.write'

      # See info about your body measurements and heart rate in Google Fit
      AUTH_FITNESS_BODY_READ = 'https://www.googleapis.com/auth/fitness.body.read'

      # See and add info about your body measurements and heart rate to Google Fit
      AUTH_FITNESS_BODY_WRITE = 'https://www.googleapis.com/auth/fitness.body.write'

      # See info about your body temperature in Google Fit
      AUTH_FITNESS_BODY_TEMPERATURE_READ = 'https://www.googleapis.com/auth/fitness.body_temperature.read'

      # See and add to info about your body temperature in Google Fit
      AUTH_FITNESS_BODY_TEMPERATURE_WRITE = 'https://www.googleapis.com/auth/fitness.body_temperature.write'

      # See your Google Fit speed and distance data
      AUTH_FITNESS_LOCATION_READ = 'https://www.googleapis.com/auth/fitness.location.read'

      # See and add to your Google Fit location data
      AUTH_FITNESS_LOCATION_WRITE = 'https://www.googleapis.com/auth/fitness.location.write'

      # See info about your nutrition in Google Fit
      AUTH_FITNESS_NUTRITION_READ = 'https://www.googleapis.com/auth/fitness.nutrition.read'

      # See and add to info about your nutrition in Google Fit
      AUTH_FITNESS_NUTRITION_WRITE = 'https://www.googleapis.com/auth/fitness.nutrition.write'

      # See info about your oxygen saturation in Google Fit
      AUTH_FITNESS_OXYGEN_SATURATION_READ = 'https://www.googleapis.com/auth/fitness.oxygen_saturation.read'

      # See and add info about your oxygen saturation in Google Fit
      AUTH_FITNESS_OXYGEN_SATURATION_WRITE = 'https://www.googleapis.com/auth/fitness.oxygen_saturation.write'

      # See info about your reproductive health in Google Fit
      AUTH_FITNESS_REPRODUCTIVE_HEALTH_READ = 'https://www.googleapis.com/auth/fitness.reproductive_health.read'

      # See and add info about your reproductive health in Google Fit
      AUTH_FITNESS_REPRODUCTIVE_HEALTH_WRITE = 'https://www.googleapis.com/auth/fitness.reproductive_health.write'
    end
  end
end
