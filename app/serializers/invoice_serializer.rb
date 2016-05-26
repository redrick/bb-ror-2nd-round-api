class InvoiceSerializer < ActiveModel::Serializer
  attribute :id
  attribute :number, key: :invoice_number
  attributes :price_with_vat, :price, :vat_rate, :issued_at

  belongs_to :client
  belongs_to :category
end
