require_relative '../lib/generic_item.rb'

# AgedBrie
module AgedBrie
  include GenericItem

  AGED_BRIE_DAILY_QUALITY_INCREMENT = 1

  def update_quality
    super(AGED_BRIE_DAILY_QUALITY_INCREMENT)
  end
end
