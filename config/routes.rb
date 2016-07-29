Rails.application.routes.draw do

  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resources :users, only: %i() do
        collection do
          get 'listing_history'
        end
      end
      resource :oauth, only: %i(create)
      resources :search, only: %i() do
        collection do
          get 'by_listing'
          get 'by_text'
        end
      end
      resources :listings, only: %i(create show destroy update)
    end
  end

  get "*path" => "application#index"
  root to: "admin/users#index"
end
