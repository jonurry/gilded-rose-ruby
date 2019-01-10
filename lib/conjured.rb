require_relative '../lib/generic_item.rb'

CONJURED_DAILY_QUALITY_INCREMENT = -2

# Conjured
module Conjured
  include GenericItem

  def update_quality
    super(CONJURED_DAILY_QUALITY_INCREMENT)
  end
end
