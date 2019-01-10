require_relative '../lib/generic_item.rb'

# BackstagePass
module BackstagePass
  include GenericItem

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
