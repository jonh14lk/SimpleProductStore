Rails.application.routes.draw do
  post '/authentication', to: 'authentication#login'
  resources :products
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
