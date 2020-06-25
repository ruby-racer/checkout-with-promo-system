require_relative 'basket'

class Checkout
  def initialize(promotional_rules = nil)
    @products = []
    @basket = Basket.new(promotional_rules)
    @order = Hash.new(0)
  end

  def scan(item)
    @products << item unless item_in_products?(item.code)

    @order[item.code] += 1
  end

  def total
    '£%.2f' % order_cost
  end

  private

  attr_reader :products, :basket, :order

  def order_cost
    basket.product_prices = products
    basket.total(order)
  end

  def item_in_products?(item_code)
    products.any? { |product| product.code == item_code }
  end

end
