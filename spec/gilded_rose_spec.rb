require_relative '../gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    context 'generic item' do
      it 'does not change the name' do
        items = [Item.new('foo', 0, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].name).to eq 'foo'
      end

      it 'quality cannot be negative' do
        items = [Item.new('foo', 2, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end

      it 'quality cannot exceed 50' do
        items = [Item.new('Aged Brie', 2, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      context 'in date' do
        it 'quality reduces by 1' do
          items = [Item.new('foo', 2, 2)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 1
        end

        it 'sell_in reduces by 1' do
          items = [Item.new('foo', 2, 2)]
          GildedRose.new(items).update_quality
          expect(items[0].sell_in).to eq 1
        end
      end

      context 'past sell_in date' do
        it 'quality reduces by 2' do
          items = [Item.new('foo', 0, 5)]
          GildedRose.new(items).update_quality
          expect(items[0].quality).to eq 3
        end
      end
    end

    context 'aged brie' do
      it 'quality increases as it gets older' do
        items = [Item.new('Aged Brie', 5, 5)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 6
      end
    end
  end
end
