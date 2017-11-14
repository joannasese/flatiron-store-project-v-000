class Cart < ActiveRecord::Base
    has_many :line_items
    has_many :items, through: :line_items
    belongs_to :user

    def total
        sum = 0
        self.line_items.each do |li|
            sum += (li.item.price * li.quantity)
        end
        sum
    end

    def add_item(item_id)
        new_li = self.line_items.find_by(id: item_id)
        if new_li
            new_li.quantity += 1
        else
            new_li = self.line_items.build(item_id: item_id)
        end
        new_li
    end
end
