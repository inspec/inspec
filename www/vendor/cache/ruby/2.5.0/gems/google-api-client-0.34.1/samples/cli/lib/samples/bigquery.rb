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

require 'google/apis/bigquery_v2'
require 'base_cli'


module Samples
  # Examples for the Google BigQuery API
  #
  # Sample usage:
  #
  #     $ ./google-api-samples bigquery list_datasets --project_id=publicdata
  #     $ ./google-api-samples bigquery list_tables --project_id=publicdata --dataset_id=samples
  #     $ ./google-api-samples bigquery list_table_data --project_id=publicdata --dataset_id=samples --table_id=wikipedia --max_results=10
  class Bigquery < BaseCli
    Bigquery = Google::Apis::BigqueryV2

    desc 'list datasets', 'List datasets'
    method_option :project_id, type: :string
    def list_datasets
      bigquery = Bigquery::BigqueryService.new
      bigquery.authorization = user_credentials_for(Bigquery::AUTH_BIGQUERY)

      begin
        project_id = options[:project_id] || 'publicdata'
        result = bigquery.list_datasets(project_id)
        data = []
        data << ['id','kind']
        result.datasets.each do |dataset|
          data << [
            dataset.id,
            dataset.kind,
          ]
        end
        print_table(data)
      end
    end

    desc 'list tables', 'List tables'
    method_option :project_id, type: :string
    method_option :dataset_id, type: :string
    def list_tables
      bigquery = Bigquery::BigqueryService.new
      bigquery.authorization = user_credentials_for(Bigquery::AUTH_BIGQUERY)

      begin
        project_id = options[:project_id] || 'publicdata'
        dataset_id = options[:dataset_id] || 'samples'
        result = bigquery.list_tables(project_id, dataset_id)
        data = []
        data << ['id','kind']
        result.tables.each do |table|
          data << [
            table.id,
            table.kind,
          ]
        end
        print_table(data)
      end
    end

    desc 'list table data', 'List table data'
    method_option :project_id, type: :string
    method_option :dataset_id, type: :string
    method_option :table_id, type: :string
    def list_table_data
      bigquery = Bigquery::BigqueryService.new
      bigquery.authorization = user_credentials_for(Bigquery::AUTH_BIGQUERY)

      begin
        project_id = options[:project_id] || 'publicdata'
        dataset_id = options[:dataset_id] || 'samples'
        table_id = options[:table_id] || 'wikipedia'
        max_results = options[:max_results] || 10
        result = bigquery.list_table_data(project_id, dataset_id, table_id, max_results: max_results)

        datas = []
        result.rows.each do |row|
          data = []
          row.f.each do |field|
            data << field.v
          end
          datas << data
        end
        print_table(datas)
      end
    end
  end
end
