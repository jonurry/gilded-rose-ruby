require_relative 'generic_item'

# BackstagePass
class BackstagePass < GenericItem
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
  end

  def update_quality
    super(calculate_quality_increment)
  end

  private

  def calculate_quality_increment
    return 1 if @sell_in > 10
    return 2 if @sell_in > 5
    return -@quality if @sell_in <= 0

    3
  end
end
