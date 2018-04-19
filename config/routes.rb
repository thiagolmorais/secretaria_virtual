Rails.application.routes.draw do
  devise_for :users
  root to: "home#index"
  resources :pacientes, only:[:index, :show, :new, :create, :edit, :upload]
end
