Rails.application.routes.draw do

  get 'sessions/create'

  get 'sessions/destroy'

  root 'welcome#index'

   get '/auth/github', as: :github_login
   get '/auth/github/callback', to: 'sessions#create'
   delete '/logout', to: 'sessions#destroy', as: 'logout'

   resources :users, only: [:show]


end
