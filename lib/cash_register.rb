class CashRegister

    attr_accessor :total, :discount, :items, :last_item_price, :last_item_quantity

    # initialize => a class method
    def initialize (discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item (title, price, quantity = 1)
        self.total = self.total + (price * quantity)
        self.last_item_price = quantity * price
        self.last_item_quantity = quantity
        for i in 1..quantity do 
            self.items << title
        end
    end

    def apply_discount
        if self.discount == 0
            return "There is no discount to apply."
        else
            float_discount = self.discount.to_f
            float_total = self.total.to_f
            new_price = float_total - ((float_discount/100) * float_total)
            self.total = new_price
            return "After the discount, the total comes to $#{self.total.to_i}."
        end
    end

    def void_last_transaction
        self.items.pop(self.last_item_quantity)
        self.total = self.total - self.last_item_price
    end
end