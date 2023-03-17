require 'swagger_helper'

RSpec.describe 'api/users/reserves', type: :request do
  describe 'reserves' do
    path '/reserves' do
      post 'create a reservation' do
        tags 'Reserve'
        consumes 'application/json'
        produces 'application/json'
        security [bearer_auth: []]
        parameter name: :reservation, in: :body, schema: {
          type: :object,
          properties: {
            item_id: { type: :integer },
            user_id: { type: :integer },
            date: { type: :string }
          },
          required: %w[item_id user_id date]
        }
        response '200', 'successful' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   item_id: { type: :integer },
                   user_id: { type: :integer },
                   date: { type: :string }
                 },
                 required: %w[id item_id user_id date]

          let(:Authorization) { "Basic #{JSONWebToken.encode(user_id: 1)}" }
          let(:reserves) do
            { reserves: { item_id: 1, user_id: 1, date: '2023-12-12' } }
          end
          run_test!
        end

        response '401', 'unauthorized' do
          schema type: :object,
                 properties: {
                   msg: { type: :string },
                   error: { type: :string }
                 },
                 required: ['reserves']

          let(:reserves) do
            { reserves: { item_id: 1, user_id: 1, date: '2023-12-12' } }
          end
          run_test!
        end
      end

      get 'list all reserves' do
        tags 'Reserve'
        produces 'application/json'
        security [bearer_auth: []]

        response '200', 'successful' do
          schema type: :object,
                 properties: {
                   id: { type: :integer },
                   item_id: { type: :integer },
                   user_id: { type: :integer },
                   date: { type: :string }
                 },
                 required: %w[id item_id user_id date]

          let(:Authorization) { "Basic #{JSONWebToken.encode(user_id: 1)}" }
          run_test!
        end
      end
    end
  end
end
