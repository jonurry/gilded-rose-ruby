require_relative 'generic_item'

# AgedBrie
class AgedBrie < GenericItem
  DAILY_QUALITY_INCREMENT = 1

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end
end
