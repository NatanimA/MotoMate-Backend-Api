RSpec.describe User, type: :model do
  describe 'associations' do
    it 'has many reservations' do
      expect(described_class.reflect_on_association(:reservations).macro).to eq :has_many
    end

    it 'has many motorcycles' do
      expect(described_class.reflect_on_association(:motorcycles).macro).to eq :has_many
    end
  end

  it 'validates presence of name' do
    user = build(:user, name: nil)
    expect(user).not_to be_valid
  end

  it 'validates length of name' do
    user = build(:user, name: 'A')
    expect(user).not_to be_valid

    user = build(:user, name: 'A' * 26)
    expect(user).not_to be_valid

    user = build(:user, name: 'John Doe')
    expect(user).to be_valid
  end
end
