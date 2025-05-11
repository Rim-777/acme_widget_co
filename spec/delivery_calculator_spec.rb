# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AcmeVidgetCo::DeliveryCalculator do
  let(:calculator) { described_class.new(AcmeVidgetCo::DeliveryRules) }

  describe '#cost' do
    context 'when amount is less than the first threshold' do
      it 'returns the first rule cost' do
        expect(calculator.cost(49.9)).to eq(4.95)
      end
    end

    context 'when amount is between thresholds' do
      it 'returns the second rule cost' do
        expect(calculator.cost(70.0)).to eq(2.95)
      end
    end

    context 'when amount is equal to the highest threshold' do
      it 'returns 0.0 (free delivery)' do
        expect(calculator.cost(90.0)).to eq(0.0)
      end
    end

    context 'when amount is greater than all thresholds' do
      it 'returns 0.0 (free delivery)' do
        expect(calculator.cost(90.1)).to eq(0.0)
      end
    end
  end
end
