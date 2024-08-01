require 'sidekiq/web'
require 'sidekiq/cron/web'

Rails.application.routes.draw do
  get '/healthcheck', to: proc { [200, { 'Content-Type' => 'text/plain' }, ['ok']] }

  #----------------- Swagger
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  #----------------- Rutas
  devise_for :users, path: :auth, controllers: {
    passwords: 'auth/passwords',
    registrations: 'auth/registrations',
    sessions: 'auth/sessions'
  }

  #----------------- API
  draw(:api)

  devise_scope :user do
    #----------------- Routes for admin user
    draw(:admin)

    unauthenticated :user do
      get '/sidekiq', to: redirect('/')
    end
  end

  scope module: :admin do
    get '/toggle_sidebar', to: 'admin#toggle_sidebar', as: :toggle_sidebar
    root to: 'backoffice_module/main#index'
  end

  draw(:public)

  match '*path', via: :all, to: 'application#catch_404', constraints: lambda { |req|
    req.path.exclude? 'rails/active_storage'
  }
end
