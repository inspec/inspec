# frozen_string_literal: true
require "inspec/license_context"

module Inspec
  class LicenseDataCollector
    class Payload
      SOURCE = "Inspec CLI"
      class Scan
        attr_accessor :identifier, :executions, :version, :start_time, :end_time

        def initialize(start_time: nil)
          @start_time = start_time || Time.now.getutc.iso8601
        end

        def as_serializable_hash
          {
            identifier: identifier, # platform identifier
            executions: 1, # TODO: figure out tests count
            version: Inspec::VERSION,
            activity: { start: start_time, end: end_time }, # scan start & end time
          }
        end
      end

      class Content

        attr_accessor :identifier, :executions, :version, :type, :start_time, :end_time

        def initialize(start_time: nil)
          @start_time = start_time || Time.now.getutc.iso8601
        end

        def self.build_from(profile)
          new.tap do |instance|
            instance.identifier = profile.metadata.params[:profile_content_id]
            # Profile execution within a scan is always 1
            instance.executions = 1
            instance.version = profile.metadata.params[:version]
            instance.type = "Profile" # we don't have any other content type
          end
        end

        def as_serializable_hash
          {
            identifier: identifier,
            executions: executions,
            version: version,
            type: type,
            activity: { start: start_time, end: end_time },
          }
        end

      end

      class Period
        attr_accessor :start_time, :end_time
        attr_reader :contents

        def initialize(start_time: nil, end_time: nil)
          @report_date = Time.now.getutc.iso8601
          @start_time = start_time || report_date
          @end_time = end_time
          @scan = Inspec::LicenseDataCollector::Payload::Scan.new
          @contents = []
        end

        def summary
          {
            nodes: { total: 0, active: 0 }, # we don't have to calculate active nodes this is for automate
            scans: { total: 1, targets: 1 }, # Total : Platform 1, targets is always 1 for now
          }
        end

        def as_serializable_hash
          {
            version: Inspec::VERSION,
            date: report_date,
            period: { start: start_time, end: end_time },
            summary: summary,
            evidence: {
              nodes: [],
              scans: scans.map(&:as_serializable_hash),
              content: contents.map(&:as_serializable_hash),
            },
          }
        end

        def contents=(content)
          @contents << content
        end

        def scans
          [@scan]
        end

        # TODO: implement accessor for to push new scan evidences using data streaming.
        # def scans=(scan)
        #   # @scans << scan
        # end
        private

        attr_reader :report_date

      end

      attr_accessor :period

      def initialize
        @period = Period.new
      end

      def as_serializable_hash
        {
          license: license&.id, # TBD Do not get this info for license from /client API call
          customer: "", # we won't know the Customer ID
          expiration: license&.expiration_date,
          name: "", # TBD Do not get this info from license, hence sending blank
          periods: [
            period.as_serializable_hash,
          ],
          source: SOURCE,
        }
      end

      private

      # TODO: fetch the already cached license object
      def license
        @license ||= Inspec::LicenseContext.cached
      end

    end
  end
end
