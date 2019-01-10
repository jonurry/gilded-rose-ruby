require_relative '../lib/generic_item.rb'

AGED_BRIE_DAILY_QUALITY_INCREMENT = 1

# AgedBrie
module AgedBrie
  include GenericItem

  def update_quality
    super(AGED_BRIE_DAILY_QUALITY_INCREMENT)
  end
end
