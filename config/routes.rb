Rails.application.routes.draw do

  devise_for :users, controllers: {omniauth_callbakcs: 'users/omniauth_callbakcs'}
  resources :posts

  root 'pages#home'

end
