class Basket

  def initialize(promotional_rules = nil, products = nil)
    @promotional_rules = promotional_rules
    self.product_prices = products
  end

  def total(order)
    sum_without_discounts(order)
  end

  def product_prices=(value)
    @product_prices = value ? products_with_prices(value) : []
  end

  private

  attr_reader :product_prices, :promotional_rules

  def sum_without_discounts(order)
    order.reduce(0) do |sum, (item, num)|
      sum += cost_for(item, num)
    end
  end

  def cost_for(item, num)
    product_prices[item] * num
  end

  def products_with_prices(products)
    products.map { |product| [product.code, product.price] }.to_h
  end
end