Rails.application.routes.draw do
  devise_for :admins, skip: :all
  devise_scope :admin do
    get 'admins/sign_in' => 'admins/sessions#new', as: 'new_admin_session'
    post 'admins/sign_in' => 'admins/sessions#create', as: 'admin_session'
    delete 'admins/sign_out' => 'admins/sessions#destroy', as: 'destroy_admin_session'    
  end
  
  devise_for :users, skip: :all
  devise_scope :user do
    get 'users/sign_in' => 'users/sessions#new', as: 'new_user_session'
    post 'users/sign_in' => 'users/sessions#create', as: 'user_session'
    delete 'users/sign_out' => 'users/sessions#destroy', as: 'destroy_user_session'
    get 'users/sign_up' => 'users/registrations#new', as: 'new_user_registration'
    post 'users' => 'users/registrations#create', as: 'user_registration'
    get 'users/password/new' => 'users/passwords#new', as: 'new_user_password'
  end
  
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :users do
    
  get 'about' => 'homes#about'
  get 'contact' => 'homes#contact'
  root to: 'homes#top'
  #ユーザールーティング自動設定
  resources :users, only: [:show, :edit, :quit, :update, :goodbye]
  #商品ルーティング自動設定
  resources :products do
    resource :favorites, only: [:create, :destroy]
  end
  #ショップルーティング自動設定
  resources :shops, only: [:show, :edit, :new, :create, :update, :destroy]
  end
end
