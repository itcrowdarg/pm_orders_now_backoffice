#----------------- Public routes

scope module: :public do
  scope module: :public_module do
    get '/confirmed', to: 'main#confirmed'
    get '/already_confirmed', to: 'main#already_confirmed'
    get '/user_not_found', to: 'main#user_not_found'
    get '/reset_password', to: 'main#reset_password'
  end
end
