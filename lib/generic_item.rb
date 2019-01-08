require_relative 'item'

# GenericItem
class GenericItem < Item
  def initialize(name, sell_in, quality)
    @daily_quality_increment = -1
    @daily_sell_in_increment = -1
    super(name, sell_in, quality)
  end

  def update
    update_quality
    update_sell_in
  end

  def update_quality
    @quality += @daily_quality_increment
  end

  def update_sell_in
    @sell_in += @daily_sell_in_increment
  end
end
