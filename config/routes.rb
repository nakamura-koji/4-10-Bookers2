Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'homes#top'
  get 'books_path'=>'books#index'
  resources :books, only: [:create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:show, :edit, :update]
end