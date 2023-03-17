require 'swagger_helper'

RSpec.describe ItemsController, type: :request do
  before do
    let(:user) { FactoryBot.create(:user) }
    sign_in :user
    get :index
  end
  describe 'Items API' do
    path '/items' do
      get 'Retrieves all items' do
        tags 'Items'
        produces 'application/json'

        response '200', 'items found' do
          schema type: :array,
                 items: {
                   type: :object,
                   properties: {
                     user_id: { type: :integer },
                     title: { type: :string },
                     item_model: { type: :string },
                     serial_n: { type: :string },
                     image: { type: :string },
                     description: { type: :string },
                     brand: { type: :string }
                   },
                   required: %w[user_id title item_model serial_n description]
                 }

          run_test!
        end

        response '401', 'unauthorized' do
          let(:Authorization) { 'Bearer invalid_token' }
          run_test!
        end
      end
    end
  end
  describe 'Items API' do
    let(:item) { create(:item) }
    let(:valid_attributes) { attributes_for(:item) }
    let(:invalid_attributes) { attributes_for(:item, title: nil) }
    let(:Authorization) { "Bearer #{JsonWebToken.encode(user_id: item.user_id)}" }

    path '/items/{id}' do
      parameter name: 'id', in: :path, type: :integer

      get 'Retrieves an item' do
        tags 'Items'
        produces 'application/json'
        security [Bearer: []]

        response '200', 'item found' do
          schema type: :object,
                 properties: {
                   user_id: { type: :integer },
                   title: { type: :string },
                   item_model: { type: :string },
                   serial_n: { type: :string },
                   image: { type: :string },
                   description: { type: :string },
                   brand: { type: :string }
                 },
                 required: %w[user_id title item_model serial_n description]

          run_test!
        end

        response '401', 'unauthorized' do
          let(:Authorization) { 'Bearer invalid_token' }
          run_test!
        end

        response '404', 'item not found' do
          let(:id) { 'invalid' }
          run_test!
        end
      end
    end

    path '/items' do
      post 'Creates an item' do
        tags 'Items'
        consumes 'multipart/form-data'
        security [Bearer: []]
        parameter name: :item, in: :body, schema: {
          type: :object,
          properties: {
            title: { type: :string },
            item_model: { type: :string },
            serial_n: { type: :string },
            image: { type: :string, format: :binary },
            description: { type: :string },
            brand: { type: :string }
          },
          required: %w[title item_model serial_n description]
        }

        response '201', 'item created' do
          let(:Authorization) { "Bearer #{JsonWebToken.encode(user_id: item.user_id)}" }
          let(:item) { valid_attributes }
          run_test!
        end

        response '401', 'unauthorized' do
          let(:Authorization) { 'Bearer invalid_token' }
          let(:item) { valid_attributes }
          run_test!
        end

        response '422', 'invalid request' do
          let(:Authorization) { "Bearer #{JsonWebToken.encode(user_id: item.user_id)}" }
          let(:item) { invalid_attributes }
          run_test!
        end
      end
    end
  end

  describe 'Items API' do
    path '/items/{id}' do
      delete 'Deletes an item' do
        tags 'Items'
        consumes 'application/json'
        produces 'application/json'
        parameter name: :id, in: :path, type: :integer

        response '200', 'item deleted' do
          let(:user) { create(:user) }
          let(:Authorization) { "Bearer #{JsonWebToken.encode(user_id: user.id)}" }
          let(:id) { create(:item, user:).id }

          run_test! do |response|
            expect(response).to be_successful
            expect(response.body).to include_json([])
          end
        end

        response '401', 'unauthorized' do
          let(:id) { create(:item).id }

          run_test! do |response|
            expect(response).to have_http_status(:unauthorized)
          end
        end

        response '404', 'item not found' do
          let(:user) { create(:user) }
          let(:Authorization) { "Bearer #{JsonWebToken.encode(user_id: user.id)}" }
          let(:id) { 'invalid' }

          run_test! do |response|
            expect(response).to have_http_status(:not_found)
          end
        end
      end
    end
  end
end
