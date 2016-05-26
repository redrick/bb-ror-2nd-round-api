class MonthProcessorService
  Summary = Struct.new(:date, :price_with_vat, :price)

  attr_accessor :grouped_invoices

  def initialize
    @grouped_invoices ||= Invoice.all.group_by { |m| m.issued_at.beginning_of_month }
  end

  def process
    groupped = []
    grouped_invoices.each do |group|
      date = group.first.to_date.to_s
      price_sum = group.last.map(&:price).inject(0, &:+).round(2)
      price_vat_sum = group.last.map(&:price_with_vat).inject(0, &:+).round(2)
      groupped << Summary.new(date, price_vat_sum, price_sum)
    end
    groupped
  end
end
