Rails.application.routes.draw do
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'about' => 'homes#about'
  get 'contact' => 'homes#contact'
  
  #ユーザールーティング自動設定
  resources :users, only: [:show, :edit, :quit, :update, :goodbye]
  #商品ルーティング自動設定
  resources :products
  #ショップルーティング自動設定
  resources :shops, only: [:show, :edit, :new, :create, :update, :destroy]
 
end
