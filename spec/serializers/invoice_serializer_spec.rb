describe InvoiceSerializer do
  let(:invoice) { create(:invoice) }

  it 'returns correct format' do
    client_hash = JSON.parse ActiveModelSerializers::SerializableResource.new(invoice).to_json
    expect(client_hash['invoice']).not_to be_empty
    expect(client_hash['invoice']['id']).to eq(invoice.id)
    expect(client_hash['invoice']['invoice_number']).to eq(invoice.number)
    expect(client_hash['invoice']['price_with_vat']).to eq(invoice.price_with_vat)
    expect(client_hash['invoice']['price']).to eq(invoice.price)
    expect(client_hash['invoice']['vat_rate']).to eq(invoice.vat_rate)
    expect(client_hash['invoice']['issued_at']).to eq(invoice.issued_at.to_datetime.to_s)

    expect(client_hash['invoice']['client']).not_to be_empty
    expect(client_hash['invoice']['category']).not_to be_empty
  end
end
