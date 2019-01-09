require_relative 'item'

IN_DATE_QUALITY_INCREMENT = -1
OUT_OF_DATE_QUALITY_INCREMENT = -2
SELL_IN_INCREMENT = -1

# GenericItem
class GenericItem < Item
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
    @daily_quality_increment = IN_DATE_QUALITY_INCREMENT
    @daily_sell_in_increment = SELL_IN_INCREMENT
  end

  def update
    update_quality
    update_sell_in
  end

  def update_quality
    @daily_quality_increment = OUT_OF_DATE_QUALITY_INCREMENT if sell_by_date_passed?
    @quality += @daily_quality_increment
    @quality = 0 if @quality < 0
    @quality = 50 if @quality > 50
  end

  def update_sell_in
    @sell_in += @daily_sell_in_increment
  end

  private

  def sell_by_date_passed?
    @sell_in <= 0
  end

end
