# frozen_string_literal: true

module AcmeVidgetCo
  class ProductCatalog

    def initialize(products)
      @products = products
    end

    def product(code)
      @products[code]
    end

    def price(code)
      product(code)[:price].to_d
    end

    def name(code)
      product(code)[:name]
    end
  end
end
