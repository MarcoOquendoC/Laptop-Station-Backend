require 'swagger_helper'

RSpec.describe 'api/users/reserves', type: :request do
  describe 'reserves' do
    path '/reserves' do
      post 'create a reservation' do
        tags 'Reservations'
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
        tags 'Reservations'
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
  describe 'Reserves API' do
    path '/reserves/{id}' do
      delete 'Deletes a reserve' do
        tags 'Reservations'
        security [bearerAuth: []]
        parameter name: :id, in: :path, type: :integer

        response '204', 'reserve deleted' do
          let(:user) { create(:user) }
          let(:item) { create(:item) }
          let(:reserve) { create(:reserve, user:, item:) }
          let(:Authorization) { "Bearer #{user.authentication_token}" }
          let(:id) { reserve.id }

          before do
            @initial_reserves_count = Reserve.count
          end

          run_test!

          after do
            expect(Reserve.count).to eq(@initial_reserves_count - 1)
          end
        end

        response '401', 'unauthorized' do
          let(:id) { create(:reserve).id }

          run_test!
        end

        response '404', 'reserve not found' do
          let(:user) { create(:user) }
          let(:Authorization) { "Bearer #{user.authentication_token}" }
          let(:id) { 0 }

          run_test!
        end
      end
    end
  end
end
