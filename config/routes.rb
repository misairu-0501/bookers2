Rails.application.routes.draw do

  root to:'homes#top'
  devise_for :users

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  resources :users, only:[:index, :show, :edit, :update]

  resources :books, only:[:index, :show, :edit, :create, :destroy, :update]

  # get 'users/index'
  # get 'users/show'
  # get 'users/edit'
  # get 'books/new'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'

  get "/home/about" => 'homes#about', as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
