Rails.application.routes.draw do
  namespace :api do
    namespace :v1, defaults: { format: :json } do
      resources :hello_world, only: [:index]
      resources :invoices, only: [:index]
      resource :summary, only: [] do
        get :months, :categories
      end
    end
  end
end
