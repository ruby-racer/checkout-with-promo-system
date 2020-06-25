require_relative '../lib/basket'

RSpec.describe Basket do
  let(:item_001) { Item.new('001', 'name-product', 120) }
  let(:item_002) { Item.new('002', 'name-product', 50) }
  let(:products) { [item_001, item_002] }
  subject(:basket) { described_class.new(nil, products) }

  describe '#total' do
    it 'is expected to calculate basket without any promo' do
      order = { "001" => 1, "002" => 2 }
      expect(basket.total(order)).to eq 220
    end
  end
end
