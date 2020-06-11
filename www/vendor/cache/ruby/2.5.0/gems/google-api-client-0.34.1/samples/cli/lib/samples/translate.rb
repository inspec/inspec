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

require 'google/apis/translate_v2'
require 'base_cli'


module Samples
  # Examples for the Google Translate API
  #
  # Sample usage:
  #
  #      $ ./google-api-samples translate 'Hola!' --target='en'
  #      Hello
  #
  class Translate < BaseCli
    Translate = Google::Apis::TranslateV2

    desc 'translate PHRASE', 'Translate a phrase'
    method_option :source, type: :string
    method_option :target, type: :string, required: true
    def translate(phrase)
      translate = Translate::TranslateService.new
      translate.key = api_key

      result = translate.list_translations(phrase, options[:target], source: options[:source])
      puts result.translations.first.translated_text
    end

    default_task :translate

  end
end
