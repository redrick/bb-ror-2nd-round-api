# == Schema Information
#
# Table name: invoices
#
#  id          :integer          not null, primary key
#  number      :string
#  price       :float
#  vat_rate    :integer
#  issued_at   :datetime
#  client_id   :integer
#  category_id :integer
#

class InvoiceSerializer < ActiveModel::Serializer
  attribute :id
  attribute :number, key: :invoice_number
  attributes :price_with_vat, :price, :vat_rate
  attribute :issued_at_formatted, key: :issued_at

  belongs_to :client
  belongs_to :category

  def issued_at_formatted
    object.issued_at.to_datetime.to_s
  end
end
