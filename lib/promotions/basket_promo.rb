class BasketPromo
  def initialize(min_price:, discount_price:)
    @min_price = min_price
    @discount_price = discount_price
  end

  def apply(current_total, order)
    should_discount_be_applied?(current_total) ? @discount_price : 0
  end

  private

  attr_reader :min_price

  def should_discount_be_applied?(current_total)
    min_price <= current_total
  end

end