# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AcmeVidgetCo::Offers::RedWidgetSecondHalfPriceOffer do
  let(:product_catalog) do
    double('ProductCatalog', price: 32.95)
  end

  let(:offer) { described_class.new }

  context 'when there are no R01 products' do
    it 'returns 0.0 discount' do
      expect(offer.discount([], product_catalog)).to eq(0.0)
    end
  end

  context 'when there is 1 R01 product' do
    it 'returns 0.0 discount' do
      expect(offer.discount(['R01'], product_catalog)).to eq(0.0)
    end
  end

  context 'when there are 2 R01 products' do
    it 'returns half price discount for one' do
      expect(offer.discount(['R01', 'R01'], product_catalog)).to eq(16.48)
    end
  end

  context 'when there are 3 R01 products' do
    it 'returns half price discount for one (only full pairs count)' do
      expect(offer.discount(['R01', 'R01', 'R01'], product_catalog)).to eq(16.48)
    end
  end

  context 'when there are 4 R01 products' do
    it 'returns half price discount for two' do
      expect(offer.discount(['R01', 'R01', 'R01', 'R01'], product_catalog)).to eq(32.95)
    end
  end

  context 'when there are mixed products' do
    it 'counts only R01 for discount' do
      codes = ['R01', 'G01', 'R01', 'B01', 'R01']
      expect(offer.discount(codes, product_catalog)).to eq(16.48)
    end
  end
end
