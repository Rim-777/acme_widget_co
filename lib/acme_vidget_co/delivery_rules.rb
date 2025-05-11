module AcmeVidgetCo
  module DeliveryRules
    extend self

    RULES = [
      { threshold: 50.0, cost: 4.95 },
      { threshold: 90.0, cost: 2.95 }
    ].freeze

    def rules
      RULES
    end
  end
end
