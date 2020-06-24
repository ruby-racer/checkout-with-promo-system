require_relative '../lib/item'

RSpec.describe Item do
  before do
    @item = Item.new('code-product', 'name-product', 99.99)
  end

  it { expect(@item.code).to eq('code-product') }
  it { expect(@item.name).to eq('name-product') }
  it { expect(@item.price).to eq(99.99) }
end
