Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :pacientes, only:[:index, :show, :new, :create, :edit, :update] do
      resources :precos, only:[:new, :create]
  end
  resources :consultas
  get '/consultas/agenda'
  resources :faturas, only:[:index, :create, :destroy]
  resources :pagamentos, only:[:index, :create, :destroy]
  resources :relatorios, only:[:index]
end
