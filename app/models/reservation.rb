class Reservation < ApplicationRecord
  belongs_to :user, class_name: 'User'
  belongs_to :motorcycle, class_name: 'Motorcycle'

  validates :city, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
end
