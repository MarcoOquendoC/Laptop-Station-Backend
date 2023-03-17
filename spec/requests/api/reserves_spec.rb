require 'rails_helper'

RSpec.describe ReservesController, type: :controller do
  describe 'GET #index' do
    context 'when user is authenticated' do
      let(:user) { FactoryBot.create(:user) }
      let!(:item1) { FactoryBot.create(:item) }
      let!(:item2) { FactoryBot.create(:item) }
      let!(:reserve1) { FactoryBot.create(:reserve, :user, item: item1) }
      let!(:reserve2) { FactoryBot.create(:reserve, :user, item: item2) }

      before do
        sign_in user
        get :index
      end

      it 'returns http success' do
        expect(response).to have_http_status(:success)
      end

      it "returns a JSON array of user's reserves" do
        reserves = JSON.parse(response.body)
        expect(reserves.count).to eq(2)
        expect(reserves[0]['user_id']).to eq(user.id)
        expect(reserves[0]['item_id']).to eq(item1.id)
        expect(reserves[1]['user_id']).to eq(user.id)
        expect(reserves[1]['item_id']).to eq(item2.id)
      end

      it "returns the reserve's details and the item's title" do
        reserves = JSON.parse(response.body)
        expect(reserves[0]['name']).to eq("#{user.first_name} #{user.last_name}")
        expect(reserves[0]['title']).to eq(item1.title)
        expect(reserves[0]['id']).to eq(reserve1.id)
        expect(reserves[0]['date']).to eq(reserve1.date.strftime('%Y-%m-%d'))
        expect(reserves[0]['created_at']).to eq(reserve1.created_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'))
        expect(reserves[0]['updated_at']).to eq(reserve1.updated_at.strftime('%Y-%m-%dT%H:%M:%S.%LZ'))
      end
    end

    context 'when user is not authenticated' do
      before do
        get :index
      end

      it 'returns http unauthorized' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
