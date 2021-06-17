Rails.application.routes.draw do
  resources :telebots
  get '/', to: proc { [200, {}, ['']] }
  resources :users
  resources :gas_prices
  resources :prices
  get '/search' => 'gas_prices#search'

  require 'sidekiq/web'
  require 'sidekiq/cron/web'
mount Sidekiq::Web => '/sidekiq'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
