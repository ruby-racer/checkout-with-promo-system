require_relative '../lib/checkout'

RSpec.describe Checkout do
  let(:item) { Item.new('code-product', 'name-product', 99.99) }
  subject(:checkout) { described_class.new() }

  describe '#scan' do
    it 'should add only one uniq item to products' do
      checkout.scan(item)
      checkout.scan(item)
      expect(checkout.send(:products)).to eq [item]
    end
  end

end