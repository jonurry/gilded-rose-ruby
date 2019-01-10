require_relative '../lib/item.rb'
require_relative '../lib/sulfuras.rb'
require_relative '../lib/gilded_rose'

describe Sulfuras do
  describe '#update' do
    it 'quality initialized to 80' do
      items = [
        Item.new('Sulfuras, Hand of Ragnaros', 5, 40)
            .extend(Sulfuras)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end

    it 'quality never changes' do
      items = [
        Item.new('Sulfuras, Hand of Ragnaros', 5, 80)
            .extend(Sulfuras)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end

    it 'never has to be sold' do
      items = [
        Item.new('Sulfuras, Hand of Ragnaros', 5, 80)
            .extend(Sulfuras)
      ]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 5
    end
  end
end
