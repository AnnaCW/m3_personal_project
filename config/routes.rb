Rails.application.routes.draw do

  root 'welcome#index'

  get '/auth/spotify', as: :spotify_login
  get '/auth/spotify/callback', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:show]
    
  resources :categories, only: [:index, :show]
  resources :suggestions, only: [:index, :show]

  get 'items/:type/:id', to: 'items#show', as: 'item'

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :listening_sessions, only: [:create, :update] do
        post '/listening_sessions', to: 'listening_sessions#create', :on => :member
        put '/listening_sessions/:id', to: 'listening_sessions#update', :on => :member
        patch '/listening_sessions/:id', to: 'listening_sessions#update', :on => :member
      end
    end
  end

end
