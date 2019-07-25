Rails.application.routes.draw do

  #板块下有文章，文章下有回复
  resources :forums do
    resources :articles do
      resources :replies
    end
  end

  #用户部分使用devise，重写了部分方法
  get 'users/destroy'
  get 'users/index'
  devise_for :users, :path_prefix =>"d" ,controllers: {registrations: 'user/registrations'}
  resources :users do
    resources :signatures
  end

  #mount RuCaptcha::Engine => "/rucaptcha"

  # 一些自定义的路径
  match '/forums/favor/:id(.:format)',            to: 'forums#favorforum',     via: 'post'
  match '/forums/unfavor/:id(.:format)',          to: 'forums#unfavorforum',   via: 'post'
  match '/unfavor/:id(.:format)',                 to: 'forums#unfavorinlist',  via: 'post'
  match '/myfavor',                               to: 'forums#allfavor',       via: 'get'
  match '/myarticles',                            to: 'users#myarticles',      via: 'get'
  match '/myreplies',                             to: 'users#myreplies',       via: 'get'
  match '/forums/:forum_id/articles/:id/like',    to: 'articles#like',         via: 'post'


  root to: "home#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
