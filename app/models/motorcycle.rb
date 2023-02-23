class Motorcycle < ApplicationRecord
  belongs_to :user, class_name: 'User'
  has_many :reservations, foreign_key: 'motorcycle_id'

  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
  validates :img_url, presence: true
  validates :price, presence: true, numericality: { greater_than: 0 }
end
