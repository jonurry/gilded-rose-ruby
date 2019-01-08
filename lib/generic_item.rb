require_relative 'item'

# GenericItem
class GenericItem < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update
    update_quality
    update_sell_in
  end

  def update_quality
    @quality -= 1
  end

  def update_sell_in
    @sell_in -= 1
  end
end
