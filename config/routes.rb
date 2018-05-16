Rails.application.routes.draw do
  devise_for :users
  get '/consultas/agenda', controller: 'consultas', action: 'agenda'
  root to: "home#index"
  resources :pacientes, only:[:index, :show, :new, :create, :edit, :update] do
      resources :precos, only:[:new, :create]
  end
  resources :consultas
  resources :faturas, only:[:index, :create, :destroy]
  resources :pagamentos, only:[:index, :create, :destroy]
  resources :relatorios, only:[:index]

  namespace :api do
    resources :pacientes, only:[:index]
    resources :precos, only:[:index]
    resources :consultas, only:[:index]
    resources :faturas, only:[:index]
    resources :pagamentos, only:[:index]
  end
end
