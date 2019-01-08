require_relative '../lib/gilded_rose'

describe GenericItem do
  describe '#update' do
    it 'does not change the name' do
      items = [GenericItem.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    it 'quality cannot be negative' do
      items = [GenericItem.new('foo', 2, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].quality).to eq 0
    end

    it 'sell_in reduces by 1' do
      items = [GenericItem.new('foo', 2, 2)]
      GildedRose.new(items).update_quality
      expect(items[0].sell_in).to eq 1
    end

    context 'in date' do
      it 'quality reduces by 1' do
        items = [GenericItem.new('foo', 2, 2)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 1
      end
    end

    context 'past sell_in date' do
      it 'quality reduces by 2' do
        items = [GenericItem.new('foo', 0, 5)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 3
      end
    end
  end
end
