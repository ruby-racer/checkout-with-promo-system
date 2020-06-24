class Checkout
  def initialize(promotional_rules = nil)
    @products = []
    @order = Hash.new(0)
  end

  def scan(item)
    @products << item unless item_in_products?(item.code)

    @order[item.code] += 1
  end

  private

  attr_reader :products

  def item_in_products?(item_code)
    products.map{ |product| product.code }.include?(item_code)
  end

end
