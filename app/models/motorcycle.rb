class Motorcycle < ApplicationRecord
  has_many :users, through: :reservations
  has_many :reservations, dependent: :destroy

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :img_url, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :description, presence: true, length: { minimum: 3 }
  validates :model_year, presence: true
  validates :engine, presence: true
  validates :fuel_type, presence: true
end
