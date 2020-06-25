require './lib/checkout.rb'
require './lib/item.rb'
require './lib/promotions/item_promo.rb'
require './lib/promotions/basket_promo.rb'

# instantiate the items you want to checkout
item1 = Item.new "001", "A", 30
item2 = Item.new "002", "B", 20
item3 = Item.new "003", "C", 50
item4 = Item.new "004", "D", 15

# create promotion rules
promotional_rules = [
  ItemPromo.new(item_code: item1.code, count_of_items: 3, discount_price: 15),
  ItemPromo.new(item_code: item2.code, count_of_items: 2, discount_price: 5),
  BasketPromo.new(min_price: 150, discount_price: 20),
]

# initialize checkout with promotion rules
co = Checkout.new(promotional_rules)

# scan items which you wand to add a basket
co.scan(item3) # C
co.scan(item2) # B
co.scan(item1) # A
co.scan(item1) # A
co.scan(item4) # D
co.scan(item1) # A
co.scan(item2) # B

# get total price
price = co.total
puts price
