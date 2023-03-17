require 'swagger_helper'

RSpec.describe CurrentUserController, type: :request do
  path '/current_user' do
    get 'Returns the current user' do
      tags 'Current User'
      produces 'application/json'
      security [{ Bearer: [] }]

      response '200', 'returns the current user' do
        schema '$ref' => '#/components/schemas/User'

        run_test! do
          expect(response).to have_http_status(:ok)
          expect(response.content_type).to eq('application/json')
        end
      end

      response '401', 'unauthorized' do
        schema '$ref' => '#/components/schemas/Error'

        run_test! do
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
