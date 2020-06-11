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

require 'google/apis/drive_v3'
require 'base_cli'


module Samples
  # Examples for the Google Drive API
  #
  # Sample usage:
  #
  #     $ ./google-api-samples drive upload ~/myvideo.mov
  class Drive < BaseCli
    Drive = Google::Apis::DriveV3

    desc 'upload FILE', 'Upload a file to Google Drive'
    method_option :name, type: :string
    def upload(file)
      drive = Drive::DriveService.new
      drive.authorization = user_credentials_for(Drive::AUTH_DRIVE)

      metadata  = {
        name: options[:name] || file
      }
      result = drive.create_file(metadata, upload_source: file)
      say "Upload complete"
    end

    desc 'download FILE_ID', 'Download a file from Google Drive'
    method_option :out, type: :string
    def download(file_id)
      drive = Drive::DriveService.new
      drive.authorization = user_credentials_for(Drive::AUTH_DRIVE)

      dest = options[:out] || StringIO.new
      drive.get_file(file_id, download_dest: dest)

      if dest.is_a?(StringIO)
        dest.rewind
        STDOUT.write(dest.read)
      else
        say "File downloaded to #{options[:out]}"
      end
    end

    desc 'list QUERY', 'Search for files'
    method_option :limit, type: :numeric
    def list(query)
      drive = Drive::DriveService.new
      drive.authorization = user_credentials_for(Drive::AUTH_DRIVE)

      page_token = nil
      limit = options[:limit] || 1000
      begin
        result = drive.list_files(q: query,
                                  page_size: [limit, 100].min,
                                  page_token: page_token,
                                  fields: 'files(id,name),next_page_token')

        result.files.each { |file| puts "#{file.id}, #{file.name}" }
        limit -= result.files.length
        if result.next_page_token
          page_token = result.next_page_token
        else
          page_token = nil
        end
      end while !page_token.nil? && limit > 0
    end
  end
end
