require_relative 'generic_item'

# Sulfuras
class Sulfuras < GenericItem
  DAILY_QUALITY_INCREMENT = 0
  DAILY_SELL_IN_INCREMENT = 0

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end
end
