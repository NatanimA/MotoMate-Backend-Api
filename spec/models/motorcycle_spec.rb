require 'rails_helper'

RSpec.describe Motorcycle, type: :model do
  describe "validations" do
    let(:motorcycle) { build(:motorcycle) }

    it "is valid with valid attributes" do
      expect(motorcycle).to be_valid
    end

    it "is not valid without a name" do
      motorcycle.name = nil
      expect(motorcycle).not_to be_valid
    end

    it "is not valid with a name that is too short" do
      motorcycle.name = "a"
      expect(motorcycle).not_to be_valid
    end

    it "is not valid with a name that is too long" do
      motorcycle.name = "a" * 51
      expect(motorcycle).not_to be_valid
    end

    it "is not valid without an img_url" do
      motorcycle.img_url = nil
      expect(motorcycle).not_to be_valid
    end

    it "is not valid without a price" do
      motorcycle.price = nil
      expect(motorcycle).not_to be_valid
    end

    it "is not valid with a price of 0" do
      motorcycle.price = 0
      expect(motorcycle).not_to be_valid
    end

    it "is not valid without a description" do
      motorcycle.description = nil
      expect(motorcycle).not_to be_valid
    end

    it "is not valid with a description that is too short" do
      motorcycle.description = "a" * 4
      expect(motorcycle).not_to be_valid
    end

    it "is not valid without a model_year" do
      motorcycle.model_year = nil
      expect(motorcycle).not_to be_valid
    end

    it "is not valid without an engine" do
      motorcycle.engine = nil
      expect(motorcycle).not_to be_valid
    end

    it "is not valid without a fuel_type" do
      motorcycle.fuel_type = nil
      expect(motorcycle).not_to be_valid
    end
  end

  describe 'Associations' do
    it 'has many reservations' do
      expect(described_class.reflect_on_association(:reservations).macro).to eq :has_many
    end

    it 'has many users through reservations' do
      expect(described_class.reflect_on_association(:users).through_reflection.name).to eq :reservations
    end
  end

  describe "factory" do
    it "is valid" do
      expect(create(:motorcycle)).to be_valid
    end
  end
end
