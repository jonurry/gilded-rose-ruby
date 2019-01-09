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
    @items.each(&:update)
  end
end
