class BaseProcessorService
  attr_accessor :grouped_invoices

  def initialize
    @grouped_invoices ||= Invoice.all.group_by { |m| m.issued_at.beginning_of_month }
  end
end
