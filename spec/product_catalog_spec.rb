# frozen_string_literal: true

require 'spec_helper'

RSpec.describe AcmeVidgetCo::ProductCatalog do
  let(:products) do
    {
      'R01' => { name: 'Red Widget', price: 32.95 },
      'G01' => { name: 'Green Widget', price: 24.95 }
    }
  end

  let(:catalog) { described_class.new(products) }

  describe '#product' do
    it 'returns the product hash for a valid code' do
      expect(catalog.product('R01')).to eq(products['R01'])
    end

    it 'returns nil for an unknown code' do
      expect(catalog.product('B01')).to be_nil
    end
  end

  describe '#price' do
    it 'returns the price for a valid code' do
      expect(catalog.price('G01')).to eq(products['G01'].fetch(:price))
      expect(catalog.price('G01')).to be_a(BigDecimal)
    end

    it 'raises NoMethodError for an unknown code' do
      expect { catalog.price('B01') }.to raise_error(NoMethodError)
    end
  end

  describe '#name' do
    it 'returns the name for a valid code' do
      expect(catalog.name('R01')).to eq(products['R01'].fetch(:name))
    end

    it 'raises NoMethodError for an unknown code' do
      expect { catalog.name('B01') }.to raise_error(NoMethodError)
    end
  end
end
