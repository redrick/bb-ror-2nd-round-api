Rails.application.routes.draw do
  namespace :api do
    api_version(module: 'v1', path: { value: 'v1' }, default: true) do
      resources :hello_world, only: [:index], defaults: { format: :json }
    end
  end
end
