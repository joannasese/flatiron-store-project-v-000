class Cart < ActiveRecord::Base
  has_many :line_items
  has_many :items, through: :line_items
  belongs_to :user

 def total
    total = 0
    self.line_items.each do |li|
        total += li.item.price * li.quantity
    end
    total
  end

 def add_item(item_id)
    line_item = self.line_items.find_by(item_id: item_id)
    if line_item
      line_item.quantity += 1
    else
      line_item = self.line_items.build(item_id: item_id)
    end
    line_item
  end

 def checkout
   self.update(status: "submitted")
   self.update_inventory
   self.user.current_cart_id = nil
   self.user.save
   self.save
 end

def update_inventory
  self.line_items.each do |i|
    i.item.inventory -= i.quantity
    i.item.save
   end
 end

end