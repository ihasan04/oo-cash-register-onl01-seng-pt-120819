class CashRegister
    attr_accessor :total, :discount, :items, :last_price

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(item, price, quantity = 1)
        self.total += price * quantity
        quantity.times { items << item }
        self.last_price = price * quantity
    end

    # def add_item(item, price, quantity = 1)
    #     @last_price = price
    #     @total += price * quantity

    #     if quantity > 1
    #         i = 0
    #         while i < quantity
    #             @items << item
    #             i += 1
    #         end
    #     else
    #         @items << item
    #     end
    # end

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
        self.total -= self.last_price
    end
    
end