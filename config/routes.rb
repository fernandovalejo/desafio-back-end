Rails.application.routes.draw do

  devise_for :usuarios

  root "transacoes#new"

  resources :transacoes, only: [:new, :create]

  resources :lojas do
    resources :transacoes, only: :index
  end
end
