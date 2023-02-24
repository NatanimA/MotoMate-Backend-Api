class User < ApplicationRecord
  has_many :reservations, foreign_key: 'user_id', dependent: :destroy
  has_many :motorcycles, foreign_key: 'user_id', dependent: :destroy

  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
  validates :user_name, presence: true, length: { minimum: 3, maximum: 50 }, uniqueness: { case_sensitive: false }
end
