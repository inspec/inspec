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

require 'google/apis/commentanalyzer_v1alpha1/service.rb'
require 'google/apis/commentanalyzer_v1alpha1/classes.rb'
require 'google/apis/commentanalyzer_v1alpha1/representations.rb'

module Google
  module Apis
    # Perspective Comment Analyzer API
    #
    # The Perspective Comment Analyzer API provides information about the potential
    # impact of a comment on a conversation (e.g. it can provide a score for the "
    # toxicity" of a comment). Users can leverage the "SuggestCommentScore" method
    # to submit corrections to improve Perspective over time. Users can set the "
    # doNotStore" flag to ensure that all submitted comments are automatically
    # deleted after scores are returned.
    #
    # @see https://github.com/conversationai/perspectiveapi/blob/master/README.md
    module CommentanalyzerV1alpha1
      VERSION = 'V1alpha1'
      REVISION = '20190922'

      # View your email address
      AUTH_USERINFO_EMAIL = 'https://www.googleapis.com/auth/userinfo.email'
    end
  end
end
