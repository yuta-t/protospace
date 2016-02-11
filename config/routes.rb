Rails.application.routes.draw do
  root 'prototypes/ranking#index'

  devise_for :users

  namespace :prototypes do
    resources :ranking, only: [:index]
    resources :newest, only: [:index]
  end

  resources :prototypes do
    scope module: :prototypes do
      resources :comments, only: [:create, :edit, :update, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

  resources :tags, only: [:index, :show], param: :tag_name
end
