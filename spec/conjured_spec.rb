require_relative '../lib/item.rb'
require_relative '../lib/conjured.rb'
require_relative '../lib/gilded_rose'

describe Conjured do
  describe '#update' do
    context 'in date' do
      it 'quality reduces by 2' do
        items = [
          Item.new('Conjured Mana Cake', 2, 2)
              .extend(Conjured)
        ]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 0
      end
    end

    context 'past sell_in date' do
      it 'quality reduces by 2' do
        items = [
          Item.new('Conjured Mana Cake', 0, 5)
              .extend(Conjured)
        ]
        GildedRose.new(items).update_quality
        expect(items[0].quality).to eq 3
      end
    end
  end
end
