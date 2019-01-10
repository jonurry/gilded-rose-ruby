require_relative 'generic_item'

CONJURED_DAILY_QUALITY_INCREMENT = -2

# Conjured
class Conjured < GenericItem
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality
    super(CONJURED_DAILY_QUALITY_INCREMENT)
  end
end
