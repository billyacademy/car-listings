class Car < ActiveRecord::Base
  validates :manufacturer_id, presence: true
  validates :color, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :mileage, presence: true
  validates_numericality_of :mileage, greater_than_or_equal_to: 0
  validates :year, presence: true, length: { is: 4 }
  validates_numericality_of :year, greater_than: 1919

  belongs_to :manufacturer
end
