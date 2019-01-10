require_relative '../lib/generic_item.rb'

# Conjured
module Conjured
  include GenericItem

  CONJURED_DAILY_QUALITY_INCREMENT = -2

  def update_quality
    super(CONJURED_DAILY_QUALITY_INCREMENT)
  end
end
