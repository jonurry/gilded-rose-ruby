require_relative 'item'

# GenericItem
class GenericItem < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
    @daily_quality_increment = -1
    @daily_sell_in_increment = -1
  end

  def update
    update_quality
    update_sell_in
  end

  def update_quality
    @quality += @daily_quality_increment
    @quality = 0 if @quality < 0
  end

  def update_sell_in
    @sell_in += @daily_sell_in_increment
  end
end
