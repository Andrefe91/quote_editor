Rails.application.routes.draw do
  get 'line_item_dates/new'
  get 'line_item_dates/create'
  get 'line_item_dates/edit'
  get 'line_item_dates/update'
  get 'line_item_dates/destroy'
  devise_for :users
  root "pages#home"

  resources :quotes do
    resources :line_item_dates, except: [ :index, :show ]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
