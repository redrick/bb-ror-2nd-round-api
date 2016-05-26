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

describe Invoice, type: :model do
  it { should belong_to :client }
  it { should belong_to :category }

  describe 'vat_only' do
    let(:invoice) { create(:invoice) }

    it 'should calculate only vat amount' do
      vat_only = invoice.price / 100 * invoice.vat_rate
      expect(invoice.send(:vat_only)).to eql(vat_only)
    end
  end

  describe 'price_with_vat' do
    let(:invoice) { create(:invoice) }

    it 'should calculate price with vat' do
      price_with_vat = (invoice.price + invoice.price / 100 * invoice.vat_rate).round(2)
      expect(invoice.price_with_vat).to eql(price_with_vat)
    end
  end
end
