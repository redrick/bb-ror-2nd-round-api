class MonthProcessorService < BaseProcessorService
  Summary = Struct.new(:date, :price_with_vat, :price)

  def process
    grouped = []
    grouped_invoices.each do |group|
      date = group.first.to_date.to_s
      price_sum = group.last.map(&:price).inject(0, &:+).round(2)
      price_vat_sum = group.last.map(&:price_with_vat).inject(0, &:+).round(2)
      grouped << Summary.new(date, price_vat_sum, price_sum)
    end
    grouped
  end
end
