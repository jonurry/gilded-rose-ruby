require_relative 'item.rb'
require_relative 'generic_item.rb'
require_relative 'aged_brie.rb'
require_relative 'sulfuras.rb'
require_relative 'backstage_pass.rb'

# GildedRose
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name != 'Aged Brie' && item.name != 'Backstage passes to a TAFKAL80ETC concert'
        item.update_quality
      else
        if item.quality < 50
          item.update_quality
          if item.name == 'Backstage passes to a TAFKAL80ETC concert'
            if item.sell_in < 11
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
            if item.sell_in < 6
              if item.quality < 50
                item.quality = item.quality + 1
              end
            end
          end
        end
      end
      if item.name != 'Sulfuras, Hand of Ragnaros'
        item.update_sell_in
      end
      if item.sell_in < 0
        if item.name != 'Aged Brie'
          if item.name != 'Backstage passes to a TAFKAL80ETC concert'
            if item.quality > 0
              if item.name != 'Sulfuras, Hand of Ragnaros'
                item.update_quality
              end
            end
          else
            item.quality = item.quality - item.quality
          end
        else
          if item.quality < 50
            item.update_quality
          end
        end
      end
    end
  end
end
