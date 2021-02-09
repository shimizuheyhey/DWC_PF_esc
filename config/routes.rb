Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
devise_for :users

root to: 'homes#top'
resources :posts, only: [:new, :create, :index, :show, :destroy, :edit, :update]
resources :users, only: [:edit, :index, :show, :update]
end
