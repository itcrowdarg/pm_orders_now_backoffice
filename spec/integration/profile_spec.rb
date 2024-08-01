require 'swagger_helper'

describe 'Profile API' do

  path '/api/v1/profile' do

    get '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Profile'
      security []
      produces 'application/json'

      response '200', 'Respond ok' do
        schema type: :object, properties: {
          status:               { type: :string },
          data: {
            type: :object,
            properties: {
              id:                             { type: :integer },
              email:                          { type: :string },
              first_name:                     { type: :string },
              last_name:                      { type: :string },
              timezone:                       { type: :string },
              locale:                         { type: :string },
              created_at:                     { type: :string },
              updated_at:                     { type: :string }
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

    put '<button class="postman-link" onclick="event.stopPropagation();window.open(\'\');"><b>POSTMAN LINK</b></button>' do
      tags 'Profile'
      security []
      consumes 'application/json'
      produces 'application/json'


      parameter name: :profile, in: :body, schema: {
        type: :object,
        properties: {
          email:                          { type: :string },
          first_name:                     { type: :string },
          last_name:                      { type: :string },
          timezone:                       { type: :string },
          locale:                         { type: :string },
        },
        required: [:email, :first_name, :last_name, :timezone, :locale]
      }
  
      response '200', 'Respond ok' do
        schema type: :object, properties: {
          message:                    { type: :string },
          status:                     { type: :string },
          data: {
            type: :object,
            properties: {
              id:                             { type: :integer },
              email:                          { type: :string },
              first_name:                     { type: :string },
              last_name:                      { type: :string },
              timezone:                       { type: :string },
              locale:                         { type: :string },
              created_at:                     { type: :string },
              updated_at:                     { type: :string }
            }
          }
        }

        run_test!
      end
  
      response '422', 'Respond unprocessable entity' do
        schema type: :object, properties: {
          status:                     { type: :string },
          message:                    { type: :string },
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
              id:                             { type: :integer },
              email:                          { type: :string },
              first_name:                     { type: :string },
              last_name:                      { type: :string },
              timezone:                       { type: :string },
              locale:                         { type: :string },
              created_at:                     { type: :string },
              updated_at:                     { type: :string }
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


