Rails.application.routes.draw do

  resources :users do
     get :projects_users, on: :member
  end
  resources :projects
  resources :companies

  # Defines the root path route ("/")
  #root "companies#index"
end
