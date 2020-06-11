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
      
      # Specifies the minimum and maximum values, the color, opacity, icon and weight
      # of a bucket within a StyleSetting.
      class Bucket
        include Google::Apis::Core::Hashable
      
        # Color of line or the interior of a polygon in #RRGGBB format.
        # Corresponds to the JSON property `color`
        # @return [String]
        attr_accessor :color
      
        # Icon name used for a point.
        # Corresponds to the JSON property `icon`
        # @return [String]
        attr_accessor :icon
      
        # Maximum value in the selected column for a row to be styled according to the
        # bucket color, opacity, icon, or weight.
        # Corresponds to the JSON property `max`
        # @return [Float]
        attr_accessor :max
      
        # Minimum value in the selected column for a row to be styled according to the
        # bucket color, opacity, icon, or weight.
        # Corresponds to the JSON property `min`
        # @return [Float]
        attr_accessor :min
      
        # Opacity of the color: 0.0 (transparent) to 1.0 (opaque).
        # Corresponds to the JSON property `opacity`
        # @return [Float]
        attr_accessor :opacity
      
        # Width of a line (in pixels).
        # Corresponds to the JSON property `weight`
        # @return [Fixnum]
        attr_accessor :weight
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @color = args[:color] if args.key?(:color)
          @icon = args[:icon] if args.key?(:icon)
          @max = args[:max] if args.key?(:max)
          @min = args[:min] if args.key?(:min)
          @opacity = args[:opacity] if args.key?(:opacity)
          @weight = args[:weight] if args.key?(:weight)
        end
      end
      
      # Specifies the id, name and type of a column in a table.
      class Column
        include Google::Apis::Core::Hashable
      
        # Optional identifier of the base column. If present, this column is derived
        # from the specified base column.
        # Corresponds to the JSON property `baseColumn`
        # @return [Google::Apis::FusiontablesV1::Column::BaseColumn]
        attr_accessor :base_column
      
        # Identifier for the column.
        # Corresponds to the JSON property `columnId`
        # @return [Fixnum]
        attr_accessor :column_id
      
        # Optional column description.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Optional column predicate. Used to map table to graph data model (subject,
        # predicate,object) See http://www.w3.org/TR/2014/REC-rdf11-concepts-20140225/#
        # data-model
        # Corresponds to the JSON property `graph_predicate`
        # @return [String]
        attr_accessor :graph_predicate
      
        # Type name: a template for an individual column.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Required name of the column.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Required type of the column.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @base_column = args[:base_column] if args.key?(:base_column)
          @column_id = args[:column_id] if args.key?(:column_id)
          @description = args[:description] if args.key?(:description)
          @graph_predicate = args[:graph_predicate] if args.key?(:graph_predicate)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @type = args[:type] if args.key?(:type)
        end
        
        # Optional identifier of the base column. If present, this column is derived
        # from the specified base column.
        class BaseColumn
          include Google::Apis::Core::Hashable
        
          # The id of the column in the base table from which this column is derived.
          # Corresponds to the JSON property `columnId`
          # @return [Fixnum]
          attr_accessor :column_id
        
          # Offset to the entry in the list of base tables in the table definition.
          # Corresponds to the JSON property `tableIndex`
          # @return [Fixnum]
          attr_accessor :table_index
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @column_id = args[:column_id] if args.key?(:column_id)
            @table_index = args[:table_index] if args.key?(:table_index)
          end
        end
      end
      
      # Represents a list of columns in a table.
      class ColumnList
        include Google::Apis::Core::Hashable
      
        # List of all requested columns.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::FusiontablesV1::Column>]
        attr_accessor :items
      
        # Type name: a list of all columns.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. No token is displayed if
        # there are no more pages left.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Total number of columns for the table.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
      end
      
      # Represents a Geometry object.
      class Geometry
        include Google::Apis::Core::Hashable
      
        # The list of geometries in this geometry collection.
        # Corresponds to the JSON property `geometries`
        # @return [Array<Object>]
        attr_accessor :geometries
      
        # 
        # Corresponds to the JSON property `geometry`
        # @return [Object]
        attr_accessor :geometry
      
        # Type: A collection of geometries.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @geometries = args[:geometries] if args.key?(:geometries)
          @geometry = args[:geometry] if args.key?(:geometry)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents an import request.
      class Import
        include Google::Apis::Core::Hashable
      
        # Type name: a template for an import request.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The number of rows received from the import request.
        # Corresponds to the JSON property `numRowsReceived`
        # @return [Fixnum]
        attr_accessor :num_rows_received
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @num_rows_received = args[:num_rows_received] if args.key?(:num_rows_received)
        end
      end
      
      # Represents a line geometry.
      class Line
        include Google::Apis::Core::Hashable
      
        # The coordinates that define the line.
        # Corresponds to the JSON property `coordinates`
        # @return [Array<Array<Float>>]
        attr_accessor :coordinates
      
        # Type: A line geometry.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @coordinates = args[:coordinates] if args.key?(:coordinates)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a LineStyle within a StyleSetting
      class LineStyle
        include Google::Apis::Core::Hashable
      
        # Color of the line in #RRGGBB format.
        # Corresponds to the JSON property `strokeColor`
        # @return [String]
        attr_accessor :stroke_color
      
        # Represents a StyleFunction within a StyleSetting
        # Corresponds to the JSON property `strokeColorStyler`
        # @return [Google::Apis::FusiontablesV1::StyleFunction]
        attr_accessor :stroke_color_styler
      
        # Opacity of the line : 0.0 (transparent) to 1.0 (opaque).
        # Corresponds to the JSON property `strokeOpacity`
        # @return [Float]
        attr_accessor :stroke_opacity
      
        # Width of the line in pixels.
        # Corresponds to the JSON property `strokeWeight`
        # @return [Fixnum]
        attr_accessor :stroke_weight
      
        # Represents a StyleFunction within a StyleSetting
        # Corresponds to the JSON property `strokeWeightStyler`
        # @return [Google::Apis::FusiontablesV1::StyleFunction]
        attr_accessor :stroke_weight_styler
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @stroke_color = args[:stroke_color] if args.key?(:stroke_color)
          @stroke_color_styler = args[:stroke_color_styler] if args.key?(:stroke_color_styler)
          @stroke_opacity = args[:stroke_opacity] if args.key?(:stroke_opacity)
          @stroke_weight = args[:stroke_weight] if args.key?(:stroke_weight)
          @stroke_weight_styler = args[:stroke_weight_styler] if args.key?(:stroke_weight_styler)
        end
      end
      
      # Represents a point object.
      class Point
        include Google::Apis::Core::Hashable
      
        # The coordinates that define the point.
        # Corresponds to the JSON property `coordinates`
        # @return [Array<Float>]
        attr_accessor :coordinates
      
        # Point: A point geometry.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @coordinates = args[:coordinates] if args.key?(:coordinates)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a PointStyle within a StyleSetting
      class PointStyle
        include Google::Apis::Core::Hashable
      
        # Name of the icon. Use values defined in http://www.google.com/fusiontables/
        # DataSource?dsrcid=308519
        # Corresponds to the JSON property `iconName`
        # @return [String]
        attr_accessor :icon_name
      
        # Represents a StyleFunction within a StyleSetting
        # Corresponds to the JSON property `iconStyler`
        # @return [Google::Apis::FusiontablesV1::StyleFunction]
        attr_accessor :icon_styler
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @icon_name = args[:icon_name] if args.key?(:icon_name)
          @icon_styler = args[:icon_styler] if args.key?(:icon_styler)
        end
      end
      
      # Represents a polygon object.
      class Polygon
        include Google::Apis::Core::Hashable
      
        # The coordinates that define the polygon.
        # Corresponds to the JSON property `coordinates`
        # @return [Array<Array<Array<Float>>>]
        attr_accessor :coordinates
      
        # Type: A polygon geometry.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @coordinates = args[:coordinates] if args.key?(:coordinates)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a PolygonStyle within a StyleSetting
      class PolygonStyle
        include Google::Apis::Core::Hashable
      
        # Color of the interior of the polygon in #RRGGBB format.
        # Corresponds to the JSON property `fillColor`
        # @return [String]
        attr_accessor :fill_color
      
        # Represents a StyleFunction within a StyleSetting
        # Corresponds to the JSON property `fillColorStyler`
        # @return [Google::Apis::FusiontablesV1::StyleFunction]
        attr_accessor :fill_color_styler
      
        # Opacity of the interior of the polygon: 0.0 (transparent) to 1.0 (opaque).
        # Corresponds to the JSON property `fillOpacity`
        # @return [Float]
        attr_accessor :fill_opacity
      
        # Color of the polygon border in #RRGGBB format.
        # Corresponds to the JSON property `strokeColor`
        # @return [String]
        attr_accessor :stroke_color
      
        # Represents a StyleFunction within a StyleSetting
        # Corresponds to the JSON property `strokeColorStyler`
        # @return [Google::Apis::FusiontablesV1::StyleFunction]
        attr_accessor :stroke_color_styler
      
        # Opacity of the polygon border: 0.0 (transparent) to 1.0 (opaque).
        # Corresponds to the JSON property `strokeOpacity`
        # @return [Float]
        attr_accessor :stroke_opacity
      
        # Width of the polyon border in pixels.
        # Corresponds to the JSON property `strokeWeight`
        # @return [Fixnum]
        attr_accessor :stroke_weight
      
        # Represents a StyleFunction within a StyleSetting
        # Corresponds to the JSON property `strokeWeightStyler`
        # @return [Google::Apis::FusiontablesV1::StyleFunction]
        attr_accessor :stroke_weight_styler
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @fill_color = args[:fill_color] if args.key?(:fill_color)
          @fill_color_styler = args[:fill_color_styler] if args.key?(:fill_color_styler)
          @fill_opacity = args[:fill_opacity] if args.key?(:fill_opacity)
          @stroke_color = args[:stroke_color] if args.key?(:stroke_color)
          @stroke_color_styler = args[:stroke_color_styler] if args.key?(:stroke_color_styler)
          @stroke_opacity = args[:stroke_opacity] if args.key?(:stroke_opacity)
          @stroke_weight = args[:stroke_weight] if args.key?(:stroke_weight)
          @stroke_weight_styler = args[:stroke_weight_styler] if args.key?(:stroke_weight_styler)
        end
      end
      
      # Represents a response to an sql statement.
      class Sqlresponse
        include Google::Apis::Core::Hashable
      
        # Columns in the table.
        # Corresponds to the JSON property `columns`
        # @return [Array<String>]
        attr_accessor :columns
      
        # Type name: a template for an individual table.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # The rows in the table. For each cell we print out whatever cell value (e.g.,
        # numeric, string) exists. Thus it is important that each cell contains only one
        # value.
        # Corresponds to the JSON property `rows`
        # @return [Array<Array<Object>>]
        attr_accessor :rows
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @columns = args[:columns] if args.key?(:columns)
          @kind = args[:kind] if args.key?(:kind)
          @rows = args[:rows] if args.key?(:rows)
        end
      end
      
      # Represents a StyleFunction within a StyleSetting
      class StyleFunction
        include Google::Apis::Core::Hashable
      
        # Bucket function that assigns a style based on the range a column value falls
        # into.
        # Corresponds to the JSON property `buckets`
        # @return [Array<Google::Apis::FusiontablesV1::Bucket>]
        attr_accessor :buckets
      
        # Name of the column whose value is used in the style.
        # Corresponds to the JSON property `columnName`
        # @return [String]
        attr_accessor :column_name
      
        # Gradient function that interpolates a range of colors based on column value.
        # Corresponds to the JSON property `gradient`
        # @return [Google::Apis::FusiontablesV1::StyleFunction::Gradient]
        attr_accessor :gradient
      
        # Stylers can be one of three kinds: "fusiontables#fromColumn" if the column
        # value is to be used as is, i.e., the column values can have colors in #
        # RRGGBBAA format or integer line widths or icon names; "fusiontables#gradient"
        # if the styling of the row is to be based on applying the gradient function on
        # the column value; or "fusiontables#buckets" if the styling is to based on the
        # bucket into which the the column value falls.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @buckets = args[:buckets] if args.key?(:buckets)
          @column_name = args[:column_name] if args.key?(:column_name)
          @gradient = args[:gradient] if args.key?(:gradient)
          @kind = args[:kind] if args.key?(:kind)
        end
        
        # Gradient function that interpolates a range of colors based on column value.
        class Gradient
          include Google::Apis::Core::Hashable
        
          # Array with two or more colors.
          # Corresponds to the JSON property `colors`
          # @return [Array<Google::Apis::FusiontablesV1::StyleFunction::Gradient::Color>]
          attr_accessor :colors
        
          # Higher-end of the interpolation range: rows with this value will be assigned
          # to colors[n-1].
          # Corresponds to the JSON property `max`
          # @return [Float]
          attr_accessor :max
        
          # Lower-end of the interpolation range: rows with this value will be assigned to
          # colors[0].
          # Corresponds to the JSON property `min`
          # @return [Float]
          attr_accessor :min
        
          def initialize(**args)
             update!(**args)
          end
        
          # Update properties of this object
          def update!(**args)
            @colors = args[:colors] if args.key?(:colors)
            @max = args[:max] if args.key?(:max)
            @min = args[:min] if args.key?(:min)
          end
          
          # 
          class Color
            include Google::Apis::Core::Hashable
          
            # Color in #RRGGBB format.
            # Corresponds to the JSON property `color`
            # @return [String]
            attr_accessor :color
          
            # Opacity of the color: 0.0 (transparent) to 1.0 (opaque).
            # Corresponds to the JSON property `opacity`
            # @return [Float]
            attr_accessor :opacity
          
            def initialize(**args)
               update!(**args)
            end
          
            # Update properties of this object
            def update!(**args)
              @color = args[:color] if args.key?(:color)
              @opacity = args[:opacity] if args.key?(:opacity)
            end
          end
        end
      end
      
      # Represents a complete StyleSettings object. The primary key is a combination
      # of the tableId and a styleId.
      class StyleSetting
        include Google::Apis::Core::Hashable
      
        # Type name: an individual style setting. A StyleSetting contains the style
        # defintions for points, lines, and polygons in a table. Since a table can have
        # any one or all of them, a style definition can have point, line and polygon
        # style definitions.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Represents a PointStyle within a StyleSetting
        # Corresponds to the JSON property `markerOptions`
        # @return [Google::Apis::FusiontablesV1::PointStyle]
        attr_accessor :marker_options
      
        # Optional name for the style setting.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Represents a PolygonStyle within a StyleSetting
        # Corresponds to the JSON property `polygonOptions`
        # @return [Google::Apis::FusiontablesV1::PolygonStyle]
        attr_accessor :polygon_options
      
        # Represents a LineStyle within a StyleSetting
        # Corresponds to the JSON property `polylineOptions`
        # @return [Google::Apis::FusiontablesV1::LineStyle]
        attr_accessor :polyline_options
      
        # Identifier for the style setting (unique only within tables).
        # Corresponds to the JSON property `styleId`
        # @return [Fixnum]
        attr_accessor :style_id
      
        # Identifier for the table.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @marker_options = args[:marker_options] if args.key?(:marker_options)
          @name = args[:name] if args.key?(:name)
          @polygon_options = args[:polygon_options] if args.key?(:polygon_options)
          @polyline_options = args[:polyline_options] if args.key?(:polyline_options)
          @style_id = args[:style_id] if args.key?(:style_id)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # Represents a list of styles for a given table.
      class StyleSettingList
        include Google::Apis::Core::Hashable
      
        # All requested style settings.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::FusiontablesV1::StyleSetting>]
        attr_accessor :items
      
        # Type name: in this case, a list of style settings.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. No token is displayed if
        # there are no more pages left.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Total number of styles for the table.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
      end
      
      # Represents a table. Specifies the name, whether it is exportable, description,
      # attribution, and attribution link.
      class Table
        include Google::Apis::Core::Hashable
      
        # Optional attribution assigned to the table.
        # Corresponds to the JSON property `attribution`
        # @return [String]
        attr_accessor :attribution
      
        # Optional link for attribution.
        # Corresponds to the JSON property `attributionLink`
        # @return [String]
        attr_accessor :attribution_link
      
        # Optional base table identifier if this table is a view or merged table.
        # Corresponds to the JSON property `baseTableIds`
        # @return [Array<String>]
        attr_accessor :base_table_ids
      
        # Columns in the table.
        # Corresponds to the JSON property `columns`
        # @return [Array<Google::Apis::FusiontablesV1::Column>]
        attr_accessor :columns
      
        # Optional description assigned to the table.
        # Corresponds to the JSON property `description`
        # @return [String]
        attr_accessor :description
      
        # Variable for whether table is exportable.
        # Corresponds to the JSON property `isExportable`
        # @return [Boolean]
        attr_accessor :is_exportable
        alias_method :is_exportable?, :is_exportable
      
        # Type name: a template for an individual table.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Name assigned to a table.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Optional sql that encodes the table definition for derived tables.
        # Corresponds to the JSON property `sql`
        # @return [String]
        attr_accessor :sql
      
        # Encrypted unique alphanumeric identifier for the table.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @attribution = args[:attribution] if args.key?(:attribution)
          @attribution_link = args[:attribution_link] if args.key?(:attribution_link)
          @base_table_ids = args[:base_table_ids] if args.key?(:base_table_ids)
          @columns = args[:columns] if args.key?(:columns)
          @description = args[:description] if args.key?(:description)
          @is_exportable = args[:is_exportable] if args.key?(:is_exportable)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @sql = args[:sql] if args.key?(:sql)
          @table_id = args[:table_id] if args.key?(:table_id)
        end
      end
      
      # Represents a list of tables.
      class TableList
        include Google::Apis::Core::Hashable
      
        # List of all requested tables.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::FusiontablesV1::Table>]
        attr_accessor :items
      
        # Type name: a list of all tables.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. No token is displayed if
        # there are no more pages left.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
        end
      end
      
      # Specifies the identifier, name, and type of a task in a table.
      class Task
        include Google::Apis::Core::Hashable
      
        # Type of the resource. This is always "fusiontables#task".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # An indication of task progress.
        # Corresponds to the JSON property `progress`
        # @return [String]
        attr_accessor :progress
      
        # false while the table is busy with some other task. true if this background
        # task is currently running.
        # Corresponds to the JSON property `started`
        # @return [Boolean]
        attr_accessor :started
        alias_method :started?, :started
      
        # Identifier for the task.
        # Corresponds to the JSON property `taskId`
        # @return [Fixnum]
        attr_accessor :task_id
      
        # Type of background task. One of  DELETE_ROWS Deletes one or more rows from the
        # table. ADD_ROWS "Adds one or more rows to a table. Includes importing data
        # into a new table and importing more rows into an existing table. ADD_COLUMN
        # Adds a new column to the table. CHANGE_TYPE Changes the type of a column.
        # Corresponds to the JSON property `type`
        # @return [String]
        attr_accessor :type
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @kind = args[:kind] if args.key?(:kind)
          @progress = args[:progress] if args.key?(:progress)
          @started = args[:started] if args.key?(:started)
          @task_id = args[:task_id] if args.key?(:task_id)
          @type = args[:type] if args.key?(:type)
        end
      end
      
      # Represents a list of tasks for a table.
      class TaskList
        include Google::Apis::Core::Hashable
      
        # List of all requested tasks.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::FusiontablesV1::Task>]
        attr_accessor :items
      
        # Type of the resource. This is always "fusiontables#taskList".
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. No token is displayed if
        # there are no more pages left.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Total number of tasks for the table.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
      end
      
      # Represents the contents of InfoWindow templates.
      class Template
        include Google::Apis::Core::Hashable
      
        # List of columns from which the template is to be automatically constructed.
        # Only one of body or automaticColumns can be specified.
        # Corresponds to the JSON property `automaticColumnNames`
        # @return [Array<String>]
        attr_accessor :automatic_column_names
      
        # Body of the template. It contains HTML with `column_name` to insert values
        # from a particular column. The body is sanitized to remove certain tags, e.g.,
        # script. Only one of body or automaticColumns can be specified.
        # Corresponds to the JSON property `body`
        # @return [String]
        attr_accessor :body
      
        # Type name: a template for the info window contents. The template can either
        # include an HTML body or a list of columns from which the template is computed
        # automatically.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Optional name assigned to a template.
        # Corresponds to the JSON property `name`
        # @return [String]
        attr_accessor :name
      
        # Identifier for the table for which the template is defined.
        # Corresponds to the JSON property `tableId`
        # @return [String]
        attr_accessor :table_id
      
        # Identifier for the template, unique within the context of a particular table.
        # Corresponds to the JSON property `templateId`
        # @return [Fixnum]
        attr_accessor :template_id
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @automatic_column_names = args[:automatic_column_names] if args.key?(:automatic_column_names)
          @body = args[:body] if args.key?(:body)
          @kind = args[:kind] if args.key?(:kind)
          @name = args[:name] if args.key?(:name)
          @table_id = args[:table_id] if args.key?(:table_id)
          @template_id = args[:template_id] if args.key?(:template_id)
        end
      end
      
      # Represents a list of templates for a given table.
      class TemplateList
        include Google::Apis::Core::Hashable
      
        # List of all requested templates.
        # Corresponds to the JSON property `items`
        # @return [Array<Google::Apis::FusiontablesV1::Template>]
        attr_accessor :items
      
        # Type name: a list of all templates.
        # Corresponds to the JSON property `kind`
        # @return [String]
        attr_accessor :kind
      
        # Token used to access the next page of this result. No token is displayed if
        # there are no more pages left.
        # Corresponds to the JSON property `nextPageToken`
        # @return [String]
        attr_accessor :next_page_token
      
        # Total number of templates for the table.
        # Corresponds to the JSON property `totalItems`
        # @return [Fixnum]
        attr_accessor :total_items
      
        def initialize(**args)
           update!(**args)
        end
      
        # Update properties of this object
        def update!(**args)
          @items = args[:items] if args.key?(:items)
          @kind = args[:kind] if args.key?(:kind)
          @next_page_token = args[:next_page_token] if args.key?(:next_page_token)
          @total_items = args[:total_items] if args.key?(:total_items)
        end
      end
    end
  end
end
