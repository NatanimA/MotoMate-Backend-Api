require 'rails_helper'

RSpec.describe Reservation, type: :model do
  let(:user) { create(:user) }
  let(:motorcycle) { create(:motorcycle) }

  describe 'associations' do
    it 'belongs to a user' do
      expect(described_class.reflect_on_association(:user).macro).to eq :belongs_to
    end

    it 'belongs to a motorcycle' do
      expect(described_class.reflect_on_association(:motorcycle).macro).to eq :belongs_to
    end
  end

  describe 'validations' do
    it 'validates presence of city' do
      reservation = build(:reservation, city: nil, user: user, motorcycle: motorcycle)
      expect(reservation).not_to be_valid
    end

    it 'validates presence of start_date' do
      reservation = build(:reservation, start_date: nil, user: user, motorcycle: motorcycle)
      expect(reservation).not_to be_valid
    end

    it 'validates presence of end_date' do
      reservation = build(:reservation, end_date: nil, user: user, motorcycle: motorcycle)
      expect(reservation).not_to be_valid
    end
  end
end
