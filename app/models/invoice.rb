class Invoice < ActiveRecord::Base
  belongs_to :client
  belongs_to :category

  def price_with_vat
    (price + vat_only).round(2)
  end

  private

  def vat_only
    price / 100 * vat_rate
  end
end
