#----------------- API

namespace :api, defaults: { format: :json } do
  namespace :v1 do
    resource :profile, only: %i[show update destroy]
    resources :locations, only: %i[index show create update]

    post '/auth/sign_in', to: 'auth#sign_in'
    post '/auth/refresh_token', to: 'auth#refresh_token'
    post '/auth/sign_up', to: 'auth#sign_up'
    post '/auth/send_confirmation', to: 'auth#send_confirmation'
    get '/auth/confirm/:confirmation_token', to: 'auth#confirm', as: 'auth_confirm'
    post '/auth/send_reset_password', to: 'auth#send_reset_password'
    get '/auth/reset_password/:reset_password_token', to: 'auth#reset_password', as: 'auth_reset_password'
    put '/auth/reset_password', to: 'auth#reset_password_update'
  end
end
