# spec/basket_integration_spec.rb

require 'spec_helper'

RSpec.describe AcmeVidgetCo::Basket do
  let(:products) do
    {
      'R01' => { name: 'Red Widget', price: 32.95 },
      'G01' => { name: 'Green Widget', price: 24.95 },
      'B01' => { name: 'Blue Widget', price: 7.95 }
    }
  end

  let(:product_catalog) { AcmeVidgetCo::ProductCatalog.new(products) }

  let(:delivery_rules) do
    AcmeVidgetCo::DeliveryRules
  end

  let(:delivery_calculator) { AcmeVidgetCo::DeliveryCalculator.new(delivery_rules) }

  let(:offers) { [AcmeVidgetCo::Offers::RedWidgetSecondHalfPriceOffer.new] }

  [
    { codes: %w[B01 G01], total: '$37.85' },
    { codes: %w[R01 R01], total: '$54.37' },
    { codes: %w[R01 G01], total: '$60.85' },
    { codes: %w[B01 B01 R01 R01 R01], total: '$98.27' }
  ].each do |test_case|
    it "returns #{test_case[:total]} for products #{test_case[:codes].join(', ')}" do
      basket = described_class.new(product_catalog, delivery_calculator, offers)
      test_case[:codes].each { |code| basket.add(code) }
      expect(basket.total).to eq(test_case[:total])
    end
  end
end
