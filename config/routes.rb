Rails.application.routes.draw do
  get 'products/index'
  # get 'products/show'
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'contact' => 'homes#contact'
  # resources :products, only: [:index, :show]
  
  devise_for :users, controllers: {
  sessions: 'member/users/sessions',
  passwords: 'member/users/passwords',
  registrations: 'member/users/registrations',
  }
 
  devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations',
  }
  
  scope module: :member do
    resources :users, only: [:show, :edit, :quit, :update, :goodbye]
    resources :products do
      resource :favorites, only: [:create, :destroy]
      resources :product_comments, only: [:create, :destroy]
    end
    resources :shops, only: [:show, :edit, :new, :create, :update, :destroy]
  end
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit]
    resources :products, only: [:index, :show]
    resources :shops, only: [:index, :show]
    resources :genres, only: [:index, :edit, :create, :update]
  end
end
