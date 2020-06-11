# Copyright 2016 Google Inc.
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

require 'google/apis/vision_v1'
require 'base_cli'


module Samples
  # Examples for the Vision APIs
  #
  # Sample usage:
  #
  #     $ ./google-api-samples vision process ~/my_image.jpg --feature='TEXT_DETECTION'
  #
  class Vision < BaseCli
    Vision = Google::Apis::VisionV1

    attr_reader :image_path

    desc 'process FILE', 'Process an image'
    method_option :feature, type: :string, required: true
    method_option :max_results, type: :numeric
    def process(image_path)
      @image_path = image_path

      vision = Vision::VisionService.new
      vision.key = api_key

      result = vision.annotate_image(requests)
      print "\nImage processed! - Response:\n\n"
      p result
    end

  private

    def image
      @image ||= Vision::Image.new(content: File.open(image_path).read)
    end

    def feature
      @feature ||= Vision::Feature.new(
        type:        options[:feature],
        max_results: options[:max_results] || 1
      )
    end

    def requests
      @requests ||= Vision::BatchAnnotateImagesRequest.new(
        requests: [
          Vision::AnnotateImageRequest.new(
            image:    image,
            features: [feature]
          )
        ]
      )
    end
  end
end
