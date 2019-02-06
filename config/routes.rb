Rails.application.routes.draw do

  resources :users, only: [:new, :create, :update, :edit]
  resource :session, only: [:new, :create, :destroy]
  resources :subs do
    resources :posts, except: [:destroy]
  end
  resources :posts, only: [:destroy]
end
