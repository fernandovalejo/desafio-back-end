Rails.application.routes.draw do
  root "transacoes#new"

  resources :transacoes, only: [:new, :create]

  resources :lojas do
    resources :transacoes, only: :index
  end
end
