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
    module FusiontablesV1
      
      class Bucket
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Column
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class BaseColumn
          class Representation < Google::Apis::Core::JsonRepresentation; end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class ColumnList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Geometry
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Import
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Line
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class LineStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Point
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PointStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Polygon
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class PolygonStyle
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Sqlresponse
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StyleFunction
        class Representation < Google::Apis::Core::JsonRepresentation; end
        
        class Gradient
          class Representation < Google::Apis::Core::JsonRepresentation; end
          
          class Color
            class Representation < Google::Apis::Core::JsonRepresentation; end
          
            include Google::Apis::Core::JsonObjectSupport
          end
        
          include Google::Apis::Core::JsonObjectSupport
        end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StyleSetting
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class StyleSettingList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Table
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TableList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Task
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TaskList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Template
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class TemplateList
        class Representation < Google::Apis::Core::JsonRepresentation; end
      
        include Google::Apis::Core::JsonObjectSupport
      end
      
      class Bucket
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :color, as: 'color'
          property :icon, as: 'icon'
          property :max, as: 'max'
          property :min, as: 'min'
          property :opacity, as: 'opacity'
          property :weight, as: 'weight'
        end
      end
      
      class Column
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :base_column, as: 'baseColumn', class: Google::Apis::FusiontablesV1::Column::BaseColumn, decorator: Google::Apis::FusiontablesV1::Column::BaseColumn::Representation
      
          property :column_id, as: 'columnId'
          property :description, as: 'description'
          property :graph_predicate, as: 'graph_predicate'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :type, as: 'type'
        end
        
        class BaseColumn
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            property :column_id, as: 'columnId'
            property :table_index, as: 'tableIndex'
          end
        end
      end
      
      class ColumnList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::FusiontablesV1::Column, decorator: Google::Apis::FusiontablesV1::Column::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :total_items, as: 'totalItems'
        end
      end
      
      class Geometry
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :geometries, as: 'geometries'
          property :geometry, as: 'geometry'
          property :type, as: 'type'
        end
      end
      
      class Import
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :num_rows_received, :numeric_string => true, as: 'numRowsReceived'
        end
      end
      
      class Line
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :coordinates, as: 'coordinates', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
          property :type, as: 'type'
        end
      end
      
      class LineStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :stroke_color, as: 'strokeColor'
          property :stroke_color_styler, as: 'strokeColorStyler', class: Google::Apis::FusiontablesV1::StyleFunction, decorator: Google::Apis::FusiontablesV1::StyleFunction::Representation
      
          property :stroke_opacity, as: 'strokeOpacity'
          property :stroke_weight, as: 'strokeWeight'
          property :stroke_weight_styler, as: 'strokeWeightStyler', class: Google::Apis::FusiontablesV1::StyleFunction, decorator: Google::Apis::FusiontablesV1::StyleFunction::Representation
      
        end
      end
      
      class Point
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :coordinates, as: 'coordinates'
          property :type, as: 'type'
        end
      end
      
      class PointStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :icon_name, as: 'iconName'
          property :icon_styler, as: 'iconStyler', class: Google::Apis::FusiontablesV1::StyleFunction, decorator: Google::Apis::FusiontablesV1::StyleFunction::Representation
      
        end
      end
      
      class Polygon
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :coordinates, as: 'coordinates', :class => Array do
        include Representable::JSON::Collection
        items :class => Array do
        include Representable::JSON::Collection
        items
      end
      
      end
      
          property :type, as: 'type'
        end
      end
      
      class PolygonStyle
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :fill_color, as: 'fillColor'
          property :fill_color_styler, as: 'fillColorStyler', class: Google::Apis::FusiontablesV1::StyleFunction, decorator: Google::Apis::FusiontablesV1::StyleFunction::Representation
      
          property :fill_opacity, as: 'fillOpacity'
          property :stroke_color, as: 'strokeColor'
          property :stroke_color_styler, as: 'strokeColorStyler', class: Google::Apis::FusiontablesV1::StyleFunction, decorator: Google::Apis::FusiontablesV1::StyleFunction::Representation
      
          property :stroke_opacity, as: 'strokeOpacity'
          property :stroke_weight, as: 'strokeWeight'
          property :stroke_weight_styler, as: 'strokeWeightStyler', class: Google::Apis::FusiontablesV1::StyleFunction, decorator: Google::Apis::FusiontablesV1::StyleFunction::Representation
      
        end
      end
      
      class Sqlresponse
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :columns, as: 'columns'
          property :kind, as: 'kind'
          collection :rows, as: 'rows', :class => Array do
        include Representable::JSON::Collection
        items
      end
      
        end
      end
      
      class StyleFunction
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :buckets, as: 'buckets', class: Google::Apis::FusiontablesV1::Bucket, decorator: Google::Apis::FusiontablesV1::Bucket::Representation
      
          property :column_name, as: 'columnName'
          property :gradient, as: 'gradient', class: Google::Apis::FusiontablesV1::StyleFunction::Gradient, decorator: Google::Apis::FusiontablesV1::StyleFunction::Gradient::Representation
      
          property :kind, as: 'kind'
        end
        
        class Gradient
          # @private
          class Representation < Google::Apis::Core::JsonRepresentation
            collection :colors, as: 'colors', class: Google::Apis::FusiontablesV1::StyleFunction::Gradient::Color, decorator: Google::Apis::FusiontablesV1::StyleFunction::Gradient::Color::Representation
        
            property :max, as: 'max'
            property :min, as: 'min'
          end
          
          class Color
            # @private
            class Representation < Google::Apis::Core::JsonRepresentation
              property :color, as: 'color'
              property :opacity, as: 'opacity'
            end
          end
        end
      end
      
      class StyleSetting
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :marker_options, as: 'markerOptions', class: Google::Apis::FusiontablesV1::PointStyle, decorator: Google::Apis::FusiontablesV1::PointStyle::Representation
      
          property :name, as: 'name'
          property :polygon_options, as: 'polygonOptions', class: Google::Apis::FusiontablesV1::PolygonStyle, decorator: Google::Apis::FusiontablesV1::PolygonStyle::Representation
      
          property :polyline_options, as: 'polylineOptions', class: Google::Apis::FusiontablesV1::LineStyle, decorator: Google::Apis::FusiontablesV1::LineStyle::Representation
      
          property :style_id, as: 'styleId'
          property :table_id, as: 'tableId'
        end
      end
      
      class StyleSettingList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::FusiontablesV1::StyleSetting, decorator: Google::Apis::FusiontablesV1::StyleSetting::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :total_items, as: 'totalItems'
        end
      end
      
      class Table
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :attribution, as: 'attribution'
          property :attribution_link, as: 'attributionLink'
          collection :base_table_ids, as: 'baseTableIds'
          collection :columns, as: 'columns', class: Google::Apis::FusiontablesV1::Column, decorator: Google::Apis::FusiontablesV1::Column::Representation
      
          property :description, as: 'description'
          property :is_exportable, as: 'isExportable'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :sql, as: 'sql'
          property :table_id, as: 'tableId'
        end
      end
      
      class TableList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::FusiontablesV1::Table, decorator: Google::Apis::FusiontablesV1::Table::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
        end
      end
      
      class Task
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          property :kind, as: 'kind'
          property :progress, as: 'progress'
          property :started, as: 'started'
          property :task_id, :numeric_string => true, as: 'taskId'
          property :type, as: 'type'
        end
      end
      
      class TaskList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::FusiontablesV1::Task, decorator: Google::Apis::FusiontablesV1::Task::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :total_items, as: 'totalItems'
        end
      end
      
      class Template
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :automatic_column_names, as: 'automaticColumnNames'
          property :body, as: 'body'
          property :kind, as: 'kind'
          property :name, as: 'name'
          property :table_id, as: 'tableId'
          property :template_id, as: 'templateId'
        end
      end
      
      class TemplateList
        # @private
        class Representation < Google::Apis::Core::JsonRepresentation
          collection :items, as: 'items', class: Google::Apis::FusiontablesV1::Template, decorator: Google::Apis::FusiontablesV1::Template::Representation
      
          property :kind, as: 'kind'
          property :next_page_token, as: 'nextPageToken'
          property :total_items, as: 'totalItems'
        end
      end
    end
  end
end
