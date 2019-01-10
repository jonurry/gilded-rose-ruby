require_relative 'generic_item'

AGED_BRIE_DAILY_QUALITY_INCREMENT = 1

# AgedBrie
class AgedBrie < GenericItem
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality
    super(AGED_BRIE_DAILY_QUALITY_INCREMENT)
  end
end
