require_relative './lib/item'
require_relative './lib/generic_item'
require_relative './lib/aged_brie'
require_relative './lib/backstage_pass'
require_relative './lib/conjured'
require_relative './lib/sulfuras'
require_relative './lib/gilded_rose'

items = [
  # name, sell_in, quality
  Item.new('+5 Dexterity Vest', 10, 20).extend(GenericItem),
  Item.new('Aged Brie', 2, 0).extend(AgedBrie),
  Item.new('Elixir of the Mongoose', 5, 7).extend(GenericItem),
  Item.new('Sulfuras, Hand of Ragnaros', 0, 80).extend(Sulfuras),
  Item.new('Sulfuras, Hand of Ragnaros', -1, 80).extend(Sulfuras),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 15, 20)
      .extend(BackstagePass),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 10, 49)
      .extend(BackstagePass),
  Item.new('Backstage passes to a TAFKAL80ETC concert', 5, 49)
      .extend(BackstagePass),
  # This Conjured item does not work properly yet
  Item.new('Conjured Mana Cake', 3, 6).extend(Conjured), # <-- :O
]

days = 2
days = ARGV[0].to_i + 1 unless ARGV.empty?

gilded_rose = GildedRose.new items
(0...days).each do |day|
  puts "-------- day #{day} --------"
  puts 'name, sellIn, quality'
  items.each do |item|
    puts item
  end
  puts ''
  gilded_rose.update_quality
end
