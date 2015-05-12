require 'spec_helper'

describe Graphite::Tools::Regression do
  subject { described_class.new('target' => 'x', 'datapoints' => datapoints) }
  let(:datapoints) do 
    [
      [nil, 1430697600], 
      [32228212736.0, 1430784000], 
      [32217464832.0, 1430870400], 
      [31741001728.0, 1430956800], 
      [30440521728.0, 1431043200], 
      [29350772736.0, 1431129600], 
      [28261875712.0, 1431216000], 
      [27169488896.0, 1431302400]
    ]
  end

  describe '#forecast' do
    it 'forecasts future values for the series' do
      expect(subject.forecast(1431302400 + 60*60*24)).to eq 26561679945.14258
    end
  end

  describe '#x_intercept' do
    it 'estimates the time when the series reaches 0' do
      expect(subject.x_intercept).to eq Time.at(1433910939.829250574)
    end
  end
end
