Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :ebay_request, only: [:index]
    end
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :list, only: [:index, :create]
    end
  end
end
