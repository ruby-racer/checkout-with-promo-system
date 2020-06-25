require_relative '../lib/checkout'

RSpec.describe Checkout do
  let(:item) { Item.new('001', 'name-product', 50) }
  subject(:checkout) { described_class.new() }

  describe '#scan' do
    it 'should add only one uniq item to products' do
      checkout.scan(item)
      checkout.scan(item)
      expect(checkout.send(:products)).to eq [item]
    end
  end

  describe '#total' do
    it 'is expected to return the total cost' do
      checkout.scan(item)
      checkout.scan(item)

      expect(checkout.total).to eq '£100.00'
    end
  end

end