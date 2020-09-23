Rails.application.routes.draw do
  devise_for :users
  #get 'posts', to: 'posts#index'
  root 'items#index'
end
