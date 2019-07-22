Rails.application.routes.draw do
  resources :forums
  get 'users/destroy'
  get 'users/index'
  devise_for :users, :path_prefix =>"d" ,controllers: {registrations: 'user/registrations'}
  resources :users do
    resources :signatures
  end
  #resources :users, :only => [:show]
  #match '/users',         to: 'users#index',      via: 'get'
  #match '/users/:id',     to: 'users#show',       via: 'get'
  #match '/users/:id',     to: 'users#destroy',    via: 'delete'
  #match '/users/new',     to: 'users#new' ,       via: 'get'
  #match '/users/create',     to: 'users#create' ,    via: 'post'

  #mount RuCaptcha::Engine => "/rucaptcha"

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
