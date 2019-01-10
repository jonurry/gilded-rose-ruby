# GenericItem
module GenericItem
  IN_DATE_QUALITY_INCREMENT = -1
  OUT_OF_DATE_QUALITY_INCREMENT = -2
  SELL_IN_INCREMENT = -1

  def update
    update_quality
    update_sell_in
  end

  def update_quality(increment = nil)
    @quality += increment || calculate_quality_increment
    @quality = 0 if @quality < 0
    @quality = 50 if @quality > 50
  end

  def update_sell_in
    @sell_in += SELL_IN_INCREMENT
  end

  private

  def calculate_quality_increment
    return OUT_OF_DATE_QUALITY_INCREMENT if sell_by_date_passed?

    IN_DATE_QUALITY_INCREMENT
  end

  def sell_by_date_passed?
    @sell_in <= 0
  end
end
