require_relative '../lib/item.rb'
require_relative '../lib/backstage_pass.rb'
require_relative '../lib/gilded_rose'

describe BackstagePass do
  describe '#update' do
    it 'quality cannot exceed 50' do
      items = [
        Item.new('Backstage passes to a TAFKAL80ETC concert', 2, 50)
            .extend(BackstagePass)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 50
    end

    it 'quality increases by 1 when concert further than 10 days away' do
      items = [
        Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0)
            .extend(BackstagePass)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 1
    end

    it 'quality increases by 2 when sell_in between 6 and 10 days inclusive' do
      items = [
        Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10)
            .extend(BackstagePass),
        Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 10)
            .extend(BackstagePass)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 12
      expect(items[1].quality).to eq 12
    end

    it 'quality increases by 3 when sell_in between 0 and 5 days inclusive' do
      items = [
        Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10)
            .extend(BackstagePass),
        Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 10)
            .extend(BackstagePass)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 13
      expect(items[1].quality).to eq 13
    end

    it 'quality drops to zero after concert' do
      items = [
        Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)
            .extend(BackstagePass)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end
  end
end
