class Car < ActiveRecord::Base
  validates :manufacturer_id, presence: true
  validates :color, presence: true
  validates :year, presence: true, length: { is: 4 }
  validates_numericality_of :year, greater_than: 1919

  belongs_to :manufacturer
end
