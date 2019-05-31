Rails.application.routes.draw do
  devise_for :users 
  root to: "blogs#index"
    resources :blogs, only: [:index, :show, :new, :create, :destroy, :edit, :update] 
    resources :users, only: [:show]
         
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
