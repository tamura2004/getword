Rails.application.routes.draw do
  root "names#index"
  resources :names do
    collection do
      get "sheet"
    end
  end

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
