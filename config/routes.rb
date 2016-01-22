Rails.application.routes.draw do
  root 'prototypes#index'

  devise_for :users

  resources :prototypes do
    scope module: :prototypes do
      resources :comments, only: [:create, :edit, :update, :destroy]
      resources :likes, only: [:create, :destroy]
    end
  end

end
