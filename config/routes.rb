Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'static_pages#home'
  devise_for :users, :controllers => {
    :registrations => "registrations"
  }
  resources :users, only: [:show, :index, :destroy] do
    member do
      get :friend, :friends_list, :talk
    end
  end
  resources :posts
  resources :recipes, only: [:index]
  resources :others, only: [:index]
  resources :travels, only: [:index]
  resources :lifes, only: [:index]
  resources :learns, only: [:index]
  resources :healths, only: [:index]
  resources :cooks, only: [:index]
  resources :goes, only: [:index]
  resources :ingredients, only: [:index, :create, :destroy]
  resources :surveys, only: [:create]
  resources :comments, only: [:create, :destroy]
  resources :likes, only: [:create, :destroy]
  resources :friends, only: [:create, :destroy]
  resources :talks, only: [:create, :destroy]

  

end
