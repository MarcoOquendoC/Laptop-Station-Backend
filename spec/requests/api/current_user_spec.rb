require 'swagger_helper'

describe 'Current User API' do
  path '/current_user' do
    get 'Retrieves the current user' do
      tags 'Current User'
      security [bearer_auth: []]
      produces 'application/json'

      response '200', 'current user retrieved' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 name: { type: :string },
                 email: { type: :string, format: :email },
                 created_at: { type: :string, format: :date_time },
                 updated_at: { type: :string, format: :date_time }
               },
               required: %w[id name email created_at updated_at]

        let(:Authorization) { "Bearer #{token}" }

        run_test! do
          expect(response).to match_json_schema('current_user')
        end
      end

      response '401', 'unauthorized' do
        let(:Authorization) { nil }

        run_test! do
          expect(response).to match_json_schema('error')
          expect(response).to have_http_status(:unauthorized)
        end
      end
    end
  end
end
