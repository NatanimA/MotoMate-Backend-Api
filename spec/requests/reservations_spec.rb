require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:motorcycle) { FactoryBot.create(:motorcycle) }
  let(:reservation) { FactoryBot.create(:reservation, motorcycle_id: motorcycle.id, user_id: user.id) }

  describe '#Checkout' do
    it 'Should checkout on delete /api/v1/reserve/:id' do
      delete api_v1_path(reservation.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#Reservation' do
    it 'Should belong to the user' do
      expect(reservation.user_id).to eq(user.id)
    end

    it 'Should belong to the motorcycle' do
      expect(reservation.motorcycle_id).to eq(motorcycle.id)
    end
  end
end
