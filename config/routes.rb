Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :courses, only: [ :index, :show ] do
    resources :bookmarks, only: [ :new, :create, :destroy ]
    resources :course_reviews, only: [ :index, :new, :create ]

  end

  get 'users/edit_avatar' => 'users#edit_avatar', :as => :edit_avatar
  post 'users/edit_avatar' => 'users#new_avatar', :as => :new_avatar


  resources :users, only: [:show] do
    resources :course_reviews, only: [ :destroy ]
  end

  get "/categories" => "courses#categories"



  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
end
