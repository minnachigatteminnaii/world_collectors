Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/remove'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  ###ルートURL
  root 'items#index'


  ###エンドユーザー###
  #UsersController
  resources :users, only: [:show, :edit, :update] do
    collection do
      get 'order'
      get 'warn'
      put 'unsubscribe'
    end
  end

  #ItemsController
  resources :items, only: :show
  get '/items/category/:category_id', to: 'items#category', as: :categoryr

  #CartsController
  resources :carts, only: [:index, :create, :destroy]
  put '/carts/:id', to: 'carts#change'

  #Shopping_AddressesController
  resources :shopping_addresses, only: [:index, :new, :create, :edit, :update, :destroy]

  #OrdersController
  resources :orders, only: [:new, :create] do
    collection do
      #get 'confirm' ##設計書と違う点
      post 'confirm' ##設計書と違う点
      #get 'done'
    end
  end
  get '/orders/done/:date', to: 'orders#done', as: :order_date

  #FavoritesController
  resources :favorites, only: [:index, :create, :destroy]

  #ContactsController
  resources :contacts, only: [:new, :create]



  ###管理者###
  #Admin::UsersController
  get '/admin', to: 'admin/users#top' #管理者側のルートURL

  #Admin::End_UsersController
  namespace :admin do
    resources :end_users, only: [:index, :show, :edit, :update]
    put '/end_users/remove/:id', to: 'end_users#remove', as: :remove_path ##設計と違う箇所
  end

  #Admin::ItemsController
  namespace :admin do
    resources :items, only: [:index, :show, :edit, :update, :new, :create]
    put 'items/stop/:id', to: 'items#stop', as: :stop_path
  end

  #Admin::OrdersControler
  namespace :admin do
    resources :orders, only: [:index, :show]
  end

  #Admin::ArrivalsController
  namespace :admin do
    resources :arrivals, only: [:index, :new, :create] do
      collection do
        get 'result'
      end
    end
  end

  #Admin::ContactsController
  namespace :admin do
    resources :contacts, only: [:index, :show]
  end



  ###Devise
  #Users::~~DeviseController
  devise_for :users


  #Administrators::~~DeviseController
  devise_for :administrators

end

