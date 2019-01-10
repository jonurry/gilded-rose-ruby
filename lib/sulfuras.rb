require_relative '../lib/generic_item.rb'

# Sulfuras
module Sulfuras
  include GenericItem

  QUALITY_IS_ALWAYS_80 = 80

  def update_quality
    @quality = QUALITY_IS_ALWAYS_80
  end

  def update_sell_in; end
end
