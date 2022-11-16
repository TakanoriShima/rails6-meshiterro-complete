Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'  
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end
  
  # 以下の行のonly: []内にupdateを追加
  resources :users, only: [:show, :edit, :update]
end
