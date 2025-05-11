# frozen_string_literal: true

module AcmeVidgetCo
  class Basket

    def initialize(product_catalog, delivery_calculator, offers = [])
      @product_catalog = product_catalog
      @delivery_calculator = delivery_calculator
      @offers = offers
      @product_codes = []
    end

    def add(product_code)
      return unless @product_catalog.product(product_code)

      @product_codes << product_code
    end

    def total
      cost_with_discount = subtotal - discount
      delivery_cost = @delivery_calculator.cost(cost_with_discount)

      format("$%.2f", (cost_with_discount + delivery_cost))
    end

    private

    def subtotal
      @product_codes.map { |code| @product_catalog.price(code) }.sum
    end

    def discount
      @offers.sum { |offer| offer.discount(@product_codes, @product_catalog) }
    end
  end
end
