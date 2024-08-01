#----------------- Admin routes

authenticated :user, ->(user) { user.admin? } do
  mount Sidekiq::Web => '/sidekiq'

  scope module: :admin do
    scope module: :backoffice_module do
      # resources :parent_model do
      #   resources :child_model, only: %i[index create]
      #   member do
      #     patch :custom_action
      #   end
      # end

      resources :admin_users
      resources :normal_users do
        post :confirm, on: :member
        post :send_confirmation, on: :member
      end
      resources :locations
    end
  end
end

authenticated :user, ->(user) { user.normal? } do
  get '/sidekiq', to: redirect('/')
end
