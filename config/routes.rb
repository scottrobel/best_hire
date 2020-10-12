Rails.application.routes.draw do
  resources :job_applications
#== Resources
  resources :purchases
  resources :jobs
  resources :job_application_searches, only: [:new, :create]
  resources :jobs do
    resources :job_applications, only: [:index]
  end
#== Root Url 
  root to: 'pages#home'

#== Written Routes
  get '/dashboard', to: 'pages#dashboard', as: :dashboard
  get '/admin-dashboard', to: 'pages#admin_dashboard', as: :admin_dashboard
#== Devise User
  devise_for :users
#== Stripe
  mount StripeEvent::Engine, at: '/stripe-webhooks' #you can change this url
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
