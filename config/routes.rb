Rails.application.routes.draw do
  get "/", to: "users#new"
  resources :users, only: [:new, :create, :edit, :update, :show]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
