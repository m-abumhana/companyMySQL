Rails.application.routes.draw do
  resources :users do
    get :projects, on: :member
  end
  resources :projects
  resources :companies

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  #root "companies#index"
end
