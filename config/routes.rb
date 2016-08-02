Rails.application.routes.draw do

  root 'welcome#index'

  get '/auth/spotify', as: :spotify_login
  get '/auth/spotify/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  namespace :admin do
    resources :data_export, only: [:index]
    resources :listening_sessions, only: [:index]
  end

  resources :users, only: [:show]

  resources :categories, only: [:index, :show]
  resources :suggestions, only: [:index, :show]
  resources :listening_sessions, only: [:index]

  get 'items/:type/:id', to: 'items#show', as: 'item'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :listening_sessions, except: [:new, :edit]
        # post '/listening_sessions', to: 'listening_sessions#create', :on => :member
        # put '/listening_sessions/:id', to: 'listening_sessions#update', :on => :member
        # patch '/listening_sessions/:id', to: 'listening_sessions#update', :on => :member
        # delete '/listening_sessions/:id', to: 'listening_sessions#destroy', :on => :member
      # end
      resources :suggestions, only: [:index]
    end
  end

end
