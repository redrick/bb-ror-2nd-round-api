describe ClientSerializer do
  let(:client) { create(:client) }

  it 'returns correct format' do
    client_hash = JSON.parse ActiveModelSerializers::SerializableResource.new(client).to_json
    expect(client_hash['client']).not_to be_empty
    expect(client_hash['client']['id']).to eq(client.id)
    expect(client_hash['client']['name']).to eq(client.name)
  end
end
