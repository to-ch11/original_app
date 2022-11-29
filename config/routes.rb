Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        sessions: 'users/sessions'
      }
  root to: "home#index"
  resources :shippings do
    resources :shipping_details
  end
  resources :budget_details
  resources :items
  resources :menus, only: %i[ index ]
  resource :profiles, only: %i[edit update]
end
