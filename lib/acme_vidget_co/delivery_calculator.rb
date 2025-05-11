# frozen_string_literal: true

module AcmeVidgetCo
  class DeliveryCalculator

    def initialize(rule_module)
      @rules = rule_module.rules.sort_by { |rule| rule[:threshold] }
    end

    def cost(amount)
      found_rule = @rules.find { |rule| amount < rule[:threshold] }
      found_rule ? found_rule[:cost].to_d : 0.0
    end
  end
end
