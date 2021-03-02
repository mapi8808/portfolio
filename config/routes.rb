Rails.application.routes.draw do
  # get 'products/show'
  root to: 'homes#top'
  get 'about' => 'homes#about'
  get 'unsubscribe/:name' => 'homes#unsubscribe', as: 'confirm_unsubscribe'
  patch ':id/withdraw/:name' => 'homes#withdraw', as: 'withdraw_user'
  put 'withdraw/:name' => 'users#withdraw'
  get 'contacts' => 'contacts#index'
  post 'contacts/confirm' 
  
  get 'products/index'
  
  
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
    get 'search/search'
    resources :users, only: [:show, :edit, :update]
    resources :shops, only: [:show, :edit, :new, :create, :update, :destroy]
    resources :products do
      resource :favorites, only: [:create, :destroy]
      resources :productcomments, only: [:create, :destroy]
    end
  end
  
  namespace :admin do
    resources :users, only: [:index, :show, :edit, :destroy]
    resources :products, only: [:index, :show, :destroy]
    resources :shops, only: [:index, :show, :destroy]
    resources :genres, only: [:index, :edit, :create, :update, :destroy]
  end
end
