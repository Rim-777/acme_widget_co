# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AcmeVidgetCo::ProductCatalog do
  let(:products) do
    [
      AcmeVidgetCo::Product.new(code: 'R01', name: 'Red Widget', price: 32.95),
      AcmeVidgetCo::Product.new(code: 'G01', name: 'Green Widgett', price: 24.95)
    ]
  end

  let(:catalog) { described_class.new(products) }

  describe '#product' do
    it 'returns the product hash for a valid code' do
      expect(catalog.product('R01')).to eq(products.first)
    end

    it 'returns nil for an unknown code' do
      expect(catalog.product('B01')).to be_nil
    end
  end

  describe '#price' do
    it 'returns the price for a valid code' do
      expect(catalog.price('G01')).to eq(products.last.price)
      expect(catalog.price('G01')).to be_a(BigDecimal)
    end

    it 'raises NoMethodError for an unknown code' do
      expect { catalog.price('B01') }.to raise_error(NoMethodError)
    end
  end

  describe '#name' do
    it 'returns the name for a valid code' do
      expect(catalog.name('R01')).to eq(products.first.name)
    end

    it 'raises NoMethodError for an unknown code' do
      expect { catalog.name('B01') }.to raise_error(NoMethodError)
    end
  end
end
