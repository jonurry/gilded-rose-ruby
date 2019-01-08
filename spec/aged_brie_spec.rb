require_relative '../lib/aged_brie'

describe AgedBrie do
  describe '#update' do
    context 'Aged Brie' do
      it 'quality increases as it gets older' do
        items = [AgedBrie.new('Aged Brie', 5, 5)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 6
      end

      it 'quality cannot exceed 50' do
        items = [AgedBrie.new('Aged Brie', 2, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end
    end
  end
end
