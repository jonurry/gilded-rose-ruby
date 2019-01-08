require_relative 'item'

# GenericItem
class GenericItem < Item
  DAILY_QUALITY_INCREMENT = -1
  DAILY_SELL_IN_INCREMENT = -1

  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update
    update_quality
    update_sell_in
  end

  def update_quality
    @quality += DAILY_QUALITY_INCREMENT
  end

  def update_sell_in
    @sell_in += DAILY_SELL_IN_INCREMENT
  end
end
