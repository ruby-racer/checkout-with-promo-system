require_relative '../../lib/promotions/basket_promo'

RSpec.describe BasketPromo do
  subject(:basket_promo) { described_class.new(min_price: 50, discount_price: 10) }

  describe '#apply' do
    it 'is expected to apply the basket promo on values over the minimum' do
      expect(basket_promo.apply(100, {})).to eq 10
    end

    it 'is expected to apply no basket promo on values below the minimum' do
      expect(basket_promo.apply(40, {})).to eq 0
    end
  end
end
