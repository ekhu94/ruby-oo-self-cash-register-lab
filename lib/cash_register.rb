class CashRegister
    attr_accessor :total, :discount

    def initialize(total, discount = 0)
        @total, @discount = total, discount
    end
end
