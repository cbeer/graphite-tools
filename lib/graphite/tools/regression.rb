require 'linefit'
module Graphite
  module Tools
    ##
    # Regression analysis of graphite data
    class Regression
      attr_reader :data

      def initialize(data)
        @data = data
      end

      def datapoints
        d = @data['datapoints'].map    { |(v, t)| [t, v] }
                               .reject { |_k, v| v.nil? }
        Hash[*d.flatten]
      end

      def linefit
        @linefit ||= begin
          f = LineFit.new
          f.setData(datapoints.keys, datapoints.values)
          f
        end
      end

      def forecast(*args)
        linefit.forecast(*args)
      end

      def x_intercept(y_val = 0)
        intercept, slope = linefit.coefficients
        Time.at((y_val - intercept) / slope) if slope && slope < 0
      end
    end
  end
end
