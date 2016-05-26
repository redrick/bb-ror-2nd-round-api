module Api
  module V1
    describe InvoicesController do

      before :all do
        20.times { create(:invoice) }
      end

      after :all do
        Invoice.destroy_all
      end

      describe 'GET #index' do
        it 'returns http success' do
          get :index, format: :json
          expect(response).to be_success
        end

        it 'returns invoices' do
          get :index, format: :json
          expect(JSON.parse(response.body)['invoices'].count).to eq(20)
        end
      end
    end
  end
end
