class CashRegister
    attr_accessor :total, :discount, :items, :last_price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        self.total += price * quantity
        quantity.times { self.items << item }
        self.last_price = [item, price, quantity]
    end

    def apply_discount
        if @discount > 0
            @discount = @discount/100.to_f
            @total = @total - (@total * @discount)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.last_price[1] * self.last_price[2]
        self.last_price[2].times do
        self.items.delete_at(self.items.index(self.last_price[0]) || self.items.count)
        end
    end
    
end