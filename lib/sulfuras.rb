require_relative '../lib/generic_item.rb'

QUALITY_IS_ALWAYS_80 = 80

# Sulfuras
module Sulfuras
  include GenericItem

  def update_quality
    @quality = QUALITY_IS_ALWAYS_80
  end

  def update_sell_in; end
end
