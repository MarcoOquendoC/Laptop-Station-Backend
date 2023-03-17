require 'swagger_helper'

RSpec.describe 'api/users/registrations', type: :request do
  describe 'signup' do
    path '/registrations' do
      post 'Registration user' do
        consumes 'application/json'
        produces 'application/json'
        parameter name: :credentials, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                first_name: { type: :string },
                last_name: { type: :string },
                email: { type: :string },
                password: { type: :string }
              },
              required: %w[email password first_name last_name]
            }
          }
        }
        response '200', 'sign up succesfully' do
          schema type: :object,
                 properties: {
                   id: { type: :string },
                   email: { type: :string },
                   created_at: { type: :string, format: :datetime }
                 },
                 required: ['token']
          let(:credential) do
            { user: {
              first_name: 'test',
              last_name: 'test',
              email: 'test@mail.com',
              password: 'user123'
            } }
          end
          run_test!
        end
        response '401', 'invalid registration' do
          let(:credentials) { { first_name: '', last_name: '', email: '', password: '' } }
          run_test!
        end
      end
    end
  end
end
