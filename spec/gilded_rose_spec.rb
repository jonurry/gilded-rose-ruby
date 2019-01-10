require 'gilded_rose'

describe GildedRose do
  it '#update_quality is called and item receives #update' do
    item = spy('item')
    subject = GildedRose.new([item])
    subject.update_quality
    expect(item).to have_received(:update)
  end
end
