require_relative 'generic_item'

QUALITY_IS_ALWAYS_80 = 80

# Sulfuras
class Sulfuras < GenericItem
  def initialize(name, sell_in, _)
    super(name, sell_in, QUALITY_IS_ALWAYS_80)
  end

  def update_quality; end

  def update_sell_in; end
end
