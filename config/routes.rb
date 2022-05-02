Rails.application.routes.draw do
  resources :posts
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  ExceptionHunter.routes(self)
  mount_devise_token_auth_for 'User', at: '/api/v1/users', controllers: {
    registrations: 'api/v1/registrations',
    sessions: 'api/v1/sessions',
    passwords: 'api/v1/passwords'
  }

  namespace :api do
    namespace :v1, defaults: { format: :json } do
      get :status, to: 'api#status'

      get :homepage, to: 'api#index'

      resources :posts

      devise_scope :user do
        resource :user, only: %i[update show]
        post '/users:id/follow', to: 'users#follow'
        post '/users:id/unfollow', to: 'users#unfollow'
      end
      resources :settings, only: [] do
        get :must_update, on: :collection
      end
    end
  end
end
