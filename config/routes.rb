Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	namespace :api do
	  namespace :v1 do
	    resources :users, only: [:index, :create, :show, :update, :destroy ]
	    # resources :sessions, only: [:create]	    # 原文有 microposts, 我们现在把它注释掉
	    # resources :microposts, only: [:index, :create, :show, :update, :destroy]
	  end
	end
end
