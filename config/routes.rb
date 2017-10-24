Rails.application.routes.draw do
  get 'users/index'

  get 'users/show'

  root 'posts#index'
  devise_for :users
    resources :users, only:[:index,:show,:edit,:update] do
    	resource :relationships, only:[:create, :destroy]
    	get :follows, on: :member
    	get :followers, on: :member
    	get :favorites, on: :member
    end
	resources :posts do
		resource :favorites, only:[:create,:destroy]
    resources :comments, only:[:create,:destroy]
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
