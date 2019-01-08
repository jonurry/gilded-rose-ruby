require_relative 'generic_item'

# Sulfuras
class Sulfuras < GenericItem
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality; end

  def update_sell_in; end
end
