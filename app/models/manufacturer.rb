class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :country, presence: true, format: { with: /\A[a-zA-Z]+\z/ }

  has_many :cars
end
