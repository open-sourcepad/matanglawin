Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  namespace :api, defaults: { format: 'json' } do
    scope module: :v1 do
      resource :oauth, only: %i(create)
      resources :posts
      resources :listings, only: [] do
        collection do
          get 'lost'
          get 'found'
          get 'notifications'
        end
      end
    end
  end

  get "*path" => "application#index"
  root to: "admin/users#index"
end
