require_relative 'generic_item'

# Sulfuras
class Sulfuras < GenericItem
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
    @daily_quality_increment = 0
    @daily_sell_in_increment = 0
  end
end
