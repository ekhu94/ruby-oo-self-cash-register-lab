require 'pry'

class CashRegister
    attr_accessor :total, :discount, :items, :prices

    def initialize(discount=0)
        @total = 0
        @discount = discount
        @items = []
        @prices = []
    end

    def add_item(title, price, qty=1)
        self.total += price * qty
        qty.times { @items << title }
        qty.times { @prices << price }
    end

    def apply_discount
        if self.discount != 0
            self.total -= self.total * self.discount / 100
            "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        # print "total: #{self.total}, items: #{self.items}, prices: #{self.prices}"
        # puts
        if @items.length == 0
            self.total = 0.0
        else
            while @items[-1] == @items[-2]
                self.total -= @prices.pop
                @items.pop
            end
            self.total -= @prices.pop
            @items.pop
        end
    end
end

new_register = CashRegister.new(20)
new_register.add_item("eggs", 1.99)
new_register.add_item("tomato", 1.76, 3)
new_register.void_last_transaction
new_register.void_last_transaction
