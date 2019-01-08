require_relative '../lib/gilded_rose'

describe GildedRose do
  describe '#update_quality' do
    context 'Generic Item' do
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

    context 'Sulfuras, Hand of Ragnaros' do
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

    context 'Backstage passes to a TAFKAL80ETC concert' do
      it 'quality cannot exceed 50' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 2, 50)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 50
      end

      it 'increases in quality by 1 when concert further than 10 days away' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 11, 0)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 1
      end

      it 'increases in quality by 2 when sell_in between 6 and 10 days inclusive' do
        items = [
          Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 10),
          Item.new('Backstage passes to a TAFKAL80ETC concert', 6, 10)
        ]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 12
        expect(items[1].quality).to eq 12
      end

      it 'increases in quality by 3 when sell_in between 0 and 5 days inclusive' do
        items = [
          Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 10),
          Item.new('Backstage passes to a TAFKAL80ETC concert', 1, 10)
        ]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 13
        expect(items[1].quality).to eq 13
      end

      it 'quality drops to zero after concert' do
        items = [Item.new('Backstage passes to a TAFKAL80ETC concert', 0, 10)]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end
  end
end
