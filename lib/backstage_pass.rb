require_relative 'generic_item'

# BackstagePass
class BackstagePass < GenericItem
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality
    @daily_quality_increment = calculate_quality_increment
    @quality += @daily_quality_increment
    @quality = 0 if @quality < 0
    @quality = 50 if @quality > 50
  end

  private

  def calculate_quality_increment
    return 1 if @sell_in > 10
    return 2 if @sell_in > 5
    return -@quality if @sell_in <= 0

    3
  end
end
