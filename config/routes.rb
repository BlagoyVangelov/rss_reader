Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'readers/index'

  resources :feeds
  root 'feeds#index'
end
