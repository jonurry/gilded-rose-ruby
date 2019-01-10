require_relative '../lib/item.rb'
require_relative '../lib/aged_brie.rb'
require_relative '../lib/gilded_rose'

describe AgedBrie do
  describe '#update' do
    it 'quality increases as it gets older' do
      items = [
        Item.new('Aged Brie', 5, 5)
            .extend(AgedBrie)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 6
    end

    it 'quality increases after sell_in date passes' do
      items = [
        Item.new('Aged Brie', -2, 5)
            .extend(AgedBrie)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 6
    end

    it 'quality cannot exceed 50' do
      items = [
        Item.new('Aged Brie', 2, 50)
            .extend(AgedBrie)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end
  end
end
