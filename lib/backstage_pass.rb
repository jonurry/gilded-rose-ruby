require_relative 'generic_item'

# BackstagePass
class BackstagePass < GenericItem
  def initialize(name, sell_in, quality)
    super(name, sell_in, quality)
    @daily_quality_increment = 1
  end
end
