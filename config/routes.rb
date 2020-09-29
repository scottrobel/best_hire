Rails.application.routes.draw do
#== Resources
  resources :purchases
  resources :jobs
#== Root Url 
  root to: 'pages#home'

#== Written Routes
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
#== Devise User
  devise_for :users
#== Stripe
  mount StripeEvent::Engine, at: '/stripe-webhooks' #you can change this url
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
