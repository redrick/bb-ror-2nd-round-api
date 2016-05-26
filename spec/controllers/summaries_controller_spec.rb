module Api
  module V1
    describe SummariesController do

      before :all do
        20.times { create(:invoice) }
      end

      after :all do
        Invoice.destroy_all
      end

      describe 'GET #months' do
        it 'returns http success' do
          get :months, format: :json
          expect(response).to be_success
        end

        it 'returns summaries' do
          get :months, format: :json
          expect(JSON.parse(response.body)['summary']).not_to be_empty
        end
      end

      describe 'GET #categories' do
        it 'returns http success' do
          get :categories, format: :json
          expect(response).to be_success
        end

        it 'returns summaries' do
          get :categories, format: :json
          expect(JSON.parse(response.body)['summary']).not_to be_empty
        end
      end
    end
  end
end
