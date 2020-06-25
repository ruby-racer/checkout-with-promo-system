require_relative '../lib/basket'

RSpec.describe Basket do
  let(:item_001) { Item.new('001', 'name-product', 80) }
  let(:item_002) { Item.new('002', 'name-product', 50) }
  let(:products) { [item_001, item_002] }
  let(:item_promo) { ItemPromo.new(item_code: item_001.code, count_of_items: 2, discount_price: 10) }
  let(:basket_promo) { BasketPromo.new(min_price: 150, discount_price: 20) }
  let(:promotional_rules) { [item_promo, basket_promo] }
  subject(:basket) { described_class.new(promotional_rules, products) }

  describe '#total' do
    it 'is expected to calculate basket without any promo' do
      order = { "001" => 1, "002" => 1 }
      expect(basket.total(order)).to eq 130
    end

    it 'is expected to be able to apply a given promotions' do
      order = { "001" => 2, "002" => 1 }
      expect(basket.total(order)).to eq 180
    end
  end
end
