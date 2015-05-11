require 'spec_helper'

describe Graphite::Tools::WhisperCalc do
  subject { described_class.new('1s:2d,3h:4y') }

  describe '#to_h' do
    it 'should split an aggregation into frequency/history pairs' do
      expect(subject.to_h).to eq '1s' => '2d', '3h' => '4y'
    end
  end

  describe '#to_i' do
    it 'should be the count of the data points in the aggregation' do
      expect(subject.to_i).to eq 184_488
    end
  end
end
