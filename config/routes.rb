Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "users#index"
      resources :users, only: [:index, :show] do
        resources :posts, only: [:index, :show, :new, :create, :destroy] do
          resources :comments, only: [:index, :create, :new, :destroy]
          resources :likes, only: [:create]
        end
      end
end
