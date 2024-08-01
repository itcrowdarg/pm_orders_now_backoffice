require 'swagger_helper'

describe 'Auth API' do

  path '/api/v1/auth/sign_up' do
    post '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'

      
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email:                      { type: :string, example: "xxxxx@gmail.com" },
          password:                   { type: :string, example: "xxxxx@gmail.com" },
          password_confirmation:      { type: :string, example: "xxxxx@gmail.com" },
          first_name:                 { type: :string, example: "Jonas" },
          last_name:                  { type: :string, example: "Smith" }
        },
        required: [:email, :password, :password_confirmation, :first_name, :last_name]
      }
      response '200', 'Respond ok' do
        schema type: :object, properties: {
          message:                    { type: :string },
          status:                     { type: :string },
          data: {
            type: :object,
            properties: {
              id:                     { type: :integer },
              email:                  { type: :string },
              first_name:             { type: :string },
              last_name:              { type: :string },
              timezone:               { type: :string },
              locale:                 { type: :string },
              created_at:             { type: :string },
              updated_at:             { type: :string }
            }
          }
        }
        
        run_test!
      end
  
  
      response '422', 'Respond unprocessable entity' do
        schema type: :object, properties: {
          message:                    { type: :string },
          status:                     { type: :string },
          errors: {
            type: :object,
            properties: {
              field: {
                type: :array,
                items:                { type: :string }
              }
            }
          },
          data: {
            type: :object,
            properties: {
              id:                     { type: :integer },
              email:                  { type: :string },
              first_name:             { type: :string },
              last_name:              { type: :string },
              timezone:               { type: :string },
              locale:                 { type: :string },
              created_at:             { type: :string },
              updated_at:             { type: :string }
            }
          }
        }
        
        run_test!
      end
    end
  end

  path '/api/v1/auth/sign_in' do
    post '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email:              { type: :string, example: "xxxxx@gmail.com" },
          password:           { type: :string, example: "xxxxx@gmail.com" }
        },
        required: [:email, :password]
      }
      response '200', 'Respond ok' do
        schema type: :object, properties: {
          message:                    { type: :string },
          status:                     { type: :string },
          data: {
            type: :object,
            properties: {
              id:                     { type: :integer },
              access_token:           { type: :string },
              refresh_token:          { type: :string },
              datetime_expiration:    { type: :string },
              created_at:             { type: :string },
              updated_at:             { type: :string }
            }
          }
        }
        
        run_test!
      end
  
      response '403', 'Respond forbidden' do
        schema type: :object, properties: {
          message:              { type: :string },
          status:               { type: :string },
        }

        run_test!
      end

      response '404', 'Respond not found' do
        schema type: :object, properties: {
          message:              { type: :string },
          status:               { type: :string },
        }

        run_test!
      end
    end
  end


  path '/api/v1/auth/refresh_token' do
    post '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          access_token:           { type: :string },
          refresh_token:          { type: :string },
        },
        required: [:confirmation_token]
      }
      response '200', 'Respond ok' do
        schema type: :object, properties: {
          message:                    { type: :string },
          status:                     { type: :string },
          data: {
            type: :object,
            properties: {
              id:                     { type: :integer },
              access_token:           { type: :string },
              refresh_token:          { type: :string },
              datetime_expiration:    { type: :string },
              created_at:             { type: :string },
              updated_at:             { type: :string }
            }
          }
        }
        
        run_test!
      end

      response '404', 'Respond not found' do
        schema type: :object, properties: {
          message:              { type: :string },
          status:               { type: :string },
        }

        run_test!
      end
    end
  end

  path '/api/v1/auth/confirm' do
    get '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Auth'
      consumes 'application/json'

      parameter name: :data, in: :query, schema: {
        type: :object,
        properties: {
          confirmation_token:   { type: :string }
        },
        required: [:confirmation_token]
      }
      response '200', 'Respond ok' do
        run_test!
      end

      response '404', 'Respond not found' do
        run_test!
      end
    end
  end

  path '/api/v1/auth/send_confirmation' do
    post '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          email:           { type: :string }
        },
        required: [:email]
      }
      response '200', 'Respond ok' do
        schema type: :object, properties: {
          message:                    { type: :string },
          status:                     { type: :string },
          data: {
            type: :object,
            properties: {
              id:                     { type: :integer },
              email:                  { type: :string },
              first_name:             { type: :string },
              last_name:              { type: :string },
              timezone:               { type: :string },
              locale:                 { type: :string },
              created_at:             { type: :string },
              updated_at:             { type: :string }
            }
          }
        }
        
        run_test!
      end

        
      response '403', 'Respond forbidden' do
        schema type: :object, properties: {
          message:              { type: :string },
          status:               { type: :string },
          data: {
            type: :object,
            properties: {
              id:                     { type: :integer },
              email:                  { type: :string },
              first_name:             { type: :string },
              last_name:              { type: :string },
              created_at:             { type: :string },
              updated_at:             { type: :string }
            }
          }
        }

        run_test!
      end

      response '404', 'Respond not found' do
        schema type: :object, properties: {
          message:              { type: :string },
          status:               { type: :string },
        }

        run_test!
      end
    end
  end

  path '/api/v1/auth/send_reset_password' do
    post '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          email:           { type: :string }
        },
        required: [:email]
      }
      response '200', 'Respond ok' do
        schema type: :object, properties: {
          message:                    { type: :string },
          status:                     { type: :string },
          data: {
            type: :object,
            properties: {
              id:                     { type: :integer },
              email:                  { type: :string },
              first_name:             { type: :string },
              last_name:              { type: :string },
              timezone:               { type: :string },
              locale:                 { type: :string },
              created_at:             { type: :string },
              updated_at:             { type: :string }
            }
          }
        }
        
        run_test!
      end

      response '404', 'Respond not found' do
        schema type: :object, properties: {
          message:              { type: :string },
          status:               { type: :string },
        }

        run_test!
      end
    end
  end

  path '/api/v1/auth/reset_password' do
    get '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Auth'
      consumes 'application/json'

      parameter name: :data, in: :query, schema: {
        type: :object,
        properties: {
          reset_password_token:   { type: :string }
        },
        required: [:reset_password_token]
      }
      response '200', 'Respond ok' do
        run_test!
      end

      response '404', 'Respond not found' do
        run_test!
      end
    end

    post '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Auth'
      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          reset_password_token:       { type: :string },
          password:                   { type: :string, example: "xxxxx@gmail.com" },
          password_confirmation:      { type: :string, example: "xxxxx@gmail.com" }
        },
        required: [:reset_password_token, :password, :password_confirmation]
      }
      response '200', 'Respond ok' do
        schema type: :object, properties: {
          message:                    { type: :string },
          status:                     { type: :string },
          data: {
            type: :object,
            properties: {
              id:                     { type: :integer },
              email:                  { type: :string },
              first_name:             { type: :string },
              last_name:              { type: :string },
              timezone:               { type: :string },
              locale:                 { type: :string },
              created_at:             { type: :string },
              updated_at:             { type: :string }
            }
          }
        }
        
        run_test!
      end

      response '404', 'Respond not found' do
        schema type: :object, properties: {
          message:              { type: :string },
          status:               { type: :string },
        }

        run_test!
      end
    end
  end

end
