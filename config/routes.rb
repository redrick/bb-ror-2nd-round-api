Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :hello_world, only: [:index], defaults: { format: :json }
      resources :invoices, only: [:index], defaults: { format: :json }
      resource :summary, only: [], defaults: { format: :json } do
        get :months, :categories
      end
    end
  end
end
