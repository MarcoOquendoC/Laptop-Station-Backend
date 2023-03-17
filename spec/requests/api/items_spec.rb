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
  describe ItemsController do
    let(:user) { create(:user) }
    let(:item) { create(:item, :user) }

    describe 'PUT #update' do
      context 'with valid parameters' do
        let(:new_title) { 'New Title' }

        before do
          put :update, params: { id: item.id, item: { title: new_title } }, session: { user_id: user.id }
        end

        it 'returns a success response' do
          expect(response).to be_successful
        end

        it 'updates the item' do
          expect(item.reload.title).to eq(new_title)
        end
      end

      context 'with invalid parameters' do
        let(:invalid_params) { { title: '' } }

        before do
          put :update, params: { id: item.id, item: invalid_params }, session: { user_id: user.id }
        end

        it 'returns an unprocessable_entity response' do
          expect(response).to have_http_status(:unprocessable_entity)
        end

        it 'returns the item errors' do
          expect(JSON.parse(response.body)).to include('title' => ["can't be blank"])
        end
      end
    end

    describe 'DELETE #destroy' do
      before do
        delete :destroy, params: { id: item.id }, session: { user_id: user.id }
      end

      it 'returns a success response' do
        expect(response).to be_successful
      end

      it 'deletes the item' do
        expect(Item.exists?(item.id)).to be_falsey
      end

      it 'returns the updated list of items for the current user' do
        expect(JSON.parse(response.body).size).to eq(user.items.size)
      end
    end
  end
end
