Rails.application.routes.draw do
  namespace :admin do
    resources :users do
      get 'profile'
      resources :artworks do
        member do
          post 'make_primary'
        end
      end
      member do
        post 'toggle_admin'
      end
    end

    resources :shows

    resources :events do
      member do
        post 'set_homepage'
      end
    end

    resources :links
    resources :announcements
  end

  resources :shows do
    collection do
      get 'ind_current'
    end
  end

  resources :events, only: [:index]

  resources :artists, only: [:show, :index] do
    resources :artworks, only: [:show]
  end

  resources :links

  resources :sessions, only: [:new, :create, :destroy]

  root 'home#index'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/signin',  to: 'sessions#new',         via: 'get'
  match '/signout', to: 'sessions#destroy',     via: 'delete'
  match '/signup',  to: 'users#new',            via: 'get'
  match '/about',   to: 'static_pages#about',   via: 'get'
  match '/contact', to: 'static_pages#contact', via: 'get'
  match '/calendar', to: 'static_pages#calendar', via: 'get'
end
