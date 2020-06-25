require_relative '../../lib/promotions/item_promo'

RSpec.describe ItemPromo do
  subject(:item_promo) { described_class.new(item_code: '001', count_of_items: 2, discount_price: 10) }

  describe '#apply' do
    it 'is expected to apply the promo on orders which contain the number of items' do
      expect(item_promo.apply(5000, { "001" => 2 })).to eq 10
    end

    it 'is expected to apply the promo on orders which contain more than the number of items' do
      expect(item_promo.apply(5000, { "001" => 7 })).to eq 30
    end

    it 'is expected to apply no discount on orders which contain less than the number of items' do
      expect(item_promo.apply(1000, { "001" => 1 })).to eq 0
    end
  end
end
