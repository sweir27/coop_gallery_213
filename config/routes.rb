Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      get 'profile'
      resources :artworks
      member do
        post 'toggle_admin'
      end
    end

    resources :shows do
      member do
        post 'set_current'
      end
    end

    resources :events do
      member do
        post 'set_homepage'
      end
    end

    resources :links
  end

  resources :shows do
    collection do
      get 'ind_current'
    end
  end

  resources :events, only: [:index]

  resources :announcements, only: [:new, :create, :edit, :update, :destroy]

  resources :artists, only: [:show, :index] do
    resources :artworks, only: [:show]
  end

  resources :links

  resources :sessions, only: [:new, :create, :destroy]

  root 'shows#current'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/calendar', to: 'static_pages#calendar', via: 'get'
end
