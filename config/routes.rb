Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_for :users

root to: 'homes#top'
resources :users, only: [:edit, :index, :show, :update] do
  resource :relationships, only: [:create, :destroy]
  get 'followings' => 'relationships#followings', as: 'followings'
  get 'followers' => 'relationships#followers', as: 'followers'
end


resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update, :destroy] do
  resource :favorites, only: [:create, :destroy]
  resources :post_comments, only: [:create, :destroy]
  resources :cut_times, only: [:new, :create, :update]
  end
end
