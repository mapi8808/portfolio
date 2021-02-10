Rails.application.routes.draw do
  devise_for :admins
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'about' => 'homes#about'
  get 'contact' => 'homes#contact'
  root to: 'homes#top'
  devise_for :users
  #ユーザールーティング自動設定
  resources :users, only: [:show, :edit, :quit, :update, :goodbye]
  #商品ルーティング自動設定
  resources :products do
    resource :favorites, only: [:create, :destroy]
  end
  #ショップルーティング自動設定
  resources :shops, only: [:show, :edit, :new, :create, :update, :destroy]

end
