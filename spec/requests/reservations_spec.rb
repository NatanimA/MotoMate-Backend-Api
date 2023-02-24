require 'rails_helper'

RSpec.describe Api::V1::ReservationsController, type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:motorcycle) { FactoryBot.create(:motorcycle, user_id: user.id) }
  let(:reservation) { FactoryBot.create(:reservation, motorcycle_id: motorcycle.id, user_id: user.id) }

  describe '#Checkout' do
    it 'Should checkout on delete /api/v1/reserve/:id' do
      delete api_v1_path(reservation.id)
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#Reserve' do
    it 'Should reserve on post /api/v1/reserve' do
      post api_v1_reserve_path,
           params: { city: 'Addis Ababa', start_date: '2023-02-03', end_date: '2023-09-08', user_id: user.id,
                     motorcycle_id: motorcycle.id }
      expect(response).to have_http_status(:created)
    end
  end

  describe '#Reservation' do
    it 'Should get reservation on get /api/v1/users/:id/reservations' do
      get api_v1_reservations_path(user.id)
      expect(response).to have_http_status(:ok)
    end

    it 'Should belong to the user' do
      expect(reservation.user_id).to eq(user.id)
    end

    it 'Should belong to the motorcycle' do
      expect(reservation.motorcycle_id).to eq(motorcycle.id)
    end
  end
end
