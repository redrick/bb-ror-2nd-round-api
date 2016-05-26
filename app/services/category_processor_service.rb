class CategoryProcessorService < BaseProcessorService
  Summary = Struct.new(:date, :category, :price_with_vat, :price)

  def process
    grouped = []
    grouped_invoices.each do |group|
      date = group.first.to_date.to_s
      grouped_by_category = group.last.group_by(&:category_id)
      grouped_by_category.each do |category_group|
        invoice_records = category_group.last
        category = invoice_records.sample.category
        price_sum = invoice_records.map(&:price).inject(0, &:+).round(2)
        price_vat_sum = invoice_records.map(&:price_with_vat).inject(0, &:+).round(2)
        grouped << Summary.new(date, category, price_vat_sum, price_sum)
      end
    end
    grouped
  end
end
