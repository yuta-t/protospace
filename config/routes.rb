Rails.application.routes.draw do
  root 'prototypes#index'

  devise_for :users

  resources :prototypes do
    resources :comments, only: [:create, :edit, :update, :destroy], module: :prototypes
  end

end
