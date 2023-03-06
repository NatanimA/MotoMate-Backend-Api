class User < ApplicationRecord
  has_many :reservations, dependent: :destroy
  has_many :motorcycles, through: :reservations

  validates :name, presence: true, length: { minimum: 2, maximum: 25 }
end
