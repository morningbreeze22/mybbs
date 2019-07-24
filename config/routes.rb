Rails.application.routes.draw do
  resources :forums do
    resources :articles
  end
  get 'users/destroy'
  get 'users/index'
  devise_for :users, :path_prefix =>"d" ,controllers: {registrations: 'user/registrations'}
  resources :users do
    resources :signatures
  end

  #mount RuCaptcha::Engine => "/rucaptcha"
  match '/forums/favor/:id(.:format)', to: 'forums#favorforum', via: 'post'
  match '/forums/unfavor/:id(.:format)', to: 'forums#unfavorforum', via: 'post'
  match '/unfavor/:id(.:format)', to: 'forums#unfavorinlist', via: 'post'
  match '/myfavor', to: 'forums#allfavor', via: 'get'
  match '/myarticles', to: 'users#myarticles', via: 'get'

  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
