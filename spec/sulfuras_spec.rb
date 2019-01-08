require_relative '../lib/sulfuras'

describe Sulfuras do
  describe '#update' do
    it 'quality never changes' do
      items = [Sulfuras.new('Sulfuras, Hand of Ragnaros', 5, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 80
    end

    it 'never has to be sold' do
      items = [Sulfuras.new('Sulfuras, Hand of Ragnaros', 5, 80)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 5
    end
  end
end
