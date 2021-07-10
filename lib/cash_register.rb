class CashRegister
    attr_reader :discount
    attr_accessor :total, :added_items, :last_transaction_price
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @added_items = []
    end

    def add_item(title,price,quantity=1)
        quantity.times {self.added_items << title}
        self.last_transaction_price = quantity * price

        self.total += price * quantity
        
    end

    def apply_discount
        self.total *= (100.0 - discount) /100.0
        self.discount == 0 ? "There is no discount to apply." : 
        "After the discount, the total comes to $#{self.total.to_i}."
    end

    def items
        self.added_items
    end
    def void_last_transaction
        self.total -= self.last_transaction_price
    end
end
