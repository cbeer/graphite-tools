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

      def forecast(*args)
        linefit.forecast(*args)
      end

      def x_intercept(y_val = 0)
        return if slope == 0

        t = (y_val - intercept) / slope

        Time.at(t)
      end

      private

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

      def slope
        linefit.coefficients.last || 0
      end

      def intercept
        linefit.coefficients.first || 0
      end
    end
  end
end
