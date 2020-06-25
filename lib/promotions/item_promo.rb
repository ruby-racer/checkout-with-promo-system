class ItemPromo
  def initialize(item_code:, count_of_items:, discount_price:)
    @item_code = item_code
    @count_of_items = count_of_items
    @discount_price = discount_price
  end

  def apply(current_total, order)
    should_discount_be_applied?(order) ? apply_discount(order) : 0
  end

  private

  attr_reader :item_code, :count_of_items, :discount_price

  def should_discount_be_applied?(order)
    order[item_code] >= count_of_items
  end

  def apply_discount(order)
    (order[item_code] / count_of_items) * discount_price
  end
end