# frozen_string_literal: true

require_relative 'base_offer'

module AcmeVidgetCo
  module Offers
    class RedWidgetSecondHalfPriceOffer < BaseOffer
      PRODUCT_CODE = 'R01'
      DISCOUNT_QUANTITY = 2

      def discount(product_codes, product_catalog)
        red_count = product_codes.count(PRODUCT_CODE)
        pairs = red_count / DISCOUNT_QUANTITY
        price = product_catalog.price(PRODUCT_CODE)
        half_price = (price / DISCOUNT_QUANTITY)
        (pairs * half_price).round(2)
      end
    end
  end
end
