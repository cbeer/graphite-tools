require 'active_support/core_ext/integer/time'

##
# Calculator Carbon / Whisper storage requirements
module Graphite
  module Tools
    class WhisperCalc
      attr_reader :aggregation

      def initialize(aggregation)
        @aggregation = aggregation
      end

      def to_h
        Hash[aggregation.split(',').map { |x| x.split(':').map(&:strip) }]
      end

      def to_i
        to_h.inject(0) do |i, (k, v)|
          i + frequency_as_i(v) / frequency_as_i(k)
        end
      end

      private

      def frequency_as_i(v)
        num, unit = v.scan(/(\d+)(.)$/).first
        num = num.to_i

        case unit
        when 's'
          num.seconds
        when 'm'
          num.minutes
        when 'h'
          num.hours
        when 'd'
          num.days
        when 'y'
          num.years
        end
      end
    end
  end
end
